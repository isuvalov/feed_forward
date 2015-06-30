library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;


entity bits_ce_manager is
	port(
		clk : in STD_LOGIC;
		pilot : in std_logic;
		i_sampleI: in std_logic_vector(15 downto 0);
		i_sampleQ: in std_logic_vector(15 downto 0);
		o_sampleI: out std_logic_vector(15 downto 0);
		o_sampleQ: out std_logic_vector(15 downto 0);
		i_sample_ce: in std_logic;
		o_sample_ce: out std_logic
		);
end bits_ce_manager;



architecture bits_ce_manager of bits_ce_manager is

signal pilot_a:std_logic_vector((1+1)*InterpolateRate-1-4 downto 0);
signal cnt:std_logic_vector(log2roundup(PILOT_PERIOD)-1 downto 0);	
signal cnt_to:std_logic_vector(log2roundup(GUARD_SAMPLES)-1 downto 0);	


begin

process (clk)
begin		
	if rising_edge(clk) then
		pilot_a<=pilot_a(pilot_a'Length-2 downto 0)&pilot;
		if pilot_a(pilot_a'Length-1)='1' then
			cnt_to<=conv_std_logic_vector(GUARD_SAMPLES-1,cnt_to'Length);
			cnt<=conv_std_logic_vector(PILOT_PERIOD-PILOT_LEN-1,cnt'Length);
			o_sample_ce<='0';
		else --#reset
		    if i_sample_ce='1' then
				o_sampleI<=i_sampleI;
				o_sampleQ<=i_sampleQ;
				if unsigned(cnt_to)>0 then
					cnt<=cnt-1;
					o_sample_ce<='0';
					cnt_to<=cnt_to-1;
				else
					if unsigned(cnt)>0 then
						cnt<=cnt-1;
						o_sample_ce<='1';
					else
						o_sample_ce<='0';
					end if;
				end if;
			else
				o_sample_ce<='0';
			end if;
		end if; --#reset
	end if;	--clk
end process;
		 

	
end bits_ce_manager;
