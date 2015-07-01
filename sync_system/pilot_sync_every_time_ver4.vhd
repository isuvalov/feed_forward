library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;

entity pilot_sync_every_time_ver4 is
	generic(
		FILTER_QUICK:integer:=0;  --# use quick IIF, use it for simulation
		SIMULATION:integer:=0;    --# not use IIF, use it for very quick simulation
		PERIOD:integer:=100       --# must be setup!
	);
	port(
		clk : in STD_LOGIC;
		reset : in std_logic;

		realpilot_event: in std_logic; 
		pilot_not_here: out std_logic;		
		
		start_pilotU: out std_logic;
        sync_find: out std_logic
		);
end pilot_sync_every_time_ver4;



architecture pilot_sync_every_time_ver4 of pilot_sync_every_time_ver4 is

constant INTEGRATION_C:integer:=5;
constant DIVC:integer:=InterpolateRate/2;
constant C_LOCK:integer:=InterpolateRate;

constant NEW_PERIOD:integer:=conv_integer(conv_std_logic_vector(PERIOD,log2roundup(PERIOD)+1)&EXT("0",INTEGRATION_C));

signal main_cnt:std_logic_vector(INTEGRATION_C+log2roundup(PERIOD)-1 downto 0);
signal s_start_pilotU:std_logic:='0';

type Tstm is (FINDING,LOCK);
signal stm:Tstm;
signal lockcnt:std_logic_vector(7 downto 0);
signal abscnt:std_logic_vector(log2roundup(PERIOD)-1-log2roundup(C_LOCK) downto 0);
begin

	

process (clk) is 
begin		
	if rising_edge(clk) then
		if reset='1' then
			main_cnt<=conv_std_logic_vector(1000,main_cnt'Length);
		else
			if realpilot_event='1' then
				if unsigned(main_cnt(log2roundup(PERIOD)-log2roundup(DIVC) downto 0))<(PERIOD/(DIVC)) then 
					main_cnt(log2roundup(PERIOD)-log2roundup(DIVC) downto 0)<=conv_std_logic_vector(0,log2roundup(2*PERIOD/(DIVC)));
				else
					main_cnt(log2roundup(PERIOD)-log2roundup(DIVC) downto 0)<=conv_std_logic_vector(2*PERIOD/(DIVC)-1,log2roundup(2*PERIOD/(DIVC)));
				end if;				
			else
				if unsigned(main_cnt)<NEW_PERIOD-1 then
					main_cnt<=main_cnt+1;
				else
					main_cnt<=(others=>'0');
				end if;
			end if;
		end if;

		if main_cnt(log2roundup(PERIOD)-1 downto 0)=PERIOD-1 and s_start_pilotU='0' then
			start_pilotU<='1';
			s_start_pilotU<='1';
		else
			start_pilotU<='0';
			s_start_pilotU<='0';
		end if;

		if signed(main_cnt(log2roundup(PERIOD)-1 downto log2roundup(C_LOCK)))<0 then
			abscnt<=0-main_cnt(log2roundup(PERIOD)-1 downto log2roundup(C_LOCK));
		else
			abscnt<=main_cnt(log2roundup(PERIOD)-1 downto log2roundup(C_LOCK));
		end if;

		if reset='1' then
			stm<=FINDING;
			lockcnt<=(others=>'0');
			sync_find<='0';
		else
			case stm is 
			when FINDING=>
				if realpilot_event='1' then
					if abscnt<=2 then
						lockcnt<=lockcnt+1;
					else
						if unsigned(lockcnt)>0 then
							lockcnt<=lockcnt-1;
						end if;
					end if;
				end if;
				if unsigned(lockcnt)>5 then
					stm<=LOCK;
				end if;
				sync_find<='0';
			when LOCK =>
				if realpilot_event='1' then
					if abscnt<=2 then
					    if unsigned(lockcnt)<10 then
							lockcnt<=lockcnt+1;
						end if;
					else
						if unsigned(lockcnt)>0 then
							lockcnt<=lockcnt-1;
						end if;
					end if;
				end if;
				if unsigned(lockcnt)<3 then
					stm<=FINDING;
				end if;
				sync_find<='1';
			when others=>
			end case;
		end if;

	end if;
end process;

	
end pilot_sync_every_time_ver4;
