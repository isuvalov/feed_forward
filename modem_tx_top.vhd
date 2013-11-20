library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library work;
use work.feedf_consts_pack.all;

entity modem_tx_top is
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

signal bits_gen:std_logic_vector(1 downto 0):=(others=>'0');

begin


process (clk) is
begin
	if rising_edge(clk) then
		if rd_req='1' then
			bits_gen<=bits_gen+1;
		end if;
	end if;
end process;



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

