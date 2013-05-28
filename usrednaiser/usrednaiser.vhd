library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library work;
use work.feedf_consts_pack.all;

entity usrednaiser is
    Port (clk: in std_logic;
		  reset: in std_logic;
		  input_event : in std_logic;
		  data_ce: in std_logic;
		  output_event: out std_logic
	);
end usrednaiser;

architecture usrednaiser of usrednaiser is

signal filtered_1w,reg,cnt,filtered,filtered2b:std_logic_vector(log2roundup(PERIOD_OF_PILOT)+2-1 downto 0);
signal event,filtered_ce:std_logic;

signal cnt2:std_logic_vector(log2roundup(PERIOD_OF_PILOT)+1-1 downto 0);


begin

process (clk) is
begin		
	if rising_edge(clk) then
	filtered_1w<=filtered;
	if reset='1' then
		cnt<=(others=>'0');
	else --# reset
		if data_ce='1' then
			if unsigned(cnt)<2*PERIOD_OF_PILOT-1 then
				cnt<=cnt+1;
			else
				cnt<=(others=>'0');
			end if;
		end if; --# data_ce
	end if; --# reset
	
	if unsigned(cnt)>PERIOD_OF_PILOT/2 and unsigned(cnt)<3*PERIOD_OF_PILOT/2 then
		event<=input_event;
	else
		event<='0';
	end if;

	if data_ce='1' then
		if cnt=filtered_1w then
			cnt2<=(others=>'0');
			output_event<='1';
		else
			if unsigned(cnt2)<PERIOD_OF_PILOT-1 then
				cnt2<=cnt2+1;
				output_event<='0';
			else
				cnt2<=(others=>'0');
				output_event<='1';
			end if;
		end if;
	end if;

	if input_event='1' then		
		reg<=cnt;
	end if; --# input_event

	end if;
end process;


bih_intgr_inst: entity work.bih_filter_integrator
	generic map(
		ALPHA_NUM=>12,  --# коэффициент интегрирования, чем он больше тем большую историю храним
		SCALE_FACTOR=>9,  --# маштаб - чем он больше тем меньше значение на выходе
		WIDTH=>reg'Length
	)
	port map(
		clk =>clk,
		
		ce => event,
		sample =>reg, --# this is unsigned value!!!

		filtered=>filtered,
		ce_out =>filtered_ce
	);


--bih_intgr_inst2: entity work.bih_filter_integrator
--	generic map(
--		ALPHA_NUM=>4,  --# коэффициент интегрирования, чем он больше тем большую историю храним
--		SCALE_FACTOR=>3,  --# маштаб - чем он больше тем меньше значение на выходе
--		WIDTH=>reg'Length
--	)
--	port map(
--		clk =>clk,
--		
--		ce => event,
--		sample =>reg, --# this is unsigned value!!!
--
--		filtered=>filtered2b,
--		ce_out =>open
--	);



end usrednaiser;

