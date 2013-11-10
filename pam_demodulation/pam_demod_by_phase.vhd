library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;


entity pam_demod_by_phase is
	port(
		clk : in STD_LOGIC;
		i_ce : in std_logic;		
		i_phase: in std_logic_vector(9 downto 0);

		bit_value: out std_logic_vector(1 downto 0);
		out_ce: out std_logic
		);
end pam_demod_by_phase;



architecture pam_demod_by_phase of pam_demod_by_phase is

--# constant mem:Tmem:=((1,0),(0,1),(-1,0),(0,-1));
--# 0,90,180,270 = 0,90,+-180,-90
--# (-45..45),(135..45),(135..-135),(-135..-45)   = (-1/4..1/4),(3/4..1/4),(3/4..-3/4),(-3/4..-1/4)

--# i_phase=-2**8*pi/2..+2**8*pi/2=-402..402  and this is equal  -PI..+PI

constant  MAX_VAL:integer:=402; --# 2**8*pi/2

signal test:std_logic;

begin

process (clk) is
begin		
	if rising_edge(clk) then
		if i_ce='1' then
			if signed(i_phase)>-(MAX_VAL/4) and signed(i_phase)<(MAX_VAL/4) then
				bit_value<="00";
				test<='0';
			elsif signed(i_phase)>=(MAX_VAL/4) and signed(i_phase)<(3*(MAX_VAL/4)) then
				bit_value<="01";
				test<='1';
			elsif signed(i_phase)<=-(3*(MAX_VAL/4)) or signed(i_phase)>=3*(MAX_VAL/4) then
				bit_value<="10";
				test<='0';
			elsif signed(i_phase)>-3*(MAX_VAL/4) and signed(i_phase)<=-MAX_VAL/4 then
				bit_value<="11";
				test<='0';
			end if;
			out_ce<='1';
		else
			out_ce<='0';
			test<='0';
		end if; --#i_Ce
	end if;
end process;


end pam_demod_by_phase;


