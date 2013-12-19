library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;


entity table_phaseerrors is
	port(
		clk : in std_logic;

		input_angles: in std_logic_vector(8 downto 0);
		phase_acum_mod: in std_logic_vector(8 downto 0);

		phi_error: out std_logic_vector(8 downto 0);
		val_engle: out std_logic_vector(9 downto 0)
		);
end table_phaseerrors;



architecture table_phaseerrors of table_phaseerrors is

component core_phaseerrors_mif
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		q		: OUT STD_LOGIC_VECTOR (18 DOWNTO 0)
	);
end component;

signal address : STD_LOGIC_VECTOR (15 DOWNTO 0);

signal qout:STD_LOGIC_VECTOR (18 DOWNTO 0);

begin

process(clk) is
begin
	if rising_edge(clk) then
	end if;
end process;

address<=phase_acum_mod(8 downto 1)&input_angles(8 downto 1);

core_phaseerrors_mif_o: core_phaseerrors_mif
	PORT map
	(
		address=>address,
		clock=>clk,
		q	=>qout
	);

val_engle<=qout(9 downto 0);
phi_error<=qout(18 downto 10);

end table_phaseerrors;
