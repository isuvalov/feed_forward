library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;

entity gardner_ted_stm is
	port(
		clk : in STD_LOGIC;
		reset : in std_logic;

		i_sampleI: in std_logic_vector(15 downto 0);
		i_sampleQ: in std_logic_vector(15 downto 0);
		i_ce: in std_logic;

		o_mu: out std_logic_vector(15 downto 0);
		o_ce: out std_logic
		);
end gardner_ted_stm;



architecture gardner_ted_stm of gardner_ted_stm is

signal mu_error:std_logic_vector(15 downto 0);
signal mu_error_ce:std_logic;

signal mu_error_acum,mu_error_acum_filt:std_logic_vector(15 downto 0);

begin

gardner_ted_i: entity work.gardner_ted
	port map(
		clk =>clk,
		reset =>reset,

		i_sampleI=>i_sampleI,
		i_sampleQ=>i_sampleQ,
		i_ce=>i_ce,

		o_mu=>mu_error,
		o_ce =>mu_error_ce
		);


process (clk) is
begin
	if rising_edge(clk) then
		if reset='1' then
			mu_error_acum<=(others=>'0');
		else
			if signed(mu_error)>0 then
				mu_error_acum<=mu_error_acum-1;
			elsif signed(mu_error)<0 then
				mu_error_acum<=mu_error_acum+1;
			else
				mu_error_acum<=mu_error_acum+0;
			end if;
		end if;
		o_ce<=mu_error_ce;
	end if;
end process;

bih_filter_freq_i:entity work.bih_filter_freq
	generic map(
		ALPHA_NUM=>7-2+1,
		SCALE_FACTOR=>5-2+1,

		WIDTH=>mu_error_acum'Length
	)
	port map(
		clk =>clk,
		reset=>reset,
		ce =>i_ce,
		sample =>mu_error_acum,

		filtered=>mu_error_acum_filt,
		ce_out =>open
	);

o_mu<=mu_error_acum_filt;
	
end gardner_ted_stm;
