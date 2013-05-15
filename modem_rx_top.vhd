library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library work;
use work.feedf_consts_pack.all;

entity modem_rx_top is
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
			  
		  dds_cos_o: out std_logic_vector(15 downto 0);
		  dds_sin_o: out std_logic_vector(15 downto 0);
		  pilot_start: out std_logic --# Этот импульс будет задержан на InterpolateRate*PILOT_LEN+5+Sqrt_Latency тактов
	);
			--# В данный момент Sqrt_Latency=16
end modem_rx_top;
architecture modem_rx_top of modem_rx_top is

signal sampleIfilt,sampleQfilt: std_logic_vector(15 downto 0);
signal sampleIfilt2,sampleQfilt2: std_logic_vector(15 downto 0);
constant SQRT_LATENCY:natural:=16;
constant FILTRCC_LATENCY:natural:=33/2+1-5;
constant DELAY_LEN:natural:=InterpolateRate*PILOT_LEN+SQRT_LATENCY+FILTRCC_LATENCY;
constant DDS_LATENCY:natural:=8;
constant DELAY_AFTER_FREQESTIM:natural:=25413+DDS_LATENCY+1; --# Высчитывается по симуляции сигналом time_for_freqcalc_cnt_reg 


signal sampleI_delay,sampleQ_delay:std_logic_vector(sampleIfilt'Length-1 downto 0);
signal sampleI_delay_fe,sampleQ_delay_fe:std_logic_vector(sampleIfilt'Length-1 downto 0);
signal sampleI_delay_fe_reg,sampleQ_delay_fe_reg:std_logic_vector(sampleIfilt'Length-1 downto 0);
signal s_pilot_start:std_logic;

signal freq_value,freq_val_filt:std_logic_vector(NBITm1+log2roundup(PILOT_LEN*2) downto 0);
--constant MUL_SCALE:std_logic_vector(11 downto 0):=conv_std_logic_vector(2564,12);
--constant MUL_SCALE:std_logic_vector(11 downto 0):=conv_std_logic_vector(45,12);
constant MUL_SCALE:std_logic_vector(11 downto 0):=conv_std_logic_vector(34,12);
signal freq_val_filt_mult_1w,freq_val_filt_mult:std_logic_vector(freq_val_filt'Length+MUL_SCALE'Length-1+1 downto 0);

signal freq_ce,freq_ce_f,freq_ce_f_1w,freq_ce_f_2w,good_values:std_logic;
signal dds_cos,dds_sin:std_logic_vector(15 downto 0);

signal s_pilot_start_norm,pilot_wr:std_logic;
signal sampleI_norm,sampleQ_norm:std_logic_vector(15 downto 0);

signal corrI_s: std_logic_vector(15 downto 0);
signal corrQ_s: std_logic_vector(15 downto 0);

signal time_for_freqcalc_ce:std_logic;
signal time_for_freqcalc_cnt,time_for_freqcalc_cnt_reg:std_logic_vector(31 downto 0):=(others=>'0');

signal sampleI_moveback,sampleQ_moveback:std_logic_vector(dds_cos'Length+sampleI_delay_fe_reg'Length-1 downto 0);

begin

rcc_up_filter_inst: entity work.rcc_up_filter_rx
	generic map(
		LEN=>sampleI'Length
	)
	port map(
		clk =>clk,
		reset =>reset,
		i_samplesI=>sampleI,
		i_samplesQ=>sampleQ,
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
		i_samplesI=>sampleI_norm,
		i_samplesQ=>sampleQ_norm,
		freq_ce=>freq_ce,
		o_freq=>freq_value --#  надо разделить число на (4607023/(5.5))
		);

--# Так как надо привести к 32 битному числу которое укажет частоту
--# то умножить надо на 2**31/(4607023/(5.5))=2563.729346 так как надо 
--# помнить что freq_value знаковое 

bih_filter_integrator_inst: entity work.bih_filter_integrator_sign
	generic map(
		ALPHA_NUM=>6,  --# коэффициент интегрирования, чем он больше тем большую историю храним
		SCALE_FACTOR=>3,  --# маштаб - чем он больше тем меньше значение на выходе
		WIDTH=>freq_value'Length
	)
	port map(
		clk =>clk,
		
		ce =>freq_ce,
		sample =>freq_value, --# this is signed value!!!
  
		filtered =>freq_val_filt,
		ce_out =>freq_ce_f
	);

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
		if freq_ce='1' then
			freq_val_filt_mult<=signed(freq_value)*unsigned(MUL_SCALE);
		end if;
		freq_val_filt_mult_1w<=freq_val_filt_mult;

		dds_cos_o<=dds_cos;
		dds_sin_o<=dds_sin;


		sampleI_moveback<=signed(sampleI_delay_fe_reg)*signed(dds_cos);
		sampleQ_moveback<=signed(sampleQ_delay_fe_reg)*signed(dds_sin);

	end if;
end process;


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
		DELAY_LEN=>DELAY_AFTER_FREQESTIM
	) 
	port map(
		clk =>clk,
		reset =>reset,

		i_sampleI=>sampleI_delay,
		i_sampleQ=>sampleQ_delay,

		o_sampleI=>sampleI_delay_fe,
		o_sampleQ=>sampleQ_delay_fe
		);


end modem_rx_top;

