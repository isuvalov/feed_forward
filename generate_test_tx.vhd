library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;


entity generate_test_tx is
	generic (
		SIM_LOAD_FROM_FILE:integer:=1;
		SIM_FILENAME_I:string:="datfiles/resample_pilot_p0mhz_real.dat   ";
		SIM_FILENAME_Q:string:="datfiles/resample_pilot_p0mhz_imag.dat   "
	);
	port(
		clk : in STD_LOGIC;
		reset : in std_logic;

		pilot_ce: out std_logic;
		sampleI_o: out std_logic_vector(15 downto 0);
		sampleQ_o: out std_logic_vector(15 downto 0)
		);
end generate_test_tx;



architecture generate_test_tx of generate_test_tx is

FUNCTION gen_lfsr(PSPNum: integer; pol : std_logic_vector; en : std_logic; nb_iter : natural) RETURN std_logic_vector IS
VARIABLE pol_int : std_logic_vector(pol'length-1 DOWNTO 0);
VARIABLE pol_gen : std_logic_vector(pol'length-1 DOWNTO 0);
BEGIN
CASE PSPNum is
when 0 => pol_gen := x"8000000D";
when 1 => pol_gen := x"00400007";
when 2 => pol_gen := x"00086001";
when 3 => pol_gen := x"02800003";
when 4 => pol_gen := x"21000005";
when others => pol_gen := "11"; -- x^2 + x + 1
END CASE;
pol_int := pol;
iteration : FOR i in 1 to nb_iter LOOP
IF en = '1' THEN
IF pol_int(pol'length-1)='1' THEN
pol_int := (pol_int(pol'length-2 DOWNTO 0)&'0') xor pol_gen;
ELSE
pol_int := (pol_int(pol'length-2 DOWNTO 0)&'0');
END IF;
ELSE pol_int := pol_int;
END IF;
END LOOP;
RETURN (pol_int);
END gen_lfsr;


signal cnt_interp:std_logic_vector(log2roundup(InterpolateRate)-1 downto 0);	

signal o_interp_ce,o_interp_ce_w2,o_interp_ce_w1,sm_qam_ce:std_logic;
signal bits:std_logic_vector(1 downto 0);
signal lfsr_reg:std_logic_vector(31 downto 0):=x"21322132";

signal mod_samplesI,mod_samplesQ:std_logic_vector(1 downto 0);

--signal cnt:std_logic_vector(11 downto 0);
signal cnt,cnt_1w:std_logic_vector(12 downto 0);
signal qw_rd_1w,qw_rd,test_mux:std_logic;
signal s_sampleI_o,s_sampleQ_o:std_logic_vector(sampleI_o'Length-1 downto 0);
signal m_sampleI_o,m_sampleQ_o:std_logic_vector(sampleI_o'Length-1 downto 0);
signal adc_array_im,adc_array_re:std_logic_vector(15 downto 0);

type Ttest_mem is array(0 to PILOT_LEN) of std_logic_vector(15 downto 0);
signal test_mem_I,test_mem_Q:Ttest_mem;

signal first_read:std_logic;

begin

sml_fromf:if SIM_LOAD_FROM_FILE=1 generate

qw_rd<='1' when unsigned(cnt)<PILOT_LEN and first_read='1' and reset='0' else '0';


ADC_EMUL_re:entity work.FromTextFile
	generic map(BitLen =>16,
			IsSigned=>1, -- you can choose signed or unsigned value you have in text file
			NameOfFile =>SIM_FILENAME_I)
	 port map(
		 clk =>clk,
		 CE =>qw_rd,
		 DataFromFile =>adc_array_re
	     );

ADC_EMUL_im:entity work.FromTextFile
	generic map(BitLen =>16,
			IsSigned=>1, -- you can choose signed or unsigned value you have in text file
			NameOfFile =>SIM_FILENAME_Q)
	 port map(
		 clk =>clk,
		 CE =>qw_rd,
		 DataFromFile =>adc_array_im
	     );
process(clk) is
begin
	if rising_edge(clk) then
		qw_rd_1w<=qw_rd;
		cnt_1w<=cnt;
		if first_read='1' then
			if qw_rd_1w='1' then
    	    	test_mem_I(conv_integer(cnt_1w))<=adc_array_re;
				test_mem_Q(conv_integer(cnt_1w))<=adc_array_im;
			end if;
		end if;

		if reset='1' then
			m_sampleI_o<=(others=>'1');
			m_sampleQ_o<=(others=>'1');
		else
			if unsigned(cnt)<PILOT_LEN then
				m_sampleI_o<=test_mem_I(conv_integer(cnt));
				m_sampleQ_o<=test_mem_Q(conv_integer(cnt));
			else
				m_sampleI_o<=conv_std_logic_vector(5000,m_sampleI_o'Length);
				m_sampleQ_o<=conv_std_logic_vector(-6000,m_sampleI_o'Length);
			end if;
		end if;
	end if;
end process;

end generate;


--sampleI_o<=m_sampleI_o;
--sampleQ_o<=m_sampleQ_o;


sml_fromf00:if SIM_LOAD_FROM_FILE/=1 generate
m_sampleI_o<=s_sampleI_o(s_sampleI_o'Length-1-1 downto 0)&"0";
m_sampleQ_o<=s_sampleQ_o(s_sampleQ_o'Length-1-1 downto 0)&"0";
end generate;

process(clk) is
begin
	if rising_edge(clk) then
		if reset='1' then
			cnt<=(others=>'0');
			first_read<='1';
		else
			if o_interp_ce='1' then
				cnt<=cnt+1;
			end if;
			if cnt=PILOT_LEN then
				first_read<='0';
			end if;
		end if;

		if o_interp_ce='1' then
			if unsigned(cnt)<PILOT_LEN then
				if PILOT((PILOT_LEN-1)-conv_integer(cnt(log2roundup(PILOT_LEN)-1 downto 0)))='1' then --# set or 0 or 2
					bits<="00";
				else
					bits<="10";
				end if;
				test_mux<='1';
				pilot_ce<='1';
			else
				test_mux<='0';
				pilot_ce<='0';
				bits<="01";--lfsr_reg(bits'Length-1 downto 0);
			end if;
		else
			test_mux<='0';
		end if;

		if o_interp_ce='1' then
				lfsr_reg<=gen_lfsr(0,lfsr_reg,'1', bits'Length);
		end if;
		
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
		i_ce => o_interp_ce_w1,
		
		o_samplesI=>mod_samplesI,
		o_samplesQ=>mod_samplesQ,
		o_ce=>sm_qam_ce
		);

rcc_up_filter_inst: entity work.rcc_up_filter
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



--sampleI_o<=SXT(cnt(3 downto 0),16);--,m_sampleI_o;
--sampleQ_o<=SXT(cnt(3 downto 0),16);--m_sampleQ_o;

sampleI_o<=m_sampleI_o;
sampleQ_o<=m_sampleQ_o;


	
end generate_test_tx;
