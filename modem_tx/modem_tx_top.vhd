library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library work;
use work.feedf_consts_pack.all;

entity modem_tx_top is
	generic(
		USE_LFSR:integer:=1
	);
        port (clk: in std_logic;
		  reset: in std_logic;

		  init_complite: in std_logic; --# from modem_rx

		  pilot_ce_test: out std_logic;

		  sampleI_tx_o: out std_logic_vector(15 downto 0);
		  sampleQ_tx_o: out std_logic_vector(15 downto 0)
	);
end modem_tx_top;

architecture modem_tx_top of modem_tx_top is

component fifo_zero_latency
	PORT
	(
		clock		: IN STD_LOGIC ;
		data		: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		rdreq		: IN STD_LOGIC ;
		sclr		: IN STD_LOGIC ;
		wrreq		: IN STD_LOGIC ;
		empty		: OUT STD_LOGIC ;
		full		: OUT STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
		usedw		: OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
	);
end component;


signal sampleI_tx,sampleQ_tx:std_logic_vector(15 downto 0);
signal rd_req:std_logic;

--constant seq_len:integer:=36;
constant seq_len:integer:=8;
type Tseq is array(seq_len-1 downto 0) of integer;
--constant seq:Tseq:=(0,0,0,2,1,2,1,2,3,3,2,2,1,1,3,2);
--constant seq:Tseq:=(0,2,3,0,3,1,0,3);
--constant seq:Tseq:=(3,0,3,2,1,2,3,3,1,2,3,3,2,3,0,2  --# 16
--                   ,3,0,3,3,0,3,0,1,2,0,2,0,3,3,0,3,0,1,2,2);

signal pos_cnt:integer:=0;
signal bits_gen2,bits_gen:std_logic_vector(1 downto 0):=(others=>'0');
signal usedw : STD_LOGIC_VECTOR (3 DOWNTO 0);
signal s_pilot_ce_test: std_logic;

signal gen_ce,gen_ce_1w:std_logic;

type Tstm is (RESETING,INIT_SEQUENCE,START_SYNC,WORKING);
signal stm:Tstm;


begin

USE_LFSR01: if USE_LFSR/=1 generate
process (clk) is
begin
	if rising_edge(clk) then
		if s_pilot_ce_test='1' then
			pos_cnt<=0;
		elsif rd_req='1' then
			bits_gen<=bits_gen+1;
			if pos_cnt<seq_len-1 then
				pos_cnt<=pos_cnt+1;
			else
				pos_cnt<=0;
			end if;
--			bits_gen<=conv_std_logic_vector(seq(pos_cnt),bits_gen'Length);
		end if;		
	end if;
end process;
bits_gen2<=bits_gen;

end generate; --# USE_LFSR/=1



USE_LFSR02: if USE_LFSR=1 generate
	LFSRgenerator_i: entity work.LFSRgenerator
	Generic map(
	NumberOfOutputBits=>2
	)
	 port map(
		 clk =>clk,
		 ce =>gen_ce,
		 reset =>reset,
		 LFSR_Mask =>x"8000000D",
		 LFSR_Word =>bits_gen
	     );

fifo_zero_latency_i: fifo_zero_latency
	PORT map
	(
		clock=>clk,
		data=>bits_gen,
		rdreq=>rd_req,
		sclr=>reset,
		wrreq=>gen_ce_1w,
		empty=>open,
		full=>open,
		q	=>bits_gen2,
		usedw =>usedw
	);

process(clk) is
begin
	if rising_edge(clk) then
		if unsigned(usedw)<8 then
			gen_ce<='1';
		else
			gen_ce<='0';
		end if;
		gen_ce_1w<=gen_ce;
	end if;
end process;


end generate; --# USE_LFSR=1





testLFSR_i:entity work.testLFSR
	Generic map(
	NumberOfInputputBits=>2
	)
	 port map(
	 	 clk =>clk,
	 	 ce=>rd_req,
		 LFSR_Mask =>x"8000000D",
		 datain =>bits_gen2,
		 error =>open
	     );


wrapper_tx_stream_i: entity work.tx_insert_pilots
	port map(
		clk =>clk,
		reset =>reset,

		init_complite =>init_complite,

		rd_o=>rd_req,
		bits_i=>bits_gen2, --# биты должны поступать с latency=0

		pilot_ce=>s_pilot_ce_test,
		sampleI_o=>sampleI_tx_o,
		sampleQ_o=>sampleQ_tx_o
		);
pilot_ce_test<=s_pilot_ce_test;


end modem_tx_top;

