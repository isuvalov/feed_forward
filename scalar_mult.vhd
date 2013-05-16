library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;


entity scalar_mult is
	port(
		clk : in STD_LOGIC;
		reset : in std_logic;

		ce: in std_logic;

		aI: in std_logic_vector(15 downto 0);
		aQ: in std_logic_vector(15 downto 0);

		bI: in std_logic_vector(15 downto 0);
		bQ: in std_logic_vector(15 downto 0);

		sum_ce: out std_logic;
		sumI_o: out std_logic_vector(31 downto 0);
		sumQ_o: out std_logic_vector(31 downto 0)
		);
end scalar_mult;



architecture scalar_mult of scalar_mult is


signal sum_regI,sum_regQ:std_logic_vector(31 downto 0);

begin


process (clk)
begin		
	if rising_edge(clk) then
		if reset='1' then
			sum_regI<=(others=>'0');
			sum_regQ<=(others=>'0');
		else --#reset
			
		end if; --#reset
	end if;	--clk
end process;
		 

	
end scalar_mult;
