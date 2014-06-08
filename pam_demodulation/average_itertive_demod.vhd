library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;
use work.assert_pack.all;

USE STD.TEXTIO.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;

entity average_itertive_demod is
	port(
		clk : in STD_LOGIC;
		reset : in std_logic;
		after_pilot_start: in std_logic; --# он должен быть над первым i_ce
		i_ce : in std_logic;		
		i_samplesI: in std_logic_vector(15 downto 0);
		i_samplesQ: in std_logic_vector(15 downto 0);

		i_init_phaseI: in std_logic_vector(15 downto 0);
		i_init_phaseQ: in std_logic_vector(15 downto 0);

		o_samples_phase: out std_logic_vector(15 downto 0);
		out_ce: out std_logic
		);
end average_itertive_demod;



architecture average_itertive_demod of average_itertive_demod is

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



begin

--r2p_inst: entity work.cordic_wrapper
--	port map(
--		clk=>clk,
--		i_ce =>'1',--i_ce,
--		i_samplesI =>i_samplesI,
--		i_samplesQ =>i_samplesQ,
--
--		phase =>sample_phase
--		);


end average_itertive_demod;

