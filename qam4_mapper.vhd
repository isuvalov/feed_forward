library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity qam4_mapper is
	port(
		clk : in STD_LOGIC;
		reset : in std_logic;
		i_bits: in std_logic_vector(1 downto 0);
		i_ce : in std_logic;
		
		o_samplesI: out std_logic_vector(1 downto 0);
		o_samplesQ: out std_logic_vector(1 downto 0);
		o_ce: out std_logic
		);
end qam4_mapper;



architecture qam4_mapper of qam4_mapper is
	
type Tcomplex is array (0 to 1) of integer;
type Tmem is array(0 to 3) of Tcomplex;

constant mem:Tmem:=((1,1),(-1,1),(-1,-1),(1,-1));


begin

process (clk)
begin		
	if rising_edge(clk) then
		if reset='1' then
			o_samplesI<=(others=>'0');
			o_samplesQ<=(others=>'0');
			o_ce<='0';
		else --#reset
			o_ce<=i_ce;
			o_samplesI<=conv_std_logic_vector(mem(conv_integer(i_bits))(0),o_samplesI'Length);
			o_samplesQ<=conv_std_logic_vector(mem(conv_integer(i_bits))(1),o_samplesI'Length);
		end if; --#reset
	end if;	--clk
end process;
		 

	
end qam4_mapper;
