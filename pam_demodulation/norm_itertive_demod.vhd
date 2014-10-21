library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;
use work.assert_pack.all;
use WORK.MATH_REAL.all;

USE STD.TEXTIO.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;

entity norm_itertive_demod is
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
end norm_itertive_demod;



architecture norm_itertive_demod of norm_itertive_demod is

function mround (L: std_logic_vector; size:integer) return std_logic_vector is
variable result : std_logic_vector(size-1 downto 0) ;
begin
  result:=L(L'Length-1 downto L'Length-size)+EXT("0"&L(L'Length-size-1),size);
  return result ;
end mround;

constant BITSIZE:integer:=6;


--type Tceil is array(1 downto 0) of std_logic_vector(DIV_TABLEW downto 0);
--type Tdiv_tab_raw is array(-(2**DIV_TABLEW) to (2**DIV_TABLEW)-1) of Tceil;
--type Tdiv_tab is array(-(2**DIV_TABLEW) to (2**DIV_TABLEW)-1) of Tdiv_tab_raw;
--signal div_tab:Tdiv_tab;


--type Tmean_array is array(FLEN-1 downto 0) of std_logic_vector(BITSIZE+log2roundup(FLEN)-1 downto 0); 
--signal mean_array_re,mean_array_im:Tmean_array;
--signal mean_re,mean_im:std_logic_vector(mean_array_re(0)'Length-1 downto 0);



signal table_re,table_im:std_logic_vector(BITSIZE-1 downto 0);
--signal ce_1w,ce_table,ce_acum:std_logic;
signal ce_1w,ce_acum,shift1,shift2:std_logic;
signal sample_norm_I,sample_norm_Q,samplesI_1w,samplesQ_1w:std_logic_vector(15 downto 0);


signal acum_re_new,acum_re:std_logic_vector(15 downto 0):=x"7FFF";
signal acum_im_new,acum_im:std_logic_vector(15 downto 0):=x"0000";

signal	norm_samplesI,norm_samplesQ,norm_samples2I,norm_samples2Q: std_logic_vector(15 downto 0);
signal	del_samplesI,del_samplesQ: std_logic_vector(15 downto 0);
signal  ce_first_rot,ce_table:std_logic;
signal samplesI_reg,samplesQ_reg:std_logic_vector(15 downto 0);
signal ssample_rotI,ssample_rotQ:std_logic_vector(15 downto 0);
signal ssample_rotI_round,ssample_rotQ_round:std_logic_vector(15 downto 0);
signal table_reE,table_imE:std_logic_vector(15 downto 0);
signal table_re2E,table_im2E:std_logic_vector(15 downto 0);

signal after_pilot_start_norm:std_logic;
signal init_phaseI_norm,init_phaseQ_norm:std_logic_vector(15 downto 0);


begin

abs_normalizer_int: entity work.abs_normalizer
	port map(
		clk =>clk,
		reset =>reset,
		i_ce =>after_pilot_start,
		i_samplesI=>i_init_phaseI,
		i_samplesQ=>i_init_phaseQ,

		o_norm_samplesI =>init_phaseI_norm,
		o_norm_samplesQ =>init_phaseQ_norm,

		o_samplesI=>open,
		o_samplesQ=>open,


		out_ce=>after_pilot_start_norm
		);



abs_normalizer_i:entity work.abs_normalizer
	port map(
		clk =>clk,
		reset =>reset,
		i_ce =>'1',
		i_samplesI=>samplesI_reg,--i_samplesI,
		i_samplesQ=>samplesQ_reg,--i_samplesQ,

		o_norm_samplesI =>norm_samplesI,
		o_norm_samplesQ =>norm_samplesQ,

		o_samplesI =>del_samplesI,
		o_samplesQ =>del_samplesQ,

		out_ce=>open
		);


norm_samples2I<=norm_samplesI(norm_samples2I'Length-2 downto 0)&"0";
norm_samples2Q<=norm_samplesQ(norm_samples2I'Length-2 downto 0)&"0";


--complex_mult_qo_i: entity work.complex_mult_q_equal
complex_mult_qo_i: entity work.complex_mult_q
	generic map(
		SHIFT_MUL=>0,
		CONJUGATION=>'1' --# умножение на сопряженное число, если '1' - то сопрягать
	)
	port map(
		clk =>clk,
		i_ce =>i_ce,
		A_I=>norm_samples2I,
		B_Q=>norm_samples2Q,

		C_I=>acum_re_new,
		D_Q=>acum_im_new,


		o_I=>ssample_rotI,
		o_Q=>ssample_rotQ,
		out_ce=>ce_first_rot
		);

ssample_rotI_round<=mround(ssample_rotI,BITSIZE)&EXT("0",ssample_rotI_round'Length-BITSIZE);
ssample_rotQ_round<=mround(ssample_rotQ,BITSIZE)&EXT("0",ssample_rotI_round'Length-BITSIZE);

--ssample_rotI_round<=ssample_rotI(ssample_rotI'Length-1 downto ssample_rotI'Length-BITSIZE)&EXT("0",ssample_rotI_round'Length-BITSIZE);
--ssample_rotQ_round<=ssample_rotQ(ssample_rotI'Length-1 downto ssample_rotI'Length-BITSIZE)&EXT("0",ssample_rotI_round'Length-BITSIZE);


table_demod_i: entity work.table_demod_ver2 
	generic map(
		BIT_IN=>BITSIZE,
		BIT_OUT=>BITSIZE
	)
	 port map(
		  clk =>clk,
		  i_ce =>ce_first_rot,
	      sample_in_re=>ssample_rotI_round(ssample_rotI_round'Length-1 downto ssample_rotI_round'Length-BITSIZE),
	      sample_in_im=>ssample_rotQ_round(ssample_rotQ_round'Length-1 downto ssample_rotQ_round'Length-BITSIZE),
		  o_ce=>ce_table,
	      o_phase_error_re=>table_re,
	      o_phase_error_im=>table_im
		 );

table_reE<=table_re&EXT("0",16-BITSIZE);
table_imE<=table_im&EXT("0",16-BITSIZE);
--table_reE<=SXT(table_re,16);
--table_imE<=SXT(table_im,16);



--complex_mult_q_ii: entity work.complex_mult_q_equal
complex_mult_q_ii: entity work.complex_mult_q
	generic map(
		SHIFT_MUL=>7,
		CONJUGATION=>'0' --# умножение на сопряженное число, если '1' - то сопрягать
	)
	port map(
		clk =>clk,
		i_ce =>ce_table,
		A_I=>acum_re_new,
		B_Q=>acum_im_new,

		C_I=>table_reE,
		D_Q=>table_imE,



		o_I=>acum_re,
		o_Q=>acum_im,
		out_ce=>ce_acum
		);


process(clk) is
begin
	if rising_edge(clk) then

		if i_ce='1' then
			samplesI_reg<=i_samplesI;
			samplesQ_reg<=i_samplesQ;
		end if;

		ce_1w<=i_ce;
		out_ce<=i_ce;
		o_samplesI<=ssample_rotI;
		o_samplesQ<=ssample_rotQ;
		if after_pilot_start_norm='1' then
			acum_re_new<=init_phaseI_norm(init_phaseI_norm'Length-2 downto 0)&"0";
			acum_im_new<=init_phaseQ_norm(init_phaseI_norm'Length-2 downto 0)&"0";
		else
			if ce_acum='1' then
				if acum_re=0 then
					acum_re_new<=conv_std_logic_vector(1,acum_re_new'Length);
				else
					acum_re_new<=acum_re;
				end if;
				if acum_im=0 then
					acum_im_new<=conv_std_logic_vector(1,acum_im_new'Length);
				else
					acum_im_new<=acum_im;
				end if;

			end if;
		end if;
	end if;
end process;


end norm_itertive_demod;

