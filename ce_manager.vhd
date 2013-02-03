library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;


entity ce_manager is
	port(
		clk : in STD_LOGIC;
		reset : in std_logic;
		o_interp_ce: out std_logic
		);
end ce_manager;



architecture ce_manager of ce_manager is

signal cnt_interp:std_logic_vector(log2roundup(InterpolateRate)-1 downto 0);	

begin

process (clk)
begin		
	if rising_edge(clk) then
		if reset='1' then
			cnt_interp<=(others=>'0');
			o_interp_ce<='0';
		else --#reset
			cnt_interp<=cnt_interp+1;
			if cnt_interp=0 then
				o_interp_ce<='1';
			else
				o_interp_ce<='0';
			end if;
		end if; --#reset
	end if;	--clk
end process;
		 

	
end ce_manager;
