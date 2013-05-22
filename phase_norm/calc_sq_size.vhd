library IEEE;
use IEEE.STD_LOGIC_1164.all;   
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.std_logic_arith.all;

--# y(n) = x(n) - x(n-1) + R * y(n-1)
--# "R" 0.9 .. 1
--# для -3dB: R = 1 - (pi*2 * frequency /samplerate)

--# может более привычный вид 
--# 1-st Order Filter of the Form:
--# y(n)=b0*x(n)+b1*x(n-1)+a1*y(n-1)

entity calc_sq_size is
	port(
		clk : in std_logic;
		reset : in std_logic;
		ce : in std_logic;

		sampleI : in std_logic_vector(15 downto 0);
		sampleQ : in std_logic_vector(15 downto 0);

		size_o : out std_logic_vector(15 downto 0);
		ce_out : out std_logic
	);
end calc_sq_size;

architecture calc_sq_size of calc_sq_size is

component sqrt32to16_altera
	PORT
	(
		aclr		: IN STD_LOGIC ;
		clk		: IN STD_LOGIC ;
		ena		: IN STD_LOGIC ;
		radical		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		q		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
		remainder		: OUT STD_LOGIC_VECTOR (16 DOWNTO 0)
	);
end component;

constant SQRT_LATENCY:natural:=16;
signal sqI,sqQ,sqIsqQ : std_logic_vector(2*sampleI'Length-1 downto 0):=(others=>'0');

signal slrr:std_logic_vector(SQRT_LATENCY downto 0);

begin




process (clk) is
begin
	if rising_edge(clk) then
		if ce='1' then
			sqI<=signed(sampleI)*signed(sampleI);
			sqQ<=signed(sampleQ)*signed(sampleQ);
			slrr<=(others=>'0',0=>'1');
		else
			slrr<=slrr(slrr'Length-2 downto 0)&'0';
		end if;
		sqIsqQ<=sqI+sqQ;
		ce_out<=slrr(slrr'Length-1);
	end if;
end process;


sqrt32to16_altera_inst : sqrt32to16_altera PORT MAP (
		aclr	 => reset,
		clk	 => clk,
		ena	 => '1',
		radical	 => sqIsqQ,
		q	 => size_o,
		remainder	 => open
	);


end calc_sq_size;
	