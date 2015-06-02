library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;


entity tx_insert_pilots is
	port(
		clk : in STD_LOGIC;
		reset : in std_logic;

  	    init_complite: in std_logic; --# from modem_rx


		rd_o: out std_logic;
		bits_i: in std_logic_vector(1 downto 0); --# биты должны поступать с latency=0

		pilot_ce: out std_logic;
		sampleI_o: out std_logic_vector(15 downto 0);
		sampleQ_o: out std_logic_vector(15 downto 0)
		);
end tx_insert_pilots;



architecture tx_insert_pilots of tx_insert_pilots is



signal cnt_interp:std_logic_vector(log2roundup(InterpolateRate)-1 downto 0);	

signal o_interp_ce,o_interp_ce_w2,o_interp_ce_w1,sm_qam_ce:std_logic;
signal bits:std_logic_vector(1 downto 0);
signal sin_mux:std_logic;
signal lfsr_reg,bits_cnt:std_logic_vector(31 downto 0):=x"21322132";

signal mod_samplesI,mod_samplesQ:std_logic_vector(1 downto 0);

--signal cnt:std_logic_vector(11 downto 0);
signal cnt,cnt_1w:std_logic_vector(log2roundup(PILOT_PERIOD)-1 downto 0);
signal qw_rd_1w,qw_rd,test_mux:std_logic;
signal s_sampleI_o,s_sampleQ_o:std_logic_vector(sampleI_o'Length-1 downto 0);


signal s_sampleI_filt,s_sampleQ_filt:std_logic_vector(sampleI_o'Length-1 downto 0);
signal s_sampleI_sin,s_sampleI_cos:std_logic_vector(sampleI_o'Length-1 downto 0);
signal s_sampleI_mux,s_sampleQ_mux:std_logic_vector(sampleI_o'Length-1 downto 0);

signal m_sampleI_o,m_sampleQ_o:std_logic_vector(sampleI_o'Length-1 downto 0);
signal adc_array_im,adc_array_re:std_logic_vector(15 downto 0);

type Ttest_mem is array(0 to PILOT_LEN) of std_logic_vector(15 downto 0);
signal test_mem_I,test_mem_Q:Ttest_mem;

signal first_read,s_pilot_ce,s_pilot_ce_1w,s_pilot_ce_2w:std_logic;
signal s_pilot_ce_a:std_logic_vector(9-1 downto 0);
signal duplicate_iq:std_logic;
signal delay_cnt:std_logic_vector(3 downto 0);

signal test_seq:std_logic;
signal s_pilot_ce_array:std_logic_vector(8 downto 0);

type Tstm is (INIT_INSERT_PILOT,INIT_SIN,INSERT_PILOT,INSERT_DATA);
signal stm:Tstm;

begin


process(clk) is
begin
	if rising_edge(clk) then
		if reset='1' then
			cnt<=(others=>'0');
			first_read<='1';
			
		else
			if o_interp_ce='1' then
				if unsigned(cnt)<PILOT_PERIOD-1 then
					cnt<=cnt+1;
				else
					cnt<=(others=>'0');
				end if;
			end if;
			if cnt=PILOT_LEN then
				first_read<='0';
			end if;
		end if;

		if reset='1' then
			stm<=INSERT_PILOT;
			duplicate_iq<='0';
			rd_o<='0';
			sin_mux<='0';
		else
		if o_interp_ce='1' then
			case stm is

			when INIT_INSERT_PILOT=>
				if unsigned(cnt)<PILOT_LEN-1 then
				else
					stm<=INIT_SIN;
				end if;
				test_seq<=PILOT((PILOT_LEN-1)-conv_integer(cnt(log2roundup(PILOT_LEN)-1 downto 0)));

				if PILOT((PILOT_LEN-1)-conv_integer(cnt(log2roundup(PILOT_LEN)-1 downto 0)))='1' then --# set or 0 or 2
					bits<="00";
				else
					bits<="10";
				end if;
				if init_complite='1' then
					sin_mux<='0';
				else
					sin_mux<='1';
				end if;
				s_pilot_ce<='1';
				duplicate_iq<='1';
				rd_o<='0';
				delay_cnt<=(others=>'1');

			when INIT_SIN=>
				test_seq<='Z';
				if init_complite='1' then
					sin_mux<='0';
				else
					sin_mux<='1';
				end if;
				s_pilot_ce<='0';
				duplicate_iq<='0';
				rd_o<='1';
                bits<=bits_i;
				if cnt=PILOT_PERIOD-1 then
					if init_complite='1' then
						stm<=INSERT_PILOT;
					else
						stm<=INIT_INSERT_PILOT;
					end if;
				end if;


			when INSERT_PILOT=>
				if init_complite='1' then
					sin_mux<='0';
				else
					sin_mux<='1';
				end if;

				if unsigned(cnt)<PILOT_LEN-1 then
				else
					stm<=INSERT_DATA;--PREAMBULE01;
				end if;
				test_seq<=PILOT((PILOT_LEN-1)-conv_integer(cnt(log2roundup(PILOT_LEN)-1 downto 0)));

				if PILOT((PILOT_LEN-1)-conv_integer(cnt(log2roundup(PILOT_LEN)-1 downto 0)))='1' then --# set or 0 or 2
					bits<="00";
				else
					bits<="10";
				end if;
				s_pilot_ce<='1';
				duplicate_iq<='1';
				rd_o<='0';
				delay_cnt<=(others=>'1');
			when INSERT_DATA=>
				test_seq<='Z';
				if init_complite='1' then
					sin_mux<='0';
				else
					sin_mux<='1';
				end if;
				s_pilot_ce<='0';
				duplicate_iq<='0';
				rd_o<='1';
                bits<=bits_i;
				if cnt=PILOT_PERIOD-1 then
					stm<=INSERT_PILOT;
				end if;
			when others=>
			end case;
		else     --# o_interp_ce
			rd_o<='0';
--			duplicate_iq<='0';
		end if;  --# o_interp_ce
		end if; --# reset
        o_interp_ce_w1<=o_interp_ce;
		o_interp_ce_w2<=o_interp_ce_w1;
	end if;
end process;

ce_manager_inst: entity work.ce_manager
	port map(
		clk =>clk,
		reset =>reset,
		o_interp_ce =>o_interp_ce
		);


qam4_mapper_inst:entity work.qam4_mapper
	port map(
		clk =>clk,
		reset =>reset,
		i_bits =>bits(1 downto 0),
		i_duplicate_iq => duplicate_iq,
		i_ce => o_interp_ce_w1,
		
		o_samplesI=>mod_samplesI,
		o_samplesQ=>mod_samplesQ,
		o_ce=>sm_qam_ce
		);

--sin_mux


rcc_up_filter_inst: entity work.rcc_up_filter --# задерживаем на 9 тактов
	generic map(
		LEN=>mod_samplesI'Length
	)
	port map(
		clk =>clk,
		reset =>reset,		
		i_samplesI=>mod_samplesI,
		i_samplesQ=>mod_samplesQ,
		o_sampleI=>s_sampleI_filt,
		o_sampleQ=>s_sampleQ_filt
		);





--dds_I_inst:entity work.dds_synthesizer_pipe
--  generic map(
--    ftw_width =>32
--    )
--  port map(
--    clk_i   =>clk,
--    rst_i   =>reset, --# потом поставить сигнал найденного конца пилота
--    ftw_i   =>conv_std_logic_vector(4*((2**30)/FREQ_FD)*PILOTSIN_FREQ,32),
--    phase_i =>x"4000",
--    phase_o =>open,
--    ampl_o  =>s_sampleI_cos
--    );
--
--dds_Q_inst:entity work.dds_synthesizer_pipe
--  generic map(
--    ftw_width =>32
--    )
--  port map(
--    clk_i   =>clk,
--    rst_i   =>reset,
--    ftw_i   =>conv_std_logic_vector(4*((2**30)/FREQ_FD)*PILOTSIN_FREQ,32),
--    phase_i =>x"0000",
--    phase_o =>open,
--    ampl_o  =>s_sampleI_sin
--    );




start_sin_gen_i:entity work.start_sin_gen
	generic map(
		SIN_GEN=>1,
		FREQ_FD=>FREQ_FD, --# Frequncy of discretization
		FREQ_VAL=>PILOTSIN_FREQ, --# it means Fs=fd/freq_val, where Fs - frequncy of sin
		LEN=>s_sampleI_sin'Length
	)
	port map(
		clk =>clk,
		i_reset =>reset,
		i_ce =>'1',
		o_ce => open,
		o_samples =>s_sampleI_sin
		);

start_sin_gen2_i:entity work.start_sin_gen
	generic map(
		SIN_GEN=>0,
		FREQ_FD=>FREQ_FD, --# Frequncy of discretization
		FREQ_VAL=>PILOTSIN_FREQ, --# it means Fs=fd/freq_val, where Fs - frequncy of sin
		LEN=>s_sampleI_sin'Length
	)
	port map(
		clk =>clk,
		i_reset =>reset,
		i_ce =>'1',
		o_ce => open,
		o_samples =>s_sampleI_cos
		);


process(clk) is
begin
	if rising_edge(clk) then
		if sin_mux='0' then
			s_sampleI_mux<=s_sampleI_filt(s_sampleI_o'Length-1-1 downto 0)&"0";
			s_sampleQ_mux<=s_sampleQ_filt(s_sampleI_o'Length-1-1 downto 0)&"0";
		else
			s_sampleI_mux<=s_sampleI_sin;
			s_sampleQ_mux<=s_sampleI_cos;
		end if;

		s_pilot_ce_array<=s_pilot_ce_array(s_pilot_ce_a'Length-2 downto 0)&s_pilot_ce;

	end if;
end process;
pilot_ce<=s_pilot_ce_array(s_pilot_ce_a'Length-1);

sampleI_o<=s_sampleI_mux;
sampleQ_o<=s_sampleQ_mux;


--G01: if GLOBAL_DEBUG/=1 generate
--	sampleI_o<=s_sampleI_o(s_sampleI_o'Length-1-1 downto 0)&"0";
--	sampleQ_o<=s_sampleQ_o(s_sampleQ_o'Length-1-1 downto 0)&"0";
--end generate;

--G02: if GLOBAL_DEBUG=1 generate
--	sampleI_o<=s_sampleI_o(s_sampleI_o'Length-1-3 downto 0)&"000";
--	sampleQ_o<=s_sampleQ_o(s_sampleQ_o'Length-1-3 downto 0)&"000";
--end generate;
	
end tx_insert_pilots;
