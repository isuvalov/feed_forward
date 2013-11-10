library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;


entity wrapper_tx_stream is
	port(
		clk : in STD_LOGIC;
		reset : in std_logic;

		rd_o: out std_logic;
		bits_i: in std_logic_vector(1 downto 0); --# биты должны поступать с latency=0

		pilot_ce: out std_logic;
		sampleI_o: out std_logic_vector(15 downto 0);
		sampleQ_o: out std_logic_vector(15 downto 0)
		);
end wrapper_tx_stream;



architecture wrapper_tx_stream of wrapper_tx_stream is



signal cnt_interp:std_logic_vector(log2roundup(InterpolateRate)-1 downto 0);	

signal o_interp_ce,o_interp_ce_w2,o_interp_ce_w1,sm_qam_ce:std_logic;
signal bits:std_logic_vector(1 downto 0);
signal lfsr_reg,bits_cnt:std_logic_vector(31 downto 0):=x"21322132";

signal mod_samplesI,mod_samplesQ:std_logic_vector(1 downto 0);

--signal cnt:std_logic_vector(11 downto 0);
signal cnt,cnt_1w:std_logic_vector(log2roundup(PILOT_PERIOD)-1 downto 0);
signal qw_rd_1w,qw_rd,test_mux:std_logic;
signal s_sampleI_o,s_sampleQ_o:std_logic_vector(sampleI_o'Length-1 downto 0);
signal m_sampleI_o,m_sampleQ_o:std_logic_vector(sampleI_o'Length-1 downto 0);
signal adc_array_im,adc_array_re:std_logic_vector(15 downto 0);

type Ttest_mem is array(0 to PILOT_LEN) of std_logic_vector(15 downto 0);
signal test_mem_I,test_mem_Q:Ttest_mem;

signal first_read,s_pilot_ce,s_pilot_ce_1w,s_pilot_ce_2w:std_logic;
signal s_pilot_ce_a:std_logic_vector(9-1 downto 0);
signal duplicate_iq:std_logic;

type Tstm is (INSERT_PILOT,PREAMBULE01,PREAMBULE02,PREAMBULE03,INSERT_DATA);
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

		if o_interp_ce='1' then
			case stm is
			when INSERT_PILOT=>
				if unsigned(cnt)<PILOT_LEN-1 then
				else
					stm<=INSERT_DATA;--PREAMBULE01;
				end if;
				if PILOT((PILOT_LEN-1)-conv_integer(cnt(log2roundup(PILOT_LEN)-1 downto 0)))='1' then --# set or 0 or 2
					bits<="00";
				else
					bits<="10";
				end if;
				s_pilot_ce<='1';
				duplicate_iq<='1';
				rd_o<='0';
			when PREAMBULE01=>
				s_pilot_ce<='0';
				duplicate_iq<='0';
                bits<="00";
				stm<=PREAMBULE02;
				rd_o<='0';
			when PREAMBULE02=>
				s_pilot_ce<='0';
				duplicate_iq<='0';
                bits<="00";
				stm<=PREAMBULE03;
				rd_o<='0';
			when PREAMBULE03=>
				s_pilot_ce<='0';
				duplicate_iq<='0';
                bits<="00";
				stm<=INSERT_DATA;
				rd_o<='0';
			when INSERT_DATA=>
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
		end if;  --# o_interp_ce

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
		i_bits =>bits,
		i_duplicate_iq => duplicate_iq,
		i_ce => o_interp_ce_w1,
		
		o_samplesI=>mod_samplesI,
		o_samplesQ=>mod_samplesQ,
		o_ce=>sm_qam_ce
		);

rcc_up_filter_inst: entity work.rcc_up_filter --# задерживаем на 10 тактов
	generic map(
		LEN=>mod_samplesI'Length
	)
	port map(
		clk =>clk,
		reset =>reset,
		i_samplesI=>mod_samplesI,
		i_samplesQ=>mod_samplesQ,
		o_sampleI=>s_sampleI_o,
		o_sampleQ=>s_sampleQ_o
		);
pilot_ce<=s_pilot_ce_a(s_pilot_ce_a'Length-1);

sampleI_o<=s_sampleI_o(s_sampleI_o'Length-1-1 downto 0)&"0";
sampleQ_o<=s_sampleQ_o(s_sampleQ_o'Length-1-1 downto 0)&"0";

	
end wrapper_tx_stream;
