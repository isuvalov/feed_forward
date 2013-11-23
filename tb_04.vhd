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
signal sampleI_tx2,sampleQ_tx2:std_logic_vector(15 downto 0);

signal rd_req:std_logic;
signal bits_gen:std_logic_vector(1 downto 0):=(others=>'0');


signal bit_value_rx_ce,bit_value_rx_ce_1w,ce_all,error:std_logic;
signal bit_value_rx:std_logic_vector(1 downto 0);

signal test_bits_ce: std_logic;
signal test_bits: std_logic_vector(1 downto 0);


begin

reset<='0' after 30 ns;


CLK_GEN125: process(clk)
begin
	clk<= not clk after CLK_PERIOD_clk125/2; 
end process;

process (clk) is
begin
	if rising_edge(clk) then
		pilot_ce_test_1w<=pilot_ce_test;
		if pilot_ce_test='1' and pilot_ce_test_1w='0' then
			print(GLOBAL_DEBUG,"Pilot first value is ("&int_to_string(conv_integer(signed(sampleI_tx)))&","&int_to_string(conv_integer(signed(sampleQ_tx)))&")");
			pilot_ce_test_event<='1';
		else
			pilot_ce_test_event<='0';
		end if;
	end if;
end process;


modem_tx_top_i: entity work.modem_tx_top
	generic map(
			USE_LFSR=>0
	)
    Port map(clk=>clk,
		  reset=>reset,

		  pilot_ce_test=>open,

		  sampleI_tx_o=>sampleI_tx0,
		  sampleQ_tx_o=>sampleQ_tx0
	);

modem_rx_top_inst: entity work.modem_rx_top
	generic map(
		SIMULATION=>1
	)
    port map(clk=>clk,
		  reset=>reset,
		  sampleI=>sampleI_tx0(sampleI_tx'Length-1 downto sampleI_tx'Length-12),
		  sampleQ=>sampleQ_tx0(sampleQ_tx'Length-1 downto sampleQ_tx'Length-12),

		  test_mode=>"01",
				--# 0 - output phase calculation
				--# 1 - output after signal normalizing
				--# 2 - output after rcc filter
				--# 3 - output after correlation

		  test_I=>open,
		  test_Q=>open,
		  test_inner_pilot_pos=>open,


		  demod_phase =>open,
		  demod_phase_ce =>open,

		  bit_value_ce=>bit_value_rx_ce,
		  bit_value=>bit_value_rx,

		  sync_find=>open,

		  dds_cos_o=>open,
		  dds_sin_o=>open,
		  pilot_start=>pilot_start --# Этот импульс будет задержан на InterpolateRate*PILOT_LEN+5+Sqrt_Latency тактов
	);


testLFSR_i:entity work.testLFSR
	Generic map(
	NumberOfInputputBits=>2
	)
	 port map(
	 	 clk =>clk,
	 	 ce=>bit_value_rx_ce,
		 LFSR_Mask =>x"8000000D",
		 datain =>bit_value_rx,
		 error =>error
	     );


end tb;

