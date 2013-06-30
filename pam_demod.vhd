library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;


entity pam_demod is
	port(
		clk : in STD_LOGIC;
		i_ce : in std_logic;		
		i_samplesI: in std_logic_vector(15 downto 0);
		i_samplesQ: in std_logic_vector(15 downto 0);

		o_I: out std_logic_vector(15 downto 0);
		o_Q: out std_logic_vector(15 downto 0);
		out_ce: out std_logic
		);
end pam_demod;



architecture pam_demod of pam_demod is

--# like in TX part
type Tcomplex is array (0 to 1) of integer;
type Tmem is array(0 to 3) of Tcomplex;
constant mem:Tmem:=((1,1),(-1,1),(-1,-1),(1,-1));

begin



process (clk) is
begin		
	if rising_edge(clk) then
	end if;
end process;


end pam_demod;

