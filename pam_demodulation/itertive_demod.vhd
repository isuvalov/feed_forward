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
constant DEBUG_SAVE:integer:=1;
constant DEBUG:integer:=1;
constant SHFT:natural:=11;
constant FI_POROG_PHASE:integer:=100; --# =Fi_porog*256/2

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

signal init_phase2,init_phase,sample_phase,init_add_phase,sample_add_phase,sample_phase_ok,sample_ok,sample_init_ok,sample_phase_reg:std_logic_vector(19 downto 0):=(others=>'0');
signal init_phase_big:std_logic_vector(15 downto 0);
signal samples_phase_mul,init_phase_mul:std_logic_vector(19+15 downto 0);
signal init_phase_mul_mod,samples_phase_mul_mod:std_logic_vector(19+15+4+1 downto 0);
--signal :std_logic_vector(19 downto 0);
signal sample_phase_short,phase_demod_acumMOD2,phase_demod_acumMOD,phi_error,phi_error2:std_logic_vector(8 downto 0);
signal val_engle_reg,val_engle,val_engle2:std_logic_vector(9 downto 0);

signal phase_demod_acum,filt_acum,phase_delta_round,phase_demod_acum_new,phase_demod_acum_demod:std_logic_vector(19 downto 0):=(others=>'0');
signal phase_delta_saturate,phase_delta:std_logic_vector(19+1 downto 0):=(others=>'0');
signal phase_demod_acum_new_pi:std_logic_vector(phase_demod_acum_new'Length+20-1 downto 0):=(others=>'0');
signal phase_delta_short:std_logic_vector(8 downto 0):=(others=>'0');
signal phase_demod_acum_int0,phase_demod_acum_start,phase_demod_acum_p_err,phase_demod_acum_p_err_1w:std_logic_vector(19 downto 0):=(others=>'0');
signal phase_demod_acum_p_errE:std_logic_vector(phase_demod_acum_p_err'Length-1 downto 0):=(others=>'0');
signal phase_demod_acum_p_errE2:std_logic_vector(15 downto 0):=(others=>'0');
signal phase_demod_acum_start_shift:std_logic_vector(8 downto 0):=(others=>'0');

signal phase_demod_acum_start_div_mod:std_logic_vector(8 downto 0):=(others=>'0');

type Tsample_add_phase_a is array(0 to 18) of std_logic_vector(19 downto 0);
--type Tsample_add_phase_a is array(0 to 16) of std_logic_vector(19 downto 0);
signal sample_add_phase_a,init_add_phase_a:Tsample_add_phase_a;

signal after_pilot_start_1w:std_logic;
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

signal saveit4,saveit3,saveit2_1w,saveit2,saveit,saveit_1w:std_logic:='0';
signal savenum,save_cnt:integer:=0;

signal input_angles2:std_logic_vector(8 downto 0);

   constant TO_PI_BB:std_logic_vector(19 downto 0):=x"145F3";
--   constant TO_PI_BB:std_logic_vector(19 downto 0):=x"15800";

   constant TO_PI:std_logic_vector(19 downto 0):=conv_std_logic_vector(10474,20); 
constant TO_PI_sm:std_logic_vector(19 downto 0):=x"00051";
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
--samples_phase_mul<=signed(sample_phase)*signed(conv_std_logic_vector(10474,15));

samples_phase_mul<=signed(sample_phase)*signed(conv_std_logic_vector(81,15)); 


sample_phase_short<=std_logic_vector(sample_phase(19 downto 20-9));


r2p_inst2: entity work.cordic_wrapper
	port map(
		clk=>clk,
		i_ce =>i_ce,
		i_samplesI =>i_init_phaseI,
		i_samplesQ =>i_init_phaseQ,

		phase =>init_phase
		);
--init_phase<=init_phase2;--83443/2+SXT(init_phase2(init_phase2'Length-1 downto 2),init_phase'Length);
--init_phase_mul<=signed(init_phase)*signed(conv_std_logic_vector(10474,15));

init_phase_mul<=signed(init_phase)*signed(conv_std_logic_vector(81,15));
--init_phase_mul_mod<=signed(init_phase)*signed(conv_std_logic_vector(10474,15));

init_phase_mul_mod<=signed(init_phase)*signed(TO_PI_BB);
samples_phase_mul_mod<=signed(phase_demod_acum_new)*signed(TO_PI_BB); 
--init_phase_mul<=signed(init_phase)*signed(conv_std_logic_vector(16383,15));



ce_correct<=i_ce;

--d_i_ce<=ce_1w;   --# WAS
d_i_ce<=down_ce;

s_phase_demod_acum_new_pi<=(phase_demod_acum_new)*(x"145F3"); --signed(conv_std_logic_vector(823550,20)); =floor((1/pi)*2^18)

--assert new_after_pilot_start='0' report "Work have began!"  severity note;

--assert false report integer'IMAGE(phase_demod_acum_start) severity note;
--assert false report Std_Logic'image(phase_demod_acum_start) severity note;
--assert d_ce_2w='0' report "phase_demod_acum_start="&int_to_string(conv_integer(signed(phase_demod_acum_start)),10) severity note;


DEBUG_SAVE01: if DEBUG_SAVE=1 generate

process(clk)
begin
	if after_pilot_start='1' and savenum=0 then
		saveit<='1';
		save_cnt<=PILOT_PERIOD*InterpolateRate+1;
		savenum<=savenum+1;
--	if rising_edge(clk) then
--		if after_pilot_start='1' and savenum=0 then
--			saveit<='1';
--			save_cnt<=PILOT_PERIOD*InterpolateRate;
--			savenum<=savenum+1;
		elsif  rising_edge(clk) then
			if save_cnt>0 then
				save_cnt<=save_cnt-1;
			else
				saveit<='0';
			end if;
--		end if;
	end if;
end process;

process(clk)
begin
	if rising_edge(clk) then
		saveit_1w<=saveit;
		if saveit='1' and saveit_1w='0' then
			saveit2<='1';
		else
			saveit2<='0';
		end if;
		saveit2_1w<=saveit2;
	end if;
end process;
    --saveit3<=saveit2_1w or saveit2;

	sph01: entity work.ToTextFile
	generic map(BitLen =>i_samplesI'Length,
			WriteHex =>0,  -- if need write file in hex format or std_logic_vector too long(>=64)
			NameOfFile =>"frame_phase_init_I.txt")
	 port map(
		 clk =>clk,
		 CE =>saveit2,
		 block_marker =>'0',
		 DataToSave =>i_init_phaseI
	     );

	sph02: entity work.ToTextFile
	generic map(BitLen =>i_samplesI'Length,
			WriteHex =>0,  -- if need write file in hex format or std_logic_vector too long(>=64)
			NameOfFile =>"frame_phase_init_Q.txt")
	 port map(
		 clk =>clk,
		 CE =>saveit2,
		 block_marker =>'0',
		 DataToSave =>i_init_phaseQ
	     );


	s01: entity work.ToTextFile
	generic map(BitLen =>i_samplesI'Length,
			WriteHex =>0,  -- if need write file in hex format or std_logic_vector too long(>=64)
			NameOfFile =>"frame_I.txt")
	 port map(
		 clk =>clk,
		 CE =>saveit,
		 block_marker =>'0',
		 DataToSave =>i_samplesI
	     );


	s02: entity work.ToTextFile
	generic map(BitLen =>i_samplesI'Length,
			WriteHex =>0,  -- if need write file in hex format or std_logic_vector too long(>=64)
			NameOfFile =>"frame_Q.txt")
	 port map(
		 clk =>clk,
		 CE =>saveit,
		 block_marker =>'0',
		 DataToSave =>i_samplesQ
	     );

saveit3<=d_ce_1w and saveit;
saveit4<=new_after_pilot_start and saveit;

	s03: entity work.ToTextFile
	generic map(BitLen =>sample_phase'Length,
			WriteHex =>0,  -- if need write file in hex format or std_logic_vector too long(>=64)
			NameOfFile =>"frame_phase.txt")
	 port map(
		 clk =>clk,
		 CE =>saveit3,
		 block_marker =>'0',
		 DataToSave =>sample_phase
	     );


	s04: entity work.ToTextFile
	generic map(BitLen =>init_phase'Length,
			WriteHex =>0,  -- if need write file in hex format or std_logic_vector too long(>=64)
			NameOfFile =>"frame_phaseinit.txt")
	 port map(
		 clk =>clk,
		 CE =>saveit4,
		 block_marker =>'0',
		 DataToSave =>init_phase
	     );


end generate; --# DEBUG_SAVE


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
		if DEBUG=1 and saveit='1' then
		if d_i_ce='1' then
			TX_LOC:=sTX_LOC;
			STD.TEXTIO.write(TX_LOC,int_to_string(conv_integer(signed(phase_demod_acum_p_errE)))&"  " );
			STD.TEXTIO.write(TX_LOC,int_to_string(conv_integer(signed(filt_acum)))&"  " );
			STD.TEXTIO.write(TX_LOC,int_to_string(conv_integer(  signed(   SXT(filt_acum(filt_acum'Length-1-5 downto 0)&"00000",phase_delta'Length)  )   ))&"  " );
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
			STD.TEXTIO.write(TX_LOC,int_to_string(conv_integer(signed(i_samplesI)))&"  " );
			STD.TEXTIO.write(TX_LOC,int_to_string(conv_integer(signed(sample_phase)))&"  " );
--			STD.TEXTIO.write(OUTPUT, TX_LOC2);
			sTX_LOC:=TX_LOC;
		end if;

        if d_ce_2w='1' then
			TX_LOC:=sTX_LOC;
--			STD.TEXTIO.write(TX_LOC,int_to_string(conv_integer(signed(sample_phase_ok(8 downto 0))))&"  ");
			STD.TEXTIO.write(TX_LOC,int_to_string(conv_integer(signed(input_angles2)))&"  ");
			STD.TEXTIO.write(TX_LOC,int_to_string(conv_integer(signed(phase_demod_acum_start)))&"  ");
			STD.TEXTIO.write(TX_LOC,int_to_string(conv_integer("0"&unsigned(phase_demod_acumMOD)))&"  ");
			sTX_LOC:=TX_LOC;
--			STD.TEXTIO.write(OUTPUT, TX_LOC); 

--				STD.TEXTIO.write(TX_LOC,"phase_demod_acum_start="&int_to_string(conv_integer(signed(phase_demod_acum_start))));
--				STD.TEXTIO.writeline(OUTPUT, TX_LOC); 
		end if;
        if d_ce_3w='1' then
			TX_LOC:=sTX_LOC;
			STD.TEXTIO.write(TX_LOC,int_to_string(conv_integer(signed(phi_error)))&"  ");
			STD.TEXTIO.write(TX_LOC,int_to_string(conv_integer(signed(val_engle)))&"  ");
			STD.TEXTIO.write(TX_LOC,int_to_string(conv_integer(signed(phase_demod_acum_int0)))&"  ");


--			STD.TEXTIO.write(OUTPUT, TX_LOC);
			sTX_LOC:=TX_LOC;
		end if;
		end if; --#DEBUG

		if ce_3w='1' then
			sample_phase_reg<=sample_phase(sample_phase'Length-1 downto 0);
		end if;		



		new_after_pilot_start_a<=new_after_pilot_start_a(new_after_pilot_start_a'Length-2 downto 0)&(after_pilot_start);
--		new_after_pilot_start_a<=new_after_pilot_start_a(new_after_pilot_start_a'Length-2 downto 0)&(after_pilot_start and ce_1w);
		new_after_pilot_start<=new_after_pilot_start_a(new_after_pilot_start_a'Length-1) and d_i_ce;
		new_after_pilot_start_1w<=new_after_pilot_start;
		new_after_pilot_start_2w<=new_after_pilot_start_1w;

--        sample_init_ok<=SXT(init_phase_mul_mod(init_phase_mul'Length-1-4 downto 16-4),sample_phase_ok'Length);
        sample_init_ok<=SXT(init_phase_mul_mod(init_phase_mul'Length-1 downto 16+4),sample_phase_ok'Length); --# in_val_phase_int0_mul_div=in_val_phase_int0_mul/(2^12) 
        sample_ok<=SXT(samples_phase_mul_mod(init_phase_mul'Length-1 downto 16+4),sample_phase_ok'Length);


		if i_ce='1' then
			samplesI_reg<=(i_samplesI);
			samplesQ_reg<=(i_samplesQ);
			test_sample_cnt<=test_sample_cnt+1;
		end if; --# ce

			if new_after_pilot_start='1' then --and ce_1w='1' then
					--# TO_PI_sm=0x51 = 81(dec)
					v_phase_demod_acum_new_pi:=signed(init_phase)*signed(TO_PI_sm);-- x"145F3"; --signed(conv_std_logic_vector(823550,20)); =(2**18)/pi


--					phase_demod_acum_start<=SXT(sample_init_ok(sample_init_ok'Length-1 downto 0+11+1),phase_demod_acum_start'Length); --# To acum_MOD
					phase_demod_acum_start<=SXT(init_phase_mul_mod(init_phase_mul_mod'Length-1 downto 26-1),phase_demod_acum_start'Length);                --# To acum_MOD = 2*init*0x145F3/(2^24)

					phase_demod_acum_int0<=SXT(init_phase(init_phase'Length-2 downto 0)&"0",phase_demod_acum_start'Length); --!!!! To reset error acum

--					sample_phase_ok<=SXT(init_phase_mul(init_phase_mul'Length-1 downto init_phase_mul'Length-sample_phase_ok'Length+2),sample_phase_ok'Length); --!!!! To sample_phase
					sample_phase_ok<=SXT(v_phase_demod_acum_new_pi(v_phase_demod_acum_new_pi'Length-1 downto 17),sample_phase_ok'Length); --!!!! To sample_phase

					test_it<='1';
			else
					test_it<='0';
				if d_ce_1w='1' then
					v_phase_demod_acum_new_pi:=signed(sample_phase)*signed(TO_PI_sm);--(x"145F3"); --signed(conv_std_logic_vector(823550,20)); =floor((1/pi)*2^18)

					phase_demod_acum_start<=SXT(samples_phase_mul_mod(samples_phase_mul_mod'Length-1 downto 26-1+1),phase_demod_acum_start'Length);                --# To acum_MOD = 2*init*0x145F3/(2^24)

					phase_demod_acum_int0<=phase_demod_acum_new;
--					sample_phase_ok<=SXT(samples_phase_mul(samples_phase_mul'Length-1 downto samples_phase_mul'Length-sample_phase_ok'Length+2),sample_phase_ok'Length);
--                    v_phase_demod_acum_new_pi:=signed(samples_phase)*signed(TO_PI_sm);

					--sample_phase_ok<=SXT(samples_phase_mul(samples_phase_mul'Length-1 downto 17),sample_phase_ok'Length);


--					v_phase_demod_acum_new_pi:=signed(phase_demod_acum_new)*signed(TO_PI_BB*2); --signed(conv_std_logic_vector(823550,20)); =floor((1/pi)*2^18)

--					phase_demod_acum_new_pi<=v_phase_demod_acum_new_pi;--v_phase_demod_acum_new_pi;

--					phase_demod_acum_start<=SXT(v_phase_demod_acum_new_pi(v_phase_demod_acum_new_pi'Length-1 downto v_phase_demod_acum_new_pi'Length-(phase_demod_acum_start'Length-6)),phase_demod_acum_start'Length);  -- OK

--					phase_demod_acum_start<=SXT(v_phase_demod_acum_new_pi(v_phase_demod_acum_new_pi'Length-1 downto 24),phase_demod_acum_start'Length);  -- OK
					sample_phase_ok<=SXT(v_phase_demod_acum_new_pi(v_phase_demod_acum_new_pi'Length-1 downto 17),sample_phase_ok'Length); --!!!! To sample_phase



--                    phase_demod_acum_start<=SXT(sample_ok(sample_ok'Length-1 downto 0+11+2),phase_demod_acum_start'Length); --# To acum_MOD

				end if;
			end if;


	end if;
end process;


phase_demod_acum_start_shift<=phase_demod_acum_start(9 downto 1);

phase_demod_acum_start_div_mod<=phase_demod_acum_start_shift when signed(phase_demod_acum_start_shift)>0 else 0-(phase_demod_acum_start_shift);
--phase_demod_acum_start_div_mod<=phase_demod_acum_start_shift when signed(phase_demod_acum_start)>0 else 0-(phase_demod_acum_start_shift(8 downto 0));

--phase_demod_acumMOD<=phase_demod_acum_start_div_mod when phase_demod_acum_start(phase_demod_acum_start'Length-1)='0' else 511-phase_demod_acum_start_div_mod;
phase_demod_acumMOD<=511-phase_demod_acum_start_div_mod when signed(phase_demod_acum_start)<0 else phase_demod_acum_start_div_mod;


--input_angles2<=sample_phase_ok(8+1 downto 0+1);
input_angles2<=sample_phase_ok(8 downto 0);
--phase_demod_acumMOD2<=SXT(phase_demod_acumMOD(phase_demod_acumMOD'Length-1 downto 1),phase_demod_acumMOD2'Length);

table_phaseerrors_inst: table_phaseerrors
	port map(
		clk =>clk,

		input_angles=>input_angles2,--std_logic_vector(sample_phase_ok(8 downto 0)),
		phase_acum_mod=>phase_demod_acumMOD,--std_logic_vector(sample_init_ok(sample_init_ok'Length-1 downto sample_init_ok'Length-9)),

		phi_error =>phi_error,
		val_engle =>val_engle
		);

        phase_delta<=SXT(phase_demod_acum_p_errE(phase_demod_acum_p_err'Length-1 downto 0),phase_delta'Length)-SXT(filt_acum(filt_acum'Length-1-5 downto 0)&"00000",phase_delta'Length);

process(phase_delta) is
begin
		if signed(phase_delta)>255 then
			phase_delta_saturate<=conv_std_logic_vector(255,phase_delta_saturate'Length);
		elsif signed(phase_delta)<-256 then
			phase_delta_saturate<=conv_std_logic_vector(-256,phase_delta_saturate'Length);
		else
			phase_delta_saturate<=phase_delta;
		end if;
end process;

		phase_delta_short<=phase_delta(phase_delta_short'Length-1+10 downto 0+10);--,phase_delta_short'Length);

process (clk) is
begin
	if rising_edge(clk) then
		phase_demod_acum_p_err_1w<=phase_demod_acum_p_err;
		--if new_after_pilot_start_2w='1' then
--			phase_demod_acum_p_errE<=SXT(init_phase,phase_demod_acum_p_errE'Length);
		--	phase_demod_acum_p_errE<=SXT(phase_demod_acum_int0(phase_demod_acum_int0'Length-1 downto 1),phase_demod_acum_p_errE'Length);
		--else
			if d_ce_3w='1' then
--				phase_demod_acum_p_errE<=SXT(phase_demod_acum_int0(phase_demod_acum_int0'Length-1 downto 1),phase_demod_acum_p_err'Length)+SXT(phi_error&"00000",phase_demod_acum_p_err'Length);
				phase_demod_acum_p_errE<=SXT(phase_demod_acum_int0(phase_demod_acum_int0'Length-1 downto 1),phase_demod_acum_p_err'Length)+SXT(phi_error&x"00"&"00",phase_demod_acum_p_err'Length);
			end if;
		--end if;
        d_ce_correct_perr<=d_ce_3w;

		if d_ce_3w='1' then
			val_engle_reg<=val_engle;
		end if;


		if d_i_ce='1' then
			if signed(phase_delta_short)>FI_POROG_PHASE then
				--# '01'=+1 , '10'=-1, '00'=0
				cccc<="01";
--				phase_demod_acum_new<=phase_demod_acum_p_errE-SXT((conv_std_logic_vector(FI_POROG_PHASE,8)&x"00"&"0"),20);
--				phase_demod_acum_new<=phase_demod_acum_p_errE-SXT((conv_std_logic_vector(FI_POROG_PHASE,8)&x"00"&"0"),20);
				phase_demod_acum_new<=phase_demod_acum_p_errE-"00011001001000000000";
				
				phase_demod_acum_demod<=signed(SXT(val_engle_reg&"0",phase_demod_acum_demod'Length)) + signed(POROGMUL);  --# = val_engle + FI_POROG_PHASE*(2^10)
			elsif signed(phase_delta_short)<-FI_POROG_PHASE then
				cccc<="10";
--				phase_demod_acum_new<=phase_demod_acum_p_errE+SXT((conv_std_logic_vector(FI_POROG_PHASE,8)&x"00"&"0"),20);
--				phase_demod_acum_new<=phase_demod_acum_p_errE+SXT((conv_std_logic_vector(FI_POROG_PHASE,8)&x"00"&"0"),20);
				phase_demod_acum_new<=phase_demod_acum_p_errE+"00011001001000000000";
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

phase_demod_acum_p_errE2<=SXT(phase_demod_acum_p_errE(phase_demod_acum_p_err'Length-1 downto phase_demod_acum_p_err'Length-16+1),16);

init_phase_big<=init_phase(init_phase'Length-1-1-4 downto init_phase'Length-16-4)&"0";
short_lf_filter_inst: entity work.short_lf_filter
	port map(
		clk =>clk,
		i_ce =>d_i_ce,--d_ce_2w,
		init =>new_after_pilot_start_a(new_after_pilot_start_a'Length-1-5),--new_after_pilot_start,
		init_phase =>init_phase(init_phase'Length-1-1 downto init_phase'Length-16-1),
--		init_phase =>init_phase_big,
		i_phase =>phase_demod_acum_p_errE2, --phase_demod_acum_p_errE(phase_demod_acum_p_err'Length-1 downto phase_demod_acum_p_err'Length-16+1)
		o_phase =>filt_acum,
		out_ce =>open
		);



end itertive_demod;

