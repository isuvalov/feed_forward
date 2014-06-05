library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library work;
use work.feedf_consts_pack.all;
use work.assert_pack.all;

entity modem_rx_top is
	generic (
		SIMULATION:integer:=0
	);
    Port (clk: in std_logic;
		  reset: in std_logic;
		  sampleI: in std_logic_vector(11 downto 0);
		  sampleQ: in std_logic_vector(11 downto 0);

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
constant SQRT_LATENCY:natural:=16;
constant FILTRCC_LATENCY:natural:=33/2+1-5;
constant DELAY_LEN:natural:=InterpolateRate*PILOT_LEN+SQRT_LATENCY+FILTRCC_LATENCY;
constant DDS_LATENCY:natural:=8;
constant DELAY_AFTER_FREQESTIM:natural:=25413+DDS_LATENCY+1; --# Высчитывается по симуляции сигналом time_for_freqcalc_cnt_reg 
constant PILOTUP_START_DELAY:natural:=9+3; --# Время которое надо для того чтоб генератор интерполированного пилота начал выдавать отсчеты
constant DELAY_COMPLEX_NORMALIZER:natural:=51+2; 

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

signal s_pilot_start_norm_1w,s_pilot_start_norm,pilot_wr,start_pilotU,start_pilotU_1w:std_logic;
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

signal demod_sampleI,demod_sampleQ:std_logic_vector(15 downto 0);

begin

sync_find<=s_sync_find;

sampleIE<=SXT(sampleI,sampleIE'Length);
sampleQE<=SXT(sampleQ,sampleQE'Length);

zero_remove02: if SIMULATION=1 generate
	sampleI_zero<=sampleIE;
	sampleQ_zero<=sampleQE;
end generate; --#SIMULATION=1

zero_remove01: if SIMULATION/=1 generate
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
end generate; --#SIMULATION/=1


rcc_up_filter_inst: entity work.rcc_up_filter_rx
	generic map(
		USE_IT=>1,
		LEN=>sampleI'Length
	)
	port map(
		clk =>clk,
		reset =>reset,
		i_samplesI=>sampleI_zero(sampleI'Length-1 downto 0),
		i_samplesQ=>sampleQ_zero(sampleI'Length-1 downto 0),
		o_sampleI=>sampleIfilt,
		o_sampleQ=>sampleQfilt
		);
sampleIfilt2<=sampleIfilt(sampleIfilt'Length-2 downto 0)&"0";
sampleQfilt2<=sampleQfilt(sampleIfilt'Length-2 downto 0)&"0";
--sampleIfilt2<=sampleIfilt;
--sampleQfilt2<=sampleQfilt;



pilot_finder_inst: entity work.pilot_finder
    Port map(clk=>clk,
		  reset=>reset,
		  sample_ce=>'1',

		  corrI_o=>corrI_s,
		  corrQ_o=>corrQ_s,

		  sampleI=>sampleIfilt2,
		  sampleQ=>sampleQfilt2,
		  pilot_start=>s_pilot_start --# Этот импульс будет задержан на InterpolateRate*PILOT_LEN+3+Sqrt_Latency тактов
	);
pilot_start<=s_pilot_start;


delayer_find: entity work.delayer
	generic map(
		DELAY_LEN=>DELAY_LEN
	)
	port map(
		clk =>clk,
		reset =>reset,

		i_sampleI=>sampleIfilt2,
		i_sampleQ=>sampleQfilt2,

		o_sampleI=>sampleI_delay,
		o_sampleQ=>sampleQ_delay
		);



normalizer_inst:entity work.normalizer
	port map(
		clk =>clk,
		reset =>reset,
		pilot_start=>s_pilot_start, --# он должен быть над первым i_ce
		i_ce =>'1',
		i_samplesI=>sampleI_delay,
		i_samplesQ=>sampleQ_delay,

		o_pilot_wr=>pilot_wr,
		o_pilot_start=>s_pilot_start_norm,
		o_samplesI=>sampleI_norm,
		o_samplesQ=>sampleQ_norm,

		out_ce=>open
		);

	process(clk) is
	begin
		if rising_edge(clk) then
			case test_mode is
			when "00" =>
				if scalar_sum_ce='1' then
					test_I<=scalar_sumI(scalar_sumI'Length-1 downto scalar_sumI'Length-test_I'Length);
					test_Q<=scalar_sumQ(scalar_sumI'Length-1 downto scalar_sumI'Length-test_I'Length);
				end if;
			when "01" =>
				test_I<=sampleI_norm;
				test_Q<=sampleQ_norm;
			when "10" =>
				test_I<=sampleI_norm;
				test_Q<=sampleQ_norm;
			when "11" =>
				test_I<=corrI_s;
				test_Q<=corrQ_s;
			when others=>
			end case;
		end if;
	end process;


freq_estimator_inst: entity work.freq_estimator
	port map(
		clk =>clk,
		reset =>reset,
		pilot_start=>s_pilot_start_norm, --# он должен быть над первым i_ce
		i_ce =>pilot_wr,
		i_samplesI=>sampleI_norm_W(34),--_3w,
		i_samplesQ=>sampleQ_norm_W(34),--_3w,
		freq_ce=>freq_ce,
		o_freq=>freq_value --#  надо разделить число на (4607023/(5.5))
		);
--freq_value<=(others=>'0');


--# Так как надо привести к 32 битному числу которое укажет частоту
--# то умножить надо на 2**31/(4607023/(5.5))=2563.729346 так как надо 
--# помнить что freq_value знаковое 

bih_filter_integrator_inst: entity work.bih_filter_freq
	generic map(
		ALPHA_NUM=>12,  --# коэффициент интегрирования, чем он больше тем большую историю храним
		SCALE_FACTOR=>9,  --# маштаб - чем он больше тем меньше значение на выходе
		WIDTH=>freq_value'Length
	)
	port map(
		clk =>clk,
		reset=>reset,
		ce =>freq_ce,
		sample =>freq_value,

		filtered =>freq_val_filt2,
		ce_out =>freq_ce_f
	);

--freqcorr01: if SIMULATION/=1 generate
	freq_val_filt<=SXT(freq_val_filt2(freq_val_filt2'Length-1 downto 0),freq_val_filt'Length)-200;
--end generate;


--freqcorr02: if SIMULATION=1 generate
--	freq_val_filt<=SXT(freq_val_filt2(freq_val_filt2'Length-3 downto 0)&"00",freq_val_filt'Length)-200;
--end generate;

--freq_val_filt<=freq_val_filt2;


--small_lf_fir_inst: entity work.small_lf_fir
--	generic map(
--		SHIFT=>0,
--		WIDTH=>freq_value'Length
--	)
--	port map(
--		reset=>reset,
--		clk =>clk,
--		
--		ce =>freq_ce,
--		sample =>freq_value, --# this is unsigned value!!!
--
--		filtered=>freq_val_filt,
--		good_values=>good_values,
--		ce_out =>freq_ce_f
--	);



process (clk)
begin
	if rising_edge(clk) then

		sampleI_norm_W(0)<=sampleI_norm;
		sampleQ_norm_W(0)<=sampleQ_norm;

		for i in 1 to 40 loop
			sampleI_norm_W(i)<=sampleI_norm_W(i-1);
			sampleQ_norm_W(i)<=sampleQ_norm_W(i-1);
		end loop;


		s_pilot_start_norm_1w<=s_pilot_start_norm;
        sampleI_delay_fe_reg<=sampleI_delay_fe;
		sampleQ_delay_fe_reg<=sampleQ_delay_fe;
		if s_pilot_start_norm='1' then
			time_for_freqcalc_cnt<=(others=>'0');
			time_for_freqcalc_ce<='1';
		elsif time_for_freqcalc_ce='1' then
			if freq_ce='1' then
				time_for_freqcalc_cnt_reg<=time_for_freqcalc_cnt;
				time_for_freqcalc_ce<='0';
			else
				time_for_freqcalc_cnt<=time_for_freqcalc_cnt+1;
			end if;
		end if;

		freq_ce_f_1w<=freq_ce_f;
		freq_ce_f_2w<=freq_ce_f_1w;
		if freq_ce_f='1' then
			freq_val_filt_mult<=signed(freq_val_filt)*unsigned(MUL_SCALE);
		end if;
		freq_val_filt_mult_1w<=freq_val_filt_mult;
		
--		if GLOBAL_DEBUG=1 then
--			dds_cos_d<=x"3FFF";
--			dds_sin_d<=(others=>'0');
--		else
		dds_cos_d<=dds_cos;
		dds_sin_d<=dds_sin;
--		end if;

		dds_cos_o<=dds_cos;
		dds_sin_o<=dds_sin;


--		sampleI_moveback<=signed(sampleI_delay_fe_reg)*signed(dds_cos);
--		sampleQ_moveback<=signed(sampleQ_delay_fe_reg)*signed(dds_sin);

        test_inner_pilot_pos<=start_pilotU;
		start_pilotU_1w<=start_pilotU;


		start_rotate_ce_1w<=start_rotate_ce and s_sync_find;
		start_rotate_ce_W<=start_rotate_ce_W(start_rotate_ce_W'Length-2 downto 0)&start_rotate_ce_1w;
		start_rotate_ce_2w<=start_rotate_ce_1w;
		start_rotate_ce_3w<=start_rotate_ce_2w;

		sampleI_to_demod_1w<=sampleI_to_demod;
		sampleQ_to_demod_1w<=sampleQ_to_demod;

--		start_rotate_ce_W<=start_rotate_ce_W(start_rotate_ce_W'Length-2 downto 0)&start_rotate_ce;

        down_ce_1w<=down_ce;
        if start_rotate_ce='1' then
--		  if start_rotate_ce_W(12-2)='1' then
--			cnt<=conv_std_logic_vector(InterpolateRate-1,cnt'Length);
			cnt<=conv_std_logic_vector(0,cnt'Length);
			down_ce<='1';
		else
			if unsigned(cnt)<InterpolateRate-1 then
				cnt<=cnt+1;
				down_ce<='0';
			else
				cnt<=(others=>'0');
				down_ce<='1';
			end if;
		end if;
        pilot_valid_1w<=pilot_valid;
		pilot_valid_2w<=pilot_valid_1w;
		pilot_valid_3w<=pilot_valid_2w;
		pilot_valid_W<=pilot_valid_W(pilot_valid_W'Length-2 downto 0)&pilot_valid_1w;


		if pilot_valid_2w='1' and pilot_valid_3w='0' and s_sync_find='1' then
			print_event<='1';
			print(GLOBAL_DEBUG,"On scalar_mult.vhd pilot first value is ("&int_to_string(conv_integer(signed(sampleI_moveback)))&
				","&int_to_string(conv_integer(signed(sampleQ_moveback)))&")");
		else
			print_event<='0';
		end if;

	end if;
end process;


moveB: entity work.complex_mult
	generic map(
		SHIFT_MUL=>2,
		NOT_USE_IT=>0,--GLOBAL_DEBUG,
		CONJUGATION=>'1' --# умножение на сопряженное число, если '1' - то сопрягать
	)
	port map(
		clk =>clk,
		i_ce =>'1',--down_ce,
		A_I =>sampleI_delay_fe_reg(sampleI_delay_fe_reg'Length-1 downto sampleI_delay_fe_reg'Length-16),
		B_Q =>sampleQ_delay_fe_reg(sampleQ_delay_fe_reg'Length-1 downto sampleQ_delay_fe_reg'Length-16),

		C_I =>dds_cos_d,
		D_Q =>dds_sin_d,

		o_I =>sampleI_moveback,
		o_Q =>sampleQ_moveback,
		out_ce =>sampleQ_moveback_ce
		);





pilotsync_inst: entity work.pilot_sync_every_time
	generic map(
		SIMULATION=>SIMULATION,
		DELAY_AFTER_FREQESTIM=>DELAY_AFTER_FREQESTIM,
		DELAY_LEN=>PILOT_PERIOD*InterpolateRate
	) 
	port map(
		clk =>clk,
		reset =>reset,

		realpilot_event =>s_pilot_start,
		
		
		start_pilotU =>start_pilotU,
        sync_find =>s_sync_find
		);


dds_I_inst:entity work.dds_synthesizer_pipe
  generic map(
    ftw_width =>32
    )
  port map(
    clk_i   =>clk,
    rst_i   =>reset, --# потом поставить сигнал найденного конца пилота
    ftw_i   =>freq_val_filt_mult_1w(31 downto 0),
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
    ftw_i   =>freq_val_filt_mult_1w(31 downto 0),
    phase_i =>x"0000",
    phase_o =>open,
    ampl_o  =>dds_sin
    );



delayer_de: entity work.delayer
	generic map(
--		DELAY_LEN=>DELAY_AFTER_FREQESTIM
		DELAY_LEN=>DELAY_AFTER_FREQESTIM-20+18
	) 
	port map(
		clk =>clk,
		reset =>reset,

		i_sampleI=>sampleI_delay,
		i_sampleQ=>sampleQ_delay,

		o_sampleI=>sampleI_delay_fe,
		o_sampleQ=>sampleQ_delay_fe
		);
--sampleI_delay_fe<=sampleI_delay;
--sampleQ_delay_fe<=sampleQ_delay;


pilot_upper_inst: entity work.pilot_upper
	port map(
		clk =>clk,
		reset =>start_pilotU_1w,

		pilot_valid=>pilot_valid,
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

		ce=>pilot_valid_W(11),--pilot_valid_2w,

		aI=>sampleI_moveback(sampleI_moveback'Length-1 downto sampleI_moveback'Length-16),
		aQ=>sampleQ_moveback(sampleI_moveback'Length-1 downto sampleI_moveback'Length-16),

		bI=>pilotU_I,
		bQ=>pilotU_Q,

		sum_ce=>scalar_sum_ce,
		sumI_o=>scalar_sumI,
		sumQ_o=>scalar_sumQ
		);



--complex_normalizer_inst: entity work.complex_normalizer
--	generic map(
--		CONJUGATION=>'0' --# сопряжение числа по выходу, если '1' - то сопрягать
--	)
--	port map(
--		clk =>clk,
--		reset =>reset,
--		i_ce =>scalar_sum_ce,
--		i_samplesI =>scalar_sumI(scalar_sumI'Length-1 downto scalar_sumI'Length-16),
--		i_samplesQ =>scalar_sumQ(scalar_sumQ'Length-1 downto scalar_sumQ'Length-16),
--  
--		o_samplesI=>start_rotate_I,
--		o_samplesQ=>start_rotate_Q,
--		out_ce=>start_rotate_ce
--		);



--start_rotate_I<=scalar_sumI(scalar_sumI'Length-1-4 downto scalar_sumI'Length-16-4);
--start_rotate_Q<=scalar_sumQ(scalar_sumQ'Length-1-4 downto scalar_sumQ'Length-16-4);
--start_rotate_ce<=scalar_sum_ce;





--delay_before_d: entity work.delayer
--	generic map(
--		DELAY_LEN=>DELAY_COMPLEX_NORMALIZER --# еще добавить задержку от скалярного произведения
--	) 
--	port map(
--		clk =>clk,
--		reset =>reset,
--  
--		i_sampleI=>sampleI_moveback(sampleI_moveback'Length-1 downto sampleI_moveback'Length-16),
--		i_sampleQ=>sampleQ_moveback(sampleQ_moveback'Length-1 downto sampleQ_moveback'Length-16),
--  
--		o_sampleI=>sampleI_to_demod,
--		o_sampleQ=>sampleQ_to_demod
--		);


gadarg_i: entity work.gadarg
	generic map(               --# PS=5.5942e+008 by signal star in input! =sum(abs(<input signal>).^2)/NS
--		RM=>5856428,     --# RM=1.34*PS/(4*KKK)
--		STEP=>471, --# (2^(AcumLen-1)) * (2^(BitsInADC*2+RM)/(PS^2))
--		KKK=>5   --# ceil(log2(STEP)/2)
		RM=>226871798/8,
		KKK=>2,
		STEP=>5148
	)
	port map(
		clk =>clk,
		reset =>reset_with_s_sync_find,

		i_sampleI=>sampleI_to_demod_W(0),
		i_sampleQ=>sampleQ_to_demod_W(0),
		i_ce=>down_ce,

		o_sampleI=>demod_sampleI,
		o_sampleQ=>demod_sampleQ
		);


ss: if SIMULATION=1 generate
	s01: entity work.ToTextFile
	generic map(BitLen =>demod_sampleI'Length,
			WriteHex =>0,  -- if need write file in hex format or std_logic_vector too long(>=64)
			NameOfFile =>"gadarg_frame_I.txt")
	 port map(
		 clk =>clk,
		 CE =>down_ce,
		 block_marker =>'0',
		 DataToSave =>demod_sampleI
	     );


	s02: entity work.ToTextFile
	generic map(BitLen =>demod_sampleQ'Length,
			WriteHex =>0,  -- if need write file in hex format or std_logic_vector too long(>=64)
			NameOfFile =>"gadarg_frame_Q.txt")
	 port map(
		 clk =>clk,
		 CE =>down_ce,
		 block_marker =>'0',
		 DataToSave =>demod_sampleQ
	     );
end generate;

pam_demod_i: entity work.pam_demod
	port map(
		clk =>clk,
		i_ce =>down_ce,
		i_samplesI =>demod_sampleI,
		i_samplesQ =>demod_sampleQ,

		bit_value=>bit_value_rx_1p,
		out_ce=>bit_value_rx_ce_1p
		);


	start_rotate_ce<=scalar_sum_ce;

process(clk) is
begin
	if rising_edge(clk) then
        reset_with_s_sync_find<=reset or not(s_sync_find);
		bit_value_rx<=bit_value_rx_1p;
		bit_value_rx_ce<=bit_value_rx_ce_1p;

		demod_phase<=s_demod_phase;
		demod_phase_ce<=s_demod_phase_ce;

		if scalar_sum_ce='1' then
			start_rotate_I<=scalar_sumI(scalar_sumI'Length-1-4 downto scalar_sumI'Length-16-4);
			start_rotate_Q<=scalar_sumQ(scalar_sumQ'Length-1-4 downto scalar_sumQ'Length-16-4);
		end if;




		if s_demod_phase_ce='1' then
			s_demod_phase_minus<=s_demod_phase;
		end if;
        s_demod_phase_ce_1w<=s_demod_phase_ce;

		sampleI_to_demod<=sampleI_moveback(sampleI_moveback'Length-1 downto sampleI_moveback'Length-16);
    	sampleQ_to_demod<=sampleQ_moveback(sampleI_moveback'Length-1 downto sampleI_moveback'Length-16);

		sampleI_to_demod_W(0)<=sampleI_to_demod_1w;
		sampleQ_to_demod_W(0)<=sampleQ_to_demod_1w;
		for i in 1 to 20+21+26 loop
			sampleI_to_demod_W(i)<=sampleI_to_demod_W(i-1);
			sampleQ_to_demod_W(i)<=sampleQ_to_demod_W(i-1);
		end loop;

	
		bit_value_ce<=bit_value_rx_ce;
        bit_value<=bit_value_rx;

	end if;
end process;



end modem_rx_top;

