LIBRARY ieee;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.math_real.all;


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
signal reset,cnt_ce,cnt_ce_o:std_logic:='1'; 
signal cnt_rd:std_logic_vector(64 downto 0):=(others=>'0');
signal cnt_wr:std_logic_vector(64 downto 0):=(others=>'0');

signal samples,sampleI_tx,sampleQ_tx:std_logic_vector(15 downto 0):=(others=>'0');
signal phase_for_dds:std_logic_vector(31 downto 0):=(others=>'0');

signal dds_cos,dds_sin,sampleI_moveback,sampleQ_moveback:std_logic_vector(15 downto 0);

begin

reset<='0' after 400 ns;


CLK_GEN125: process(clkq)
begin
	clkq<= not clkq after CLK_PERIOD_clk125/2; 
end process;


process(clkq) is
begin
	if rising_edge(clkq) then
		cnt_wr<=cnt_wr+1;
		if cnt_wr(4 downto 0)=5 then
			cnt_ce<='1';
		else
			cnt_ce<='0';
		end if;
	end if;
end process;

--start_sin_gen_i:entity work.start_sin_gen
--	generic map(
--		FREQ_FD=>100, --# Frequncy of discretization
--		FREQ_VAL=>1, --# it means Fs=fd/freq_val, where Fs - frequncy of sin
--		LEN=>16
--	)
--	port map(
--		clk =>clkq,
--		i_reset =>reset,
--		i_ce =>'1',--cnt_ce,
--		o_ce => cnt_ce_o,
--		o_samples =>samples
--		);



tx_top_i: entity work.modem_tx_top
	generic map(
		USE_LFSR=>1
	)
        port map(clk =>clkq,
		  reset =>reset,

		  init_complite =>'0', --# from modem_rx

		  pilot_ce_test=>open,

		  sampleI_tx_o=>sampleI_tx,
		  sampleQ_tx_o=>sampleQ_tx 
	);


--calc_freq_of_sin_i: entity work.calc_freq_of_sin
--	port map(
--		clk =>clkq,
--		reset =>reset,
--  
--		i_ce=>'1',
--		i_sampleI=>sampleI_tx,
--		i_sampleQ=>sampleQ_tx,
--
--		phase_for_dds_ce=>open,
--		phase_for_dds=>phase_for_dds,
--
--
--		o_freq_ce=>open,
--		o_freq=>open
--		);

dds_I_inst:entity work.dds_synthesizer_pipe
  generic map(
    ftw_width =>32
    )
  port map(
    clk_i   =>clkq,
    rst_i   =>reset, --# потом поставить сигнал найденного конца пилота
	--#  =  ((2**32)*3e6)/100e6 = 128849019 i.e +3MHz generation  - I test it and it equal for generation start_sin_gen.vhd 
    ftw_i   =>conv_std_logic_vector(-42949673,32), 
    phase_i =>x"4000",
    phase_o =>open,
    ampl_o  =>dds_cos
    );

dds_Q_inst:entity work.dds_synthesizer_pipe
  generic map(
    ftw_width =>32
    )
  port map(
    clk_i   =>clkq,
    rst_i   =>reset,
    ftw_i   =>conv_std_logic_vector(-42949673,32), --#  =  ((2**32)*3e6)/100e6 = 128849019
    phase_i =>x"0000",
    phase_o =>open,
    ampl_o  =>dds_sin
    );



moveB: entity work.complex_mult
	generic map(
		SHIFT_MUL=>1,
		NOT_USE_IT=>0,--GLOBAL_DEBUG,
		CONJUGATION=>'0' --# умножение на сопряженное число, если '1' - то сопрягать
	)
	port map(
		clk =>clkq,
		i_ce =>'1',--down_ce,
		A_I =>sampleI_tx,
		B_Q =>sampleQ_tx,

		C_I =>dds_sin,
		D_Q =>dds_cos,

		o_I =>sampleI_moveback,
		o_Q =>sampleQ_moveback,
		out_ce =>open --sampleQ_moveback_ce
		);


--ToTextFile_i: entity work.ToTextFile
--	generic map(BitLen =>16,
--			WriteHex=>0,  -- if need write file in hex format or std_logic_vector too long(>=64)
--			NameOfFile=>"sss.txt")
--	 port map(
--		 clk =>clkq,
--		 CE =>cnt_ce_o,
--		 block_marker=>'0',
--		 DataToSave =>samples
--	     );

modem_rx_top_i: entity work.modem_rx_top
	generic map(
		SIMULATION=>0
	)
    Port map(clk=>clkq,
		  reset=>reset,
		  sampleI=>sampleI_moveback(15 downto 4),
		  sampleQ=>sampleQ_moveback(15 downto 4),

		  test_mode=>"00",
				--# 1 - output after signal normalizing
				--# 2 - output after rcc filter
				--# 3 - output after correlation

		  test_I=>open,
		  test_Q=>open,
		  test_inner_pilot_pos=>open,
		
		  demod_phase=>open,
		  demod_phase_ce=>open,

		  bit_value_ce=>open,
		  bit_value=>open,

		  sync_find=>open,
		  dds_cos_o=>open,
		  dds_sin_o=>open,
		  pilot_start=>open  --# Этот импульс будет задержан на InterpolateRate*PILOT_LEN+5+Sqrt_Latency тактов
	);



end tb;
