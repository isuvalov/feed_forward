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

constant DataLen:natural:=16;

constant SHFT:integer:=8;


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

signal cnt_ce:integer;--std_logic_vector(1 downto 0):=(others=>'0');
signal cnt_d:std_logic_vector(1 downto 0):="00";

signal adc_im,adc_re:std_logic_vector(15 downto 0):=(others=>'0');


signal pilot_ce_test_event,pilot_ce_test,pilot_ce_test_1w:std_logic;
signal clk,clk125,clk125_div2,clk125_div4:std_logic:='0';
signal reset:std_logic:='1'; 
signal cnt_rd:std_logic_vector(64 downto 0):=(others=>'0');
signal cnt_wr:std_logic_vector(64 downto 0):=(others=>'0');

signal tx_cnt:integer:=0;

signal sampleI_tx,sampleQ_tx:std_logic_vector(15 downto 0);
signal sampleI_tx_sh,sampleQ_tx_sh,mu:std_logic_vector(15 downto 0);
signal sampleI_tx0,sampleQ_tx0:std_logic_vector(15 downto 0);
signal pilot_start:std_logic;
signal out_sampleQ,out_sampleI,sampleI_tx2,sampleQ_tx2:std_logic_vector(15 downto 0);

signal rd_req:std_logic;
signal bits_gen:std_logic_vector(1 downto 0):=(others=>'0');


signal bit_value_rx_ce,bit_value_rx_ce_1w,ce_all,error,local_ce_1w:std_logic;
signal bit_value_rx:std_logic_vector(1 downto 0);

signal test_bits_ce,reset_n,local_ce,ttt_ce: std_logic;
signal test_bits: std_logic_vector(1 downto 0);

signal ce_d,after_farrow_ce:std_logic;
signal after_farrow_i,after_farrow_q:std_logic_vector(15 downto 0);


signal ttt:std_logic_vector(15 downto 0):=x"0000";

begin

reset<='0' after 30 ns;
reset_n<=(not reset) and local_ce;

CLK_GEN125: process(clk)
begin
	clk<= not clk after CLK_PERIOD_clk125/2; 
end process;

process(clk) is
begin
	if rising_edge(clk) then
		if reset='1' then
			local_ce<='0';
			cnt_ce<=0;
			cnt_d<="00";
			ce_d<='0';
		else
			if local_ce='1' then
				cnt_d<=cnt_d+1;
				if cnt_d="11" then
					ce_d<='1';
				else
					ce_d<='0';
				end if;
			else
				ce_d<='0';
			end if;
			local_ce<='1';
			cnt_ce<=cnt_ce+1;
		end if;

		


	    ttt<=ttt+1;	
		if ttt(3 downto 0)=0 then
			ttt_ce<='1';
		else
			ttt_ce<='0';
		end if;


		if cnt_ce=100 then
			sampleI_tx<=x"0FFF";
		else
			sampleI_tx<=x"0000";
		end if;

		local_ce_1w<=local_ce;
--		if cnt_ce=3 then
--			local_ce<='1';
--		else
--			local_ce<='0';
--		end if;			
		
	end if;
end process;


--mu<="01"&conv_std_logic_vector(4096,14); --# 0..8191 (4096/8192)=0.5 => 4096 have powers  2048,1024,512  <=>  ((4096/8192)**2)*8192
--mu<="01"&conv_std_logic_vector(1000,14); --# 0..8191  (1000/8192)=0.12207 => 4096 have powers  122,14,1 <=>  ((1000/8192)**2)*8192
--mu<="00"&conv_std_logic_vector(8191,14);


--mu<="0"&conv_std_logic_vector(16384,15); --# 0..16383 (8192/32768)=0.5 => 8192 have powers  16384,8192,4096,2048  <=>  ((16384/32768)**2)*32768
mu<="0"&conv_std_logic_vector(1024,15); --# 0..16383  (2000/32768)=0.03125 => 4096 have powers  1024,32,1,0 <=>  ((2000/32768)**2)*16384
--mu<="0"&conv_std_logic_vector(32767,15);  --# =1
--mu<="0"&conv_std_logic_vector(0,15);  --# =0

make_powers_i: entity work.make_powers
	generic map(
		WIDTH=>8
	)
	port map(
		clk =>clk,

		i_val=>ttt(11 downto 12-8),
		i_ce=>ttt_ce,

		o_sq1=>open,  --# WIDTH*1
		o_sq2=>open,  --# WIDTH*2
		o_sq3=>open,  --# WIDTH*3
		o_sq4=>open,  --# WIDTH*4
		o_ce=>open
		);



ADC_EMUL_re:entity work.FromTextFile
	generic map(BitLen =>16,
			IsSigned=>1, -- you can choose signed or unsigned value you have in text file
--			NameOfFile =>"../gadarg/no_channel/gadarg_signal_re.txt")
			NameOfFile =>"before_farrow_i.txt")
	 port map(
		 clk =>clk,
		 CE =>'1',
		 DataFromFile =>adc_re
	     );

ADC_EMUL_im:entity work.FromTextFile
	generic map(BitLen =>16,
			IsSigned=>1, -- you can choose signed or unsigned value you have in text file
--			NameOfFile =>"../gadarg/no_channel/gadarg_signal_im.txt")
			NameOfFile =>"before_farrow_q.txt")
	 port map(
		 clk =>clk,
		 CE =>'1',
		 DataFromFile =>adc_im
	     );

--farrow_i:entity work.farrow_32bit
--	generic map(
--		MU_SIZE=>8
--	)
--	port map(
--		clk =>clk,
--		reset =>reset,
--
--		i_mu=>mu(15 downto 8), --# signed 2.14 i.e. 14bit for fraction
--		
--		i_sample=>adc_im, --sampleI_tx,--
--		i_ce=>local_ce_1w,
--
--		o_sample=>open,
--		o_ce=>open
--		);


--farrow16_i:entity work.farrow
--	generic map(
--		MU_SIZE=>8
--	)
--	port map(
--		clk =>clk,
--		reset =>reset,
--
--		i_mu=>mu(15 downto 8), --# signed 2.14 i.e. 14bit for fraction
--		
--		i_sample=>adc_im, --sampleI_tx,--
--		i_ce=>ce_d,--local_ce_1w,
--
--		o_sample=>open,
--		o_ce=>open
--		);


to_zero_fraction_i: entity work.to_zero_fraction
	port map(
		clk =>clk,
		reset =>reset,

		i_sampleI=>adc_re,
		i_sampleQ=>adc_im,
		i_ce =>ce_d,--local_ce_1w,

		o_sampleI=>after_farrow_i,
		o_sampleQ=>after_farrow_q,
		o_ce=>after_farrow_ce
		);


ToTextFile_i: entity work.ToTextFile
	generic map(BitLen =>16,
			WriteHex=>0,  -- if need write file in hex format or std_logic_vector too long(>=64)
			NameOfFile=>"after_farrow_i.txt")
	 port map(
		 clk =>clk,
		 CE =>after_farrow_ce, 
		 block_marker=>'0',
		 DataToSave=>after_farrow_i
	     );

ToTextFile_q: entity work.ToTextFile
	generic map(BitLen =>16,
			WriteHex=>0,  -- if need write file in hex format or std_logic_vector too long(>=64)
			NameOfFile=>"after_farrow_q.txt")
	 port map(
		 clk =>clk,
		 CE =>after_farrow_ce, 
		 block_marker=>'0',
		 DataToSave=>after_farrow_q
	     );

end tb;

