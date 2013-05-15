library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;

entity delayer is
	generic(
		DELAY_LEN:natural:=10000
	);
	port(
		clk : in STD_LOGIC;
		reset : in std_logic;

		i_sampleI: in std_logic_vector(15 downto 0);
		i_sampleQ: in std_logic_vector(15 downto 0);

		o_sampleI: out std_logic_vector(15 downto 0);
		o_sampleQ: out std_logic_vector(15 downto 0)
		);
end delayer;



architecture delayer of delayer is

type Tdelayline is array (0 to DELAY_LEN-1) of std_logic_vector(i_sampleI'Length-1 downto 0);
signal delaylineI,delaylineQ:Tdelayline:=(others=>(others=>'0'));

signal p_wr:std_logic_vector(log2roundup(DELAY_LEN)-1 downto 0):=(others=>'0');
signal p_rd:std_logic_vector(log2roundup(DELAY_LEN)-1 downto 0):=conv_std_logic_vector(DELAY_LEN-1,p_wr'Length);


begin

		 

process (clk) is
begin		
	if rising_edge(clk) then
		if reset='1' then
			p_wr<=(others=>'0');
			p_rd<=conv_std_logic_vector(1,p_rd'Length);
		else
			if unsigned(p_rd)<DELAY_LEN-1 then
				p_rd<=p_rd+1;
			else
				p_rd<=(others=>'0');
			end if;
			if unsigned(p_wr)<DELAY_LEN-1 then
				p_wr<=p_wr+1;
			else
				p_wr<=(others=>'0');
			end if;
		end if;
	end if;
end process;


process (clk) is
begin		
	if rising_edge(clk) then
		delaylineI(conv_integer(p_wr))<=i_sampleI;
		o_sampleI<=delaylineI(conv_integer(p_rd));
	end if;
end process;

process (clk) is
begin		
	if rising_edge(clk) then
		delaylineQ(conv_integer(p_wr))<=i_sampleQ;
		o_sampleQ<=delaylineQ(conv_integer(p_rd));
	end if;
end process;

	
end delayer;
