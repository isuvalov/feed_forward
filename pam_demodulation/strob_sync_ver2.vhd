library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;

entity strob_sync_ver2 is
	generic(
		PERIOD:natural:=4
	);
	port(
		clk : in STD_LOGIC;
		reset : in std_logic;

		realpilot_event: in std_logic; 
		
		
		start_pilotU: out std_logic;
        sync_find: out std_logic
		);
end strob_sync_ver2;



architecture strob_sync_ver2 of strob_sync_ver2 is

signal pilot_event,prev:std_logic;

signal cnt,cnt_timeout:std_logic_vector(log2roundup(PERIOD)-1 downto 0);
signal cntE,cntE_mean:std_logic_vector(log2roundup(PERIOD) downto 0);

begin




bih_filter_integrator_sign_i: entity work.bih_filter_integrator_sign
	generic map(
		ALPHA_NUM=>6,  --# коэффициент интегрирования, чем он больше тем большую историю храним
		SCALE_FACTOR=>4,  --# маштаб - чем он больше тем меньше значение на выходе
		WIDTH=>cntE'Length
	)
	port map(
		clk =>clk,
		reset =>reset,
		ce =>pilot_event,
		sample =>cntE,

		filtered =>cntE_mean,
		ce_out =>open
	);
	

process (clk) is 
begin		
	if rising_edge(clk) then

		if reset='1' then
			cnt<=(others=>'0');
			cntE<=(others=>'0');
			cnt_timeout<=(others=>'0');
			start_pilotU<='0';
			prev<='0';
		else
            cntE<="0"&cnt;
		    if unsigned(cnt)<PERIOD-1 then
				cnt<=cnt+1;
			else
				cnt<=(others=>'0');
			end if;

			if realpilot_event='1' and cnt_timeout=0 then
				cnt_timeout<=conv_std_logic_vector(PERIOD-1,cnt_timeout'Length);
				pilot_event<='1';
		    else
				pilot_event<='0';
				if unsigned(cnt_timeout)>0 then
					cnt_timeout<=cnt_timeout-1;
				end if;
			end if;


			if cnt=cntE_mean(cnt'Length-1 downto 0) and prev='0' then
				start_pilotU<='1';
				prev<='1';
			else
				prev<='0';
				start_pilotU<='0';
			end if;
			
		end if;
	end if;
end process;
	

	
end strob_sync_ver2;
