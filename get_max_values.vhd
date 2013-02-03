library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;


entity get_max_values is
	port(
		clk : in STD_LOGIC;
		reset : in std_logic;
		pilot_start: in std_logic; --# он должен быть над первым i_ce
		i_ce : in std_logic;		
		i_samplesI: in std_logic_vector(15 downto 0);
		i_samplesQ: in std_logic_vector(15 downto 0);
		max_ce: out std_logic;
		maxIQ:  out std_logic_vector(15 downto 0); --#max(I,Q)
		maxI: out std_logic_vector(15 downto 0);
		maxQ: out std_logic_vector(15 downto 0)
		);
end get_max_values;



architecture get_max_values of get_max_values is


type Tpwr_stm is (WAITING,FIRST_WR,INCR,FIN_FIND);
signal pwr_stm:Tpwr_stm;

signal s_maxI,s_maxQ,s_maxIQ: std_logic_vector(15 downto 0);
signal abs_samplesI: std_logic_vector(15 downto 0);
signal abs_samplesQ: std_logic_vector(15 downto 0);


signal i_ce_1w,s_max_ce:std_logic;
signal p_wr:std_logic_vector(log2roundup(PILOT_LEN*InterpolateRate)-1 downto 0);

begin

find_max:process (clk)
begin		
	if rising_edge(clk) then
		if i_ce='1' then
			if signed(i_samplesI)<0 then
				abs_samplesI<=0-i_samplesI;
			else
				abs_samplesI<=i_samplesI;
			end if;

			if signed(i_samplesQ)<0 then
				abs_samplesQ<=0-i_samplesQ;
			else
				abs_samplesQ<=i_samplesQ;
			end if;
		end if;
		i_ce_1w<=i_ce;
	end if;
end process;


fnd_max:process (clk)
begin		
	if rising_edge(clk) then

		if reset='1' then
			pwr_stm<=WAITING;
		else
			case pwr_stm is 
			when WAITING=>
				if pilot_start='1' then					
					pwr_stm<=INCR;
				end if;
				p_wr<=(others=>'0');
				s_maxI<=(others=>'0');
				s_maxQ<=(others=>'0');
                s_max_ce<='0';
				when INCR=>				
		    		if i_ce_1w='1' then
						if unsigned(p_wr)<PILOT_LEN*InterpolateRate-1 then
							p_wr<=p_wr+1;
							if unsigned(abs_samplesI)>unsigned(s_maxI) then
								s_maxI<=abs_samplesI;
							end if;
							if unsigned(abs_samplesQ)>unsigned(s_maxQ) then
								s_maxQ<=abs_samplesQ;
							end if;
						else
							pwr_stm<=FIN_FIND;
						end if;
						
					end if;
				when FIN_FIND=>
					if unsigned(s_maxI)>unsigned(s_maxQ) then
						s_maxIQ<=s_maxI;
					else
						s_maxIQ<=s_maxQ;
					end if;
					s_max_ce<='1';
					pwr_stm<=WAITING;
			when others=>
			end case;
		end if;
        max_ce<=s_max_ce;
		maxIQ<=s_maxIQ;
		maxI<=s_maxI;
		maxQ<=s_maxQ;
	end if;	--clk
end process;
		 

end get_max_values;

