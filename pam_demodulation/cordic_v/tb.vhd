LIBRARY ieee;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;


entity tb is
end tb;


--clk по входу должна быть 115200*16=1843200

architecture tb of tb is

-- clkq = 31/25*clk125 

constant CLK_PERIOD_clk125: TIME := 8 ns; 
constant CLK_PERIOD_clkq: TIME := 100 ns; --# < 1/(125e6*(9/8)*(204/186))

constant FRAME_LEN:natural:=204;
constant CE_LEN:natural:=188;


constant SHFT:integer:=8;
component mult31_25
	PORT
	(
		areset		: IN STD_LOGIC  := '0';
		inclk0		: IN STD_LOGIC  := '0';
		c0		: OUT STD_LOGIC ;
		locked		: OUT STD_LOGIC 
	);
end component;


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





signal clkq,clk125,clk125_div2,clk125_div4:std_logic:='0';
signal reset:std_logic:='1'; 
signal cnt_rd:std_logic_vector(64 downto 0):=(others=>'0');
signal cnt_wr:std_logic_vector(64 downto 0):=(others=>'0');

signal tx_cnt:integer:=0;


signal lfsr_reg:std_logic_vector(31 downto 0):=x"21322132";
signal bits:std_logic_vector(1 downto 0);


signal o_interp_ce,o_interp_ce_w1,sm_qam_ce:std_logic;
signal s_test_i,s_test_q,o_samplesI,o_samplesQ:std_logic_vector(1 downto 0);
signal qam_I,qam_Q,adc_i_im,adc_i_re:std_logic_vector(15 downto 0);

type Tadc_array is array(0 to 31) of std_logic_vector(15 downto 0);
signal adc_array_re,adc_array_im:Tadc_array;


signal pilot_start:std_logic;
signal file_read,file_read_w1,file_read_w2:std_logic_vector(0 to 31):=(others=>'0');
signal file_read_cnt:std_logic_vector(15 downto 0):=(others=>'0');

signal time_calc:integer:=0;

type Tfile_stm is (STARTING,WRITING,DELAY,ENDD);
signal file_stm:Tfile_stm;

signal string_cnt,infile_cnt,delay_cnt:integer:=0;
signal muxer:std_logic_vector(0 to 30):=(others=>'0');

signal phase,a_phase:std_logic_vector(19 downto 0);
signal ai,aq:std_logic_vector(15 downto 0);
signal rd_ce:std_logic:='0';

begin

reset<='0' after 30 ns;
rd_ce<='1' after CLK_PERIOD_clk125*26;
--rd_ce<='1' after CLK_PERIOD_clk125*26*2;


CLK_GEN125: process(clkq)
begin
	clkq<= not clkq after CLK_PERIOD_clk125/2; 
end process;

process (clkq) is
begin
	if rising_edge(clkq) then
	end if;
end process;


FromTextFile_i: entity work.FromTextFile
	generic map(BitLen =>20,
			IsSigned=>1, -- you can choose signed or unsigned value you have in text file
			NameOfFile=>"a_phase.txt")
	 port map(
		 clk =>clkq,
		 CE =>rd_ce,
		 DataFromFile =>a_phase
	     );

FromTextFile_ai: entity work.FromTextFile
	generic map(BitLen =>16,
			IsSigned=>1, -- you can choose signed or unsigned value you have in text file
			NameOfFile=>"ai.txt") --"../../frame_I.txt") --"ai.txt")
	 port map(
		 clk =>clkq,
		 CE =>'1',
		 DataFromFile =>ai
	     );

FromTextFile_aq: entity work.FromTextFile
	generic map(BitLen =>16,
			IsSigned=>1, -- you can choose signed or unsigned value you have in text file
			NameOfFile=>"aq.txt") --"../../frame_Q.txt") --"aq.txt")
	 port map(
		 clk =>clkq,
		 CE =>'1',
		 DataFromFile =>aq
	     );


cordic_wrapper_i:entity work.cordic_wrapper
	port map(
		clk =>clkq,
		i_ce =>'1',
		i_samplesI=>ai,
		i_samplesQ=>aq,

		phase=>phase
		);


	s03: entity work.ToTextFile
	generic map(BitLen =>phase'Length,
			WriteHex =>0,  -- if need write file in hex format or std_logic_vector too long(>=64)
			NameOfFile =>"phasetest.txt")
	 port map(
		 clk =>clkq,
		 CE =>rd_ce,
		 block_marker =>'0',
		 DataToSave =>phase
	     );


end tb;
