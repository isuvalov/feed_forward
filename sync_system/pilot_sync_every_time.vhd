library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;

entity pilot_sync_every_time is
	generic(
		DELAY_AFTER_FREQESTIM:natural:=1000;
		DELAY_LEN:natural:=10000
	);
	port(
		clk : in STD_LOGIC;
		reset : in std_logic;

		realpilot_event: in std_logic; 
		
		
		start_pilotU: out std_logic;
        sync_find: out std_logic
		);
end pilot_sync_every_time;



architecture pilot_sync_every_time of pilot_sync_every_time is


constant CATCH_NUM_UP:natural:=3;
constant CATCH_NUM_DOWN:natural:=1;
constant MAX_CATCH_NUM:natural:=6;

constant PILOTUP_START_DELAY:natural:=9+3; --# ����� ������� ���� ��� ���� ���� ��������� ������������������ ������ ����� �������� �������

constant INTERP_CUT:natural:=log2roundup(InterpolateRate);

signal start_pilotU_have,s_start_pilotU:std_logic;
signal start_delayer_cnt:std_logic_vector(log2roundup(DELAY_AFTER_FREQESTIM)-1 downto 0);


signal loss_cnt:std_logic_vector(log2roundup(MAX_CATCH_NUM)-1 downto 0);

type Tstm is (WAITING,CATCH);
signal stm:Tstm; 

signal main_cnt_best,main_cnt_prev,main_cnt:std_logic_vector(log2roundup(PILOT_PERIOD+InterpolateRate)-1 downto 0);
signal s_sync_find,one_p:std_logic;

signal g_start_pilotU_have,g_start_pilotU:std_logic;
signal g_start_delayer_cnt:std_logic_vector(log2roundup(DELAY_AFTER_FREQESTIM)-1 downto 0);

signal m_start_pilotU_have,m_start_pilotU:std_logic;
signal m_start_delayer_cnt:std_logic_vector(log2roundup(DELAY_AFTER_FREQESTIM)-1 downto 0);

signal m_realpilot_event,good_come:std_logic;


begin

		 

process (clk) is
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
				 main_cnt<=conv_std_logic_vector(PILOT_PERIOD/2,main_cnt'Length);
				 main_cnt_prev<=main_cnt;
			else     --# realpilot_event
			    if unsigned(main_cnt)<(PILOT_PERIOD-1) then
					main_cnt<=main_cnt+1;
				 else
					main_cnt<=(others=>'0');
				 end if;
			end if;  --# realpilot_event
			
			if realpilot_event='1' then
				if main_cnt(main_cnt'Length-1 downto INTERP_CUT)=main_cnt_prev(main_cnt'Length-1 downto INTERP_CUT) then
					if unsigned(loss_cnt)<MAX_CATCH_NUM then
						loss_cnt<=loss_cnt+1;
					end if;
					main_cnt_best<=main_cnt_prev;
				else
					if unsigned(loss_cnt)>0 then
						loss_cnt<=loss_cnt-1;
					end if;
				end if;
				good_come<='1'; --# ��������� ������ ������� ����� ����� ������� ���������� ��������
			else	 --# realpilot_event
			    if unsigned(main_cnt)>=(PILOT_PERIOD/2+PILOT_PERIOD/4) then
					good_come<='0'; --# ������ ����� ����������� ������� ����
				end if; --# main_cnt
			end if;  --# realpilot_event


----------------------------------

			case stm is
			when WAITING=>
    			s_sync_find<='0';
				if unsigned(loss_cnt)>=CATCH_NUM_UP then
					stm<=CATCH;
					
--				elsif unsigned(loss_cnt)<=CATCH_NUM_DOWN then
				end if;
			when CATCH=>
				s_sync_find<='1';
				if unsigned(loss_cnt)<=CATCH_NUM_DOWN then
					stm<=WAITING;
				end if;			

					

			when others=>
			end case;
		end if; --# reset
	end if;
end process;



--# ������ �������� �������� ���� �� ������ ����������
--# "g_" - ������� �� ����� "good"
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

--# ������ �������� �������� ���� �������� ���, ����� �� �����������
--# "m_" - ������� �� ����� "my" ��� "mind"
process (clk) is
begin		
	if rising_edge(clk) then
		if m_realpilot_event='1' then
			m_start_delayer_cnt<=conv_std_logic_vector(DELAY_AFTER_FREQESTIM-PILOTUP_START_DELAY-18,m_start_delayer_cnt'Length);		
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


start_pilotU<=m_start_pilotU when good_come='0' and stm=CATCH else g_start_pilotU;

sync_find<=s_sync_find;
	
end pilot_sync_every_time;