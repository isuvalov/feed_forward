library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity calc_freq_of_sin is
	port(
		clk : in STD_LOGIC;
		reset : in std_logic;

		i_ce: in std_logic;
		i_sampleI: in std_logic_vector(15 downto 0);
		i_sampleQ: in std_logic_vector(15 downto 0);

		o_freq_ce: out std_logic;
		o_freq: out std_logic_vector(31 downto 0)
		);
end calc_freq_of_sin;



architecture calc_freq_of_sin of calc_freq_of_sin is

signal sign,sign_1w,f_ce:std_logic;
signal sampleI_filt:std_logic_vector(15 downto 0);
signal width_cnt,width_cnt_reg:std_logic_vector(31 downto 0);

begin

sign<=sampleI_filt(sampleI_filt'Length-1);

sinfilt_rxfilter_i:entity work.sinfilt_rxfilter
	generic map(
		USE_IT=>1,
		LEN=>i_sampleI'Length
	)
	port map(
		clk =>clk,
		reset =>reset,
		i_samplesI =>i_sampleI,
		i_samplesQ =>(others=>'0'),
		o_sampleI=>sampleI_filt,  --# выход в два раза меньше максимума
		o_sampleQ=>open
		);



process (clk)
begin		
	if rising_edge(clk) then
		sign_1w<=sign;
		if i_ce='1' then
			if 	sign_1w='0' and sign='1' then
				width_cnt<=(others=>'0');
				if unsigned(width_cnt)>20 then  --# 20 this is 5MHz
					width_cnt_reg<=width_cnt+1;
					f_ce<='1';
				else
					f_ce<='0';
				end if;
			else
				width_cnt<=width_cnt+1;			
				f_ce<='0';
			end if;
		else
			f_ce<='0';
		end if;
	end if;	--clk
end process;


bih_filter_freq_i:entity work.bih_filter_freq
	generic map(
		ALPHA_NUM=>7,  --# коэффициент интегрирования, чем он больше тем большую историю храним
		SCALE_FACTOR=>5,  --# маштаб - чем он больше тем меньше значение на выходе
		WIDTH=>width_cnt_reg'Length
	)
	port map(
		clk =>clk,
		reset=>reset,
		ce =>f_ce,
		sample =>width_cnt_reg, --# this is unsigned value!!!

		filtered=>o_freq,
		ce_out =>o_freq_ce
	);

		 
	
end calc_freq_of_sin;
