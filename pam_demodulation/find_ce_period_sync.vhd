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

function signed_abs (L: std_logic_vector) return std_logic_vector is
-- pragma label_applies_to abs
  
variable result : std_logic_vector(L'range) ;
--attribute IS_SIGNED of L:constant is TRUE ;
--attribute SYNTHESIS_RETURN of result:variable is "ABS" ;
begin
if (L(L'left) = '0' or L(L'left) = 'L') then
    result := L;
else
    result := 0 - signed(L);
end if;
    return result ;
end signed_abs;


signal sync_find,event,sync_event,sync_event_1w:std_logic;
signal sample_sq,sample_2sq,sample_2sm_sq:std_logic_vector(31 downto 0);
signal threshold,sq_mean:std_logic_vector(31 downto 0);
signal sample_m:std_logic_vector(i_samplesI'Length downto 0);
signal sample_sq_1w,sample_sq_diff:std_logic_vector(31 downto 0);

signal sample_2sm_abs,sample_2sm,sample_2sm_1w,sample_2sm_2w,samplesI_1w:std_logic_vector(15 downto 0);
signal delay_ce:std_logic_vector(InterpolateRate-1 downto 0);

type Trrr is array(InterpolateRate-1 downto 0) of std_logic_vector(i_samplesI'Length-1 downto 0);
signal rrr:Trrr;

signal emul_reset:std_logic:='1';

begin

emul_reset<='0' after 100 ns;

tik_sync_maxprobability_i: entity work.tik_sync_maxprobability
	port map(
		clk =>clk,
		reset =>emul_reset,
		i_event =>event,
		o_event =>sync_event
		);



strob_sync_ver2_i:entity work.strob_sync_ver2
	generic map(
		PERIOD=>InterpolateRate
	)
	port map(
		clk =>clk,
		reset =>reset,

		realpilot_event=>event,
		
		
		start_pilotU=>open,--sync_event,
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

		out_ce<=delay_ce(2);
--out_ce<=sync_event;

process(clk) is
begin
	if rising_edge(clk) then
		delay_ce<=delay_ce(delay_ce'Length-2 downto 0)&sync_event;
		
--        out_ce<=sync_event;
		rrr(0)<=i_samplesI;
		for i in 1 to InterpolateRate-1 loop
			rrr(i)<=rrr(i-1);
		end loop; 
		sync_event_1w<=sync_event;
        samplesI_1w<=i_samplesI;

		sample_2sm<=signed(samplesI_1w)-signed(i_samplesI);
--		sample_2sm<=signed(sample_sq_1w(31 downto 16))-signed(sample_sq(31 downto 16));
		sample_2sm_1w<=sample_2sm;		
		sample_2sm_2w<=sample_2sm_1w;

--		s2sign=

--		sample_m<=SXT(i_samplesI,17)-SXT(i_samplesQ,17);
--
--		sample_sq<=SXT(sample_m(16 downto 1),16)*SXT(sample_m(16 downto 1),16);
--
--		sample_sq_1w<=sample_sq;
--		sample_sq_diff<=sample_sq-sample_sq_1w;
--
		sample_sq<=signed(i_samplesI)*signed(i_samplesI);
		sample_sq_1w<=sample_sq;
--		sample_sq<=SXT(sample_m(16 downto 1),16)*SXT(sample_m(16 downto 1),16);
--		if signed(signed_abs(sample_2sm))<32768 then
--			sample_2sm<=sample_sq(15 downto 0);
--		else
--			sample_2sm<=(others=>'1');
--		end if;
--
----		sample_2sm_sq<=unsigned(sample_2sm)*unsigned(sample_2sm);
		
--		sample_2sm_abs<=signed_abs(sample_2sm);

		threshold<=EXT(sq_mean(31 downto 1),32);
--		if unsigned(sample_2sm_abs)<100 then
--		if unsigned(sample_sq)<20000 then
--		if (signed(sample_2sm)>0 and signed(sample_2sm_1w)<0 and signed(sample_2sm_2w)<0) then 
--			or (signed(sample_2sm)<0 and signed(sample_2sm_1w)>0 and signed(sample_2sm_2w)>0) then
		if (signed(i_samplesI)>=0 and signed(samplesI_1w)<=0) or (signed(i_samplesI)<=0 and signed(samplesI_1w)>=0) then
			event<='1';
		else
			event<='0';
		end if;
	end if;
end process;

end find_ce_period_sync;

                    