library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;

entity pilot_sync_every_time is
	generic(
		SIMULATION:integer:=0;
		DELAY_AFTER_FREQESTIM:natural:=1000;
		DELAY_LEN:natural:=10000
	);
	port(
		clk : in STD_LOGIC;
		reset : in std_logic;

		pilot_not_here: out std_logic;

		realpilot_event: in std_logic; 
		
		
		start_pilotU: out std_logic;
        sync_find: out std_logic
		);
end pilot_sync_every_time;



architecture pilot_sync_every_time of pilot_sync_every_time is

constant CNT_FILTER:natural:=4; --# Must be power of 2!!!
constant CATCH_NUM_UP:natural:=3*2;
constant CATCH_NUM_DOWN:natural:=1*2;
constant MAX_CATCH_NUM:natural:=6*4;

constant PILOTUP_START_DELAY:natural:=9+3; --# Время которое надо для того чтоб генератор интерполированного пилота начал выдавать отсчеты

constant INTERP_CUT:natural:=log2roundup(InterpolateRate);

signal start_pilotU_have,s_start_pilotU:std_logic:='0';
signal start_delayer_cnt:std_logic_vector(log2roundup(DELAY_AFTER_FREQESTIM)-1 downto 0);


signal loss_cnt:std_logic_vector(log2roundup(MAX_CATCH_NUM)-1 downto 0);

type Tstm is (WAITING,CATCH);
signal stm:Tstm; 


type Tmain_cnt_prev_a is array(CNT_FILTER-1 downto 0) of std_logic_vector(log2roundup(DELAY_LEN+InterpolateRate)-1 downto 0);
signal main_cnt_prev_a:Tmain_cnt_prev_a;


signal main_cnt_best,main_cnt_prev,main_cnt:std_logic_vector(log2roundup(DELAY_LEN+InterpolateRate)-1 downto 0);
signal main_cnt_prev_sum:std_logic_vector(main_cnt_prev'Length-1+log2roundup(CNT_FILTER) downto 0);
signal s_sync_find,one_p:std_logic;

signal g_start_pilotU_have,g_start_pilotU:std_logic:='0';
signal g_start_delayer_cnt:std_logic_vector(log2roundup(DELAY_AFTER_FREQESTIM)-1 downto 0);

signal m_start_pilotU_have_1w,m_start_pilotU_have,m_start_pilotU:std_logic:='0';
signal m_start_delayer_cnt:std_logic_vector(log2roundup(DELAY_AFTER_FREQESTIM)-1 downto 0):=(others=>'1');

signal m_realpilot_event,good_come:std_logic;


begin

	

process (clk) is 
begin		
	if rising_edge(clk) then
		pilot_not_here<=(not g_start_pilotU_have) or not(s_sync_find);
		if m_start_pilotU='1' then
--			good_come<='1';
		else
--			if 
		end if;			
	end if;
end process;
	
process (clk) is
variable v_main_cnt_prev_sum:std_logic_vector(main_cnt_prev_sum'Length-1 downto 0);
begin		
	if rising_edge(clk) then
		if reset='1' then
			loss_cnt<=(others=>'0');
			stm<=WAITING;
			main_cnt<=(others=>'0');
			s_sync_find<='0';
			one_p<='0';
			m_realpilot_event<='0';
		else  --# reset

			if main_cnt_best=main_cnt then
				m_realpilot_event<='1';
			else
				m_realpilot_event<='0';
			end if;

----------------------------------
			if realpilot_event='1' then
				 main_cnt<=conv_std_logic_vector(DELAY_LEN/2+InterpolateRate,main_cnt'Length);
				 main_cnt_prev<=main_cnt;
			else     --# realpilot_event
			    if unsigned(main_cnt)<(DELAY_LEN-1) then
					main_cnt<=main_cnt+1;
				 else
					main_cnt<=(others=>'0');
				 end if;
			end if;  --# realpilot_event
			
			if realpilot_event='1' then
				if main_cnt(main_cnt'Length-1 downto 1+INTERP_CUT)=main_cnt_prev(main_cnt'Length-1 downto 1+INTERP_CUT) then
					if unsigned(loss_cnt)<MAX_CATCH_NUM then
						loss_cnt<=loss_cnt+1;
					end if;
				else
					if unsigned(loss_cnt)>0 then
						loss_cnt<=loss_cnt-1;
					end if;
				end if;
				good_come<='1'; --# указывает начало времени когда будем ожидать пришествие импульса
			else	 --# realpilot_event
			    if unsigned(main_cnt(main_cnt'Length-2 downto 0))<=(DELAY_LEN/4) then
					good_come<='0'; --# теперь будем придумывать импульс сами
				end if; --# main_cnt
			end if;  --# realpilot_event


----------------------------------

			case stm is
			when WAITING=>
    			s_sync_find<='0';
				if SIMULATION=0 then				
					if unsigned(loss_cnt)>=CATCH_NUM_UP then
						stm<=CATCH;
					end if;
    
					if realpilot_event='1' then
					 	main_cnt_prev_a(0)<=main_cnt_prev;	
						v_main_cnt_prev_sum:=EXT(main_cnt_prev_a(0),v_main_cnt_prev_sum'Length);
						for i in 1 to main_cnt_prev_a'Length-1 loop
							main_cnt_prev_a(i)<=main_cnt_prev_a(i-1);
							v_main_cnt_prev_sum:=v_main_cnt_prev_sum+main_cnt_prev_a(i);
						end loop;
						main_cnt_prev_sum<=v_main_cnt_prev_sum;
						main_cnt_best<=main_cnt_prev_sum(main_cnt_prev_sum'Length-1 downto log2roundup(CNT_FILTER));					
					end if;
               else --# SIMULATION
					if unsigned(loss_cnt)>=1 then
						stm<=CATCH;
					end if;
					main_cnt_best<=main_cnt_prev-2;
               end if; --# SIMULATION
			when CATCH=>
				s_sync_find<='1';
				if SIMULATION=0 then				
					if unsigned(loss_cnt)<=CATCH_NUM_DOWN then
							stm<=WAITING;
					end if;			
				else
					if unsigned(loss_cnt)<=0 then
							stm<=WAITING;
					end if;			
				end if;
					

			when others=>
			end case;
		end if; --# reset
	end if;
end process;



--# Делаем задержку импульса если он пришел правильный
--# "g_" - префикс от слова "good"
process (clk) is
begin		
	if rising_edge(clk) then
		if realpilot_event='1' then
			g_start_delayer_cnt<=conv_std_logic_vector(DELAY_AFTER_FREQESTIM-PILOTUP_START_DELAY-18,g_start_delayer_cnt'Length);		
			g_start_pilotU<='0';
			g_start_pilotU_have<='0';
		else
			if unsigned(g_start_delayer_cnt)>0 then
				g_start_delayer_cnt<=g_start_delayer_cnt-1;
				g_start_pilotU<='0';
			else
				if g_start_pilotU_have='0' then
					g_start_pilotU<='1';
					g_start_pilotU_have<='1';
				else
					g_start_pilotU<='0';
				end if;
			end if;
		end if;
	end if;
end process;

--# Делаем задержку импульса если импульса нет, берем от предыдущего
--# "m_" - префикс от слова "my" или "mind"
process (clk) is
begin		
	if rising_edge(clk) then
		m_start_pilotU_have_1w<=m_start_pilotU_have;
		if m_realpilot_event='1' or reset='1' then
			m_start_delayer_cnt<=conv_std_logic_vector(DELAY_AFTER_FREQESTIM-PILOTUP_START_DELAY-18-1,m_start_delayer_cnt'Length);		
			m_start_pilotU<='0';
			m_start_pilotU_have<='0';
		else
			if unsigned(m_start_delayer_cnt)>0 then
				m_start_delayer_cnt<=m_start_delayer_cnt-1;
				m_start_pilotU<='0';				
			else
				if m_start_pilotU_have='0' then
					m_start_pilotU<='1';
					m_start_pilotU_have<='1';
				else
					m_start_pilotU<='0';
				end if;
			end if;
		end if;
	end if;
end process;

start_pilotU<=m_start_pilotU when good_come='0' and stm=CATCH and m_start_pilotU_have_1w='0' else g_start_pilotU;

sync_find<=s_sync_find;
	
end pilot_sync_every_time;
