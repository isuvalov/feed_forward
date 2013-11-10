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


function fliplr(A:std_logic_vector) return std_logic_vector is
variable R:std_logic_vector(A'Range);
begin
  for i in A'Low to A'High loop
	  R(A'High-(i-A'Low)):=A(i);
  end loop; 
  return R;
end function;


signal LFSRDelayLine_w1,PreviusDelayLine_w1:std_logic_vector(31 downto 0):=(others=>'0');
signal ce_w1:std_logic;

signal bigLFSRDelayLine:std_logic_vector(31 downto 0):=(others=>'0');
signal bigLFSRMask:std_logic_vector(31 downto 0):=(others=>'0');

begin

bigLFSRMask<=LFSR_Mask;	


--process (clk) is 
--variable XoredVar:std_logic:='0';
--	begin		
--		if rising_edge(clk) then	
--			ce_w1<=ce;
--		  if reset='1' then
--			  bigLFSRDelayLine<=(others=>'0');			  
--		  elsif ce='1' and ce_w1='0' then		 
--			bigLFSRDelayLine(bigLFSRDelayLine'Length-1 downto 1)<=bigLFSRDelayLine(bigLFSRDelayLine'Length-2 downto 0);						  
--			XoredVar:=BusXor(bigLFSRDelayLine  and LFSR_Mask);  
--			bigLFSRDelayLine(0)<=not XoredVar;			
--			LFSR_Word<=bigLFSRDelayLine;
--		  end if; --ce					
--		end if; --clk
--	end process;







genLFSR: process (clk) is
variable LFSRDelayLine,DelayLineWithMask:std_logic_vector(31 downto 0):=(others=>'0');
begin	   

if rising_edge(clk)	 then
	ce_w1<=ce;
	if reset='1' then
		LFSRDelayLine:=(others=>'0');
		LFSR_Word<=(others=>'0');
	elsif ce='1' and ce_w1='0' then		
	--elsif ce='1' then		
		LFSRDelayLine:=bigLFSRDelayLine;
		iteration : FOR i in 0 to NumberOfOutputBits-1 LOOP				
			--LFSRDelayLine:=bigLFSRDelayLine;
			LFSRDelayLine(LFSRDelayLine'Length-1 downto 1):=LFSRDelayLine(LFSRDelayLine'Length-2 downto 0);			
			LFSRDelayLine(0):=not BusXor(DelayLineWithMask);			
			DelayLineWithMask:=LFSRDelayLine and LFSR_Mask;
			bigLFSRDelayLine(0)<=LFSRDelayLine(0);
			LFSR_Word(i)<=LFSRDelayLine(31);  
		end loop;							
		bigLFSRDelayLine<=LFSRDelayLine;
		
	end if;
end if;
end process;
	

--if rising_edge(clk)	 then
--	ce_w1<=ce;
--	if reset='1' then
--		--LFSRDelayLine:=(others=>'0');
--		LFSR_Word<=(others=>'0');
--		
--		iteration : FOR i in 0 to NumberOfOutputBits-1 LOOP				
--			LFSRDelayLine(LFSRDelayLine'Length-1 downto 1):=LFSRDelayLine(LFSRDelayLine'Length-2 downto 0);			
--			LFSRDelayLine(0):=not BusXor(DelayLineWithMask);
--			DelayLineWithMask:=LFSRDelayLine and LFSR_Mask;
--			--LFSR_Word(i)<=LFSRDelayLine(31);
--		end loop;							
--		
--		
--	elsif ce='1' and ce_w1='0' then		
--		iteration : FOR i in 0 to NumberOfOutputBits-1 LOOP				
--			LFSRDelayLine(LFSRDelayLine'Length-1 downto 1):=LFSRDelayLine(LFSRDelayLine'Length-2 downto 0);			
--			LFSRDelayLine(0):=not BusXor(DelayLineWithMask);
--			DelayLineWithMask:=LFSRDelayLine and LFSR_Mask;
--			LFSR_Word(i)<=LFSRDelayLine(31);
--		end loop;							
--	end if;
--end if;
--end process;


end LFSRgenerator;
