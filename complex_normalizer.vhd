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
            divide_i   =>max_ce,
            dividend_i =>dividend,
            divisor_i  =>divisor,
            quotient_o =>quotient,
            done_o     =>done_o
    );

process (clk) is
begin		
	if rising_edge(clk) then
	end if;
end process;


end complex_normalizer;

