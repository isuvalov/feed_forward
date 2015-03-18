library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library work;
use work.feedf_consts_pack.all;

entity pilot_finder is
    Port (clk: in std_logic;
		  reset: in std_logic;
		  sample_ce: in std_logic;
			
		  corrI_o: out std_logic_vector(15 downto 0);
		  corrQ_o: out std_logic_vector(15 downto 0);

		  sampleI: in std_logic_vector(15 downto 0);
		  sampleQ: in std_logic_vector(15 downto 0);		  
		  pilot_start: out std_logic --# Этот импульс будет задержан на InterpolateRate*PILOT_LEN+5+Sqrt_Latency тактов
	);
			--# В данный момент Sqrt_Latency=16
end pilot_finder;
architecture pilot_finder of pilot_finder is

component sqrt32to16_altera
	PORT
	(
		aclr		: IN STD_LOGIC ;
		clk		: IN STD_LOGIC ;
		ena		: IN STD_LOGIC ;
		radical		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		q		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
		remainder		: OUT STD_LOGIC_VECTOR (16 DOWNTO 0)
	);
end component;


signal correlation_sqrt2,correlation_sqrt,correlation_sqrt_p2,correlation_sqrt_p1,correlation_sqrt_w1,correlation_sqrt_max: std_logic_vector(15 downto 0);
signal sampleI_sq,sampleQ_sq,sample_sq: std_logic_vector(31 downto 0);
signal cor_test,cor_filtered,sampleI_corr,sampleQ_corr: std_logic_vector(15 downto 0);
signal cor_filtered_ce,cor_sqrt_ce,sample_ce_w1: std_logic;
--constant MULT_POROG:std_logic_vector(6 downto 0):=conv_std_logic_vector(30,7); --# Цель умножить на 1.1 т.е. примерно *71/64

--constant MULT_POROG:std_logic_vector(6 downto 0):=conv_std_logic_vector(70,7); --# Цель умножить на 1.1 т.е. примерно *71/64
constant MULT_POROG:std_logic_vector(6 downto 0):=conv_std_logic_vector(66,7); --# Цель умножить на 1.1 т.е. примерно *71/64
signal cor_filtered_mult:std_logic_vector(cor_filtered'Length+MULT_POROG'Length-1 downto 0);

signal more_than_porog:std_logic;
signal time_out,time_out1:std_logic_vector(log2roundup(InterpolateRate*PILOT_LEN/2)-3 downto 0);


type TEXTREMUM_STM is (WAITING,LOOK_MAX,TIMEOUT);
signal EXTREMUM_STM:TEXTREMUM_STM;

signal start_cnt:std_logic_vector(correlation_sqrt'Length-1 downto 0);
signal cor_filtered_ce_st:std_logic;

begin
time_out1<=SXT("10",time_out1'Length);


pilot_corr_inst: entity work.pilot_correlator
	port map(
		clk =>clk,
		reset =>reset,
		ce =>sample_ce,
		i_samplesI=>sampleI,
		i_samplesQ=>sampleQ,
		o_sampleI=>sampleI_corr,  --# выход в два раза меньше максимума
		o_sampleQ=>sampleQ_corr
		);

corrI_o<=cor_test;--sampleI_corr;
corrQ_o<=correlation_sqrt;--sampleQ_corr;

cor_test<=EXT(cor_filtered_mult(cor_filtered_mult'Length-2 downto 5),cor_test'Length);
process (clk) is
begin		
	if rising_edge(clk) then
		sample_ce_w1<=sample_ce;
		if sample_ce='1' then
			sampleI_sq<=signed(sampleI_corr)*signed(sampleI_corr);
			sampleQ_sq<=signed(sampleQ_corr)*signed(sampleQ_corr);
		end if;
		if sample_ce_w1='1' then
			sample_sq<=sampleI_sq+sampleQ_sq;
		end if;

		if reset='1' then
           start_cnt<=(others=>'1');
		   cor_filtered_ce_st<='0';
		else
			if unsigned(start_cnt)>0 then
				start_cnt<=start_cnt-1;
				cor_filtered_ce_st<='0';
			else
				cor_filtered_ce_st<='1';
			end if;
		end if;

		if cor_filtered_ce='1' and cor_filtered_ce_st='1' then
			cor_filtered_mult<=unsigned(cor_filtered)*unsigned(MULT_POROG);
		end if;


		correlation_sqrt_w1<=correlation_sqrt;
--		correlation_sqrt2<=rats(correlation_sqrt)-rats(correlation_sqrt_w1);

		if reset='1' then
			EXTREMUM_STM<=WAITING;
			more_than_porog<='0';
		else
			case EXTREMUM_STM is 
			when WAITING=>
				if unsigned(cor_test)<unsigned(correlation_sqrt) then
					EXTREMUM_STM<=LOOK_MAX;
					correlation_sqrt_max<=correlation_sqrt;				
				end if;
				more_than_porog<='0';
			when LOOK_MAX=>
				if unsigned(correlation_sqrt_max)<unsigned(correlation_sqrt_w1) then
					correlation_sqrt_max<=correlation_sqrt;
					more_than_porog<='1';
					EXTREMUM_STM<=TIMEOUT;
				else
					more_than_porog<='0';
				end if;
				time_out<=(others=>'0');
			when TIMEOUT=>
				more_than_porog<='0';
				if unsigned(time_out)<unsigned(time_out1) then
					time_out<=time_out+1;
				else
					EXTREMUM_STM<=WAITING;
				end if;
			when others=>
			end case;
		end if;
		                   

		
	end if;
end process;




--sqrt32_inst: entity work.sqrt32to16
--  port map( 
--		 clk=>clk,
--		 A => sample_sq,
--         Q =>correlation_sqrt_p2
--	);

sqrt32_inst : sqrt32to16_altera PORT MAP (
		aclr => reset,
		clk	 => clk,
		ena	 => '1',
		radical	 => sample_sq,
		q	 => correlation_sqrt_p1,
		remainder	 => open
	);

	correlation_sqrt<=rats(correlation_sqrt_p1);



bih_filter_integrator_inst: entity work.bih_filter_integrator
	generic map(
		ALPHA_NUM=>8+6,  --# коэффициент интегрирования, чем он больше тем большую историю храним
		SCALE_FACTOR=>5+6,  --# маштаб - чем он больше тем меньше значение на выходе
		WIDTH=>correlation_sqrt'Length
	)
	port map(
		clk =>clk,
		
		ce =>'1',
		sample =>correlation_sqrt, --# this is unsigned value!!!

		filtered =>cor_filtered,
		ce_out =>cor_filtered_ce
	);
pilot_start<=more_than_porog;

process (clk) is
begin		
	if rising_edge(clk) then
	end if;
end process;


end pilot_finder;

