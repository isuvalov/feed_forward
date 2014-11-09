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
signal sample_sq,sample_2sq,sample_2sm_sq:std_logic_vector(31 downto 0);
signal threshold,sq_mean:std_logic_vector(31 downto 0);
signal sample_m:std_logic_vector(i_samplesI'Length downto 0);
signal sample_sq_1w,sample_sq_diff:std_logic_vector(31 downto 0);

signal sample_2sm,samplesI_1w:std_logic_vector(15 downto 0);
signal delay_ce:std_logic_vector(InterpolateRate-1 downto 0);

type Trrr is array(InterpolateRate-1 downto 0) of std_logic_vector(i_samplesI'Length-1 downto 0);
signal rrr:Trrr;

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
		ALPHA_NUM=>8,  --# коэффициент интегрирования, чем он больше тем большую историю храним
		SCALE_FACTOR=>9,  --# маштаб - чем он больше тем меньше значение на выходе
		WIDTH=>32
	)
	port map(
		clk =>clk,
		reset =>reset,
		ce =>'1',
		sample =>sample_2sm_sq,

		filtered =>sq_mean,
		ce_out =>open
	);

--sample_2sq<=sample_sq;

		out_ce<=delay_ce(delay_ce'Length-4);

process(clk) is
begin
	if rising_edge(clk) then
		delay_ce<=delay_ce(delay_ce'Length-2 downto 0)&sync_event;
		

		rrr(0)<=i_samplesI;
		for i in 1 to InterpolateRate-1 loop
			rrr(i)<=rrr(i-1);
		end loop; 
		sync_event_1w<=sync_event;
        samplesI_1w<=i_samplesI;

		sample_2sm<=signed(samplesI_1w)-signed(i_samplesI);
		


--		sample_m<=SXT(i_samplesI,17)-SXT(i_samplesQ,17);

--		sample_sq<=SXT(sample_m(16 downto 1),16)*SXT(sample_m(16 downto 1),16);

--		sample_sq_1w<=sample_sq;
--		sample_sq_diff<=sample_sq-sample_sq_1w;

--		sample_sq<=signed(i_samplesI)*signed(i_samplesI);
--		sample_sq<=SXT(sample_m(16 downto 1),16)*SXT(sample_m(16 downto 1),16);
		if signed(sample_sq)<32768 then
			sample_2sm<=sample_sq(15 downto 0);
		else
			sample_2sm<=(others=>'1');
		end if;

		sample_2sm_sq<=unsigned(sample_2sm)*unsigned(sample_2sm);

		threshold<=EXT(sq_mean(31 downto 1),32);
		if unsigned(sample_2sm)<500 then
			event<='1';
		else
			event<='0';
		end if;
	end if;
end process;

end find_ce_period_sync;

                    