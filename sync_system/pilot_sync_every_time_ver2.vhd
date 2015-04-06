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
		pilot_not_here: out std_logic;		
		
		start_pilotU: out std_logic;
        sync_find: out std_logic
		);
end pilot_sync_every_time_ver2;



architecture pilot_sync_every_time_ver2 of pilot_sync_every_time_ver2 is

signal phase_cnt_pre,phase_cnt,phase_cnt_get,phase_cnt_recalc,phase_cnt_recalc_reg,phase_cnt_wait:std_logic_vector(log2roundup(PERIOD)-1 downto 0):=(others=>'1');
signal phase_gradient,phase_gradient_abs:std_logic_vector(log2roundup(PERIOD) downto 0):=(others=>'1');
signal realpilot_event_1w,filtit_ce,pilot_come,prev_bit:std_logic:='0';

signal phase_cnt_getE,phase_cnt_getadd,phase_cnt_getadd_1w,phase_cnt_filt:std_logic_vector(log2roundup(PERIOD)+1 downto 0):=(others=>'0');

type Treset_stm is (CALCING,RESETING);
signal reset_stm:Treset_stm;


signal error_cnt:std_logic_vector(3 downto 0);
signal local_reset:std_logic;

begin

	

process (clk) is 
begin		
	if rising_edge(clk) then
		if reset='1' then
			reset_stm<=CALCING;
			local_reset<='1';
			sync_find<='0';
			phase_gradient_abs<=(others=>'1');
		else
			case reset_stm is
			when CALCING=>
				if filtit_ce='1' then
					if (prev_bit xor (phase_cnt_getE(phase_cnt'Length-1) and phase_cnt_getE(phase_cnt'Length-2)))='1' then
						error_cnt<=error_cnt+2;
					else
						if unsigned(error_cnt)>0 then
							error_cnt<=error_cnt-1;
						end if;
					end if;
				end if;
				if unsigned(error_cnt)>=10 then
					reset_stm<=RESETING;					
				end if;
				local_reset<='0';
				phase_cnt_wait<=conv_std_logic_vector(PERIOD/2,phase_cnt_wait'Length);
			when RESETING=>
				if unsigned(phase_cnt_wait)>0 then
					phase_cnt_wait<=phase_cnt_wait-1;
					local_reset<='0';
				else
					local_reset<='1';
					reset_stm<=CALCING;
				end if;				
			when others=>
			end case;


			if signed(phase_gradient)<0 then
				phase_gradient_abs<=0-phase_gradient;
			else
				phase_gradient_abs<=phase_gradient;
			end if;


			if unsigned(phase_gradient_abs)<6 then
				sync_find<='1';
			else
				sync_find<='0';
			end if;


		end if;


		if filtit_ce='1' then
			phase_cnt_recalc_reg<=phase_cnt_recalc;
			phase_gradient<=SXT(phase_cnt_recalc_reg,phase_cnt_recalc'Length+1)-SXT(phase_cnt_recalc,phase_cnt_recalc'Length+1);
		end if;

		prev_bit<=phase_cnt_getE(phase_cnt'Length-1) and phase_cnt_getE(phase_cnt'Length-2);

		phase_cnt_getadd_1w<=phase_cnt_getadd;
		if local_reset='1' then
			phase_cnt<=conv_std_logic_vector(0,phase_cnt'Length);
			phase_cnt_pre<=conv_std_logic_vector(1,phase_cnt'Length);
		else
			if unsigned(phase_cnt_pre)<PERIOD-1 then
				phase_cnt_pre<=phase_cnt_pre+1;
			else
				phase_cnt_pre<=(others=>'0');
			end if;


			if unsigned(phase_cnt)<PERIOD-1 then
				phase_cnt<=phase_cnt+1;
			else
				phase_cnt<=(others=>'0');
			end if;
		end if;

		realpilot_event_1w<=realpilot_event;
		if realpilot_event='1' and realpilot_event_1w='0' then
			phase_cnt_getE<=EXT(phase_cnt,phase_cnt_getE'Length);
			filtit_ce<='1';
		else
			filtit_ce<='0';
		end if;

		if SIMULATION=0 then
			phase_cnt_recalc<=phase_cnt_filt(phase_cnt_recalc'Length-1 downto 0);
		else
			phase_cnt_recalc<=phase_cnt_getE(phase_cnt_recalc'Length-1 downto 0);
		end if;

		if phase_cnt_pre=phase_cnt_recalc then
			start_pilotU<='1';
		else
			start_pilotU<='0';
		end if;


	end if;
end process;


bih_filter_small:entity work.bih_filter_freq
	generic map(
		ALPHA_NUM=>7-3+1,  --# коэффициент интегрирования, чем он больше тем большую историю храним
		SCALE_FACTOR=>5-3+1,  --# маштаб - чем он больше тем меньше значение на выходе

		WIDTH=>phase_cnt_getE'Length --width_cnt_reg'Length
	)
	port map(
		clk =>clk,
		reset=>reset,
--		ce =>f_ce,
		ce =>filtit_ce,
		sample =>phase_cnt_getE,--width_cnt_reg, --# this is unsigned value!!!

		filtered=>phase_cnt_filt,
		ce_out =>open
	);
--phase_cnt_filt<=phase_cnt_getE;

pilot_not_here<='0';
	
end pilot_sync_every_time_ver2;
