LIBRARY ieee;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;

entity tb is
end tb;


--clk по входу должна быть 115200*16=1843200

architecture tb of tb is

-- clkq = 31/25*clk125 

constant CLK_PERIOD_clk125: TIME := 8 ns; 
constant CLK_PERIOD_clkq: TIME := 100 ns; --# < 1/(125e6*(9/8)*(204/186))

constant FRAME_LEN:natural:=204;
constant CE_LEN:natural:=188;


constant OFFSET_SH:integer:=1;


signal clk,clk125,clk125_div2,clk125_div4:std_logic:='0';
signal reset:std_logic:='1'; 
signal cnt_rd:std_logic_vector(64 downto 0):=(others=>'0');
signal cnt_wr:std_logic_vector(64 downto 0):=(others=>'0');

signal tx_cnt:integer:=0;

signal sampleI_tx,sampleQ_tx:std_logic_vector(15 downto 0);
signal pilot_start:std_logic;
signal sampleI_tx2,sampleQ_tx2:std_logic_vector(15 downto 0);
signal offset,offset_val:integer:=1;

begin

reset<='0' after 30 ns;


CLK_GEN125: process(clk)
begin
	clk<= not clk after CLK_PERIOD_clk125/2; 
end process;

process (clk) is
begin
	if rising_edge(clk) then
		if unsigned(cnt_wr(31 downto 0))<(offset+PERIOD_OF_PILOT-1) then
			cnt_wr<=cnt_wr+1;
			pilot_start<='0';
		else
			cnt_wr<=(others=>'0');
			pilot_start<='1';
			offset<=offset+offset_val;
		end if;
		
		if offset>OFFSET_SH then
			offset_val<=-1;
		elsif offset<-OFFSET_SH then
            offset_val<=1;
		end if;
		
	end if;
end process;



cc: entity work.usrednaiser
    Port map(clk=>clk,
		  reset=>reset,
		  input_event =>pilot_start,
		  data_ce =>'1',
		  output_event=>open
	);

end tb;
