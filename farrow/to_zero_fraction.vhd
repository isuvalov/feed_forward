library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;

entity to_zero_fraction is
	port(
		clk : in STD_LOGIC;
		reset : in std_logic;

		i_sampleI: in std_logic_vector(15 downto 0);
		i_sampleQ: in std_logic_vector(15 downto 0);
		i_ce: in std_logic;

		o_sampleI: out std_logic_vector(15 downto 0);
		o_sampleQ: out std_logic_vector(15 downto 0);
		o_ce: out std_logic
		);
end to_zero_fraction;



architecture to_zero_fraction of to_zero_fraction is

signal sampleI_shifted,sampleQ_shifted:std_logic_vector(15 downto 0);

signal mesured_mu: std_logic_vector(7 downto 0);
signal mesured_muE: std_logic_vector(15 downto 0);
signal mesured_mu_ce:std_logic;

begin



farrow16_i:entity work.farrow_32bit
	generic map(
		MU_SIZE=>8
	)
	port map(
		clk =>clk,
		reset =>reset,

		i_mu=>mesured_mu(7 downto 0), --# signed 2.14 i.e. 14bit for fraction
		
		i_sample=>i_sampleI, --sampleI_tx,--
		i_ce=>i_ce,

		o_sample=>sampleI_shifted,
		o_ce=>open
		);


farrow16_q:entity work.farrow_32bit
	generic map(
		MU_SIZE=>8
	)
	port map(
		clk =>clk,
		reset =>reset,

		i_mu=>mesured_mu(7 downto 0), --# signed 2.14 i.e. 14bit for fraction
		
		i_sample=>i_sampleQ, --sampleI_tx,--
		i_ce=>i_ce,

		o_sample=>sampleQ_shifted,
		o_ce=>o_ce
		);


gardner_ted_stm_i: entity work.gardner_ted_stm
	port map(
		clk =>clk,
		reset =>reset,

		i_sampleI=>sampleI_shifted,
		i_sampleQ=>sampleQ_shifted,
		i_ce=>i_ce,

		o_mu=>mesured_mu,
		o_ce=>mesured_mu_ce
		);

o_sampleI<=sampleI_shifted;
o_sampleQ<=sampleQ_shifted;

process (clk) is
begin
	if rising_edge(clk) then
	end if;
end process;

	
end to_zero_fraction;
