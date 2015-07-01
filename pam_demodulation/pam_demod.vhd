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

function signed_abs (L: std_logic_vector) return std_logic_vector is
-- pragma label_applies_to abs
  
variable result : std_logic_vector(L'range) ;
--attribute IS_SIGNED of L:constant is TRUE ;
--attribute SYNTHESIS_RETURN of result:variable is "ABS" ;
begin
if (L(L'left) = '0' or L(L'left) = 'L') then
    result := L;
else
    result := 0 - signed(L);
end if;
    return result ;
end signed_abs;


--# like in TX part
type Tcomplex is array (0 to 1) of integer;
type Tmem is array(0 to 3) of Tcomplex;
constant mem:Tmem:=((1,0),(0,1),(-1,0),(0,-1));
-- new: constant mem:Tmem:=((1,0),(0,1),(-1,0),(0,-1));

signal i_more_q,sign_i,sign_q:std_logic;
signal signs:std_logic_vector(2 downto 0);
signal signs2:std_logic_vector(1 downto 0);

begin

sign_i<=i_samplesI(i_samplesI'Length-1);
sign_q<=i_samplesQ(i_samplesQ'Length-1);

i_more_q<='1' when signed(signed_abs(i_samplesI))>signed(signed_abs(i_samplesQ)) else '0';

signs<=i_more_q&sign_i&sign_q;
signs2<=sign_i&sign_q;

with signs select
  bit_value<="00" when "100",
 		     "00" when "101",
 		     "10" when "110",
		     "10" when "111",

		     "01" when "000",
		     "11" when "001",
		     "01" when "010",
		     "11" when "011",
  
		     "00" when others;

--
--with signs2 select
--  bit_value<="00" when "00",
-- 		     "00" when "01",
-- 		     "10" when "10",
--		     "10" when "11",
--
--		     "00" when others;
--
--

out_ce<=i_ce;

process (clk) is
begin		
	if rising_edge(clk) then
	end if;
end process;


end pam_demod;


