library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.math_real.all;
use work.feedf_consts_pack.all;

entity calc_freq_of_sin is
	port(
		clk : in STD_LOGIC;
		reset : in std_logic;

		i_ce: in std_logic;
		i_sampleI: in std_logic_vector(15 downto 0);
		i_sampleQ: in std_logic_vector(15 downto 0);

		phase_for_dds_ce: out std_logic;
		phase_for_dds: out std_logic_vector(31 downto 0);

		o_freq_ce: out std_logic;
		o_freq: out std_logic_vector(31 downto 0)
		);
end calc_freq_of_sin;



architecture calc_freq_of_sin of calc_freq_of_sin is

constant CALC_PERIODS_NUMBER:integer:=64;
constant FREQ_PRECISIN:integer:=0;

constant MAX_VAL:std_logic_vector(31 downto 0):=conv_std_logic_vector((2**(30)),32);
constant MAX_VAL2:std_logic_vector(31 downto 0):=conv_std_logic_vector((2**(30)),32);

--constant MAX_VAL:std_logic_vector(31 downto 0):=(31=>'0',30=>'0',(FREQ_PRECISIN-1 downto 0)=>'0',others=>'1');

signal sign,sign_1w,f_ce,s_freq_ce,s_phase_for_dds_ce,freq_ce:std_logic;
signal sampleI_filt:std_logic_vector(15 downto 0);
signal s_freq_div,s_freq,width_cnt,width_cnt_reg,width_cnt_reg_shift:std_logic_vector(31 downto 0):=(others=>'0');

signal measure_phase_for_dds,measure_phase_for_dds_mul:std_logic_vector(31 downto 0);
signal phase_for_dds_test:integer;

signal periods_cnt:std_logic_vector(7 downto 0):=x"00";

signal phase_for_dds_pre: std_logic_vector(31 downto 0);

signal phase_for_dds_pi: std_logic_vector(32+16 downto 0);

begin

sign<=sampleI_filt(sampleI_filt'Length-1);

sinfilt_rxfilter_i:entity work.sinfilt_rxfilter
	generic map(
		USE_IT=>1,
		LEN=>i_sampleI'Length
	)
	port map(
		clk =>clk,
		reset =>reset,
		i_samplesI =>i_sampleI,
		i_samplesQ =>(others=>'0'),
		o_sampleI=>sampleI_filt,  --# ����� � ��� ���� ������ ���������
		o_sampleQ=>open
		);



process (clk)
begin		
	if rising_edge(clk) then
		sign_1w<=sign;	
		if i_ce='1' then
			if 	sign_1w='0' and sign='1' then
				if unsigned(width_cnt)>14 then
					f_ce<='1';
					if periods_cnt>CALC_PERIODS_NUMBER-1 then
						periods_cnt<=(others=>'0');
						width_cnt<=(others=>'0');
						width_cnt_reg<=width_cnt+2;
					else
						periods_cnt<=periods_cnt+1;
					end if;

				else
					f_ce<='0';
				end if;
			else
				width_cnt<=width_cnt+1;			
				f_ce<='0';
			end if;
		else
			f_ce<='0';
		end if;
	end if;	--clk
end process;

--width_cnt_reg_shift<=EXT(width_cnt_reg(width_cnt_reg_shift'Length-1 downto log2roundup(CALC_PERIODS_NUMBER)*2-FREQ_PRECISIN),width_cnt_reg_shift'Length);

--width_cnt_reg_shift<=EXT(width_cnt_reg(width_cnt_reg_shift'Length-1 downto log2roundup(CALC_PERIODS_NUMBER)*2-FREQ_PRECISIN),width_cnt_reg_shift'Length);

width_cnt_reg_shift<=width_cnt_reg;

o_freq<=s_freq;

bih_filter_freq_i:entity work.bih_filter_freq
	generic map(
--		ALPHA_NUM=>7+2+1,  --# ����������� ��������������, ��� �� ������ ��� ������� ������� ������
--		SCALE_FACTOR=>5+2,  --# ������ - ��� �� ������ ��� ������ �������� �� ������
		ALPHA_NUM=>7-2+1,  --# ����������� ��������������, ��� �� ������ ��� ������� ������� ������
		SCALE_FACTOR=>5-2+1,  --# ������ - ��� �� ������ ��� ������ �������� �� ������

		WIDTH=>width_cnt_reg'Length
	)
	port map(
		clk =>clk,
		reset=>reset,
		ce =>f_ce,
		sample =>width_cnt_reg_shift, --# this is unsigned value!!!

		filtered=>s_freq,
		ce_out =>s_freq_ce
	);

s_freq_div<=EXT(s_freq(s_freq'length-1 downto log2roundup(CALC_PERIODS_NUMBER)*2),s_freq_div'Length);


--# FTW=(2**N)*(1-n'/n)/n' = (2**N) * (n-n')/n * (1/n') = ((2**N)/n  * (n-n'))/n'

process(clk) is
begin
	if rising_edge(clk) then

		measure_phase_for_dds_mul<=measure_phase_for_dds(measure_phase_for_dds'Length-1-(log2roundup(CALC_PERIODS_NUMBER)-3) downto 0)&EXT("0",log2roundup(CALC_PERIODS_NUMBER)-3);


--		phase_for_dds_test<=integer(ROUND(real((2**30)-0)/(real(FREQ_FD)/real(PILOTSIN_FREQ))));
		phase_for_dds_test<=integer(ROUND(4.0*real(PILOTSIN_FREQ)*(real(conv_integer(MAX_VAL))/real(FREQ_FD))));

--		phase_for_dds<=integer(ROUND(real((2**30)-0)/(real(FREQ_FD)/real(PILOTSIN_FREQ))))-measure_phase_for_dds;
		phase_for_dds_pre<=integer(ROUND(4.0*real(PILOTSIN_FREQ)*(real(conv_integer(MAX_VAL))/real(FREQ_FD))))-measure_phase_for_dds_mul;

--		phase_for_dds<=SXT(phase_for_dds_pre(phase_for_dds_pre'Length-1-2 downto (FREQ_PRECISIN+2))&EXT("0",2),phase_for_dds'Length);

--		phase_for_dds<=phase_for_dds_pre(phase_for_dds_pre'Length-1 downto 0);


--		phase_for_dds_pi<=unsigned(conv_std_logic_vector(integer(round(real(2**13)*MATH_2_PI)),16))*signed(phase_for_dds_pre);

--		phase_for_dds<=phase_for_dds_pi(phase_for_dds_pi'Length-1-3 downto phase_for_dds_pi'Length-phase_for_dds'Length-3);
		phase_for_dds<=phase_for_dds_pre;

		if i_ce='1' then
			freq_ce<=s_freq_ce;
		else
			freq_ce<='0';
		end if;

		if i_ce='1' then
			phase_for_dds_ce<=s_phase_for_dds_ce;
		else
			phase_for_dds_ce<='0';
		end if;
	end if;
end process;

o_freq_ce<=s_freq_ce;

 

divI_inst: entity work.serial_divide_uu
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
            divide_i   =>freq_ce,
            dividend_i =>MAX_VAL,--x"3FFFFFFF",
            divisor_i  =>width_cnt_reg_shift,--s_freq,  -- !!!! only for quckly test!!!! must be  s_freq
            quotient_o =>measure_phase_for_dds,
            done_o     =>s_phase_for_dds_ce
    );


	
end calc_freq_of_sin;
