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

		bit_value: out std_logic_vector(1 downto 0);
		out_ce: out std_logic
		);
end pam_demod;



architecture pam_demod of pam_demod is

--# like in TX part
type Tcomplex is array (0 to 1) of integer;
type Tmem is array(0 to 3) of Tcomplex;
constant mem:Tmem:=((1,1),(-1,1),(-1,-1),(1,-1));


signal sign_i,sign_q:std_logic;
signal signs:std_logic_vector(1 downto 0);

begin

sign_i<=i_samplesI(i_samplesI'Length-1);
sign_q<=i_samplesQ(i_samplesQ'Length-1);

signs<=sign_i&sign_q;

with signs select
bit_value<="00" when "00",
		   "01" when "10",
		   "10" when "11",
		   "11" when "01",
		   "00" when others;

out_ce<=i_ce;

process (clk) is
begin		
	if rising_edge(clk) then
	end if;
end process;


end pam_demod;

