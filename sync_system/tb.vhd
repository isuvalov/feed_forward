LIBRARY ieee;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;

entity tb is
end tb;


architecture tb of tb is

-- clkq = 31/25*clk125 

constant CLK_PERIOD_clk125: TIME := 8 ns; 
constant CLK_PERIOD_clkq: TIME := 6.45161290322580645 ns; --# < 1/(125e6*(9/8)*(204/186))
--constant CLK_PERIOD_clkq: TIME := 80 ns; --# < 1/(125e6*(9/8)*(204/186))



component system_strob_gen
port (
--#  fd - in Hz, period - in samples, freqoffset - in mHz 
--# error_val - size of whole window(in two ways +/-) where strob generate, in samples
--# p_loss - probability of loss strob, value 65535 is 100%, 0 meens that loss=0 
 clk: in std_logic;
 period: in std_logic_vector(31 downto 0);
 fd: in std_logic_vector(31 downto 0);
 freqoffset: in std_logic_vector(31 downto 0);
 error_val: in std_logic_vector(31 downto 0);
 p_loss: in std_logic_vector(31 downto 0);
 start_delay: in std_logic_vector(31 downto 0);
 ce: in std_logic;
 strob: out std_logic
);
end component;


signal cnt,cntreg:integer:=0;
signal clkq,clk125,clk125_div2,clk125_div4:std_logic:='0';
signal strob,strob_mean,reset:std_logic:='1'; 

signal frame_start_p1_0,frame_start_p1,mean_lock,mean_lock_1w,sync_gen_reset : std_logic;
signal to_gun:std_logic_vector(17 downto 0);

begin

reset<='0' after 80 ns;



CLK_GEN125: process(clk125)
begin
	clk125<= not clk125 after CLK_PERIOD_clk125/2; 
end process;

c125div2: process(clk125)
begin
 if rising_edge(clk125) then
  clk125_div2<=not clk125_div2;
 end if;
end process;

c125div4: process(clk125_div2)
begin
 if rising_edge(clk125_div2) then
  clk125_div4<=not clk125_div4;
 end if;
end process;


c125clkq: process(clkq)
begin
	clkq<= not clkq after CLK_PERIOD_clkq/2; 
end process;



stbgen_inst: system_strob_gen
port map(
--#  fd - in Hz, period - in samples, freqoffset - in mHz 
--# error_val - size of whole window(in two ways +/-) where strob generate, in samples
--# p_loss - probability of loss strob, value 65535 is 100%, 0 meens that loss=0 
 clk=>clkq,
 period	=>		conv_std_logic_vector(PILOT_PERIOD,32),
 fd =>			conv_std_logic_vector(125e6,32),
 freqoffset=>	conv_std_logic_vector(0000,32),
 error_val=>	conv_std_logic_vector(0,32),
 p_loss=>		conv_std_logic_vector(65535/3,32),
 start_delay=>	conv_std_logic_vector(0000,32),
 ce=>'1',
 strob=>strob
);

process(clkq)
begin
    if rising_edge(clkq) then
		if strob='1' then
			cnt<=0;
			cntreg<=cnt;
		else
			cnt<=cnt+1;
		end if;
	end if;
end process;



process (clkq) 
begin
	if rising_edge(clkq) then
		if reset='1' then
		else
		end if;
	end if;
end process;


end tb;
