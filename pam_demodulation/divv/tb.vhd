LIBRARY ieee;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
--library std;
--use std.textio.all;

entity tb is
end tb;


architecture tb of tb is

-- clkq = 31/25*clk125 

constant CLK_PERIOD_clk125: TIME := 40 ns; 
constant CLK_PERIOD_clkq: TIME := 6.45161290322580645 ns; --# < 1/(125e6*(9/8)*(204/186))

constant CLK_PERIOD_clks: TIME := 200.0 ns;

constant FRAME_LEN:natural:=204;
constant CE_LEN:natural:=188;


constant SHFT:integer:=8;


signal clkq,clk125,clk125_div2,clk125_div4:std_logic:='0';
signal reset:std_logic:='1'; 
signal cnt_rd:std_logic_vector(64 downto 0):=(others=>'0');
signal cnt_wr:std_logic_vector(64 downto 0):=(others=>'0');

-- for data_generator
signal Tx_mac_wa,Tx_mac_wr:std_logic;
signal Tx_mac_data:std_logic_vector(31 downto 0);
signal Tx_mac_BE:std_logic_vector(1 downto 0);
signal Tx_mac_eop,Tx_mac_sop:std_logic;
signal Tx_mac_wa_n:std_logic;

--# loop back
signal Tx_en,Tx_er,Rx_clk,Gtx_clk,Tx_clk:std_logic;
signal Rx_er,Rx_dv:std_logic;
signal Txd,Rxd:std_logic_vector(7 downto 0):=(others=>'0');

--# rx engine
signal Rx_mac_ra_tb,Rx_mac_rd_tb:std_logic;
signal Rx_mac_eop_tb,Rx_mac_pa_tb,Rx_mac_sop_tb,Tx_mac_wr_n_tb: std_logic;
signal Rx_mac_data_tb : std_logic_vector(31 downto 0);
signal Rx_mac_BE_tb : std_logic_vector(1 downto 0);


signal data_fromfile,data_fromfile_w1,data_fromfile_w2:std_logic_vector(7 downto 0);
signal ce_fromfile_F,ce_fromfile,ce_fromfile_w1,ce_fromfile_w2:std_logic;

signal tx_coded_data,tx_coded_data_rs:std_logic_vector(7 downto 0);
signal tx_coded_ce,reset_delay:std_logic;
signal cccnt:std_logic_vector(15 downto 0):=(others=>'0');

signal dataout_end:std_logic_vector(7 downto 0);
signal ceout_end:std_logic;

signal err,Tx_er_end,Tx_en_end:std_logic;
signal Txd_end_w1,Txd_end:std_logic_vector(7 downto 0);

signal reset0,locked_sig,ack_out_bus,empty2_bus:std_logic;
signal time_cnt:std_logic_vector(31 downto 0):=(others=>'0');


signal makerr,rd89,empty89,state_value,ce89,ce89_w1,ce98,ce98_w1,empty98:std_logic;
signal data89,data98,DataOutB_2,DataOutB:std_logic_vector(8 downto 0):=(others=>'0');
signal data8:std_logic_vector(7 downto 0):=(others=>'0');
signal towork:std_logic_vector(11 downto 0):=(others=>'0');

signal clk_signal,signal_ce:std_logic:='0';

signal byted,byted_w1,byted2:std_logic_vector(7 downto 0);
signal short,short2:std_logic_vector(15 downto 0);
signal dv_cnt_short:std_logic:='0';

signal half_b:std_logic_vector(3 downto 0);
signal dv,dv_1w:std_logic;
signal dv_cnt:std_logic:='0';
signal dv_cnt_not,dv_cnt_parse,dv_cnt2:std_logic;
signal sweep_ce,sweep_ce_w1:std_logic;

signal data_to_algorithm:  std_logic_vector(15 downto 0);
signal ce_to_algorithm:  std_logic;
signal finish_to_algorithm:  std_logic;

signal data_from_algorithm:  std_logic_vector(15 downto 0);
signal ce_from_algorithm:  std_logic;
signal finish_from_algorithm:  std_logic;

signal byte1,byte2:std_logic_vector(7 downto 0);


signal cnt_udp_frame,cnt_udp_frame_reg,alg_cnt:integer:=0;

type Tmem is array(0 to 7) of integer;
constant mem:Tmem:=(-1000,-1000,0,1000,1000,50,50,50);

signal localc,allalg:integer:=0;
signal data_tx:std_logic_vector(3 downto 0);
signal dv_tx:std_logic;

signal denom:std_logic_vector(15 downto 0):=(others=>'0');

begin

--reset<='0' after 100 ns;



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



sigclk: process(clk_signal)
begin
	clk_signal<= not clk_signal after CLK_PERIOD_clks/2; 
end process;


process (clk_signal) is
begin
 if rising_edge(clk_signal) then
	denom<=denom+1;
	if localc<10000 then
		localc<=localc+1;	
		reset<='0';
	else
		localc<=0;
		reset<='1';
	end if;
 end if;
end process;


pipe_div_i:ENTITY work.pipe_div
	PORT map
	(
		aclr	=>reset,
		clken	=>'1',
		clock	=>clk_signal,
		denom	=>conv_std_logic_vector(2,16),
		numer	=>denom,
		quotient		=>open,
		remain		=>open
	);


end tb;
