library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity testLFSR is
	Generic (
	NumberOfInputputBits: natural :=10
	);	
	 port(
	 	 clk : in STD_LOGIC;
	 	 ce: in std_logic;
		 LFSR_Mask : in STD_LOGIC_VECTOR(31 downto 0);
		 datain : in STD_LOGIC_VECTOR(NumberOfInputputBits-1 downto 0);
		 error : out STD_LOGIC
	     );
end testLFSR;



architecture testLFSR of testLFSR is


function BusXor(B:std_logic_vector) return std_logic is
variable R:std_logic;
begin	
	R:='0';
	for i in B'Range Loop
		R:=R xor B(i);
	end loop;
return R;
end function;


signal shift_rg:std_logic_vector(31 downto 0);
signal s_shift_rgM:std_logic_vector(31 downto 0);

begin

testlf: process (clk) is
variable v_error:std_logic_vector(0 to NumberOfInputputBits-1);
variable v_shift_rg,v_shift_rgM:std_logic_vector(31 downto 0);
begin  
	if rising_edge(clk) then
		if ce='1' then
			v_error:=(others=>'0');
			v_shift_rg:=shift_rg;
			for i in 0 to NumberOfInputputBits-1 loop
				v_shift_rg(shift_rg'Length-1 downto 1):=v_shift_rg(shift_rg'Length-2 downto 0);
				v_shift_rg(0):=datain(i);
				v_shift_rgM:=v_shift_rg and LFSR_Mask;
				v_error(i):=datain(i) xor BusXor(s_shift_rgM);
			end loop;
			s_shift_rgM<=v_shift_rgM;
			shift_rg<=v_shift_rg;

			error<=not v_error(0);
		end if; --ce
	end if; --clk
end process;

end testLFSR;
