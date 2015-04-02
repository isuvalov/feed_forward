library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.math_real.all;
use work.feedf_consts_pack.all;

entity calc_freq_of_sin is
	generic (
		SIMULATION:integer:=0
	);
	port(
		clk : in STD_LOGIC;
		reset : in std_logic;

		i_ce: in std_logic;
		i_sampleI: in std_logic_vector(15 downto 0);
		i_sampleQ: in std_logic_vector(15 downto 0);

		phase_for_dds_ce: out std_logic;
		phase_for_dds: out std_logic_vector(31 downto 0);

		o_freq_ce: out std_logic;
		o_freq: out std_logic_vector(31 downto 0)
		);
end calc_freq_of_sin;



architecture calc_freq_of_sin of calc_freq_of_sin is

constant CALC_PERIODS_NUMBER:integer:=64;
constant FREQ_PRECISIN:integer:=0;

constant n_norm:integer:=CALC_PERIODS_NUMBER*(FREQ_FD/PILOTSIN_FREQ);

constant MAX_VAL:std_logic_vector(31 downto 0):=conv_std_logic_vector((2**30)/n_norm,32);
constant MAX_VAL2:std_logic_vector(31 downto 0):=conv_std_logic_vector((2**(30)),32);

--constant MAX_VAL:std_logic_vector(31 downto 0):=(31=>'0',30=>'0',(FREQ_PRECISIN-1 downto 0)=>'0',others=>'1');

signal sign,sign_1w,f_ce,s_freq_ce,s_phase_for_dds_ce,freq_ce,use_inv:std_logic;
signal sampleQ_filt,sampleI_filt:std_logic_vector(15 downto 0);
signal s_freq_div,s_freq,width_cnt,width_cnt_reg,width_cnt_reg_shift,delta_n,delta_n_inv:std_logic_vector(31 downto 0):=(others=>'0');

signal measure_phase_for_dds:std_logic_vector(31 downto 0);
signal measure_phase_for_dds_mul:std_logic_vector(31+16-1+1 downto 0);
signal phase_for_dds_test:integer;

signal use_inv_array:std_logic_vector(31 downto 0);

signal periods_cnt:std_logic_vector(7 downto 0):=x"00";

signal phase_for_dds_pre: std_logic_vector(31 downto 0);

signal phase_for_dds_pi: std_logic_vector(32+16 downto 0);

signal delta_n_mul: std_logic_vector(32+16-1 downto 0);
signal sin_phase,sin_phase_1w: std_logic_vector(19 downto 0);
signal sin_phase_delta,sin_phase_delta_filt,sin_phase_delta_filt_c,sin_phase_delta_filt_div: std_logic_vector(sin_phase'Length downto 0);

signal zero_phase_event:std_logic;

begin

--sign<=sampleI_filt(sampleI_filt'Length-1);
sign<=sin_phase(sin_phase'Length-1);


sinfilt_rxfilter_i:entity work.sinfilt_rxfilter
	generic map(
		USE_IT=>1,
		LEN=>i_sampleI'Length
	)
	port map(
		clk =>clk,
		reset =>reset,
		i_samplesI =>i_sampleI,
		i_samplesQ =>i_sampleQ,
		o_sampleI=>sampleI_filt,  --# выход в два раза меньше максимума
		o_sampleQ=>sampleQ_filt
		);


r2p_inst2: entity work.cordic_wrapper
	port map(
		clk=>clk,
		i_ce =>i_ce,
		i_samplesI =>sampleI_filt,
		i_samplesQ =>sampleQ_filt,

		phase =>sin_phase
		);



process (clk)
begin		
	if rising_edge(clk) then
		sin_phase_1w<=sin_phase;
		if zero_phase_event='0' then
	 	    sin_phase_delta<=SXT(sin_phase,sin_phase'Length+1)-SXT(sin_phase_1w,sin_phase'Length+1);
		end if;
		

		if 	(sign_1w xor sign)='0' then
			zero_phase_event<='1';
		else
			zero_phase_event<='0';
		end if;
		sign_1w<=sign;	

		sin_phase_delta_filt_c<=sin_phase_delta_filt+34320;

		if SIMULATION=1 then
			phase_for_dds<=(others=>'0');
		else
	        phase_for_dds<=signed(sin_phase_delta_filt_c(sin_phase_delta_filt_c'Length-1-4 downto 0)&"0000")*unsigned(conv_std_logic_vector((2**10)/(3),10)); --FREQ_FD
		end if;
		
	end if;	--clk
end process;

o_freq<=s_freq;

bih_filter_freq_i:entity work.bih_filter_freq
	generic map(
		ALPHA_NUM=>7+3+2+1,  --# коэффициент интегрирования, чем он больше тем большую историю храним
		SCALE_FACTOR=>5+3+2,  --# маштаб - чем он больше тем меньше значение на выходе
--		ALPHA_NUM=>7-2+1,  --# коэффициент интегрирования, чем он больше тем большую историю храним
--		SCALE_FACTOR=>5-2+1,  --# маштаб - чем он больше тем меньше значение на выходе

		WIDTH=>sin_phase_delta'Length --width_cnt_reg'Length
	)
	port map(
		clk =>clk,
		reset=>reset,
--		ce =>f_ce,
		ce =>i_ce,
		sample =>sin_phase_delta,--width_cnt_reg, --# this is unsigned value!!!

		filtered=>sin_phase_delta_filt,--s_freq,
		ce_out =>s_freq_ce
	);

process(clk) is
begin
	if rising_edge(clk) then

		if i_ce='1' then
			freq_ce<=s_freq_ce;
		else
			freq_ce<='0';
		end if;

		if i_ce='1' then
			phase_for_dds_ce<=s_phase_for_dds_ce;
		else
			phase_for_dds_ce<='0';
		end if;
	end if;
end process;

o_freq_ce<=s_freq_ce;

	
end calc_freq_of_sin;
