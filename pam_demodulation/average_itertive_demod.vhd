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

		o_samplesI: out std_logic_vector(15 downto 0);
		o_samplesQ: out std_logic_vector(15 downto 0);

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

constant BITSIZE:integer:=8;
constant SH:integer:=5;

signal acum_re_1w,acum_im_1w,acum_re_new,acum_im_new,acum_re,acum_im,sample_rotI,sample_rotQ:std_logic_vector(15 downto 0);
signal table_re,table_im:std_logic_vector(BITSIZE-1 downto 0);
signal table_reE,table_imE:std_logic_vector(15 downto 0);
signal ce_1w,ce_table,ce_acum:std_logic;

begin

table_reE<=table_re&EXT("0",16-BITSIZE);
table_imE<=table_im&EXT("0",16-BITSIZE);

complex_mult_q_i: entity work.complex_mult_q
	generic map(
		SHIFT_MUL=>0,
		CONJUGATION=>'1' --# умножение на сопряженное число, если '1' - то сопрягать
	)
	port map(
		clk =>clk,
		i_ce =>i_ce,
		A_I=>i_samplesI,
		B_Q=>i_samplesQ,

		C_I=>acum_re,
		D_Q=>acum_im,


		o_I=>sample_rotI,
		o_Q=>sample_rotQ,
		out_ce=>open
		);

complex_mult_q_ii: entity work.complex_mult_q
	generic map(
		SHIFT_MUL=>SH,
		CONJUGATION=>'0' --# умножение на сопряженное число, если '1' - то сопрягать
	)
	port map(
		clk =>clk,
		i_ce =>ce_table,
		A_I=>acum_re_1w,
		B_Q=>acum_im_1w,

		C_I=>table_reE,
		D_Q=>table_imE,


		o_I=>acum_re_new,
		o_Q=>acum_im_new,
		out_ce=>ce_acum
		);


table_demod_i:entity work.table_demod
	generic map(
		BIT_IN=>BITSIZE,
		BIT_OUT=>BITSIZE
	)
	 port map(
		  clk =>clk,
		  i_ce=>ce_1w,
	      sample_in_re=>sample_rotI(sample_rotI'Length-1-SH downto sample_rotI'Length-BITSIZE-SH),
	      sample_in_im=>sample_rotQ(sample_rotI'Length-1-SH downto sample_rotI'Length-BITSIZE-SH),
		  o_ce=>ce_table,
	      sample_out_re=>table_re,
	      sample_out_im=>table_im
		 );


process(clk) is
begin
	if rising_edge(clk) then
		ce_1w<=i_ce;
		out_ce<=i_ce;
		acum_re_1w<=acum_re;
		acum_im_1w<=acum_im;
		o_samplesI<=sample_rotI;
		o_samplesQ<=sample_rotQ;

		if after_pilot_start='1' then
			acum_re<=i_init_phaseI;
			acum_im<=i_init_phaseQ;
		else        --# reset
			if ce_acum='1' then
				acum_re<=acum_re_new;
				acum_im<=acum_im_new;
			end if; --# i_ce
		end if;     --# reset
	end if;
end process;


end average_itertive_demod;

