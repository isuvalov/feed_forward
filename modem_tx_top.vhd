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
    Port (clk: in std_logic;
		  reset: in std_logic;

		  pilot_ce_test: out std_logic;

		  sampleI_tx_o: out std_logic_vector(15 downto 0);
		  sampleQ_tx_o: out std_logic_vector(15 downto 0)
	);
end modem_tx_top;

architecture modem_tx_top of modem_tx_top is

signal sampleI_tx,sampleQ_tx:std_logic_vector(15 downto 0);
signal rd_req:std_logic;

constant seq_len:integer:=36;
type Tseq is array(seq_len-1 downto 0) of integer;
--constant seq:Tseq:=(0,0,0,2,1,2,1,2,3,3,2,2,1,1,3,2);
--constant seq:Tseq:=(0,0,0,2,1,2,3,3);
constant seq:Tseq:=(0,0,0,2,1,2,3,3,1,2,0,1,2,3,0,2  --# 16
                   ,1,0,1,2,0,1,0,1,2,0,2,0,2,3,0,1,0,1,2,2);

signal pos_cnt:integer:=0;
signal bits_gen2,bits_gen:std_logic_vector(1 downto 0):=(others=>'0');

begin

USE_LFSR01: if USE_LFSR/=1 generate
process (clk) is
begin
	if rising_edge(clk) then
		if rd_req='1' then
--			bits_gen<=bits_gen+1;
			if pos_cnt<seq_len-1 then
				pos_cnt<=pos_cnt+1;
			else
				pos_cnt<=0;
			end if;
			bits_gen<=conv_std_logic_vector(seq(pos_cnt),bits_gen'Length);
		end if;		
	end if;
end process;
end generate; --# USE_LFSR/=1



USE_LFSR02: if USE_LFSR=1 generate
	LFSRgenerator_i: entity work.LFSRgenerator
	Generic map(
	NumberOfOutputBits=>2
	)
	 port map(
		 clk =>clk,
		 ce =>rd_req,
		 reset =>reset,
		 LFSR_Mask =>x"8000000D",
		 LFSR_Word =>bits_gen
	     );
end generate; --# USE_LFSR=1


bits_gen2<=fliplr(bits_gen);

wrapper_tx_stream_i: entity work.wrapper_tx_stream
	port map(
		clk =>clk,
		reset =>reset,

		rd_o=>rd_req,
		bits_i=>bits_gen, --# биты должны поступать с latency=0

		pilot_ce=>pilot_ce_test,
		sampleI_o=>sampleI_tx_o,
		sampleQ_o=>sampleQ_tx_o
		);



end modem_tx_top;

