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

type Tmem is array(0 to 262143) of std_logic_vector(18 downto 0);
signal mem:Tmem;

attribute ram_init_file : string;
attribute ram_init_file of mem : signal is "mem.mif";



begin

process(clk) is
begin
	if rising_edge(clk) then
		valmem
	end if;
end process;

end table_phaseerrors;
