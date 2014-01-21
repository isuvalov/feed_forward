library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;
use work.assert_pack.all;

USE STD.TEXTIO.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;

entity itertive_demod is
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
end itertive_demod;



architecture itertive_demod of itertive_demod is

constant DEBUG:integer:=0;
constant SHFT:natural:=11;
constant FI_POROG_PHASE:integer:=201; --# =Fi_porog*256

component table_phaseerrors is
	port(
		clk : in std_logic;

		input_angles: in std_logic_vector(8 downto 0);
		phase_acum_mod: in std_logic_vector(8 downto 0);

		phi_error: out std_logic_vector(8 downto 0);
		val_engle: out std_logic_vector(9 downto 0)
		);
end component;


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

signal init_phase2,init_phase,sample_phase,init_add_phase,sample_add_phase,sample_phase_ok,sample_init_ok,sample_phase_reg:std_logic_vector(19 downto 0):=(others=>'0');
signal samples_phase_mul,init_phase_mul:std_logic_vector(19+15 downto 0);
--signal :std_logic_vector(19 downto 0);
signal sample_phase_short,phase_demod_acumMOD,phi_error:std_logic_vector(8 downto 0);
signal val_engle_reg,val_engle:std_logic_vector(9 downto 0);

signal phase_demod_acum,filt_acum,phase_delta_round,phase_delta,phase_demod_acum_new,phase_demod_acum_demod:std_logic_vector(19 downto 0):=(others=>'0');
signal phase_demod_acum_new_pi:std_logic_vector(phase_demod_acum_new'Length+20-1 downto 0):=(others=>'0');
signal phase_delta_short:std_logic_vector(8 downto 0):=(others=>'0');
signal phase_demod_acum_int0,phase_demod_acum_start,phase_demod_acum_p_err,phase_demod_acum_p_err_1w:std_logic_vector(19 downto 0):=(others=>'0');
signal phase_demod_acum_p_errE:std_logic_vector(phase_demod_acum_p_err'Length-1 downto 0):=(others=>'0');
signal phase_demod_acum_start_shift:std_logic_vector(8 downto 0):=(others=>'0');

signal phase_demod_acum_start_div_mod:std_logic_vector(8 downto 0):=(others=>'0');

type Tsample_add_phase_a is array(0 to 18) of std_logic_vector(19 downto 0);
--type Tsample_add_phase_a is array(0 to 16) of std_logic_vector(19 downto 0);
signal sample_add_phase_a,init_add_phase_a:Tsample_add_phase_a;

signal new_after_pilot_start_a: std_logic_vector(15-2+12-1 downto 0):=(others=>'0');
signal new_after_pilot_start_2w,new_after_pilot_start_1w,new_after_pilot_start,ce_1w,ce_2w,ce_3w,ce_correct:std_logic;

signal cccc:std_logic_vector(1 downto 0); --# '01'=+1 , '10'=-1, '00'=0

signal samplesI_reg: std_logic_vector(15 downto 0):=(others=>'0');
signal samplesQ_reg: std_logic_vector(15 downto 0):=(others=>'0');

signal d_i_ce,d_ce_1w,d_ce_2w,d_ce_3w,d_ce_correct_perr,test_it:std_logic;

signal test_sample_cnt:integer:=0;
signal s_phase_demod_acum_new_pi:std_logic_vector(phase_demod_acum_new_pi'Length-1 downto 0);

signal dcnt:std_logic_vector(log2roundup(InterpolateRate)-1 downto 0):=(others=>'0');
signal down_ce:std_logic;
signal whole_dcnt:std_logic_vector(log2roundup(PILOT_PERIOD)-1 downto 0);

constant TO_PI:std_logic_vector(19 downto 0):=x"145F3";
constant TO_PI_sm:std_logic_vector(19 downto 0):=x"2FFFF";
constant POROGMUL:std_logic_vector(19 downto 0):=conv_std_logic_vector(FI_POROG_PHASE*1,10)&"0000000000"; 

file OUTPUT: TEXT open WRITE_MODE is "STD_OUTPUT";
shared variable sTX_LOC : LINE;	

begin

--# (i_samplesI,i_samplesQ) ---> sample_phase --> sample_phase(8 downto 0)
--# (i_init_phaseI,i_init_phaseQ) -->init_phase --> phase_demod_acum но только один раз после after_pilot_start 

--# phase_demod_acumMOD=phase_demod_acumMOD % (2^9)                                     (0)

--# table_phaseerrors(sample_phase,phase_demod_acumMOD) -->     val_engle,	phi_error   (1)

--# phase_demod_acum_new=phase_demod_acum+phi_error                                 	(2)

--# phase_delta=phase_demod_acum_new-filt_acum                                      	(3)
--# filt_acum="Filtering phase_demod_acum_new"

--# phase_delta<>Fi_porog_angle                                                     	(4)
--# Demodulation!
--# phase_demod_acum=phase_demod_acum+-Demodulation                                 	(5)

--########### Получается что (2)(3) надо делать за один такт #########


--# 262141 => 0.5 of whole Aout(Aout - signed) =pi/2
--# -262141 => -0.5 of whole Aout(Aout - signed) =-pi/2
r2p_inst: entity work.cordic_wrapper
	port map(
		clk=>clk,
		i_ce =>'1',--i_ce,
		i_samplesI =>i_samplesI,
		i_samplesQ =>i_samplesQ,

		phase =>sample_phase
		);
--#(x*10474>>14)
samples_phase_mul<=signed(sample_phase)*signed(conv_std_logic_vector(10474,15));


sample_phase_short<=std_logic_vector(sample_phase(19 downto 20-9));


r2p_inst2: entity work.cordic_wrapper
	port map(
		clk=>clk,
		i_ce =>i_ce,
		i_samplesI =>i_init_phaseI,
		i_samplesQ =>i_init_phaseQ,

		phase =>init_phase2
		);
init_phase<=init_phase2;--83443/2+SXT(init_phase2(init_phase2'Length-1 downto 2),init_phase'Length);
init_phase_mul<=signed(init_phase)*signed(conv_std_logic_vector(10474,15));
--init_phase_mul<=signed(init_phase)*signed(conv_std_logic_vector(16383,15));



ce_correct<=i_ce;

--d_i_ce<=ce_1w;   --# WAS
d_i_ce<=down_ce;

s_phase_demod_acum_new_pi<=(phase_demod_acum_new)*(x"145F3"); --signed(conv_std_logic_vector(823550,20)); =floor((1/pi)*2^18)

--assert new_after_pilot_start='0' report "Work have began!"  severity note;

--assert false report integer'IMAGE(phase_demod_acum_start) severity note;
--assert false report Std_Logic'image(phase_demod_acum_start) severity note;
--assert d_ce_2w='0' report "phase_demod_acum_start="&int_to_string(conv_integer(signed(phase_demod_acum_start)),10) severity note;


process (clk) is
variable v_phase_demod_acum_new_pi:std_logic_vector(phase_demod_acum_new_pi'Length-1 downto 0);
VARIABLE TX_LOC : LINE;	
VARIABLE TX_LOC2 : LINE;	
begin
	if rising_edge(clk) then


        if after_pilot_start='1' then
			dcnt<=conv_std_logic_vector(0,dcnt'Length);
			whole_dcnt<=conv_std_logic_vector(PILOT_PERIOD-PILOT_LEN*InterpolateRate-1,whole_dcnt'Length);
			down_ce<='1';
		else			
			if unsigned(dcnt)<InterpolateRate-1 then
				dcnt<=dcnt+1;
				down_ce<='0';
			else
				dcnt<=(others=>'0');
				if unsigned(whole_dcnt)>0 then
					down_ce<='1';
					whole_dcnt<=whole_dcnt-1;
				else
					down_ce<='0';
				end if;
			end if;
		end if;



		ce_1w<=i_ce;
		ce_2w<=ce_1w;
		ce_3w<=ce_2w;
			
		d_ce_1w<=d_i_ce;
		d_ce_2w<=d_ce_1w;
		d_ce_3w<=d_ce_2w;

--assert new_after_pilot_start='1' report "Work have began!" severity note;
--		if new_after_pilot_start='1' then
--			assert new_after_pilot_start='1' report "Work have began!" severity note;
--		end if;
		if DEBUG=1 then
		if d_i_ce='1' then
			TX_LOC:=sTX_LOC;
			STD.TEXTIO.write(TX_LOC,int_to_string(conv_integer(signed(phase_demod_acum_p_errE)))&"  " );
			STD.TEXTIO.write(TX_LOC,int_to_string(conv_integer(signed(filt_acum)))&"  " );
			STD.TEXTIO.write(TX_LOC,int_to_string(conv_integer(signed(phase_delta)))&"  " );
			STD.TEXTIO.write(TX_LOC,int_to_string(conv_integer(signed(phase_delta_short)))&"  " );
			sTX_LOC:=TX_LOC;
--			STD.TEXTIO.write(OUTPUT, TX_LOC); 
		end if;


		if d_ce_1w='1' then	 --
			TX_LOC:=sTX_LOC;
			STD.TEXTIO.write(TX_LOC,int_to_string(conv_integer(signed(cccc)))&"  " );
			STD.TEXTIO.write(TX_LOC,int_to_string(conv_integer(signed(phase_demod_acum_new)))&"  " );
            STD.TEXTIO.writeline(OUTPUT, TX_LOC); 

		    TX_LOC:=NULL;
			if new_after_pilot_start='1' then
				STD.TEXTIO.write(TX_LOC,int_to_string(0)&">>>>> ");
			end if;
			STD.TEXTIO.write(TX_LOC,int_to_string(2*conv_integer(signed(sample_phase)))&"  " );
--			STD.TEXTIO.write(OUTPUT, TX_LOC2);
			sTX_LOC:=TX_LOC;
		end if;

        if d_ce_2w='1' then
			TX_LOC:=sTX_LOC;
			STD.TEXTIO.write(TX_LOC,int_to_string(conv_integer(signed(sample_phase_ok(8 downto 0))))&"  "); --# new
			STD.TEXTIO.write(TX_LOC,int_to_string(conv_integer(signed(phase_demod_acum_start)))&"  ");
			STD.TEXTIO.write(TX_LOC,int_to_string(conv_integer(unsigned(phase_demod_acumMOD)))&"  ");
			sTX_LOC:=TX_LOC;
--			STD.TEXTIO.write(OUTPUT, TX_LOC); 

--				STD.TEXTIO.write(TX_LOC,"phase_demod_acum_start="&int_to_string(conv_integer(signed(phase_demod_acum_start))));
--				STD.TEXTIO.writeline(OUTPUT, TX_LOC); 
		end if;
        if d_ce_3w='1' then
			TX_LOC:=sTX_LOC;
			STD.TEXTIO.write(TX_LOC,int_to_string(conv_integer(signed(phi_error)))&"  ");
			STD.TEXTIO.write(TX_LOC,int_to_string(conv_integer(signed(val_engle)))&"  ");
--			STD.TEXTIO.write(OUTPUT, TX_LOC);
			sTX_LOC:=TX_LOC;
		end if;
		end if; --#DEBUG

		if ce_3w='1' then
			sample_phase_reg<=sample_phase(sample_phase'Length-1 downto 0);
		end if;		

--		new_after_pilot_start_a<=new_after_pilot_start_a(new_after_pilot_start_a'Length-2 downto 0)&(after_pilot_start and i_ce);
		new_after_pilot_start_a<=new_after_pilot_start_a(new_after_pilot_start_a'Length-2 downto 0)&(after_pilot_start and ce_3w);
		new_after_pilot_start<=new_after_pilot_start_a(new_after_pilot_start_a'Length-1);
		new_after_pilot_start_1w<=new_after_pilot_start;
		new_after_pilot_start_2w<=new_after_pilot_start_1w;

        sample_phase_ok<=SXT(samples_phase_mul(samples_phase_mul'Length-1-1 downto samples_phase_mul'Length-sample_phase_ok'Length+10-1),sample_phase_ok'Length);
        sample_init_ok<=SXT(init_phase_mul(init_phase_mul'Length-1-1 downto init_phase_mul'Length-sample_init_ok'Length+10-1),sample_phase_ok'Length);

		if i_ce='1' then
			samplesI_reg<=(i_samplesI);
			samplesQ_reg<=(i_samplesQ);
			test_sample_cnt<=test_sample_cnt+1;
		end if; --# ce

			if new_after_pilot_start='1' then --and ce_1w='1' then
					v_phase_demod_acum_new_pi:=signed(init_phase)*signed(TO_PI_sm);-- x"145F3"; --signed(conv_std_logic_vector(823550,20)); =(2**18)/pi
					phase_demod_acum_new_pi<=v_phase_demod_acum_new_pi;

					phase_demod_acum_start<=SXT(v_phase_demod_acum_new_pi(v_phase_demod_acum_new_pi'Length-1 downto v_phase_demod_acum_new_pi'Length-phase_demod_acum_start'Length+8),phase_demod_acum_start'Length);
--					phase_demod_acum_start<=SXT(v_phase_demod_acum_new_pi(v_phase_demod_acum_new_pi'Length-1-1 downto v_phase_demod_acum_new_pi'Length-phase_demod_acum_start'Length+8-1),phase_demod_acum_start'Length);

--					phase_demod_acum_int0<=SXT(v_phase_demod_acum_new_pi(v_phase_demod_acum_new_pi'Length-1 downto v_phase_demod_acum_new_pi'Length-phase_demod_acum_start'Length+8),phase_demod_acum_start'Length);
--					phase_demod_acum_int0<=conv_std_logic_vector(72000,phase_demod_acum_int0'Length);
					phase_demod_acum_int0<=SXT(init_phase&"0",phase_demod_acum_start'Length); --!!!! роньше было это теперь сделал v_phase_demod_acum_new_pi 
					--# но работает только при изначально больших числах phase_demod_acum_int0 - 72000 или 72000
					test_it<='1';
			else
					test_it<='0';
				if d_ce_1w='1' then
					v_phase_demod_acum_new_pi:=signed(phase_demod_acum_new)*signed(TO_PI);--(x"145F3"); --signed(conv_std_logic_vector(823550,20)); =floor((1/pi)*2^18)

					phase_demod_acum_new_pi<=v_phase_demod_acum_new_pi;--v_phase_demod_acum_new_pi;

--					phase_demod_acum_start<=SXT(v_phase_demod_acum_new_pi(v_phase_demod_acum_new_pi'Length-1 downto v_phase_demod_acum_new_pi'Length-phase_demod_acum_start'Length+8),phase_demod_acum_start'Length);   OK
					phase_demod_acum_start<=SXT(v_phase_demod_acum_new_pi(v_phase_demod_acum_new_pi'Length-1-1 downto v_phase_demod_acum_new_pi'Length-phase_demod_acum_start'Length+8-1),phase_demod_acum_start'Length);

					phase_demod_acum_int0<=phase_demod_acum_new;
				end if;
			end if;


	end if;
end process;


--phase_demod_acum_start_shift<=phase_demod_acum_start(8 downto 0);
phase_demod_acum_start_shift<=phase_demod_acum_start(9 downto 1);

phase_demod_acum_start_div_mod<=phase_demod_acum_start_shift when phase_demod_acum_start_shift(8)='0' else 0-(phase_demod_acum_start_shift(8 downto 0));

--phase_demod_acumMOD<=phase_demod_acum_start_div_mod when phase_demod_acum_start(phase_demod_acum_start'Length-1)='0' else
--			511-phase_demod_acum_start_div_mod;

phase_demod_acumMOD<=phase_demod_acum_start_div_mod when phase_demod_acum_start(phase_demod_acum_start'Length-1)='0' else
			511-phase_demod_acum_start_div_mod;



table_phaseerrors_inst: table_phaseerrors
	port map(
		clk =>clk,

		input_angles=>std_logic_vector(sample_phase_ok(8 downto 0)),
		phase_acum_mod=>phase_demod_acumMOD,--std_logic_vector(sample_init_ok(sample_init_ok'Length-1 downto sample_init_ok'Length-9)),

		phi_error =>phi_error,
		val_engle =>val_engle
		);

        phase_delta<=SXT(phase_demod_acum_p_errE(phase_demod_acum_p_err'Length-1 downto 0),phase_delta'Length)   -SXT(filt_acum(filt_acum'Length-1-6 downto 0)&"00000",phase_delta'Length);
		phase_delta_short<=phase_delta(0+phase_delta_short'Length-1+9 downto 0+9);--,phase_delta_short'Length);

--		phase_delta_short<=phase_delta(0+phase_delta_short'Length-1+9 downto 0+9);--,phase_delta_short'Length);

        phase_delta_round<=phase_delta(0+phase_delta_short'Length-1+9 downto 0+9-1)+EXT(x"0100",phase_delta_round'Length);
--		phase_delta_short<=phase_delta_round(0+phase_delta_short'Length-1+9 downto 0+9);--,phase_delta_short'Length);

process (clk) is
begin
	if rising_edge(clk) then
		phase_demod_acum_p_err_1w<=phase_demod_acum_p_err;
		if new_after_pilot_start='1' then
			phase_demod_acum_p_errE<=SXT(init_phase,phase_demod_acum_p_errE'Length);
		else
			if d_ce_3w='1' then
				phase_demod_acum_p_errE<=SXT(phase_demod_acum_int0(phase_demod_acum_int0'Length-1 downto 1),phase_demod_acum_p_err'Length)+SXT(phi_error&x"00"&"00",phase_demod_acum_p_err'Length);
			end if;
		end if;
        d_ce_correct_perr<=d_ce_3w;

		if d_ce_3w='1' then
			val_engle_reg<=val_engle;
		end if;


		if d_i_ce='1' then
			if signed(phase_delta_short)>FI_POROG_PHASE then
				--# '01'=+1 , '10'=-1, '00'=0
				cccc<="01";
				phase_demod_acum_new<=phase_demod_acum_p_errE-SXT((conv_std_logic_vector(FI_POROG_PHASE,8)&x"00"&"0"),20);
				phase_demod_acum_demod<=signed(SXT(val_engle_reg&"0",phase_demod_acum_demod'Length)) + signed(POROGMUL);  --# = val_engle + FI_POROG_PHASE*(2^10)
			elsif signed(phase_delta_short)<-FI_POROG_PHASE then
				cccc<="10";
				phase_demod_acum_new<=phase_demod_acum_p_errE+SXT((conv_std_logic_vector(FI_POROG_PHASE,8)&x"00"&"0"),20);
				phase_demod_acum_demod<=signed(SXT(val_engle_reg&"0",phase_demod_acum_demod'Length)) - signed(POROGMUL);  --# = val_engle - FI_POROG_PHASE*(2^10)
			else
				cccc<="00";
				phase_demod_acum_new<=phase_demod_acum_p_errE;
				phase_demod_acum_demod<=SXT(val_engle,phase_demod_acum_demod'Length); --# make phase for demodulation
			end if;
		end if;

		o_samples_phase<=phase_demod_acum_demod(o_samples_phase'Length-1 downto 0);
		out_ce<=d_ce_1w;--d_ce_3w;

	end if;
end process;

phase_demod_acum_p_err<=phase_demod_acum_p_errE(phase_demod_acum_p_errE'Length-2 downto 0)&"0";

--phase_demod_acum_p_err<=phase_demod_acum_p_errE(phase_demod_acum_p_errE'Length-1 downto 0);

short_lf_filter_inst: entity work.short_lf_filter
	port map(
		clk =>clk,
		i_ce =>d_ce_2w,--d_i_ce,
		init =>new_after_pilot_start_2w,
		init_phase =>init_phase(init_phase'Length-1-3 downto init_phase'Length-16-3),
		i_phase =>phase_demod_acum_p_errE(phase_demod_acum_p_err'Length-1-1 downto phase_demod_acum_p_err'Length-16-1),
		o_phase =>filt_acum,
		out_ce =>open
		);



end itertive_demod;

