library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;


entity pilot_upper is
	port(
		clk : in STD_LOGIC;
		reset : in std_logic;

		sampleI_o: out std_logic_vector(15 downto 0);
		sampleQ_o: out std_logic_vector(15 downto 0)
		);
end pilot_upper;



architecture pilot_upper of pilot_upper is

signal o_interp_ce,o_interp_ce_w1,o_interp_ce_w2,sm_qam_ce:std_logic;
signal cnt_interp:std_logic_vector(log2roundup(InterpolateRate)-1 downto 0);	
signal cnt:std_logic_vector(log2roundup(PILOT_LEN)-1 downto 0);
signal mod_samplesI,mod_samplesQ:std_logic_vector(1 downto 0);
signal bits:std_logic_vector(1 downto 0);
signal s_sampleI_o,s_sampleQ_o:std_logic_vector(sampleI_o'Length-1 downto 0);


begin


ce_manager_inst: entity work.ce_manager
	port map(
		clk =>clk,
		reset =>reset,
		o_interp_ce =>o_interp_ce
		);


process (clk)
begin		
	if rising_edge(clk) then

		if reset='1' then
			cnt<=(others=>'0');
			o_interp_ce_w1<='0';
			o_interp_ce_w2<='0';
		else --#reset
			if o_interp_ce='1' then
				if unsigned(cnt)<PILOT_LEN-1 then
					cnt<=cnt+1;
				end if;
			end if;
	        o_interp_ce_w1<=o_interp_ce;
			o_interp_ce_w2<=o_interp_ce_w1;
		end if; --#reset


		if o_interp_ce='1' then
			if unsigned(cnt)<PILOT_LEN then
				if PILOT((PILOT_LEN-1)-conv_integer(cnt(log2roundup(PILOT_LEN)-1 downto 0)))='1' then --# set or 0 or 2
					bits<="00";
				else
					bits<="10";
				end if;
			else
				bits<="01";--lfsr_reg(bits'Length-1 downto 0);
			end if;
		end if;
	end if;	--clk
end process;
		 
qam4_mapper_inst:entity work.qam4_mapper
	port map(
		clk =>clk,
		reset =>reset,
		i_bits =>bits,
		i_ce => o_interp_ce_w1,
		
		o_samplesI=>mod_samplesI,
		o_samplesQ=>mod_samplesQ,
		o_ce=>sm_qam_ce  --# Этот будет на третьем такте после reset
		);


rcc_up_filter_inst: entity work.rcc_up_filter
	generic map(
		LEN=>mod_samplesI'Length
	)
	port map(
		clk =>clk,
		reset =>reset,
		i_samplesI=>mod_samplesI,
		i_samplesQ=>mod_samplesQ,
		o_sampleI=>s_sampleI_o,
		o_sampleQ=>s_sampleQ_o
		);

	
end pilot_upper;
