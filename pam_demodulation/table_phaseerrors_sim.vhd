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

component use_phaseerrors
port (
	clk : in std_logic;

	input_angles: in std_logic_vector(8 downto 0);
	phase_acum_mod: in std_logic_vector(8 downto 0);

	phi_error: out std_logic_vector(8 downto 0);
	val_engle: out std_logic_vector(9 downto 0)
);
end component;

begin

use_phaseerrors_inst: use_phaseerrors
port map(
	clk =>clk,

	input_angles=>input_angles,
	phase_acum_mod=>phase_acum_mod,

	phi_error=>phi_error,
	val_engle=>val_engle
);


end table_phaseerrors;
