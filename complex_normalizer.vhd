library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;


entity complex_normalizer is
	generic (
		CONJUGATION:std_logic:='1' --# сопряжение числа по выходу, если '1' - то сопрягать
	);
	port(
		clk : in STD_LOGIC;
		reset : in std_logic;
		i_ce : in std_logic; --# этот строб не должен поступать чаще 16+32+3=51 такта		
		i_samplesI: in std_logic_vector(15 downto 0);
		i_samplesQ: in std_logic_vector(15 downto 0);

		o_samplesI: out std_logic_vector(15 downto 0);
		o_samplesQ: out std_logic_vector(15 downto 0);
		out_ce: out std_logic
		);
end complex_normalizer;



architecture complex_normalizer of complex_normalizer is


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

constant NORM_CONST:std_logic_vector(15 downto 0):=conv_std_logic_vector(32767,16);
constant NORM_CONST_INV:std_logic_vector(15 downto 0):=conv_std_logic_vector(-32767,16);
constant SQRT_LATENCY:natural:=16;

signal i_sq,q_sq,iq_sq:std_logic_vector(i_samplesI'Length*2-1 downto 0);
signal i_ce_1w,i_ce_2w:std_logic;

signal samplesI_reg,samplesQ_reg:std_logic_vector(i_samplesI'Length-1 downto 0);
signal divisor_I,divisor_Q,iq_sq_rootM:std_logic_vector(31 downto 0);
signal iq_sq_root:std_logic_vector(15 downto 0);
signal quotient_Q,quotient_I:std_logic_vector(31 downto 0);

signal start_div,done_div,sign_save_I,sign_save_Q,done_div_1w:std_logic;
signal delay_cnt:std_logic_vector(log2roundup(SQRT_LATENCY) downto 0);


begin



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



divQ_inst: entity work.serial_divide_uu
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
            dividend_i =>divisor_Q,
            divisor_i  =>iq_sq_rootM,
            quotient_o =>quotient_Q,
            done_o     =>open
    );

process (clk) is
begin		
	if rising_edge(clk) then
		i_ce_1w<=i_ce;
		i_ce_2w<=i_ce_1w;
		if i_ce='1' then
			i_sq<=signed(i_samplesI)*signed(i_samplesI);
			q_sq<=signed(i_samplesQ)*signed(i_samplesQ);
			samplesI_reg<=i_samplesI;
			samplesQ_reg<=i_samplesQ;
			
			divisor_Q<=signed(i_samplesQ)*signed(NORM_CONST);
			sign_save_I<=i_samplesI(i_samplesI'Length-1);
			sign_save_Q<=i_samplesQ(i_samplesQ'Length-1);
		end if;
		if i_ce_1w='1' then
			iq_sq<=i_sq+q_sq;
			if sign_save_I='1' then
				divisor_I<=signed(samplesI_reg)*signed(NORM_CONST_INV);
			else
				divisor_I<=signed(samplesI_reg)*signed(NORM_CONST);
			end if;
			if sign_save_Q='1' then
				divisor_Q<=signed(samplesQ_reg)*signed(NORM_CONST_INV);
			else
				divisor_Q<=signed(samplesQ_reg)*signed(NORM_CONST);
			end if;
		end if;


		if reset='1' then
			delay_cnt<=(others=>'0');
		else
			if i_ce_2w='1' then
				delay_cnt<=conv_std_logic_vector(SQRT_LATENCY-1,delay_cnt'Length);
				start_div<='0';
			else
				if unsigned(delay_cnt)>0 then
					delay_cnt<=delay_cnt-1;
				end if;
				if delay_cnt=1 then
					start_div<='1';
				else
					start_div<='0';
				end if;
			end if;
		end if;

		done_div_1w<=done_div;
		out_ce<=not(done_div_1w) and done_div;
		if sign_save_I='1' then
	        o_samplesI<=0-quotient_I(15 downto 0);
		else
			o_samplesI<=quotient_I(15 downto 0);
		end if;

		if sign_save_Q=(not CONJUGATION) then
	        o_samplesQ<=0-quotient_Q(15 downto 0);
		else
			o_samplesQ<=quotient_Q(15 downto 0);
		end if;

	end if;
end process;


sqrt32to16_altera_inst : sqrt32to16_altera PORT MAP (
		aclr	 => reset,
		clk	 => clk,
		ena	 => '1',
		radical	 => iq_sq,
		q	 => iq_sq_root,
		remainder	 => open
	);
iq_sq_rootM<=SXT(iq_sq_root,iq_sq_rootM'Length);

end complex_normalizer;

