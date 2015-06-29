library IEEE;
use IEEE.STD_LOGIC_1164.all;   
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.std_logic_arith.all;

entity agc_digital is
	port(
		clk : in std_logic;
		reset: in std_logic;
		i_ce : in std_logic;
		i_sampleI : in std_logic_vector(15 downto 0); 
		i_sampleQ : in std_logic_vector(15 downto 0); 

		o_sampleI : out std_logic_vector(15 downto 0);
		o_sampleQ : out std_logic_vector(15 downto 0);
		o_ce: out std_logic
	);
end agc_digital;

architecture agc_digital of agc_digital is

constant NORM_CONST:std_logic_vector(15 downto 0):=conv_std_logic_vector(2*32767/3,16);

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


signal sq_iq,sq_i,sq_q,sq_iq_1w:std_logic_vector(31 downto 0);
signal samplesI_reg,samplesQ_reg:std_logic_vector(i_sampleI'Length-1 downto 0);
signal ce_1w,ce_2w:std_logic;

signal filt_power,sqrt_iq:std_logic_vector(15 downto 0);
signal start_div,done_div,sign_save_I,sign_save_Q,done_div_1w:std_logic;
signal divisor_I,divisor_Q,iq_sq_rootM:std_logic_vector(31 downto 0);

constant DIV_LATENCY:integer:=10;

signal sign_save_Ia,sign_save_Qa:std_logic_vector(DIV_LATENCY-1 downto 0);

signal delay_cnt:std_logic_vector(5 downto 0);
signal quotient_Q,quotient_I,msampleI,msampleQ:std_logic_vector(31 downto 0);

begin

divisor_I<=NORM_CONST&x"0000";

process (clk) is
begin
	if rising_edge(clk) then
		sign_save_Ia<=sign_save_Ia(sign_save_Ia'Length-2 downto 0)&sign_save_I;
		sign_save_Qa<=sign_save_Qa(sign_save_Ia'Length-2 downto 0)&sign_save_Q;
		ce_1w<=i_ce;
		ce_2w<=ce_1w;
		if i_ce='1' then
			sq_i<=signed(i_sampleI)*signed(i_sampleI);
			sq_q<=signed(i_sampleQ)*signed(i_sampleQ);
			samplesI_reg<=i_sampleI;
			samplesQ_reg<=i_sampleQ;
		end if;

		sq_iq<=sq_i+sq_q;
		sq_iq_1w<=sq_iq;

        iq_sq_rootM<=SXT(filt_power,iq_sq_rootM'Length);

		if ce_1w='1' then
			msampleI<=signed(quotient_I(31 downto 16))*signed(samplesI_reg);
			msampleQ<=signed(quotient_I(31 downto 16))*signed(samplesQ_reg);
		end if;
		o_sampleI<=msampleI(15 downto 0);
		o_sampleQ<=msampleQ(15 downto 0);
        o_ce<=ce_2w;

		if reset='1' then
			delay_cnt<=(others=>'1');
		else
			if i_ce='1' then
				if unsigned(delay_cnt)>0 then
					delay_cnt<=delay_cnt-1;
				else
					delay_cnt<=(others=>'1');
				end if;
				if delay_cnt=1 then
					start_div<='1';
				else
					start_div<='0';
				end if;
			end if;
		end if;


	end if;
end process;

sqrt32_i : sqrt32to16_altera PORT MAP (
		aclr => reset,
		clk	 => clk,
		ena	 => '1',
		radical	 => sq_iq_1w,
		q	 => sqrt_iq,
		remainder	 => open
	);


bih_filter_freq_i: entity work.bih_filter_freq
	generic map(
		ALPHA_NUM=>9,  --# коэффициент интегрирования, чем он больше тем большую историю храним
		SCALE_FACTOR=>6,  --# маштаб - чем он больше тем меньше значение на выходе
		WIDTH=>16
	)
	port map(
		clk =>clk,
		reset=>reset,
		ce =>ce_2w,
		sample =>sqrt_iq,

		filtered =>filt_power,
		ce_out =>open
	);


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
            divide_i   =>start_div,
            dividend_i =>divisor_I,
            divisor_i  =>iq_sq_rootM,
            quotient_o =>quotient_I,
            done_o     =>done_div
    );


end agc_digital;
	