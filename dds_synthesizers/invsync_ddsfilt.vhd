library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;


--# выходные значения в два раза меньше т.е. можно не брать самый старший бит
entity invsync_ddsfilt is
	generic (
		USE_IT:integer:=1;
		LEN:natural:=2
	);
	port(
		clk : in STD_LOGIC;
		reset : in std_logic;
		i_samples: in std_logic_vector(LEN-1 downto 0);
		o_sample: out std_logic_vector(15 downto 0)  --# выход в два раза меньше максимума
		);
end invsync_ddsfilt;



architecture invsync_ddsfilt of invsync_ddsfilt is

constant Nbit_FILT_COSINE:natural:=12;
constant SHM:integer:=0;
constant SH1:integer:=1;  --# надо для сдвига сумматоров 
constant SH2:integer:=2;  --# надо для сдвига сумматоров 
constant SH3:integer:=1;  --# надо для сдвига сумматоров 
constant SH4:integer:=1;  --# надо для сдвига сумматоров 
constant SH5:integer:=1;

type Tcoefs is array(0 to 32) of integer;
--constant coefs:Tcoefs:=(-3,-26,-61,-32,52,26,-85,-10,137,-36,-204,139,286,-358,-436,1007,2047,1007,-436,-358,286,139,-204,-36,137,-10,-85,26,52,-32,-61,-26,-3);
constant coefs:Tcoefs:=(-3,-19,-45,-24,37,18,-62,-8,98,-26,-148,100,206,-259,-315,726,1476,726,-315,-259,206,100,-148,-26,98,-8,-62,18,37,-24,-45,-19,-3);
constant coefs_test:Tcoefs:=(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2047, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

constant MULTSIZE:natural:=Nbit_FILT_COSINE+i_samples'Length;

type Tmuls is array (0 to 32) of std_logic_vector(MULTSIZE-1 downto 0);
signal muls_I:Tmuls;

type Tdelayline is array (0 to 32) of std_logic_vector(i_samples'Length-1 downto 0);
signal delaylineI,delaylineQ:Tdelayline;

type Tsums_1 is array (0 to 16) of std_logic_vector(14 downto 0);
signal sumsI_1:Tsums_1;

type Tsums_2 is array (0 to 8) of std_logic_vector(15 downto 0);
signal sumsI_2:Tsums_2;

type Tsums_3 is array (0 to 4) of std_logic_vector(15 downto 0);
signal sumsI_3:Tsums_3;

type Tsums_4 is array (0 to 2) of std_logic_vector(15 downto 0);
signal sumsI_4:Tsums_4;

type Tsums_5 is array (0 to 1) of std_logic_vector(15 downto 0);
signal sumsI_5:Tsums_5;

signal s_o_sampleI: std_logic_vector(15 downto 0);

type Tunsed_delay is array(0 to 16) of std_logic_vector(LEN-1 downto 0);
signal un_del_I:Tunsed_delay;

begin

process (clk)
begin		
	if rising_edge(clk) then
	    if USE_IT/=1 then
			un_del_I(0)<=i_samples;
			for i in 1 to 16 loop
				un_del_I(i)<=un_del_I(i-1);
			end loop;
		end if;

		delaylineI(0)<=i_samples;
		for i in 1 to 32 loop
			delaylineI(i)<=delaylineI(i-1);
		end loop;

		for i in 0 to 32 loop
			muls_I(i)<=signed(conv_std_logic_vector(coefs(i),Nbit_FILT_COSINE))*signed(delaylineI(i));
		end loop;
		
		for i in 0 to 15 loop
			sumsI_1(i)<=SXT(muls_I(i*2)(MULTSIZE-1-SHM downto MULTSIZE-15-SHM),sumsI_1(16)'Length)+SXT(muls_I(i*2+1)(MULTSIZE-1-SHM downto MULTSIZE-15-SHM),sumsI_1(16)'Length);
		end loop;
		sumsI_1(16)<=SXT(muls_I(32)(MULTSIZE-1-SHM downto MULTSIZE-15-SHM),sumsI_1(16)'Length);

		for i in 0 to 7 loop
			sumsI_2(i)<=SXT(sumsI_1(i*2)(15-SH1 downto 1-SH1),sumsI_2(0)'Length)+SXT(sumsI_1(i*2+1)(15-SH1 downto 1-SH1),sumsI_2(0)'Length);
		end loop;
		sumsI_2(8)<=SXT(sumsI_1(16)(15-SH1 downto 1-SH1),sumsI_2(8)'Length);

		for i in 0 to 3 loop
			sumsI_3(i)<=SXT(sumsI_2(i*2)(15-SH2 downto 0)&EXT("0",SH2-1),16)+SXT(sumsI_2(i*2+1)(15-SH2 downto 0)&EXT("0",SH2-1),16);
		end loop;
		sumsI_3(4)<=SXT(sumsI_2(8)(15-SH2 downto 0)&EXT("0",SH2-1),16);
		for i in 0 to 1 loop
			sumsI_4(i)<=SXT(sumsI_3(i*2)(15-SH3 downto 1-SH3),16)+SXT(sumsI_3(i*2+1)(15-SH3 downto 1-SH3),16);
		end loop;
		sumsI_4(2)<=SXT(sumsI_3(4)(15-SH3 downto 1-SH3),16);
	
		sumsI_5(0)<=SXT(sumsI_4(0)(15-SH4 downto 1-SH4),16)+SXT(sumsI_4(1)(15-SH4 downto 1-SH4),16);
		sumsI_5(1)<=SXT(sumsI_4(2)(15-SH4 downto 1-SH4),16);


		s_o_sampleI<=SXT(sumsI_5(0)(15-SH5 downto 1-SH5),16)+SXT(sumsI_5(1)(15-SH5 downto 1-SH5),16);

		if USE_IT=1 then
			o_sample<=s_o_sampleI(s_o_sampleI'Length-2 downto 0)&"0";
		else
			if LEN<o_sample'Length then
				o_sample<=SXT(un_del_I(16)&EXT("0",o_sample'Length-LEN-1),o_sample'Length);
			else
				o_sample<=un_del_I(16);
			end if;
		end if;
	end if;	--clk
end process;
		 

	
end invsync_ddsfilt;
