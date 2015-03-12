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

		phase_for_dds_ce: out std_logic;
		phase_for_dds: out std_logic_vector(31 downto 0);

		o_freq_ce: out std_logic;
		o_freq: out std_logic_vector(31 downto 0)
		);
end calc_freq_of_sin;



architecture calc_freq_of_sin of calc_freq_of_sin is


signal sign,sign_1w,f_ce,s_freq_ce:std_logic;
signal sampleI_filt:std_logic_vector(15 downto 0);
signal s_freq,width_cnt,width_cnt_reg:std_logic_vector(31 downto 0);

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
				if unsigned(width_cnt)>14 then  --# 20 this is 5MHz
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

o_freq<=s_freq;

bih_filter_freq_i:entity work.bih_filter_freq
	generic map(
		ALPHA_NUM=>7+2+1,  --# коэффициент интегрирования, чем он больше тем большую историю храним
		SCALE_FACTOR=>5+2,  --# маштаб - чем он больше тем меньше значение на выходе
		WIDTH=>width_cnt_reg'Length
	)
	port map(
		clk =>clk,
		reset=>reset,
		ce =>f_ce,
		sample =>width_cnt_reg, --# this is unsigned value!!!

		filtered=>s_freq,
		ce_out =>s_freq_ce
	);

o_freq_ce<=s_freq_ce;

 

divI_inst: entity work.serial_divide_uu
  generic map( M_PP => 32,           -- Size of dividend
            N_PP => 32,            -- Size of divisor
            R_PP =>0,            -- Size of remainder
            S_PP =>0,            -- Skip this many bits (known leading zeros)
--            COUNT_WIDTH_PP : integer := 5;  -- 2^COUNT_WIDTH_PP-1 >= (M_PP+R_PP-S_PP-1)
            HELD_OUTPUT_PP =>1) -- Set to 1 if stable output should be held
                                            -- from previous operation, during current
                                            -- operation.  Using this option will increase
                                            -- the resource utilization (costs extra d-flip-flops.)
    port map(   clk_i      =>clk,
            clk_en_i   =>'1',
            rst_i      =>reset,
            divide_i   =>s_freq_ce,
            dividend_i =>x"FFFFFFF0",
            divisor_i  =>s_freq,
            quotient_o =>phase_for_dds,
            done_o     =>phase_for_dds_ce
    );


	
end calc_freq_of_sin;
