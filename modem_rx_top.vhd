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

signal sampleI_delay,sampleQ_delay:std_logic_vector(15 downto 0);
signal s_pilot_start:std_logic;

type Tdelayline is array (0 to DELAY_LEN-1) of std_logic_vector(sampleIfilt'Length-1 downto 0);
signal delaylineI,delaylineQ:Tdelayline:=(others=>(others=>'0'));

signal p_wr:std_logic_vector(log2roundup(DELAY_LEN)-1 downto 0):=(others=>'0');
signal p_rd:std_logic_vector(log2roundup(DELAY_LEN)-1 downto 0):=conv_std_logic_vector(DELAY_LEN-1,p_wr'Length);

signal freq_value,freq_val_filt:std_logic_vector(NBITm1+log2roundup(PILOT_LEN*2) downto 0);
--constant MUL_SCALE:std_logic_vector(11 downto 0):=conv_std_logic_vector(2564,12);
constant MUL_SCALE:std_logic_vector(11 downto 0):=conv_std_logic_vector(45,12);
signal freq_val_filt_mult_1w,freq_val_filt_mult:std_logic_vector(freq_val_filt'Length+MUL_SCALE'Length-1+1 downto 0);

signal freq_ce,freq_ce_f,freq_ce_f_1w,freq_ce_f_2w,good_values:std_logic;
signal dds_cos,dds_sin:std_logic_vector(15 downto 0);

signal s_pilot_start_norm,pilot_wr:std_logic;
signal sampleI_norm,sampleQ_norm:std_logic_vector(15 downto 0);

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
		  sampleI=>sampleIfilt2,
		  sampleQ=>sampleQfilt2,
		  pilot_start=>s_pilot_start --# Этот импульс будет задержан на InterpolateRate*PILOT_LEN+3+Sqrt_Latency тактов
	);
pilot_start<=s_pilot_start;

process (clk) is
begin		
	if rising_edge(clk) then
		if reset='1' then
			p_wr<=(others=>'0');
--			p_rd<=conv_std_logic_vector(DELAY_LEN-1,p_rd'Length);
			p_rd<=conv_std_logic_vector(1,p_rd'Length);
		else
			if unsigned(p_rd)<DELAY_LEN-1 then
				p_rd<=p_rd+1;
			else
				p_rd<=(others=>'0');
			end if;
			if unsigned(p_wr)<DELAY_LEN-1 then
				p_wr<=p_wr+1;
			else
				p_wr<=(others=>'0');
			end if;
		end if;
	end if;
end process;


process (clk) is
begin		
	if rising_edge(clk) then
		delaylineI(conv_integer(p_wr))<=sampleIfilt2;
		sampleI_delay<=delaylineI(conv_integer(p_rd));
	end if;
end process;

process (clk) is
begin		
	if rising_edge(clk) then
		delaylineQ(conv_integer(p_wr))<=sampleQfilt2;
		sampleQ_delay<=delaylineQ(conv_integer(p_rd));
	end if;
end process;

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
		freq_ce_f_1w<=freq_ce_f;
		freq_ce_f_2w<=freq_ce_f_1w;
		if freq_ce='1' then
			freq_val_filt_mult<=signed(freq_value)*unsigned(MUL_SCALE);
		end if;
		freq_val_filt_mult_1w<=freq_val_filt_mult;
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

dds_cos_o<=dds_cos;
dds_sin_o<=dds_sin;

end modem_rx_top;

