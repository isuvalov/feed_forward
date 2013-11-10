library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity testLFSR is
	 port(
	 	 clk : in STD_LOGIC;
	 	 ce: in std_logic;
		 LFSR_Mask : in STD_LOGIC_VECTOR(31 downto 0);
		 datain : in STD_LOGIC;
		 error : out STD_LOGIC
	     );
end testLFSR;



architecture testLFSR of testLFSR is

function fliplr(A:std_logic_vector) return std_logic_vector is
variable R:std_logic_vector(A'Range);
begin
  for i in A'Low to A'High loop
	  R(A'High-(i-A'Low)):=A(i);
  end loop; 
  return R;
end function;


function BusXor(B:std_logic_vector) return std_logic is
variable R:std_logic;
begin	
	R:='0';
	for i in B'Range Loop
		R:=R xor B(i);
	end loop;
return R;
end function;

--constant Mask:std_logic_vector(31 downto 0):=x"00600000";
constant Mask:std_logic_vector(31 downto 0):=x"00000003";

signal shift_rg:std_logic_vector(31 downto 0);
signal test_bit:std_logic;
signal bits:std_logic_vector(0 downto 0);
signal FlipMask:std_logic_vector(31 downto 0);

begin
--FlipMask<=fliplr(Mask);

test_bit<=datain;
testlf: process (clk) is
begin  
	if rising_edge(clk) then
		if ce='1' then
			shift_rg(shift_rg'Length-1 downto 1)<=shift_rg(shift_rg'Length-2 downto 0);
			shift_rg(0)<=test_bit;
			error<=not(test_bit xor BusXor(shift_rg and LFSR_Mask ));
		end if; --ce
	end if; --clk
end process;


end testLFSR;
