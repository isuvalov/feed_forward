library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;


--# �������� �������� � ��� ���� ������ �.�. ����� �� ����� ����� ������� ���
--# latency=9
entity rcc_up_filter is
	generic (
		LEN:natural:=2
	);
	port(
		clk : in STD_LOGIC;
		reset : in std_logic;
		i_samplesI: in std_logic_vector(LEN-1 downto 0);
		i_samplesQ: in std_logic_vector(LEN-1 downto 0);
		o_sampleI: out std_logic_vector(15 downto 0);  --# ����� � ��� ���� ������ ���������
		o_sampleQ: out std_logic_vector(15 downto 0)
		);
end rcc_up_filter;



architecture rcc_up_filter of rcc_up_filter is

constant Nbit_FILT_COSINE:natural:=12;
constant SH2:integer:=1;  --# ���� ��� ������ ���������� 
constant SH3:integer:=1;  --# ���� ��� ������ ���������� 
constant SH4:integer:=1;  --# ���� ��� ������ ���������� 
constant SH5:integer:=1;

type Tcoefs is array(0 to 32) of integer;
constant coefs:Tcoefs:=(50, 0, -70, -109, -71, 40, 161, 198, 89, -138, -356, -386, -102, 489, 1216, 1815, 2047, 1815, 1216, 489, -102, -386, -356, -138, 89, 198, 161, 40, -71, -109, -70, 0, 50);

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

begin

process (clk)
begin		
	if rising_edge(clk) then
		delaylineI(0)<=i_samplesI;
		delaylineQ(0)<=i_samplesQ;
		for i in 1 to 32 loop
			delaylineI(i)<=delaylineI(i-1);
			delaylineQ(i)<=delaylineQ(i-1);
		end loop;

		for i in 0 to 32 loop
			muls_I(i)<=signed(conv_std_logic_vector(coefs(i),Nbit_FILT_COSINE))*signed(delaylineI(i));
			muls_Q(i)<=signed(conv_std_logic_vector(coefs(i),Nbit_FILT_COSINE))*signed(delaylineQ(i));
		end loop;
		
		for i in 0 to 15 loop
			sumsI_1(i)<=SXT(muls_I(i*2),sumsI_1(16)'Length)+SXT(muls_I(i*2+1),sumsI_1(16)'Length);
			sumsQ_1(i)<=SXT(muls_Q(i*2),sumsI_1(16)'Length)+SXT(muls_Q(i*2+1),sumsI_1(16)'Length);
		end loop;
		sumsI_1(16)<=SXT(muls_I(32),sumsI_1(16)'Length);
		sumsQ_1(16)<=SXT(muls_Q(32),sumsQ_1(16)'Length);


		for i in 0 to 7 loop
			sumsI_2(i)<=SXT(sumsI_1(i*2),16)+SXT(sumsI_1(i*2+1),16);
			sumsQ_2(i)<=SXT(sumsQ_1(i*2),16)+SXT(sumsQ_1(i*2+1),16);
		end loop;
		sumsI_2(8)<=SXT(sumsI_1(16),sumsI_2(8)'Length);
		sumsQ_2(8)<=SXT(sumsQ_1(16),sumsI_2(8)'Length);


		for i in 0 to 3 loop
			sumsI_3(i)<=SXT(sumsI_2(i*2)(15-SH2 downto 1-SH2),16)+SXT(sumsI_2(i*2+1)(15-SH2 downto 1-SH2),16);
			sumsQ_3(i)<=SXT(sumsQ_2(i*2)(15-SH2 downto 1-SH2),16)+SXT(sumsQ_2(i*2+1)(15-SH2 downto 1-SH2),16);
		end loop;
		sumsI_3(4)<=SXT(sumsI_2(8)(15-SH2 downto 1-SH2),16);
		sumsQ_3(4)<=SXT(sumsQ_2(8)(15-SH2 downto 1-SH2),16);

		for i in 0 to 1 loop
			sumsI_4(i)<=SXT(sumsI_3(i*2)(15-SH3 downto 1-SH3),16)+SXT(sumsI_3(i*2+1)(15-SH3 downto 1-SH3),16);
			sumsQ_4(i)<=SXT(sumsQ_3(i*2)(15-SH3 downto 1-SH3),16)+SXT(sumsQ_3(i*2+1)(15-SH3 downto 1-SH3),16);
		end loop;
		sumsI_4(2)<=SXT(sumsI_3(4)(15-SH3 downto 1-SH3),16);
		sumsQ_4(2)<=SXT(sumsQ_3(4)(15-SH3 downto 1-SH3),16);
		
		sumsI_5(0)<=SXT(sumsI_4(0)(15-SH4 downto 1-SH4),16)+SXT(sumsI_4(1)(15-SH4 downto 1-SH4),16);
		sumsQ_5(0)<=SXT(sumsQ_4(0)(15-SH4 downto 1-SH4),16)+SXT(sumsQ_4(1)(15-SH4 downto 1-SH4),16);
		sumsI_5(1)<=SXT(sumsI_4(2)(15-SH4 downto 1-SH4),16);
		sumsQ_5(1)<=SXT(sumsQ_4(2)(15-SH4 downto 1-SH4),16);


		s_o_sampleI<=SXT(sumsI_5(0)(15-SH5 downto 1-SH5),16)+SXT(sumsI_5(1)(15 downto 1-SH5),16);
		s_o_sampleQ<=SXT(sumsQ_5(0)(15-SH5 downto 1-SH5),16)+SXT(sumsQ_5(1)(15 downto 1-SH5),16);

		o_sampleI<=s_o_sampleI;
		o_sampleQ<=s_o_sampleQ;
	end if;	--clk
end process;
		 

	
end rcc_up_filter;
