library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;

entity find_ce_period_sync is
	port(
		clk : in STD_LOGIC;
		reset : in std_logic;
		i_samplesI: in std_logic_vector(15 downto 0);
		i_samplesQ: in std_logic_vector(15 downto 0);
		out_ce: out std_logic
		);
end find_ce_period_sync;



architecture find_ce_period_sync of find_ce_period_sync is

signal sync_find,event,sync_event,sync_event_1w:std_logic;
signal sample_sq:std_logic_vector(31 downto 0);
signal threshold,sq_mean:std_logic_vector(31 downto 0);

begin



strob_sync_ver2_i:entity work.strob_sync_ver2
	generic map(
		PERIOD=>InterpolateRate
	)
	port map(
		clk =>clk,
		reset =>reset,

		realpilot_event=>event,
		
		
		start_pilotU=>sync_event,
        sync_find=>open
		);


bih_filter_integrator_sign_i: entity work.bih_filter_integrator_sign
	generic map(
		ALPHA_NUM=>7,  --# коэффициент интегрирования, чем он больше тем большую историю храним
		SCALE_FACTOR=>8,  --# маштаб - чем он больше тем меньше значение на выходе
		WIDTH=>32
	)
	port map(
		clk =>clk,
		reset =>reset,
		ce =>'1',
		sample =>sample_sq,

		filtered =>sq_mean,
		ce_out =>open
	);



process(clk) is
begin
	if rising_edge(clk) then
		sync_event_1w<=sync_event;
		out_ce<=sync_event;
		sample_sq<=signed(i_samplesI)*signed(i_samplesI);
		threshold<=EXT(sq_mean(31 downto 0),32);
		if unsigned(sample_sq)<unsigned(threshold) then
			event<='1';
		else
			event<='0';
		end if;
	end if;
end process;

end find_ce_period_sync;

                    