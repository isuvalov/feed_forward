library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library work;
use work.feedf_consts_pack.all;
use work.math_real.all;

--use work.assert_pack.all;

entity modem_rx_top is
	generic (
		FREQ_SIMULATION:integer:=0;
		SIMULATION:integer:=0
	);
    Port (clk: in std_logic;
		  reset: in std_logic;
		  sampleI: in std_logic_vector(11 downto 0);
		  sampleQ: in std_logic_vector(11 downto 0);
		  pilot_ce_test: in std_logic; --# only for test purpose

		  test_mode: in std_logic_vector(1 downto 0);
				--# 1 - output after signal normalizing
				--# 2 - output after rcc filter
				--# 3 - output after correlation

		  test_I: out std_logic_vector(15 downto 0);
		  test_Q: out std_logic_vector(15 downto 0);
		  test_inner_pilot_pos: out std_logic;
		
		  demod_phase :out std_logic_vector(15 downto 0);
		  demod_phase_ce : out std_logic;

		  bit_value_ce: out std_logic;
		  bit_value: out std_logic_vector(1 downto 0);

		  sync_find: out std_logic;
		  dds_cos_o: out std_logic_vector(15 downto 0);
		  dds_sin_o: out std_logic_vector(15 downto 0);
		  pilot_start: out std_logic --# Этот импульс будет задержан на InterpolateRate*PILOT_LEN+5+Sqrt_Latency тактов
	);
			--# В данный момент Sqrt_Latency=16
end modem_rx_top;
architecture modem_rx_top of modem_rx_top is

signal sampleIE,sampleQE,sampleI_zero,sampleQ_zero: std_logic_vector(15 downto 0);

signal sampleIfilt,sampleQfilt: std_logic_vector(15 downto 0);
signal sampleIfilt2,sampleQfilt2: std_logic_vector(15 downto 0);
constant BEST_F:natural:=10;
constant SQRT_LATENCY:natural:=16;
constant FILTRCC_LATENCY:natural:=33/2+1-5;
constant DELAY_LEN:natural:=InterpolateRate*PILOT_LEN+SQRT_LATENCY+FILTRCC_LATENCY;
constant DDS_LATENCY:natural:=8;
constant DELAY_AFTER_FREQESTIM:natural:=25413+DDS_LATENCY+1; --# Высчитывается по симуляции сигналом time_for_freqcalc_cnt_reg 
constant PILOTUP_START_DELAY:natural:=9+3; --# Время которое надо для того чтоб генератор интерполированного пилота начал выдавать отсчеты
constant DELAY_COMPLEX_NORMALIZER:natural:=51+2; 

signal sampleI_delay_div2,sampleQ_delay_div2:std_logic_vector(sampleIfilt'Length-1 downto 0);

signal sampleI_delay,sampleQ_delay:std_logic_vector(sampleIfilt'Length-1 downto 0);
signal sampleI_delay_fe,sampleQ_delay_fe:std_logic_vector(sampleIfilt'Length-1 downto 0);
signal sampleI_delay_fe_reg,sampleQ_delay_fe_reg:std_logic_vector(sampleIfilt'Length-1 downto 0);
signal s_pilot_start:std_logic;

signal freq_value,freq_val_filt2,freq_val_filt:std_logic_vector(NBITm1+log2roundup(PILOT_LEN*2) downto 0);
constant MUL_SCALE:std_logic_vector(11 downto 0):=conv_std_logic_vector(34,12);
signal freq_val_filt_mult_1w,freq_val_filt_mult:std_logic_vector(freq_val_filt'Length+MUL_SCALE'Length-1+1 downto 0);

signal freq_ce,freq_ce_f,freq_ce_f_1w,freq_ce_f_2w,good_values:std_logic;
signal dds_cos,dds_sin:std_logic_vector(15 downto 0);
signal dds_cos_d,dds_sin_d:std_logic_vector(15 downto 0);

signal s_pilot_start_norm_1w,s_pilot_start_norm,pilot_wr,start_pilotU:std_logic;
signal sampleI_norm,sampleQ_norm:std_logic_vector(15 downto 0);

type Tsample_norm_W is array(0 to 40) of std_logic_vector(15 downto 0);
signal sampleI_norm_W,sampleQ_norm_W:Tsample_norm_W;

signal sampleI_norm_1w,sampleQ_norm_1w,sampleI_norm_2w,sampleQ_norm_2w:std_logic_vector(15 downto 0);
signal sampleI_norm_3w,sampleQ_norm_3w:std_logic_vector(15 downto 0);


signal corrI_s: std_logic_vector(15 downto 0);
signal corrQ_s: std_logic_vector(15 downto 0);

signal time_for_freqcalc_ce:std_logic;
signal time_for_freqcalc_cnt,time_for_freqcalc_cnt_reg:std_logic_vector(31 downto 0):=(others=>'0');

--signal sampleI_moveback,sampleQ_moveback:std_logic_vector(dds_cos'Length+sampleI_delay_fe_reg'Length-1 downto 0);
signal sampleI_32moveback,sampleQ_32moveback:std_logic_vector(15 downto 0);
signal sampleI_moveback,sampleQ_moveback:std_logic_vector(15 downto 0);
signal pilotU_I,pilotU_Q:std_logic_vector(15 downto 0);

signal start_pilotU_have:std_logic;
signal start_delayer_cnt:std_logic_vector(log2roundup(DELAY_AFTER_FREQESTIM)-1 downto 0);

signal scalar_sumI,scalar_sumQ:std_logic_vector(31 downto 0);
signal scalar_sum_ce,pilot_valid,pilot_valid_1w,pilot_valid_2w,pilot_valid_3w:std_logic;
signal pilot_valid_W:std_logic_vector(15 downto 0);

signal start_rotate_I,start_rotate_Q:std_logic_vector(15 downto 0);
signal start_rotate_ce:std_logic;

--signal start_rotate_ce_W:std_logic_vector(15 downto 0);

signal sampleI_to_demod,sampleQ_to_demod:std_logic_vector(15 downto 0);
signal sampleI_to_demod_1w,sampleQ_to_demod_1w:std_logic_vector(15 downto 0);
type TsampleI_to_demod_delay is array(0 to 20+21+26) of std_logic_vector(15 downto 0);
signal sampleI_to_demod_W,sampleQ_to_demod_W:TsampleI_to_demod_delay;
signal cnt:std_logic_vector(log2roundup(InterpolateRate)-1 downto 0):=(others=>'0');
signal sampleQ_moveback_ce,down_ce,down_ce_1w:std_logic;

signal start_rotate_ce_3w,start_rotate_ce_2w,start_rotate_ce_1w:std_logic;
signal start_rotate_ce_W:std_logic_vector(16 downto 0);

signal s_demod_phase_minus,s_demod_phase :std_logic_vector(15 downto 0);
signal s_demod_phase_ce,s_demod_phase_ce_1w : std_logic;
signal s_sync_find,print_event: std_logic;

signal bit_value_rx_ce,bit_value_rx_ce_1p,reset_with_s_sync_find:std_logic;
signal bit_value_rx_1p,bit_value_rx:std_logic_vector(1 downto 0);

signal demod_sampleI_1state,demod_sampleQ_1state,demod_sampleI,demod_sampleQ:std_logic_vector(15 downto 0);
signal demod_sampleI_2state,demod_sampleQ_2state:std_logic_vector(15 downto 0);

signal freq_corrector_ce,see_sin_here:std_logic;

signal ftw_correction:std_logic_vector(31 downto 0):=(others=>'0');
signal dds_freq:real;

signal pilot_here:std_logic;
signal pilot_here_cnt:std_logic_vector(log2roundup(PILOT_LEN*InterpolateRate)-1 downto 0);

type Tbests_corrs is array(BEST_F-1 downto 0) of std_logic_vector(15 downto 0);
signal sampleI_delayD,sampleQ_delayD,bests_corrs_I,bests_corrs_Q:Tbests_corrs;

type TsampleI_sq_a is array(BEST_F-1 downto 0) of std_logic_vector(31 downto 0);
signal sample_sq_a,sampleI_sq_a,sampleQ_sq_a:TsampleI_sq_a;

signal pilot_ce_test_1w,pilot_ce_test_2w,pilot_ce_test_after_removezerro:std_logic;
signal pilot_ce_test_after_removezerro_a:std_logic_vector(9 downto 0);
signal pilot_ce_test_after_frx_3w,pilot_ce_test_after_frx_2w,pilot_ce_test_after_frx_1w,pilot_ce_test_after_frx:std_logic;
signal pilot_ce_test_after_delayer,pilot_ce_test_after_cmul:std_logic;

signal after_farrow_i,after_farrow_q:std_logic_vector(15 downto 0);
signal local_ce,after_farrow_ce,reset_bysync,start_pilotU_1w,start_pilotU_2w:std_logic;
signal ce_cnt:std_logic_vector(log2roundup(InterpolateRate)-1 downto 0);

signal pilot_valid_byupper:std_logic;

begin

sync_find<=s_sync_find;

sampleIE<=SXT(sampleI&"000",sampleIE'Length);
sampleQE<=SXT(sampleQ&"000",sampleQE'Length);

--zero_remove02: if SIMULATION=1 generate
--	sampleI_zero<=sampleIE;
--	sampleQ_zero<=sampleQE;
--end generate; --#SIMULATION=1

--zero_remove01: if SIMULATION/=1 generate
	remove_zero_inst: entity work.remove_zero
	generic map(
		WIDTH=>sampleIE'Length
	)
	port map(
		clk =>clk,
		reset =>reset,
		ce => '1',
		sampleI =>sampleIE,
		sampleQ =>sampleQE,

		filtered_I =>sampleI_zero,
		filtered_Q =>sampleQ_zero,
		ce_out =>open
	);
pilot_ce_test_after_removezerro<=pilot_ce_test_2w;
--end generate; --#SIMULATION/=1


rcc_up_filter_inst: entity work.rcc_up_filter_rx
	generic map(
		USE_IT=>1,
		LEN=>sampleI_zero'Length
	)
	port map(
		clk =>clk,
		reset =>reset,
		i_samplesI=>sampleI_zero(sampleI_zero'Length-1 downto 0),
		i_samplesQ=>sampleQ_zero(sampleI_zero'Length-1 downto 0),
		o_sampleI=>sampleIfilt,
		o_sampleQ=>sampleQfilt
		);
sampleIfilt2<=sampleIfilt(sampleIfilt'Length-2 downto 0)&"0";
sampleQfilt2<=sampleQfilt(sampleIfilt'Length-2 downto 0)&"0";
pilot_ce_test_after_frx<=pilot_ce_test_after_removezerro_a(9);


--sampleIfilt2<=sampleIfilt(sampleIfilt'Length-1 downto 0);
--sampleQfilt2<=sampleQfilt(sampleIfilt'Length-1 downto 0);



dds_I_inst:entity work.dds_synthesizer_pipe
  generic map(
    ftw_width =>32
    )
  port map(
    clk_i   =>clk,
    rst_i   =>reset, --# потом поставить сигнал найденного конца пилота
--    ftw_i   =>ftw_correction,
    ftw_i   =>x"00010000",
    phase_i =>x"4000",
    phase_o =>open,
    ampl_o  =>dds_cos
    );

dds_Q_inst:entity work.dds_synthesizer_pipe
  generic map(
    ftw_width =>32
    )
  port map(
    clk_i   =>clk,
    rst_i   =>reset,
--    ftw_i   =>ftw_correction,
    ftw_i   =>x"00010000",
    phase_i =>x"0000",
    phase_o =>open,
    ampl_o  =>dds_sin
    );



moveB: entity work.complex_mult
	generic map(
		SHIFT_MUL=>1,
		NOT_USE_IT=>1,--GLOBAL_DEBUG,
		CONJUGATION=>'0' --# умножение на сопряженное число, если '1' - то сопрягать
	)
	port map(
		clk =>clk,
		i_ce =>'1',--down_ce,
		A_I =>sampleIfilt2,
		B_Q =>sampleQfilt2,

		C_I =>dds_sin_d,
		D_Q =>dds_cos_d,

		o_I =>sampleI_moveback,
		o_Q =>sampleQ_moveback,
		out_ce =>sampleQ_moveback_ce
		);
pilot_ce_test_after_cmul<=pilot_ce_test_after_frx_3w;

--pilot_ce_test_after_frx

process(clk) is
begin
	if rising_edge(clk) then
		pilot_ce_test_1w<=pilot_ce_test;
		pilot_ce_test_2w<=pilot_ce_test_1w;
		pilot_ce_test_after_removezerro_a<=pilot_ce_test_after_removezerro_a(pilot_ce_test_after_removezerro_a'Length-2 downto 0)&pilot_ce_test_after_removezerro;
		pilot_ce_test_after_frx_1w<=pilot_ce_test_after_frx;
		pilot_ce_test_after_frx_2w<=pilot_ce_test_after_frx_1w;
		pilot_ce_test_after_frx_3w<=pilot_ce_test_after_frx_2w;

		dds_cos_d<=dds_cos;
        dds_sin_d<=dds_sin;
	end if;
end process;

pilot_finder_inst: entity work.pilot_finder
    Port map(clk=>clk,
		  reset=>reset,
		  sample_ce=>'1',

		  corrI_o=>corrI_s,
		  corrQ_o=>corrQ_s,

		  sampleI=>sampleI_moveback,
		  sampleQ=>sampleQ_moveback,
		  pilot_start=>s_pilot_start --# Этот импульс будет задержан на InterpolateRate*PILOT_LEN+3+Sqrt_Latency тактов
	);
pilot_start<=s_pilot_start;


delayer_find: entity work.delayer
	generic map(
		DELAY_LEN=>DELAY_LEN-12+23+22
	)
	port map(
		clk =>clk,
		reset =>reset,

		istrob_test =>pilot_ce_test_after_cmul,
		ostrob_test =>pilot_ce_test_after_delayer,

		i_sampleI=>sampleI_moveback,
		i_sampleQ=>sampleQ_moveback,

		o_sampleI=>sampleI_delay,
		o_sampleQ=>sampleQ_delay
		);


freq_corrector_ce<=see_sin_here;

calc_freq_of_sin_i: entity work.calc_freq_of_sin
	generic map(
		SIMULATION=>FREQ_SIMULATION
	)
	port map(
		clk =>clk,
		reset =>reset,

		i_ce => '1',--freq_corrector_ce, --1
		i_sampleI=>sampleIfilt2,
		i_sampleQ=>sampleQfilt2,

		phase_for_dds_ce=>open,
		phase_for_dds=>ftw_correction,

		o_freq_ce=>open,
		o_freq=>open
		);



--dds_freq<=0.25*1E6*real(FREQ_FD)*real(conv_integer(ftw_correction))/real((2**30));


pilotsync_inst: entity work.pilot_sync_every_time_ver4
	generic map(
		FILTER_QUICK=>FREQ_SIMULATION,
		SIMULATION=>SIMULATION,
		PERIOD=>PILOT_PERIOD*InterpolateRate
	) 
	port map(
		clk =>clk,
		reset =>reset,

		pilot_not_here => see_sin_here,

		realpilot_event =>s_pilot_start,
		
		
		start_pilotU =>start_pilotU,
        sync_find =>s_sync_find
		);




--to_zero_fraction_i: entity work.to_zero_fraction
--	port map(
--		clk =>clk,
--		reset =>reset,
--  
--		i_sampleI=>sampleI_delay,
--		i_sampleQ=>sampleQ_delay,
--		i_ce =>local_ce,
--  
--		o_sampleI=>after_farrow_i,
--		o_sampleQ=>after_farrow_q,
--		o_ce=>after_farrow_ce
--		);

pilot_upper_inst: entity work.pilot_upper
	port map(
		clk =>clk,
		reset =>start_pilotU_1w,

		pilot_valid=>pilot_valid_byupper,
		sampleI_o=>pilotU_I,
		sampleQ_o=>pilotU_Q
		);


scalar_mult_inst: entity work.scalar_mult
	generic map(
		CONJ_PORT_B=>1  --# Если 1 то bQ будет умножен на (-1)
		)
	port map(
		clk =>clk,
		reset =>reset,

		ce=>pilot_valid_byupper,

		aI=>sampleI_delay,
		aQ=>sampleQ_delay,

		bI=>pilotU_I,
		bQ=>pilotU_Q,

		sum_ce=>scalar_sum_ce,
		sumI_o=>scalar_sumI,
		sumQ_o=>scalar_sumQ
		);


sampleI_delay_div2<=SXT(sampleI_delay(sampleI_delay'Length-1 downto 1),sampleI_delay_div2'Length);
sampleQ_delay_div2<=SXT(sampleQ_delay(sampleI_delay'Length-1 downto 1),sampleI_delay_div2'Length);

feed_back: entity work.average_itertive_demod
	generic map(
		SIMULATION=>0
	)
	port map(
		clk =>clk,
		reset =>reset,
		after_pilot_start =>scalar_sum_ce,--start_pilotU_1w, --# он должен быть над первым i_ce
		i_ce =>local_ce,
		i_samplesI =>sampleI_delay,
		i_samplesQ =>sampleQ_delay,

		i_init_phaseI =>scalar_sumI(scalar_sumI'Length-1 downto scalar_sumI'Length-16),--x"0FFF",
		i_init_phaseQ =>scalar_sumQ(scalar_sumI'Length-1 downto scalar_sumI'Length-16),--x"0000",

		o_samplesI =>after_farrow_i,
		o_samplesQ =>after_farrow_q,

		out_ce =>open
		);


--
--gadarg_i: entity work.gadarg
--	generic map(               --# PS=5.5942e+008 by signal star in input! =sum(abs(<input signal>).^2)/NS
--		RM=>5856428,     --# RM=1.34*PS/(4*KKK) , like target maximum of signal
--		STEP=>471, --# (2^(AcumLen-1)) * (2^(BitsInADC*2+RM)/(PS^2))
--		KKK=>3   --# ceil(log2(STEP)/2) , must be more or equal than 2
--	)
--	port map(
--		clk =>clk,
--		reset =>reset_bysync,
--
--		i_sampleI=>sampleI_delay,
--		i_sampleQ=>sampleQ_delay,
--		i_ce =>local_ce,
--
--		o_sampleI =>after_farrow_i,
--		o_sampleQ =>after_farrow_q
--		);
--
--
ToTextFile_i: entity work.ToTextFile
	generic map(BitLen =>16,
			WriteHex=>0,  -- if need write file in hex format or std_logic_vector too long(>=64)
			NameOfFile=>"after_farrow_i.txt")
	 port map(
		 clk =>clk,
		 CE =>local_ce, 
		 block_marker=>'0',
		 DataToSave=>after_farrow_i
	     );

ToTextFile_q: entity work.ToTextFile
	generic map(BitLen =>16,
			WriteHex=>0,  -- if need write file in hex format or std_logic_vector too long(>=64)
			NameOfFile=>"after_farrow_q.txt")
	 port map(
		 clk =>clk,
		 CE =>local_ce, 
		 block_marker=>'0',
		 DataToSave=>after_farrow_q
	     );



delayt: process(clk) is
begin
	if rising_edge(clk) then
        reset_bysync<=not s_sync_find;

		start_pilotU_1w<=start_pilotU;
		start_pilotU_2w<=start_pilotU_1w;

		if scalar_sum_ce='1' then
			if ce_cnt=3 then
--			if ce_cnt=1 then
--			if ce_cnt=2 then
				local_ce<='1';
			else
				local_ce<='0';
			end if;
			ce_cnt<=conv_std_logic_vector(1,log2roundup(InterpolateRate));
		else
			if unsigned(ce_cnt)<InterpolateRate-1 then
				ce_cnt<=ce_cnt+1;
				local_ce<='0';
			else
				ce_cnt<=(others=>'0');
				local_ce<='1';
			end if;
		end if;


		if start_pilotU='1' then
			pilot_here<='1';
			pilot_here_cnt<=conv_std_logic_vector(PILOT_LEN*InterpolateRate-1,pilot_here_cnt'Length);
		else
			if unsigned(pilot_here_cnt)>0 then
				pilot_here_cnt<=pilot_here_cnt-1;
				pilot_here<='1';
			else
				pilot_here<='0';
			end if;
		end if;
	end if;
end process;


sampleI_delayD(0)<=sampleI_delay;
sampleQ_delayD(0)<=sampleQ_delay;

find_best_pos: for i in 0 to BEST_F-2 generate
delayt: process(clk) is
begin
	if rising_edge(clk) then
		sampleI_delayD(i+1)<=sampleI_delayD(i);
		sampleQ_delayD(i+1)<=sampleQ_delayD(i);

		sampleI_sq_a(i)<=signed(bests_corrs_I(i))*signed(bests_corrs_I(i));  --# I find that 6 the best!
		sampleQ_sq_a(i)<=signed(bests_corrs_Q(i))*signed(bests_corrs_Q(i));
		sample_sq_a(i)<=sampleI_sq_a(i)+sampleQ_sq_a(i);


	end if;
end process;

pilot_correlator_i: entity work.pilot_correlator
	port map(
		clk =>clk,
		reset =>reset,
		ce => pilot_here,
		i_samplesI=>sampleI_delayD(i),
		i_samplesQ=>sampleQ_delayD(i),
		o_sampleI=>bests_corrs_I(i),  --# выход в два раза меньше максимума
		o_sampleQ=>bests_corrs_Q(i)
		);
	
end generate;

end modem_rx_top;

