library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;


entity scalar_mult is
	generic(
		CONJ_PORT_B:integer:=0  --# Если 1 то bQ будет умножен на (-1)
		);
	port(
		clk : in STD_LOGIC;
		reset : in std_logic;

		ce: in std_logic;

		aI: in std_logic_vector(15 downto 0);
		aQ: in std_logic_vector(15 downto 0);

		bI: in std_logic_vector(15 downto 0);
		bQ: in std_logic_vector(15 downto 0);

		sum_ce: out std_logic;
		sumI_o: out std_logic_vector(31 downto 0);
		sumQ_o: out std_logic_vector(31 downto 0)
		);
end scalar_mult;



architecture scalar_mult of scalar_mult is

constant SHIFTVAL:natural:=log2roundup(InterpolateRate*PILOT_LEN);

--# (aI+jaQ) * (bI+jbQ) = (aI*bI-aQ*bQ) + (aI*bQ + aQ*bI)
--# (aI+jaQ) * (bI-jbQ) = (aI*bI+aQ*bQ) + (aQ*bI - aI*bQ)
signal sum_regI,sum_regQ,mul_regI,mul_regQ:std_logic_vector(31 downto 0);
signal aIbI,aQbQ,aIbQ,aQbI:std_logic_vector(31 downto 0);
signal aIbI_m_aQbQ,aIbQ_p_aQbI,aIbI_p_aQbQ,aQbI_m_aIbQ:std_logic_vector(31 downto 0);
signal ce_w1,ce_w2,ce_w3,ce_w4: std_logic;

begin


process (clk)
begin		
	if rising_edge(clk) then
		ce_w1<=ce;
		ce_w2<=ce_w1;
	    ce_w3<=ce_w2;
		ce_w4<=ce_w3;

		aIbI<=signed(aI)*signed(bI);
		aQbQ<=signed(aQ)*signed(bQ);
		aIbQ<=signed(aI)*signed(bQ);
		aQbI<=signed(aQ)*signed(bI);
		
		aIbI_m_aQbQ<=SXT(aIbI(31 downto 1+SHIFTVAL),32) - SXT(aQbQ(31 downto 1+SHIFTVAL),32);
		aIbQ_p_aQbI<=SXT(aIbQ(31 downto 1+SHIFTVAL),32) + SXT(aQbI(31 downto 1+SHIFTVAL),32);

		aIbI_p_aQbQ<=SXT(aIbI(31 downto 1+SHIFTVAL),32) + SXT(aQbQ(31 downto 1+SHIFTVAL),32);
		aQbI_m_aIbQ<=SXT(aQbI(31 downto 1+SHIFTVAL),32) - SXT(aIbQ(31 downto 1+SHIFTVAL),32);

		if CONJ_PORT_B=0 then
			mul_regI<=aIbI_m_aQbQ;		
			mul_regQ<=aIbQ_p_aQbI;
		else --# CONJ_PORT_B
			mul_regI<=aIbI_p_aQbQ;		
			mul_regQ<=aQbI_m_aIbQ;
		end if; --#CONJ_PORT_B	

		if ce_w3='0' then
			sum_regI<=(others=>'0');
			sum_regQ<=(others=>'0');
			if ce_w4='1' then
				sumI_o<=sum_regI;
				sumQ_o<=sum_regQ;
				sum_ce<='1';
			else
				sum_ce<='0';
			end if;
		else
			sum_ce<='0';
			sum_regI<=sum_regI+mul_regI;
			sum_regQ<=sum_regQ+mul_regQ;
		end if;	

	end if;	--clk
end process;

	
end scalar_mult;
