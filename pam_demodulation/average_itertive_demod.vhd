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
	generic(
		SIMULATION:integer:=1
	);
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
constant SH:integer:=3;

signal acum_re_1w,acum_im_1w,acum_re_new,acum_im_new,acum_re,acum_im,sample_rotI,sample_rotQ:std_logic_vector(15 downto 0);
signal table_re,table_im,to_tab_re,to_tab_im:std_logic_vector(BITSIZE-1 downto 0);
signal table_reE,table_imE:std_logic_vector(15 downto 0);
signal ce_1w,ce_table,ce_acum,shift1,shift2:std_logic;

begin

SIM01: if SIMULATION=1 generate
	save_complexdata_i: entity work.save_complexdata
		port map(
		clk =>clk,
		i_ce =>i_ce,
		i_samplesI=>i_samplesI,
		i_samplesQ=>i_samplesQ,

		i_ce2 =>after_pilot_start,
		i_samplesI2=>i_init_phaseI,
		i_samplesQ2=>i_init_phaseQ
		);
end generate;


table_reE<=table_re&EXT("0",16-BITSIZE);
table_imE<=table_im&EXT("0",16-BITSIZE);

complex_mult_q_i: entity work.complex_mult_q
	generic map(
		SHIFT_MUL=>1,
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
		SHIFT_MUL=>3, --# (числа указаны при 3)
		CONJUGATION=>'0' --# умножение на сопряженное число, если '1' - то сопрягать
	)
	port map(
		clk =>clk,
		i_ce =>ce_table,
		A_I=>acum_re_1w,       --# 6101+1i*1157  (верно)
		B_Q=>acum_im_1w,

		C_I=>table_reE,        --# 32256-1i*4352 (верно)
		D_Q=>table_imE,


		o_I=>acum_re_new, --# тут происходит переполнение должно быть 12318+1i*656
		o_Q=>acum_im_new,
		out_ce=>ce_acum
		);

shift1<='1' when unsigned(signed_abs(sample_rotI(sample_rotI'Length-1 downto 6)))>127 or unsigned(signed_abs(sample_rotQ(sample_rotQ'Length-1 downto 6)))>127  else '0';

to_tab_re<=SXT(sample_rotI(sample_rotI'Length-1 downto 9),BITSIZE) when 
	unsigned(signed_abs(sample_rotI(sample_rotI'Length-1 downto 6)))>127 or unsigned(signed_abs(sample_rotQ(sample_rotQ'Length-1 downto 6)))>127 
	else sample_rotI(6+BITSIZE-1 downto 6);

to_tab_im<=SXT(sample_rotQ(sample_rotQ'Length-1 downto 9),BITSIZE) when 
	unsigned(signed_abs(sample_rotI(sample_rotI'Length-1 downto 6)))>127 or unsigned(signed_abs(sample_rotQ(sample_rotQ'Length-1 downto 6)))>127 
	else sample_rotQ(6+BITSIZE-1 downto 6);


table_demod_i:entity work.table_demod
	generic map(
		BIT_IN=>BITSIZE,
		BIT_OUT=>BITSIZE
	)
	 port map(
		  clk =>clk,
		  i_ce=>ce_1w,
	      sample_in_re=>to_tab_re,
	      sample_in_im=>to_tab_im,
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
				if unsigned(signed_abs(acum_re_new))>16384  or  unsigned(signed_abs(acum_im_new))>16384 then
					acum_re<=SXT(acum_re_new(15 downto 2),16);
					acum_im<=SXT(acum_im_new(15 downto 2),16);
					shift2<='1';
				elsif unsigned(signed_abs(acum_re_new))>8192  or  unsigned(signed_abs(acum_im_new))>8192 then
					acum_re<=SXT(acum_re_new(15 downto 1),16);
					acum_im<=SXT(acum_im_new(15 downto 1),16);
					shift2<='1';
				elsif unsigned(signed_abs(acum_re_new))<2048  and  unsigned(signed_abs(acum_im_new))<2048 then
					acum_re<=acum_re_new(15-3 downto 0)&"000";
					acum_im<=acum_im_new(15-3 downto 0)&"000";
					shift2<='0';
				else
					shift2<='0';
					acum_re<=acum_re_new;
					acum_im<=acum_im_new;
				end if;
			end if; --# i_ce
		end if;     --# reset
	end if;
end process;


end average_itertive_demod;

