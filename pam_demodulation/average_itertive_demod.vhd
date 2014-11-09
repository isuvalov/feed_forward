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
constant SH:integer:=4;
constant FLEN:integer:=16;
constant DIV_TABLEW:integer:=8-1;
constant MMM:integer:=10;


type Tceil is array(1 downto 0) of std_logic_vector(DIV_TABLEW downto 0);
type Tdiv_tab_raw is array(-(2**DIV_TABLEW) to (2**DIV_TABLEW)-1) of Tceil;
type Tdiv_tab is array(-(2**DIV_TABLEW) to (2**DIV_TABLEW)-1) of Tdiv_tab_raw;

signal div_tab:Tdiv_tab;

function make_tab (a:integer) return Tdiv_tab is
variable ret:Tdiv_tab;
begin
 for xx in (-(2**DIV_TABLEW)) to ((2**DIV_TABLEW)-1) loop
	 for yy in (-(2**DIV_TABLEW)) to ((2**DIV_TABLEW)-1) loop
		 if (xx/=0) and (yy/=0) then
		 ret(xx)(yy)(0):=conv_std_logic_vector(integer(real(2**DIV_TABLEW)*real(xx)/sqrt(real(xx*xx+yy*yy))),DIV_TABLEW+1);
		 ret(xx)(yy)(1):=conv_std_logic_vector(integer(real(2**DIV_TABLEW)*real(yy)/sqrt(real(xx*xx+yy*yy))),DIV_TABLEW+1);
		end if;
	end loop; --# y
end loop;     --# x

for xx in (-(2**DIV_TABLEW)) to ((2**DIV_TABLEW)-1) loop
	ret(xx)(0)(0):="01"&EXT("0",DIV_TABLEW-1);
	ret(xx)(0)(1):=(others=>'0');
	ret(0)(xx)(0):="01"&EXT("0",DIV_TABLEW-1);
	ret(0)(xx)(1):=(others=>'0');
end loop;

return ret;
end make_tab;

type Tmean_array is array(FLEN-1 downto 0) of std_logic_vector(BITSIZE+log2roundup(FLEN)-1 downto 0); 
signal mean_array_re,mean_array_im:Tmean_array;
signal mean_re,mean_im:std_logic_vector(mean_array_re(0)'Length-1 downto 0);

signal acum_re_1w,acum_im_1w,acum_re_new,acum_im_new,acum_re,acum_im,sample_rotI,sample_rotQ:std_logic_vector(15 downto 0);
signal ssample_rotI,ssample_rotQ:std_logic_vector(15 downto 0);
signal table_re,table_im:std_logic_vector(BITSIZE-1 downto 0);
signal table_reE,table_imE:std_logic_vector(15 downto 0);
signal table_re2E,table_im2E:std_logic_vector(15 downto 0);
--signal ce_1w,ce_table,ce_acum:std_logic;
signal ce_1w,ce_table,ce_acum,shift1,shift2:std_logic;
signal sample_norm_I,sample_norm_Q,samplesI_1w,samplesQ_1w:std_logic_vector(15 downto 0);

begin

div_tab<=make_tab(0);

--cxceil: for xx in (-(2**DIV_TABLEW)) to ((2**DIV_TABLEW)-1) generate
--	cyceil: for yy in (-(2**DIV_TABLEW)) to ((2**DIV_TABLEW)-1) generate
--		ifc: if (xx/=0) and (yy/=0) generate
--		ceil0: div_tab(xx)(yy)(0)<=conv_std_logic_vector(integer(127.0*real(xx)/sqrt(real(xx*xx+yy*yy))),DIV_TABLEW+1);
--		ceil1: div_tab(xx)(yy)(1)<=conv_std_logic_vector(integer(127.0*real(yy)/sqrt(real(xx*xx+yy*yy))),DIV_TABLEW+1);
----		ceil0: div_tab(xx)(yy)(0)<=conv_std_logic_vector((255*xx)/integer(ROUND(sqrt(real(xx*xx+yy*yy)))),DIV_TABLEW+1);
----		ceil1: div_tab(xx)(yy)(1)<=conv_std_logic_vector((255*yy)/integer(ROUND(sqrt(real(xx*xx+yy*yy)))),DIV_TABLEW+1);
--		end generate;
--	end generate; --# y
--end generate;     --# x
--div_tab(0)(0)(0)<=(others=>'0');
--div_tab(0)(0)(1)<=(others=>'0');

table_reE<=table_re&EXT("0",16-BITSIZE);
table_imE<=table_im&EXT("0",16-BITSIZE);

--table_re2E<=mean_re(mean_re'Length-1 downto 5)&EXT("0",16-(mean_re'Length-5));
--table_im2E<=mean_im(mean_re'Length-1 downto 5)&EXT("0",16-(mean_re'Length-5));


table_re2E<=mean_re(mean_re'Length-1 downto 6)&EXT("0",16-(mean_re'Length-6));
table_im2E<=mean_im(mean_re'Length-1 downto 6)&EXT("0",16-(mean_re'Length-6));


--table_re2E<=EXT(mean_re(mean_re'Length-1 downto 0),16);--&EXT("0",16-(mean_re'Length-3));
--table_im2E<=EXT(mean_im(mean_re'Length-1 downto 0),16);--&EXT("0",16-(mean_re'Length-3));


complex_mult_qo_i: entity work.complex_mult_q
	generic map(
		SHIFT_MUL=>3,
		CONJUGATION=>'1' --# умножение на сопряженное число, если '1' - то сопрягать
	)
	port map(
		clk =>clk,
		i_ce =>i_ce,
		A_I=>samplesI_1w,
		B_Q=>samplesQ_1w,

		C_I=>acum_re,
		D_Q=>acum_im,


		o_I=>ssample_rotI,
		o_Q=>ssample_rotQ,
		out_ce=>open
		);


complex_mult_q_i: entity work.complex_mult_q
	generic map(
		SHIFT_MUL=>3,
		CONJUGATION=>'1' --# умножение на сопряженное число, если '1' - то сопрягать
	)
	port map(
		clk =>clk,
		i_ce =>i_ce,
--		A_I=>sample_norm_I,--i_samplesI,
--		B_Q=>sample_norm_Q,--i_samplesQ,
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

		C_I=>table_re2E,
		D_Q=>table_im2E,
--		C_I=>table_reE,
--		D_Q=>table_imE,



		o_I=>acum_re_new,
		o_Q=>acum_im_new,
		out_ce=>ce_acum
		);


--mean_array_re(0)<=SXT(table_re,mean_array_re(0)'Length);
--mean_array_im(0)<=SXT(table_im,mean_array_re(0)'Length);


process(clk) is
begin
	if rising_edge(clk) then

		if i_ce='1' then
			samplesI_1w<=i_samplesI;
			samplesQ_1w<=i_samplesQ;
            if unsigned(signed_abs(i_samplesI))<(2**DIV_TABLEW) and unsigned(signed_abs(i_samplesQ))<(2**DIV_TABLEW) then
				sample_norm_I<=SXT(div_tab(conv_integer(signed(i_samplesI(DIV_TABLEW downto 0))))(conv_integer(signed(i_samplesI(DIV_TABLEW downto 0))))(0)&"000000",16);
				sample_norm_Q<=SXT(div_tab(conv_integer(signed(i_samplesQ(DIV_TABLEW downto 0))))(conv_integer(signed(i_samplesQ(DIV_TABLEW downto 0))))(1)&"000000",16);
			else
				sample_norm_I<=SXT(div_tab(conv_integer(signed(i_samplesI(15 downto 15-DIV_TABLEW))))(conv_integer(signed(i_samplesI(15 downto 15-DIV_TABLEW))))(0)&"000000",16);
				sample_norm_Q<=SXT(div_tab(conv_integer(signed(i_samplesQ(15 downto 15-DIV_TABLEW))))(conv_integer(signed(i_samplesQ(15 downto 15-DIV_TABLEW))))(1)&"000000",16);
			end if;

		end if;




		if after_pilot_start='1' then
--			mean_array_re<=(others=>i_init_phaseI(i_init_phaseI'Length-1 downto i_init_phaseI'Length-mean_array_re(0)'Length));
--			mean_array_im<=(others=>i_init_phaseQ(i_init_phaseI'Length-1 downto i_init_phaseI'Length-mean_array_re(0)'Length));
			mean_array_re<=(others=>i_init_phaseI(mean_array_re(0)'Length-1 downto 0));
			mean_array_im<=(others=>i_init_phaseQ(mean_array_re(0)'Length-1 downto 0));

		elsif ce_table='1' then
--			mean_array_re(0)<=SXT(table_re,mean_array_re(0)'Length);
--			mean_array_im(0)<=SXT(table_im,mean_array_re(0)'Length);
			for i in FLEN-1 downto 2 loop
				mean_array_re(i)<=mean_array_re(i-1);
				mean_array_im(i)<=mean_array_im(i-1);
			end loop;
				mean_array_re(1)<=SXT(table_re,mean_array_re(0)'Length);
				mean_array_im(1)<=SXT(table_im,mean_array_re(0)'Length);

  
			mean_im<=mean_array_im(0)+mean_array_im(1)+mean_array_im(2)+mean_array_im(3)+mean_array_im(4)+mean_array_im(5)+
					mean_array_im(6)+mean_array_im(7)+mean_array_im(8)+mean_array_im(9)+mean_array_im(10)+mean_array_im(11)+
					mean_array_im(12)+mean_array_im(13)+mean_array_im(14)+mean_array_im(15);

  
			mean_re<=mean_array_re(0)+mean_array_re(1)+mean_array_re(2)+mean_array_re(3)+mean_array_re(4)+mean_array_re(5)+
					mean_array_re(6)+mean_array_re(7)+mean_array_re(8)+mean_array_re(9)+mean_array_re(10)+mean_array_re(11)+
					mean_array_re(12)+mean_array_re(13)+mean_array_re(14)+mean_array_re(15);
    

		end if;
	end if;
end process;

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


--process(clk) is
--begin
--	if rising_edge(clk) then
--		ce_1w<=i_ce;
--		out_ce<=i_ce;
--		acum_re_1w<=acum_re;
--		acum_im_1w<=acum_im;
--		o_samplesI<=sample_rotI;
--		o_samplesQ<=sample_rotQ;
--
--		if after_pilot_start='1' then
--			acum_re<=i_init_phaseI;
--			acum_im<=i_init_phaseQ;
--		else        --# reset
--			if ce_acum='1' then
--				acum_re<=acum_re_new;
--				acum_im<=acum_im_new;
--			end if; --# i_ce
--		end if;     --# reset
--	end if;
--end process;

process(clk) is
begin
	if rising_edge(clk) then
		ce_1w<=i_ce;
		out_ce<=i_ce;
		o_samplesI<=ssample_rotI;
		o_samplesQ<=ssample_rotQ;

		if after_pilot_start='1' then
			acum_re<=i_init_phaseI;
			acum_im<=i_init_phaseQ;
			acum_re_1w<=i_init_phaseI;
			acum_im_1w<=i_init_phaseQ;

		else        --# reset
			acum_re_1w<=acum_re;
			acum_im_1w<=acum_im;

			if ce_acum='1' then
--				if unsigned(signed_abs(acum_re_new))>16384  or  unsigned(signed_abs(acum_im_new))>16384 then
--					acum_re<=SXT(acum_re_new(15 downto 3),16);
--					acum_im<=SXT(acum_im_new(15 downto 3),16);
--					shift2<='1';
--				elsif unsigned(signed_abs(acum_re_new))>8192  or  unsigned(signed_abs(acum_im_new))>8192 then
--					acum_re<=SXT(acum_re_new(15 downto 2),16);
--					acum_im<=SXT(acum_im_new(15 downto 2),16);
--					shift2<='1';
--				elsif unsigned(signed_abs(acum_re_new))>4096  or  unsigned(signed_abs(acum_im_new))>4096 then
--					acum_re<=SXT(acum_re_new(15 downto 1),16);
--					acum_im<=SXT(acum_im_new(15 downto 1),16);
--					shift2<='1';
--				elsif unsigned(signed_abs(acum_re_new))<2048  and  unsigned(signed_abs(acum_im_new))<2048 then
--					acum_re<=acum_re_new(15-1 downto 0)&"0";
--					acum_im<=acum_im_new(15-1 downto 0)&"0";
--					shift2<='0';
--				elsif unsigned(signed_abs(acum_re_new))<1024  and  unsigned(signed_abs(acum_im_new))<1024 then
--					acum_re<=acum_re_new(15-2 downto 0)&"00";
--					acum_im<=acum_im_new(15-2 downto 0)&"00";
--					shift2<='0';
--				elsif unsigned(signed_abs(acum_re_new))<512  and  unsigned(signed_abs(acum_im_new))<512 then
--					acum_re<=acum_re_new(15-3 downto 0)&"000";
--					acum_im<=acum_im_new(15-3 downto 0)&"000";
--					shift2<='0';
--				else
--					shift2<='0';
--					acum_re<=acum_re_new;
--					acum_im<=acum_im_new;
--				end if;
                if unsigned(signed_abs(acum_re_new))<(2**DIV_TABLEW) and unsigned(signed_abs(acum_im_new))<(2**DIV_TABLEW) then
					acum_re<=SXT(div_tab(conv_integer(signed(acum_re_new(DIV_TABLEW downto 0))))(conv_integer(signed(acum_im_new(DIV_TABLEW downto 0))))(0)&"000000",16);
					acum_im<=SXT(div_tab(conv_integer(signed(acum_re_new(DIV_TABLEW downto 0))))(conv_integer(signed(acum_im_new(DIV_TABLEW downto 0))))(1)&"000000",16);
				else
					acum_re<=SXT(div_tab(conv_integer(signed(acum_re_new(15 downto 15-DIV_TABLEW))))(conv_integer(signed(acum_im_new(15 downto 15-DIV_TABLEW))))(0)&"000000",16);
					acum_im<=SXT(div_tab(conv_integer(signed(acum_re_new(15 downto 15-DIV_TABLEW))))(conv_integer(signed(acum_im_new(15 downto 15-DIV_TABLEW))))(1)&"000000",16);
				end if;
			end if; --# i_ce
		end if;     --# reset
	end if;
end process;


end average_itertive_demod;

