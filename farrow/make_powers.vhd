library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity make_powers is
	generic (
		WIDTH:natural:=8
	);
	port(
		clk : in STD_LOGIC;

		i_val: in std_logic_vector(WIDTH-1 downto 0);
		i_ce: in std_logic;

		o_sq1: out std_logic_vector(WIDTH*4-1 downto 0);  --# WIDTH*1
		o_sq2: out std_logic_vector(WIDTH*4-1 downto 0);  --# WIDTH*2
		o_sq3: out std_logic_vector(WIDTH*4-1 downto 0);  --# WIDTH*3
		o_sq4: out std_logic_vector(WIDTH*4-1 downto 0);  --# WIDTH*4
		o_ce: out std_logic
		);
end make_powers;



architecture make_powers of make_powers is

signal ce_1w,ce_2w,ce_3w:std_logic;
signal val_reg,val_reg_1w: std_logic_vector(WIDTH-1 downto 0);
signal s_sq1,s_sq2,s_sq2_1w,s_sq3,s_sq4: std_logic_vector(WIDTH*4-1 downto 0);
signal power2: std_logic_vector(WIDTH*2-1 downto 0);
signal power3: std_logic_vector(WIDTH*3-1 downto 0);
signal power4: std_logic_vector(WIDTH*4-1 downto 0);

begin

process (clk) is
begin
	if rising_edge(clk) then
		if i_ce='1' then
			power2<=signed(i_val)*signed(i_val); --# ok
			s_sq1<=SXT(i_val,s_sq1'Length);
			val_reg<=i_val;
		end if;
		ce_1w<=i_ce;
		ce_2w<=ce_1w;
		o_ce<=ce_2w;

		s_sq2<=SXT(power2,s_sq2'Length);
		s_sq2_1w<=s_sq2;
		val_reg_1w<=val_reg;

		power3<=signed(power2)*signed(val_reg);
        power4<=signed(power2)*signed(power2);

		o_sq1<=SXT(val_reg_1w,o_sq1'Length);
		o_sq2<=SXT(s_sq2,o_sq1'Length);
		o_sq3<=SXT(power3,o_sq1'Length);
		o_sq4<=SXT(power4,o_sq1'Length);

	end if;
end process;
	
end make_powers;
