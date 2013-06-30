library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;


entity complex_mult is
	generic (
		CONJUGATION:std_logic:='1' --# умножение на сопряженное число, если '1' - то сопрягать
	);
	port(
		clk : in STD_LOGIC;
		i_ce : in std_logic;
		A_I: in std_logic_vector(15 downto 0);
		B_Q: in std_logic_vector(15 downto 0);

		C_I: in std_logic_vector(15 downto 0);
		D_Q: in std_logic_vector(15 downto 0);


		o_I: out std_logic_vector(15 downto 0);
		o_Q: out std_logic_vector(15 downto 0);
		out_ce: out std_logic
		);
end complex_mult;



architecture complex_mult of complex_mult is

--#       (A+jB)*(C+jD)=(AC-BD)+j(AD+BC)
--# conj: (A+jB)*(C-jD)=(AC+BD)+j(BC-AD)

signal AC,AD,BC,BD:std_logic_vector(31 downto 0);
signal ACmBD,ADpBC,ACpBD,BCmAD:std_logic_vector(16 downto 0);
signal ce_1w,ce_2w:std_logic;

begin



process (clk) is
begin		
	if rising_edge(clk) then
		ce_1w<=i_ce;
		ce_2w<=ce_1w;
		if i_ce='1' then
			AC<=signed(A_I)*signed(C_I);
			AD<=signed(A_I)*signed(D_Q);
			BC<=signed(B_Q)*signed(C_I);
			BD<=signed(B_Q)*signed(D_Q);
		end if;
		if ce_1w='1' then
			if CONJUGATION='0' then
				ACmBD<=SXT(AC(AC'Length-1 downto AC'Length-16),17)-SXT(BD(BD'Length-1 downto BD'Length-16),17);
				ADpBC<=SXT(AD(AD'Length-1 downto AD'Length-16),17)+SXT(BC(BC'Length-1 downto BC'Length-16),17);
		    else
				ACpBD<=SXT(AC(AC'Length-1 downto AC'Length-16),17)+SXT(BD(BD'Length-1 downto BD'Length-16),17);
				BCmAD<=SXT(BC(BC'Length-1 downto BC'Length-16),17)-SXT(AD(AD'Length-1 downto AD'Length-16),17);
			end if;
		end if;

		if ce_2w='1' then
			if CONJUGATION='0' then
				o_I<=ACmBD(ACmBD'Length-1 downto ACmBD'Length-o_I'Length);
				o_Q<=ADpBC(ACmBD'Length-1 downto ACmBD'Length-o_I'Length);
			else
				o_I<=ACpBD(ACmBD'Length-1 downto ACmBD'Length-o_I'Length);
				o_Q<=BCmAD(ACmBD'Length-1 downto ACmBD'Length-o_I'Length);
			end if;
		end if;
        out_ce<=ce_2w;
	end if;
end process;


end complex_mult;

