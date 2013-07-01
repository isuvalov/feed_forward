library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;


entity qam4_demod is
	port(
		clk : in STD_LOGIC;
		i_ce : in std_logic;		
		i_samplesI: in std_logic_vector(15 downto 0);
		i_samplesQ: in std_logic_vector(15 downto 0);

		o_value: out std_logic_vector(1 downto 0);
		out_ce: out std_logic
		);
end qam4_demod;



architecture qam4_demod of qam4_demod is

--# like in TX part
type Tcomplex is array (0 to 1) of integer;
type Tmem is array(0 to 3) of Tcomplex;
--                   00     01      10     11
constant mem:Tmem:=((1,1),(-1,1),(-1,-1),(1,-1));

signal s_value: std_logic_vector(1 downto 0);

begin



process (clk) is
variable signs:std_logic_vector(1 downto 0);
begin		
	if rising_edge(clk) then
		if i_ce='1' then
			if signed(i_samplesI)>0 then
				signs(0):=0;
			else
				signs(0):=1;
			end if;
			if signed(i_samplesQ)>0 then
				signs(1):=0;
			else
				signs(1):=1;
			end if;

            s_value<=signs;
		end if;
		out_ce<=i_ce;
	end if;
end process;
o_value<=s_value;

end qam4_demod;

