library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity LFSRgenerator is
	Generic (
	NumberOfOutputBits: natural :=7
	);	
	 port(
		 clk : in STD_LOGIC;
		 ce : in STD_LOGIC;
		 reset : in std_logic;
		 LFSR_Mask : in STD_LOGIC_VECTOR(31 downto 0);
		 LFSR_Word : out STD_LOGIC_VECTOR(NumberOfOutputBits-1 downto 0)
	     );
end LFSRgenerator;

architecture LFSRgenerator of LFSRgenerator is

function BusXor(B:std_logic_vector) return std_logic is
variable R:std_logic;
begin	
	R:='0';
	for i in B'Range Loop
		R:=R xor B(i);
	end loop;
return R;
end function;


signal LFSRDelayLine,LFSRDelayLine_w1,PreviusDelayLine_w1:std_logic_vector(31 downto 0):=(others=>'0');

begin

genLFSR: process (clk) is
variable DelayLineWithMask:std_logic_vector(31 downto 0):=(others=>'0');
variable vLFSRDelayLine:std_logic_vector(31 downto 0):=(others=>'0');
begin	   
if rising_edge(clk)	 then
	if reset='1' then
		LFSRDelayLine<=(others=>'0');
		LFSR_Word<=(others=>'0');
	elsif ce='1'  then		
		vLFSRDelayLine:=LFSRDelayLine;
		iteration : FOR i in 0 to NumberOfOutputBits-1 LOOP				
			vLFSRDelayLine(LFSRDelayLine'Length-1 downto 1):=vLFSRDelayLine(LFSRDelayLine'Length-2 downto 0);			
			vLFSRDelayLine(0):=not BusXor(DelayLineWithMask);
			DelayLineWithMask:=vLFSRDelayLine and LFSR_Mask;
			LFSR_Word(i)<=vLFSRDelayLine(31);
		end loop;							
		LFSRDelayLine<=vLFSRDelayLine;
	end if;
end if;
end process; 

end LFSRgenerator;
