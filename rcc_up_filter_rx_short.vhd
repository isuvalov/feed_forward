library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;


--# выходные значения в два раза меньше т.е. можно не брать самый старший бит
entity rcc_up_filter_rx_short is
	generic (
		USE_IT:integer:=1;
		LEN:natural:=2
	);
	port(
		clk : in STD_LOGIC;
		reset : in std_logic;
		i_samplesI: in std_logic_vector(LEN-1 downto 0);
		i_samplesQ: in std_logic_vector(LEN-1 downto 0);
		o_sampleI: out std_logic_vector(15 downto 0);  --# выход в два раза меньше максимума
		o_sampleQ: out std_logic_vector(15 downto 0)
		);
end rcc_up_filter_rx_short;



architecture rcc_up_filter_rx_short of rcc_up_filter_rx_short is

--constant Nfilt:natural:=5;
constant Nfilt:natural:=4;

constant Nbit_FILT_COSINE:natural:=12;
constant SH2:integer:=0;  --# надо для сдвига сумматоров 
constant SH3:integer:=1;  --# надо для сдвига сумматоров 
constant SH4:integer:=2;  --# надо для сдвига сумматоров 
constant SH5:integer:=0;

type Tcoefs is array(0 to Nfilt-1) of integer;
--# R=0.2
--# constant coefs:Tcoefs:=(50, 0, -70, -109, -71, 40, 161, 198, 89, -138, -356, -386, -102, 489, 1216, 1815, 2047, 1815, 1216, 489, -102, -386, -356, -138, 89, 198, 161, 40, -71, -109, -70, 0, 50);
--# R=1
--constant coefs:Tcoefs:=(-32,-26,0,35,58,49,0,-75,-136,-129,0,276,682,1158,1608,1930,2047,1930,1608,1158,682,276,0,-129,-136,-75,0,49,58,35,0,-26,-32);
--constant coefs_test:Tcoefs:=(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2047, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

--# R=0.2 short
--constant coefs:Tcoefs:=(1228, 1817, 2048, 1817, 1228);
--constant coefs:Tcoefs:=(1215, 1812, 2048, 1812, 1215); -- simple filter
--constant coefs_test:Tcoefs:=(0, 0, 2047, 0, 0);

--# For InterpolateRate=4
--# norm
--constant coefs:Tcoefs:=(367,         1069,        1804,        2025,        1804,        1069,         367);
--constant coefs_test:Tcoefs:=(367,         1069,        1804,        2025,        1804,        1069,         367);


constant coefs:Tcoefs:=(559, 2047, 2047, 1559);
constant coefs_test:Tcoefs:=(559, 2047, 2047, 1559);



--# For InterpolateRate=4 veryshort
--constant coefs:Tcoefs:=(0, 1284, 2048, 1284, 0);
--constant coefs_test:Tcoefs:=(0, 1284, 2048, 1284, 0);

--# For InterpolateRate=5
--# constant coefs:Tcoefs:=(184,         612,        1232,        1804,        2040,        1804,        1232,         612,         184);
--# constant coefs_test:Tcoefs:=(184,         612,        1232,        1804,        2040,        1804,        1232,         612,         184);

constant MULTSIZE:natural:=Nbit_FILT_COSINE+i_samplesI'Length;

type Tmuls is array (0 to 32) of std_logic_vector(Nbit_FILT_COSINE+i_samplesI'Length-1 downto 0);
signal muls_I,muls_Q:Tmuls;

type Tdelayline is array (0 to 32) of std_logic_vector(i_samplesI'Length-1 downto 0);
signal delaylineI,delaylineQ:Tdelayline;

type Tsums_1 is array (0 to 16) of std_logic_vector(14 downto 0);
signal sumsI_1,sumsQ_1:Tsums_1;

type Tsums_2 is array (0 to 8) of std_logic_vector(15 downto 0);
signal sumsI_2,sumsQ_2:Tsums_2;

type Tsums_3 is array (0 to 4) of std_logic_vector(15 downto 0);
signal sumsI_3,sumsQ_3:Tsums_3;

type Tsums_4 is array (0 to 2) of std_logic_vector(15 downto 0);
signal sumsI_4,sumsQ_4:Tsums_4;

type Tsums_5 is array (0 to 1) of std_logic_vector(15 downto 0);
signal sumsI_5,sumsQ_5:Tsums_5;

signal s_o_sampleI,s_o_sampleQ: std_logic_vector(15 downto 0);

type Tunsed_delay is array(0 to 16) of std_logic_vector(LEN-1 downto 0);
signal un_del_I,un_del_Q:Tunsed_delay;

type Temu_delay is array(0 to 32-Nfilt) of std_logic_vector(15 downto 0);
signal emuI_delay,emuQ_delay:Temu_delay;


begin

process (clk)
begin		
	if rising_edge(clk) then
	    if USE_IT/=1 then
			un_del_I(0)<=i_samplesI;
			un_del_Q(0)<=i_samplesQ;
			for i in 1 to 16 loop
				un_del_I(i)<=un_del_I(i-1);
				un_del_Q(i)<=un_del_Q(i-1);
			end loop;
		end if;

		emuI_delay(0)<=s_o_sampleI;
		emuQ_delay(0)<=s_o_sampleQ;

		for i in 1 to 32-Nfilt-2 loop
			emuI_delay(i)<=emuI_delay(i-1);
			emuQ_delay(i)<=emuQ_delay(i-1);			
		end loop;


		delaylineI(0)<=i_samplesI;
		delaylineQ(0)<=i_samplesQ;
		for i in 1 to Nfilt-1 loop
			delaylineI(i)<=delaylineI(i-1);
			delaylineQ(i)<=delaylineQ(i-1);
		end loop;

		for i in 0 to Nfilt-1 loop
			if GLOBAL_DEBUG=1 then
				muls_I(i)<=signed(conv_std_logic_vector(coefs_test(i),Nbit_FILT_COSINE))*signed(delaylineI(i));
				muls_Q(i)<=signed(conv_std_logic_vector(coefs_test(i),Nbit_FILT_COSINE))*signed(delaylineQ(i));
			else
				muls_I(i)<=signed(conv_std_logic_vector(coefs(i),Nbit_FILT_COSINE))*signed(delaylineI(i));
				muls_Q(i)<=signed(conv_std_logic_vector(coefs(i),Nbit_FILT_COSINE))*signed(delaylineQ(i));
			end if;
		end loop;
		
		for i in 0 to 1 loop
			sumsI_1(i)<=SXT(muls_I(i*2)(MULTSIZE-1 downto MULTSIZE-15),sumsI_1(0)'Length)+SXT(muls_I(i*2+1)(MULTSIZE-1 downto MULTSIZE-15),sumsI_1(0)'Length);
			sumsQ_1(i)<=SXT(muls_Q(i*2)(MULTSIZE-1 downto MULTSIZE-15),sumsI_1(0)'Length)+SXT(muls_Q(i*2+1)(MULTSIZE-1 downto MULTSIZE-15),sumsI_1(0)'Length);
		end loop;


		sumsI_2(0)<=SXT(sumsI_1(0)&EXT("0",SH4),16)+SXT(sumsI_1(1)&EXT("0",SH4),16);
		sumsQ_2(0)<=SXT(sumsQ_1(0)&EXT("0",SH4),16)+SXT(sumsQ_1(1)&EXT("0",SH4),16);


		s_o_sampleI<=SXT(sumsI_2(0)(15-SH5 downto 1-SH5),16);
		s_o_sampleQ<=SXT(sumsQ_2(0)(15-SH5 downto 1-SH5),16);

		if USE_IT=1 then
--            if GLOBAL_DEBUG=1 then
--				o_sampleI<=SXT(s_o_sampleI(s_o_sampleI'Length-1-4 downto 0),o_sampleI'Length);
--				o_sampleQ<=SXT(s_o_sampleQ(s_o_sampleI'Length-1-4 downto 0),o_sampleI'Length);

			o_sampleI<=emuI_delay(32-Nfilt-1-11);
			o_sampleQ<=emuQ_delay(32-Nfilt-1-11);


--			else
--				o_sampleI<=s_o_sampleI;
--				o_sampleQ<=s_o_sampleQ;
--			end if;
		else
			if LEN<o_sampleI'Length then
				o_sampleI<=SXT(un_del_I(16)&EXT("0",o_sampleI'Length-LEN-1),o_sampleI'Length);
				o_sampleQ<=SXT(un_del_Q(16)&EXT("0",o_sampleI'Length-LEN-1),o_sampleI'Length);
			else
				o_sampleI<=un_del_I(16);
				o_sampleQ<=un_del_Q(16);
			end if;
		end if;
	end if;	--clk
end process;
		 

	
end rcc_up_filter_rx_short;
