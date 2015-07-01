library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;


entity complex_mult_qr is
	generic (
		SHIFT_MUL:integer:=0;
		CONJUGATION:std_logic:='1' --# умножение на сопряженное число, если '1' - то сопрягать
	);
	port(
		clk : in STD_LOGIC;
		load : in STD_LOGIC;
		init_I: in std_logic_vector(15 downto 0);
		init_Q: in std_logic_vector(15 downto 0);
	
		i_ce : in std_logic;
		A_I: in std_logic_vector(15 downto 0);
		B_Q: in std_logic_vector(15 downto 0);

		C_I: in std_logic_vector(15 downto 0);
		D_Q: in std_logic_vector(15 downto 0);


		o_I: out std_logic_vector(15 downto 0);
		o_Q: out std_logic_vector(15 downto 0);
		out_ce: out std_logic
		);
end complex_mult_qr;



architecture complex_mult_qr of complex_mult_qr is

--#       (A+jB)*(C+jD)=(AC-BD)+j(AD+BC)
--# conj: (A+jB)*(C-jD)=(AC+BD)+j(BC-AD)

constant SHIFT_MUL0:integer:=SHIFT_MUL;
signal A_I_1w,B_Q_1w,A_I_2w,B_Q_2w:std_logic_vector(15 downto 0);

signal AC,AD,BC,BD:std_logic_vector(31 downto 0);
signal ACmBD,ADpBC,ACpBD,BCmAD:std_logic_vector(16 downto 0);
signal ce_1w,ce_2w:std_logic;

begin


с01: if CONJUGATION='0' generate
	ACmBD<=SXT(AC(AC'Length-1-SHIFT_MUL0 downto AC'Length-16-SHIFT_MUL0),17)-SXT(BD(BD'Length-1-SHIFT_MUL0 downto BD'Length-16-SHIFT_MUL0),17);
	ADpBC<=SXT(AD(AD'Length-1-SHIFT_MUL0 downto AD'Length-16-SHIFT_MUL0),17)+SXT(BC(BC'Length-1-SHIFT_MUL0 downto BC'Length-16-SHIFT_MUL0),17);
	o_I<=ACmBD(ACmBD'Length-1 downto ACmBD'Length-o_I'Length);
	o_Q<=ADpBC(ACmBD'Length-1 downto ACmBD'Length-o_I'Length);
end generate;
с02: if CONJUGATION='1' generate
	ACpBD<=SXT(AC(AC'Length-1-SHIFT_MUL downto AC'Length-16-SHIFT_MUL),17)+SXT(BD(BD'Length-1-SHIFT_MUL downto BD'Length-16-SHIFT_MUL),17);
	BCmAD<=SXT(BC(BC'Length-1-SHIFT_MUL downto BC'Length-16-SHIFT_MUL),17)-SXT(AD(AD'Length-1-SHIFT_MUL downto AD'Length-16-SHIFT_MUL),17);
	o_I<=ACpBD(ACmBD'Length-1 downto ACmBD'Length-o_I'Length);
	o_Q<=BCmAD(ACmBD'Length-1 downto ACmBD'Length-o_I'Length);
end generate;



process (clk) is
begin		
	if rising_edge(clk) then
		ce_1w<=i_ce;
		ce_2w<=ce_1w;


		A_I_2w<=A_I_1w;
		B_Q_2w<=B_Q_1w;

		if load='1' then
			if CONJUGATION='0' then
				AC<=init_I&x"0000";
				BD<=(others=>'0');
				AD<=init_Q&x"0000";
				BC<=(others=>'0');
			else
				AC<=init_I&x"0000";
				BD<=(others=>'0');
				AD<=(others=>'0');
				BC<=init_Q&x"0000";
			end if;
		elsif i_ce='1' then
			A_I_1w<=A_I;
	        B_Q_1w<=B_Q;
			AC<=signed(A_I)*signed(C_I);
			AD<=signed(A_I)*signed(D_Q);
			BC<=signed(B_Q)*signed(C_I);
			BD<=signed(B_Q)*signed(D_Q);
		end if;
--		if ce_1w='1' then
--		end if;
        out_ce<=i_ce;
	end if;
end process;


end complex_mult_qr;

