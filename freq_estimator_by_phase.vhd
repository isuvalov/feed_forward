library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;
use work.math_real.all;


entity freq_estimator_by_phase is
	port(
		clk : in STD_LOGIC;
		reset : in std_logic;
		i_ce : in std_logic;		
		i_samplesI: in std_logic_vector(7 downto 0);
		i_samplesQ: in std_logic_vector(7 downto 0);
		freq_ce: out std_logic;
		o_freq: out std_logic_vector(31 downto 0)
		);
end freq_estimator_by_phase;



architecture freq_estimator_by_phase of freq_estimator_by_phase is
--# for +-pi/2 conversion
--# s=[1+1i -1+1i -1-1i 1-1i]
--# lut_i=[2 1 3 0];
--# lut_sum=[0 pi pi 2*pi];
--# ph_p_v=bi2de([((sign(real(s))+1)/2)' ((sign(imag(s))+1)/2)'],'left-msb');
--# ph_p2_ok=ph_p+lut_sum(lut_i(ph_p_v+1)+1);

--# (0,32767)=205893=pi/2
--# (0,-32768)=205894=-pi/2
--# (-32768,0)=411973=pi

constant CORDIC_LATEN:integer:=26;

type Tsigns is array(CORDIC_LATEN-1 downto 0) of std_logic;--_vector(1 downto 0);
signal signs:Tsigns;

signal to_c_i,to_c_q:std_logic_vector(15 downto 0);
signal samplesI_reg,samplesQ_reg:std_logic_vector(i_samplesI'Length-1 downto 0);
signal ph_angle,ph_angle_1w,ph_angle_delta:std_logic_vector(19 downto 0);
signal ph_angle_2pi,ph_angle_2pi_1w,ph_angle_2pi_delta,ph_angle_2pi_delta_ii,ph_angle_d_filt:std_logic_vector(20 downto 0);

signal s_freq_1p: std_logic_vector(31 downto 0);

begin


to_c_i<=SXT(i_samplesI,16);
to_c_q<=SXT(i_samplesQ,16);

cordic_wrapper_i: entity work.cordic_wrapper
	port map(
		clk =>clk,
		i_ce =>i_ce,
		i_samplesI=>to_c_i,
		i_samplesQ=>to_c_q,

		phase=>ph_angle
		);

process (clk) is
begin
	if rising_edge(clk) then

		if signs(CORDIC_LATEN-1)='1' then
			ph_angle_2pi<=SXT(ph_angle,ph_angle_2pi'Length)+411973*2;
		else
			ph_angle_2pi<=SXT(ph_angle,ph_angle_2pi'Length);
		end if;

		if i_ce='1' then
			signs(0)<=i_samplesQ(i_samplesQ'Length-1);	
		else
			signs(0)<=samplesQ_reg(i_samplesQ'Length-1);	
		end if;

		for i in CORDIC_LATEN-2 downto 0 loop
			signs(i+1)<=signs(i);
		end loop;

		if i_ce='1' then

			samplesI_reg<=i_samplesI;
			samplesQ_reg<=i_samplesQ;	

			ph_angle_2pi_1w<=ph_angle_2pi;
			ph_angle_2pi_delta<=ph_angle_2pi-ph_angle_2pi_1w;
			if signed(ph_angle_2pi_delta)<-411973*3/2 then
				ph_angle_2pi_delta_ii<=0-(411973*2+ph_angle_2pi_delta);
			elsif signed(ph_angle_2pi_delta)>411973*3/2 then
				ph_angle_2pi_delta_ii<=411973*2-ph_angle_2pi_delta;
			else
				ph_angle_2pi_delta_ii<=ph_angle_2pi_delta;
			end if;
	    	s_freq_1p<=signed(ph_angle_d_filt(ph_angle_d_filt'Length-1 downto 1+3))*unsigned(conv_std_logic_vector(integer(0.72176*real(2**9)/3.14159265358979324),14)); --FREQ_FD
			o_freq<=s_freq_1p(s_freq_1p'Length-1-2 downto 0)&"00";
		end if;
        freq_ce<=i_ce;

	end if;
end process;


IIFoneAdd_i: entity work.IIFoneAdd
	generic map(	
		LEN=>ph_angle_2pi_delta_ii'Length,
		Q=>35+9,	  -- –азр€дность сумматора, но помни что при первом вычитании разр€дность увеличитьс€ до (Q-K+1)
		K=>23	  --  оличество сдвигов вправо
			)	
	 port map(
		 clk =>clk,
		 ce =>i_ce,
		 reset =>reset,
		 DataIn =>rats(ph_angle_2pi_delta_ii),
		 DataFromSubstract =>open,
		 DataOut =>ph_angle_d_filt
	     );



end freq_estimator_by_phase;

