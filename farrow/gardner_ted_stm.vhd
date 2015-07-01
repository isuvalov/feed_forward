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

		o_mu: out std_logic_vector(7 downto 0);
		o_ce: out std_logic
		);
end gardner_ted_stm;



architecture gardner_ted_stm of gardner_ted_stm is

signal mu_error:std_logic_vector(15 downto 0);
signal mu_error_ce:std_logic;

signal mu_error_acum,mu_error_acum_filt:std_logic_vector(7 downto 0);

constant MAX_MU:integer:=127;
constant MIN_MU:integer:=-127;

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
--			mu_error_acum<=conv_std_logic_vector(1*256,o_mu'Length);--(others=>'0');
			mu_error_acum<=(others=>'0');
		else
			if mu_error_ce='1' then
				if signed(mu_error)>0 then
					if signed(mu_error_acum)>MIN_MU+1 then
						mu_error_acum<=mu_error_acum-1;
					end if;
				elsif signed(mu_error)<0 then
					if signed(mu_error_acum)<MAX_MU-1 then
						mu_error_acum<=mu_error_acum+1;
					end if;
				else
					mu_error_acum<=mu_error_acum+0;
				end if;
			end if;
		end if;
		o_ce<=mu_error_ce;

--	if mu_error_acum_filt=0 then
--		o_mu<=conv_std_logic_vector(1*256,o_mu'Length);
--	else
--		o_mu<=signed(mu_error_acum_filt(12 downto 0))*signed(conv_std_logic_vector(3,3));
		o_mu<=mu_error_acum_filt;
--	end if;

	end if;
end process;

bih_filter_freq_i:entity work.bih_filter_freq
	generic map(
		ALPHA_NUM=>7-2+1+1,
		SCALE_FACTOR=>5-2+1+1,

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


	
end gardner_ted_stm;
