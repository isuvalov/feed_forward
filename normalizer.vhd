library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;


entity normalizer is
	port(
		clk : in STD_LOGIC;
		reset : in std_logic;
		pilot_start: in std_logic; --# он должен быть над первым i_ce
		i_ce : in std_logic;		
		i_samplesI: in std_logic_vector(15 downto 0);
		i_samplesQ: in std_logic_vector(15 downto 0);

		o_pilot_wr: out std_logic;
		o_pilot_start: out std_logic;
		o_samplesI: out std_logic_vector(15 downto 0);
		o_samplesQ: out std_logic_vector(15 downto 0);

		out_ce: out std_logic
		);
end normalizer;



architecture normalizer of normalizer is

constant DEVIDERWORK:natural:=32;
constant NDELAY_LEN:natural:=InterpolateRate*PILOT_LEN+2+DEVIDERWORK;
type Tdelayline is array (0 to NDELAY_LEN-1) of std_logic_vector(i_samplesI'Length-1 downto 0);
signal delaylineI,delaylineQ:Tdelayline:=(others=>(others=>'0'));
signal sampleI_delay,sampleQ_delay:std_logic_vector(i_samplesI'Length-1 downto 0);
signal sampleI_mult,sampleQ_mult:std_logic_vector(32+i_samplesI'Length-1 downto 0);


signal max_ce,done_o: std_logic;
signal maxIQ: std_logic_vector(15 downto 0);
constant dividend:std_logic_vector(31 downto 0):=x"7FFFFFFE";
signal divisor:std_logic_vector(31 downto 0);
signal quotient: std_logic_vector(31 downto 0);
signal pilot_wr_cnt:std_logic_vector(log2roundup(InterpolateRate*PILOT_LEN) downto 0);
signal pilot_start_cntdelay: std_logic_vector(log2roundup(NDELAY_LEN+2)-1 downto 0);
signal pilot_start_delayv,pilot_start_delay:std_logic;

signal p_wr:std_logic_vector(log2roundup(NDELAY_LEN)-1 downto 0):=(others=>'0');
signal p_rd:std_logic_vector(log2roundup(NDELAY_LEN)-1 downto 0):=conv_std_logic_vector(NDELAY_LEN-1,p_wr'Length);


begin

get_max_values_inst: entity work.get_max_values
	port map(
		clk =>clk,
		reset =>reset,
		pilot_start=>pilot_start, --# он должен быть над первым i_ce
		i_ce =>i_ce,
		i_samplesI=>i_samplesI,
		i_samplesQ=>i_samplesQ,
		max_ce=>max_ce,
		maxIQ=>maxIQ,
		maxI=>open,
		maxQ=>open
		);
		 
process (clk) is
begin
	if rising_edge(clk) then
		sampleI_mult<=signed(sampleI_delay)*signed(SXT(quotient(quotient'Length-1 downto 1),quotient'Length));
		sampleQ_mult<=signed(sampleQ_delay)*signed(SXT(quotient(quotient'Length-1 downto 1),quotient'Length));
		o_samplesI<=sampleI_mult(sampleI_mult'Length-1-16 downto sampleI_mult'Length-o_samplesI'Length-16);
		o_samplesQ<=sampleQ_mult(sampleI_mult'Length-1-16 downto sampleI_mult'Length-o_samplesI'Length-16);
		out_ce<=i_ce;
		if pilot_start='1' then
			pilot_start_cntdelay<=conv_std_logic_vector(NDELAY_LEN+2-3,pilot_start_cntdelay'Length);
			pilot_start_delay<='0';
			pilot_start_delayv<='1';
			o_pilot_wr<='0';
		else
			if unsigned(pilot_start_cntdelay)>0 then
				pilot_start_cntdelay<=pilot_start_cntdelay-1;
				pilot_start_delay<='0';
				pilot_start_delayv<='0';
				o_pilot_wr<='0';
			else
				if pilot_start_delayv='0' then
					pilot_start_delay<='1';
					pilot_wr_cnt<=conv_std_logic_vector(InterpolateRate*PILOT_LEN,pilot_wr_cnt'Length);
					o_pilot_wr<='0';
				else
					pilot_start_delay<='0';					
					if unsigned(pilot_wr_cnt)>0 then
						pilot_wr_cnt<=pilot_wr_cnt-1;
						o_pilot_wr<='1';
					else
						o_pilot_wr<='0';
					end if;
				end if;
				pilot_start_delayv<='1';
			end if;
		end if;



	end if;
end process;
o_pilot_start<=pilot_start_delay;

divisor<=EXT(maxIQ,divisor'Length);

serial_divide_uu_inst: entity work.serial_divide_uu
  generic map( M_PP => 32,           -- Size of dividend
            N_PP => 32,            -- Size of divisor
            R_PP =>0,            -- Size of remainder
            S_PP =>0,            -- Skip this many bits (known leading zeros)
--            COUNT_WIDTH_PP : integer := 5;  -- 2^COUNT_WIDTH_PP-1 >= (M_PP+R_PP-S_PP-1)
            HELD_OUTPUT_PP =>1) -- Set to 1 if stable output should be held
                                            -- from previous operation, during current
                                            -- operation.  Using this option will increase
                                            -- the resource utilization (costs extra d-flip-flops.)
    port map(   clk_i      =>clk,
            clk_en_i   =>'1',
            rst_i      =>reset,
            divide_i   =>max_ce,
            dividend_i =>dividend,
            divisor_i  =>divisor,
            quotient_o =>quotient,
            done_o     =>done_o
    );

process (clk) is
begin		
	if rising_edge(clk) then
		if reset='1' then
			p_wr<=(others=>'0');
			p_rd<=conv_std_logic_vector(1,p_rd'Length);
		else
			if unsigned(p_rd)<NDELAY_LEN-1 then
				p_rd<=p_rd+1;
			else
				p_rd<=(others=>'0');
			end if;
			if unsigned(p_wr)<NDELAY_LEN-1 then
				p_wr<=p_wr+1;
			else
				p_wr<=(others=>'0');
			end if;
		end if;
	end if;
end process;


process (clk) is
begin		
	if rising_edge(clk) then
		if i_ce='1' then
			delaylineI(conv_integer(p_wr))<=i_samplesI;
		end if;
		sampleI_delay<=delaylineI(conv_integer(p_rd));
	end if;
end process;
process (clk) is
begin		
	if rising_edge(clk) then
		if i_ce='1' then
			delaylineQ(conv_integer(p_wr))<=i_samplesQ;
		end if;
		sampleQ_delay<=delaylineQ(conv_integer(p_rd));
	end if;
end process;


end normalizer;

