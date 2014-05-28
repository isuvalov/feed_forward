LIBRARY ieee;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;
use work.assert_pack.all;

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


signal adc_im,adc_re:std_logic_vector(15 downto 0):=(others=>'0');


signal pilot_ce_test_event,pilot_ce_test,pilot_ce_test_1w:std_logic;
signal clk,clk125,clk125_div2,clk125_div4:std_logic:='0';
signal reset:std_logic:='1'; 
signal cnt_rd:std_logic_vector(64 downto 0):=(others=>'0');
signal cnt_wr:std_logic_vector(64 downto 0):=(others=>'0');

signal tx_cnt:integer:=0;

signal sampleI_tx,sampleQ_tx:std_logic_vector(15 downto 0);
signal sampleI_tx_sh,sampleQ_tx_sh:std_logic_vector(15 downto 0);
signal sampleI_tx0,sampleQ_tx0:std_logic_vector(15 downto 0);
signal pilot_start:std_logic;
signal out_sampleQ,out_sampleI,sampleI_tx2,sampleQ_tx2:std_logic_vector(15 downto 0);

signal rd_req:std_logic;
signal bits_gen:std_logic_vector(1 downto 0):=(others=>'0');


signal bit_value_rx_ce,bit_value_rx_ce_1w,ce_all,error:std_logic;
signal bit_value_rx:std_logic_vector(1 downto 0);

signal test_bits_ce,reset_n: std_logic;
signal test_bits: std_logic_vector(1 downto 0);


begin

reset<='0' after 30 ns;
reset_n<=not reset;

CLK_GEN125: process(clk)
begin
	clk<= not clk after CLK_PERIOD_clk125/2; 
end process;


ADC_EMUL_re:entity work.FromTextFile
	generic map(BitLen =>16,
			IsSigned=>1, -- you can choose signed or unsigned value you have in text file
			NameOfFile =>"gadarg_signal_re.txt")
	 port map(
		 clk =>clk,
		 CE =>'1',
		 DataFromFile =>adc_re
	     );

ADC_EMUL_im:entity work.FromTextFile
	generic map(BitLen =>16,
			IsSigned=>1, -- you can choose signed or unsigned value you have in text file
			NameOfFile =>"gadarg_signal_im.txt")
	 port map(
		 clk =>clk,
		 CE =>'1',
		 DataFromFile =>adc_im
	     );


gadarg_i: entity work.gadarg
	generic map(               --# PS=5.5942e+008 by signal star in input! =sum(abs(<input signal>).^2)/NS
		RM=>5856428,     --# RM=1.34*PS/(4*KKK)
		STEP=>471, --# (2^(AcumLen-1)) * (2^(BitsInADC*2+RM)/(PS^2))
		KKK=>5   --# ceil(log2(STEP)/2)
	)
	port map(
		clk =>clk,
		reset =>reset,

		i_sampleI=>adc_re,
		i_sampleQ=>adc_im,
		i_ce=>reset_n,

		o_sampleI=>out_sampleI,
		o_sampleQ=>out_sampleQ
		);


ToTextFile01i: entity work.ToTextFile
	generic map(BitLen =>16,
			WriteHex=>0,  -- if need write file in hex format or std_logic_vector too long(>=64)
			NameOfFile=>"with_channel\test_re.txt")
	 port map(
		 clk =>clk,
		 CE =>reset_n,
		 block_marker =>'0',
		 DataToSave =>out_sampleI
	     );


ToTextFile02i: entity work.ToTextFile
	generic map(BitLen =>16,
			WriteHex=>0,  -- if need write file in hex format or std_logic_vector too long(>=64)
			NameOfFile=>"with_channel\test_im.txt")
	 port map(
		 clk =>clk,
		 CE =>reset_n,
		 block_marker =>'0',
		 DataToSave =>out_sampleQ
	     );

end tb;

