library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;


entity complex_normalizer is
	port(
		clk : in STD_LOGIC;
		reset : in std_logic;
		i_ce : in std_logic;		
		i_samplesI: in std_logic_vector(15 downto 0);
		i_samplesQ: in std_logic_vector(15 downto 0);

		o_samplesI: out std_logic_vector(15 downto 0);
		o_samplesQ: out std_logic_vector(15 downto 0);
		out_ce: out std_logic
		);
end normalizer;



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

constant SQRT_LATENCY:natural:=16;

signal i_sq,q_sq,iq_sq:std_logic_vector(i_samplesI'Length*2-1 downto 0);
signal i_ce_1w,i_ce_2w:std_logic;

begin


divisor<=EXT(maxIQ,divisor'Length);

serial_divide_uu_inst: entity work.serial_divide_uu
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
            divide_i   =>i_ce_2w,
            dividend_i =>iq_sq,
            divisor_i  =>divisor,
            quotient_o =>quotient,
            done_o     =>done_o
    );

process (clk) is
begin		
	if rising_edge(clk) then
		i_ce_1w<=i_ce;
		i_ce_2w<=i_ce_1w;
		if i_ce='1' then
			i_sq<=signed(i_samplesI)*signed(i_samplesI);
			q_sq<=signed(i_samplesQ)*signed(i_samplesQ);
		end if;
		if i_ce_1w='1' then
			iq_sq<=i_sq+q_sq;
		end if;

	end if;
end process;


end complex_normalizer;

