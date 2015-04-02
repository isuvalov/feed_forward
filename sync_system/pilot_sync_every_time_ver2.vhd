library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;

entity pilot_sync_every_time_ver2 is
	generic(
		SIMULATION:integer:=0;
		PERIOD:integer:=100
	);
	port(
		clk : in STD_LOGIC;
		reset : in std_logic;

		realpilot_event: in std_logic; 
		
		
		start_pilotU: out std_logic;
        sync_find: out std_logic
		);
end pilot_sync_every_time_ver2;



architecture pilot_sync_every_time_ver2 of pilot_sync_every_time_ver2 is

signal phase_cnt_pre,phase_cnt,phase_cnt_get,phase_cnt_recalc:std_logic_vector(log2roundup(PERIOD)-1 downto 0):=(others=>'0');
signal realpilot_event_1w,filtit_ce,pilot_come:std_logic:='0';

signal phase_cnt_getE,phase_cnt_getadd,phase_cnt_getadd_1w,phase_cnt_filt:std_logic_vector(log2roundup(PERIOD)+1 downto 0):=(others=>'0');

begin

	

process (clk) is 
begin		
	if rising_edge(clk) then
		phase_cnt_getadd_1w<=phase_cnt_getadd;
		if reset='1' then
			phase_cnt<=conv_std_logic_vector(0,phase_cnt'Length);
			phase_cnt_pre<=conv_std_logic_vector(0,phase_cnt'Length);
		else
			if unsigned(phase_cnt_pre)<PERIOD-1 then
				phase_cnt_pre<=phase_cnt_pre+1;
			else
				phase_cnt_pre<=(others=>'0');
			end if;


			if unsigned(phase_cnt)<PERIOD-1 then
				phase_cnt<=phase_cnt+1;
				if realpilot_event='1' and realpilot_event_1w='0' then
					pilot_come<='1';
					phase_cnt_getadd<=(others=>'0');
				end if;
			else
				phase_cnt<=(others=>'0');
				pilot_come<='0';
				if pilot_come='1' then
					phase_cnt_getadd<=conv_std_logic_vector(PERIOD-1,phase_cnt_getadd'Length);
				end if;
			end if;
		end if;

		realpilot_event_1w<=realpilot_event;
		if realpilot_event='1' and realpilot_event_1w='0' then
			phase_cnt_getE<=EXT(phase_cnt,phase_cnt_getE'Length)+phase_cnt_getadd_1w;
			filtit_ce<='1';
		else
			filtit_ce<='0';
		end if;


		phase_cnt_recalc<=phase_cnt_filt(phase_cnt_recalc'Length-1 downto 0);
		if phase_cnt_pre=phase_cnt_recalc then
			start_pilotU<='1';
		else
			start_pilotU<='0';
		end if;


	end if;
end process;


bih_filter_small:entity work.bih_filter_freq
	generic map(
		ALPHA_NUM=>7-3+1+1,  --# коэффициент интегрирования, чем он больше тем большую историю храним
		SCALE_FACTOR=>5-3+1+1,  --# маштаб - чем он больше тем меньше значение на выходе

		WIDTH=>phase_cnt_getE'Length --width_cnt_reg'Length
	)
	port map(
		clk =>clk,
		reset=>reset,
--		ce =>f_ce,
		ce =>filtit_ce,
		sample =>phase_cnt_getE,--width_cnt_reg, --# this is unsigned value!!!

		filtered=>phase_cnt_filt,--s_freq,
		ce_out =>open
	);

	
end pilot_sync_every_time_ver2;
