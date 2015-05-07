library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;

entity pilot_sync_every_time_ver3 is
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
end pilot_sync_every_time_ver3;



architecture pilot_sync_every_time_ver3 of pilot_sync_every_time_ver3 is

constant MUL:std_logic_vector(15 downto 0):=x"000A";


signal work_ce:std_logic; 
signal mul_coef:std_logic_vector(31 downto 0):=(others=>'0');
signal toacum,clock_cnt,clock_cnt_1w:std_logic_vector(31 downto 0):=(others=>'0');
signal a,dot,phase_ref:std_logic;
signal phase_error:std_logic;

signal errors_acum_filt:std_logic_vector(15 downto 0):=(others=>'0');

signal q_all_sum,q_all_sum_1w:std_logic_vector(errors_acum_filt'Length-1 downto 0):=(others=>'0');
signal q_all_cnt:std_logic_vector(log2roundup(PERIOD) downto 0):=(others=>'0');

signal q_all_ce,q_all,work_ce_f:std_logic;

signal realpilot_event_wide_cnt:std_logic_vector(log2roundup(PERIOD)-2 downto 0):=(others=>'0');
signal realpilot_event_wide:std_logic;

begin


process (clk) is 
begin		
	if rising_edge(clk) then
		clock_cnt<=clock_cnt+toacum;
		clock_cnt_1w<=clock_cnt;
		mul_coef<=signed(MUL)*signed(errors_acum_filt);
		toacum<=(conv_std_logic_vector((2**30/PERIOD),30)&"00")+rats(mul_coef)-82000;

	end if;
end process;
start_pilotU<=clock_cnt(31);

process (clk) is 
begin		
	if rising_edge(clk) then
		if clock_cnt_1w(clock_cnt'Length-1)='0' and clock_cnt(clock_cnt'Length-1)='1' then
			work_ce<='1';
		else
			work_ce<='0';
		end if;

		if clock_cnt_1w(clock_cnt'Length-1)='1' and clock_cnt(clock_cnt'Length-1)='0' then
			work_ce_f<='1';
		else
			work_ce_f<='0';
		end if;


		if unsigned(q_all_cnt)<16-1 then
			q_all_cnt<=q_all_cnt+1;
			if rat(q_all)='1' then
				q_all_sum<=q_all_sum+1;
			end if;
			q_all_ce<='0';
		else
			q_all_cnt<=(others=>'0');
			if rat(q_all)='1' then
				q_all_sum<=conv_std_logic_vector(1,q_all_sum'Length);
			else
				q_all_sum<=(others=>'0');
			end if;
			q_all_ce<='1';
		end if;
		q_all_sum_1w<=q_all_sum;

		if realpilot_event='1' then
			realpilot_event_wide_cnt<=conv_std_logic_vector((PERIOD/2)-10,realpilot_event_wide_cnt'Length);
			realpilot_event_wide<='1';
		else
			if unsigned(realpilot_event_wide_cnt)>0 then
				realpilot_event_wide_cnt<=realpilot_event_wide_cnt-1;
				realpilot_event_wide<='1';
			else
				realpilot_event_wide<='0';
			end if;
		end if;

	end if;
end process;

	
process (clk) is
begin
	if rising_edge(clk) then
		if work_ce='1' then
			a<=realpilot_event_wide;
		end if;
		if work_ce_f='1' then
			dot<=a;
		end if;

	end if;
end process;
phase_error<=a xor realpilot_event_wide;
phase_ref<=a xor dot;

process (clk) is
begin		
	if rising_edge(clk) then
		if phase_error='1' and phase_ref='0' then
			q_all<='1';
		else
			q_all<='0';
		end if;
	end if;
end process;


bih_filter_small:entity work.bih_filter_freq
	generic map(
		ALPHA_NUM=>14,  --# коэффициент интегрирования, чем он больше тем большую историю храним
		SCALE_FACTOR=>10-5-4,  --# маштаб - чем он больше тем меньше значение на выходе

		WIDTH=>errors_acum_filt'Length --mult_cnt_count_regE'Length --width_cnt_reg'Length
	)
	port map(
		clk =>clk,
		reset=>reset,
		ce =>q_all_ce,
		sample =>q_all_sum_1w,--errors_acum,--mult_cnt_count_regE,
		filtered=>errors_acum_filt,--errors_acum_filt,--open, --errors_acum_filt,--mult_cnt_reg_filtE,
		ce_out =>open
	);


end pilot_sync_every_time_ver3;
