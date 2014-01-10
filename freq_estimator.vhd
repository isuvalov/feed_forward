library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;

--# —читаем что пилот многоменьше расто€ни€ между пилотами
--#  оличество тактов на работу будет примернно PILOT_LEN*InterpolateRate*3/16= 256*(128+256)/2 =49152

entity freq_estimator is
	port(
		clk : in STD_LOGIC;
		reset : in std_logic;
		pilot_start: in std_logic; --# он должен быть над первым i_ce
		i_ce : in std_logic;		
		i_samplesI: in std_logic_vector(15 downto 0);
		i_samplesQ: in std_logic_vector(15 downto 0);
		freq_ce: out std_logic;
		o_freq: out std_logic_vector(NBITm1+log2roundup(PILOT_LEN*2) downto 0)  --# Ёто уже отрецательна€ частота
		);
end freq_estimator;



architecture freq_estimator of freq_estimator is

--constant NBIT:natural:=18;
--constant NBITm1:natural:=NBIT-1;
--constant ML_R_BITS:natural:=1; --#«начение на которое смещаетс€ данные перед перемножением идущим в CORDIC
--constant ADD_TO_TABLE:natural:=12; --# ƒобавка бит дл€ того чтоб произвести более точное деление при нормировки первых сумм


--constant NBIT:natural:=17;
--constant NBITm1:natural:=NBIT-1;
constant ML_R_BITS:natural:=2; --#«начение на которое смещаетс€ данные перед перемножением идущим в CORDIC
constant ADD_TO_TABLE:natural:=10; --# ƒобавка бит дл€ того чтоб произвести более точное деление при нормировки первых сумм

constant SIG_DELAY:natural:=1; --# —мещение сигнала относительно из-за задержани€ строба старта


function div_table_ceil(M,l,NbitMul:integer) return std_logic_vector is
--# NbitMul указывает на сколько бит сдвигаем на верх.
--# “.е. NbitMul должно быть больше чем (M-l)
variable kk:integer;
variable rett:std_logic_vector(NbitMul-1 downto 0);
begin
	kk:=conv_integer('1'&EXT("0",NbitMul))/(M-l);
	rett:=conv_std_logic_vector(kk,NbitMul);
	return rett;
end div_table_ceil;

alias PILOT_I is PILOT;
alias PILOT_Q is PILOT;



type Tstm is (WAITING,PRE_START,ML_ARRAY_START,WAIT_SUM_SAVE,WAIT_SUM_SAVE02,WAIT_SUM_SAVE03,WAIT_SUM_SAVE04,WAIT_SUM_SAVE05,WAIT_FREQ_FIN);
signal stm:Tstm:=WAITING;

type Tpwr_stm is (WAITING,FIRST_WR,INCR);
signal pwr_stm:Tpwr_stm;

type Tmem is array(0 to PILOT_LEN*InterpolateRate-1) of std_logic_vector(i_samplesI'Length-1 downto 0);
signal memI,memQ:Tmem;
signal mem2I,mem2Q:Tmem;
signal samples_cnt,p_wr,p_rd,p_rd2:std_logic_vector(log2roundup(PILOT_LEN*InterpolateRate)-1 downto 0);
signal i_samplesI_w1,i_samplesQ_w1,from_m_I,from_m_Q,from_m2_I,from_m2_Q:std_logic_vector(i_samplesI'Length-1 downto 0);
signal wr,start_calc:std_logic:='0';
signal wr_st_was:std_logic:='1';
signal i_ce_w1,i_ce_w2,i_ce_w3:std_logic;

signal l_cnt_calc_to_angle_w1,l_cnt_calc_to_angle,l_cnt_calc,l_cnt,wind_cnt:std_logic_vector(p_wr'Length-1 downto 0);
signal pilotII,pilotQQ,pilotIQ,pilotQI:std_logic_vector(i_samplesI'Length-1 downto 0);
signal pilotmskI,pilotmskQ,pilotmskI_w1,pilotmskQ_w1,pilotmsk2I_w1,pilotmsk2Q_w1:std_logic_vector(i_samplesI'Length downto 0);
signal ml_II,ml_QQ,ml_IQ,ml_QI:std_logic_vector(2*i_samplesI'Length-1 downto 0);
signal ml_I,ml_Q:std_logic_vector(NBITm1 downto 0);
signal t_ml_I,t_ml_Q:std_logic_vector(NBITm1 downto 0);
signal sum_ce,sum_ce_w1,sum_ce_w2,sum_ce_w3,ml_sum_ce,ml_sum_ce_w1,ml_sum_ce_w2:std_logic;
signal l_calc,l_calc_w1,l_calc_w2,l_calc_w3,l_calc_w4:std_logic;

signal acum_I,acum_Q,acum_phase:std_logic_vector(NBIT+log2roundup(PILOT_LEN*InterpolateRate)-Ndiv downto 0);
signal s_pilotI,sc_pilotQ:std_logic_vector(1 downto 0);
signal b_s_pilotI,b_sc_pilotQ:std_logic;
signal s_pilotIn,sc_pilotQn:std_logic_vector(1 downto 0);
signal ml_sum_I,ml_sum_Q:std_logic_vector(NBITm1 downto 0);

type Tdiv_tab is array(0 to PILOT_LEN*InterpolateRate/2-1) of std_logic_vector((log2roundup(PILOT_LEN*InterpolateRate)+ADD_TO_TABLE)-1 downto 0);
signal div_tab:Tdiv_tab;

signal ml_sum_I_mul,ml_sum_Q_mul:std_logic_vector(NBIT+div_tab(0)'Length-1 downto 0);
signal first_l:std_logic;

signal angle_sm_floor,ml_sum_I_mul_prev,ml_sum_Q_mul_prev,ml_sum_Q_mul_conj:std_logic_vector(NBITm1 downto 0);


signal first_l_w1,ml_sum_ce_w3,angle_pilot_ce:std_logic;
signal rx_p_I,rx_p_Q:std_logic_vector(NBITm1 downto 0);
signal s_rx_p_I,s_rx_p_Q:signed(NBITm1 downto 0);
-- ml_sum_I_mul'Length-1-ML_R_BITS downto div_tab(0)'Length-ML_R_BITS
signal rx_p_II,rx_p_QQ,rx_p_IQ,rx_p_QI:
	std_logic_vector(ml_sum_I_mul_prev'Length+(ml_sum_I_mul'Length-div_tab(0)'Length)-1 downto 0);
signal smoofangels_I,smoofangels_Q:std_logic_vector(NBIT+rx_p_I'Length-1 downto 0);

--signal rx_p_I,rx_p_Q:std_logic_vector(15 downto 0);
--signal Rout	: unsigned(19 downto 0);
--signal Aout	: signed(19 downto 0);

--signal angle_pilot_ce_W:std_logic_vector(0 to 20);


signal WAIT_FREQ_FIN_need:std_logic;

--signal phase_out,x_out:std_logic_vector(15 downto 0);
signal rdy_phase:std_logic;

signal sum_mult_preangle:std_logic;
signal angels_to_sum_sum_I,angels_to_sum_sum_Q:std_logic_vector(NBITm1+log2roundup(PILOT_LEN*2) downto 0);
signal angels_to_sum_sum_I_uns,angels_to_sum_sum_Q_uns:std_logic_vector(NBITm1+log2roundup(PILOT_LEN*2) downto 0);
signal angels_to_sum_sum_div,angels_to_sum_sum_I_choose,angels_to_sum_sum_Q_choose:std_logic_vector(NBITm1+log2roundup(PILOT_LEN*2) downto 0);
signal angels_to_sum_sum_divB_w1,angels_to_sum_sum_divB,angels_to_sum_sum_I_choose2,angels_to_sum_sum_Q_choose2:std_logic_vector(2*angels_to_sum_sum_I_choose'Length-1 downto 0);
signal angels_to_sum_sum_div2,angels_to_sum_sum_div3,pi_div_2_val:std_logic_vector(NBITm1+log2roundup(PILOT_LEN*2) downto 0);
signal need_pi2_sub,div_done_w2,div_done_w1,div_done,div_sign,div_done2:std_logic;


signal sum_mult_preangle_cnt:std_logic_vector(log2roundup(PILOT_LEN*2)-1 downto 0);
signal calc_angle_ce,calc_angle_ce_choose2,calc_angle_ce_choose,calc_angle_ce_w1:std_logic;

signal calc_angle_ce_W:std_logic_vector(0 to 20+22);
signal freq_calc_fin_w1,freq_calc_fin,freq_calc_fin_pre:std_logic;
signal a_calc_ce:std_logic;
signal a_calc_ce_cnt:std_logic_vector(4 downto 0):=(others=>'0');
signal smp_cnt:integer;

signal pilot_valid:std_logic;
signal pilot_valid_cnt:std_logic_vector(log2roundup(PILOT_LEN*InterpolateRate)-1 downto 0);
signal sampleI_pilot,sampleQ_pilot:std_logic_vector(15 downto 0);

signal analog_pilotII,analog_pilotQQ,analog_pilotIQ,analog_pilotQI:std_logic_vector(31 downto 0);
signal analog_pilotmskI,analog_pilotmskQ:std_logic_vector(16 downto 0);
signal pilot_start_W:std_logic_vector(32 downto 0);
signal pilot_start_work:std_logic;

type Tdelay_samples is array(32 downto 0) of std_logic_vector(i_samplesI'Length-1 downto 0);
signal test_samplesI,test_samplesQ:std_logic_vector(i_samplesI'Length-1 downto 0);
signal delay_samplesI,delay_samplesQ:Tdelay_samples;

begin


maketab: for i in 0 to PILOT_LEN*InterpolateRate/2-1 generate
	maketab_ceil: div_tab(i)<=div_table_ceil(PILOT_LEN*InterpolateRate,i,div_tab(0)'Length);
end generate;

smp_cnt<=conv_integer(samples_cnt(samples_cnt'Length-1 downto log2roundup(InterpolateRate)));

s_pilotI<=conv_std_logic_vector(1,s_pilotI'Length) when PILOT_I(PILOT_LEN-1-conv_integer(samples_cnt(samples_cnt'Length-1 downto log2roundup(InterpolateRate))) )    ='1' else conv_std_logic_vector(-1,s_pilotI'Length);
sc_pilotQ<=conv_std_logic_vector(1,s_pilotI'Length) when PILOT_Q(PILOT_LEN-1-conv_integer(samples_cnt(samples_cnt'Length-1 downto log2roundup(InterpolateRate))) )    ='0' else conv_std_logic_vector(-1,s_pilotI'Length);

b_s_pilotI<=PILOT_I(PILOT_LEN-1-conv_integer(samples_cnt(samples_cnt'Length-1 downto log2roundup(InterpolateRate))) );
b_sc_pilotQ<=not PILOT_Q(PILOT_LEN-1-conv_integer(samples_cnt(samples_cnt'Length-1 downto log2roundup(InterpolateRate))) );

--s_pilotI<=conv_std_logic_vector(1,s_pilotI'Length) when PILOT_I(conv_integer(samples_cnt(samples_cnt'Length-1 downto log2roundup(InterpolateRate))) )    ='1' else conv_std_logic_vector(-1,s_pilotI'Length);
--sc_pilotQ<=conv_std_logic_vector(1,s_pilotI'Length) when PILOT_Q(conv_integer(samples_cnt(samples_cnt'Length-1 downto log2roundup(InterpolateRate))) )    ='0' else conv_std_logic_vector(-1,s_pilotI'Length);


s_pilotIn<="00";--not(PILOT_I(PILOT_LEN-1-conv_integer(samples_cnt(samples_cnt'Length-1 downto log2roundup(InterpolateRate))) ))&"1";
sc_pilotQn<="00";--PILOT_Q(PILOT_LEN-1-conv_integer(samples_cnt(samples_cnt'Length-1 downto log2roundup(InterpolateRate))))&"1";

pilot_upper_i: entity work.pilot_upper
	port map(
		clk =>clk,
		reset =>pilot_start_W(2*InterpolateRate),--reset,

		pilot_valid=>open,--pilot_valid,
		sampleI_o =>sampleI_pilot,
		sampleQ_o =>sampleQ_pilot
		);

pilot_start_work<=pilot_start_W(7*InterpolateRate-1) when stm=WAITING else '0';
make_pilotmsk:process (clk)
begin		
	if rising_edge(clk) then
		i_ce_w1<=i_ce;
		i_ce_w2<=i_ce_w1;	
		i_ce_w3<=i_ce_w2;

		pilot_start_W<=pilot_start_W(pilot_start_W'Length-2 downto 0)&pilot_start;

delay_samplesI(0)<=i_samplesI;
delay_samplesQ(0)<=i_samplesQ;

		for i in 0 to 32-1 loop
			delay_samplesI(i+1)<=delay_samplesI(i);
			delay_samplesQ(i+1)<=delay_samplesQ(i);
		end loop;


		if pilot_start_work='1' then
			pilot_valid<='1';
			pilot_valid_cnt<=(others=>'0');
--			if i_ce='1' then
--				pilotII<=signed(i_samplesI)*signed(s_pilotI);
--				pilotQQ<=signed(i_samplesQ)*signed(sc_pilotQ); --# make conj(pilot)
--				pilotIQ<=signed(i_samplesI)*signed(sc_pilotQ); --# make conj(pilot)
--				pilotQI<=signed(i_samplesQ)*signed(s_pilotI);

--				pilotII<=signed(i_samplesI)*signed(not(PILOT_I(0))&'1');
--				pilotQQ<=signed(i_samplesQ)*signed((PILOT_Q(0))&'1'); --# make conj(pilot)
--				pilotIQ<=signed(i_samplesI)*signed((PILOT_Q(0))&'1'); --# make conj(pilot)
--				pilotQI<=signed(i_samplesQ)*signed(not(PILOT_I(0))&'1');
--				samples_cnt<=conv_std_logic_vector(1,samples_cnt'Length);
--			else
				samples_cnt<=conv_std_logic_vector(0,samples_cnt'Length);
--			end if;
		else
			if unsigned(pilot_valid_cnt)<PILOT_LEN*InterpolateRate-1 then
				pilot_valid_cnt<=pilot_valid_cnt+1;
				pilot_valid<='1';
			else
				pilot_valid<='0';
			end if;


			if i_ce='1' then

				analog_pilotII<=signed(sampleI_pilot)*signed(delay_samplesI(SIG_DELAY));
				analog_pilotQQ<=signed(0-sampleQ_pilot)*signed(delay_samplesQ(SIG_DELAY));

				analog_pilotIQ<=signed(0-sampleQ_pilot)*signed(delay_samplesI(SIG_DELAY));
				analog_pilotQI<=signed(sampleI_pilot)*signed(delay_samplesQ(SIG_DELAY));



				if b_s_pilotI='0' then
					pilotII<=x"0000"-delay_samplesI(SIG_DELAY);
				else
					pilotII<=delay_samplesI(SIG_DELAY);
				end if;

				if b_sc_pilotQ='0' then
					pilotQQ<=x"0000"-delay_samplesQ(SIG_DELAY);
				else
					pilotQQ<=delay_samplesQ(SIG_DELAY);
				end if;

				if b_sc_pilotQ='0' then
					pilotIQ<=x"0000"-delay_samplesI(SIG_DELAY);
				else
					pilotIQ<=delay_samplesI(SIG_DELAY);
				end if;

				if b_s_pilotI='0' then
					pilotQI<=x"0000"-delay_samplesQ(SIG_DELAY);
				else
					pilotQI<=delay_samplesQ(SIG_DELAY);
				end if;


--				pilotII<=signed(i_samplesI)*signed(s_pilotI);
--				pilotQQ<=signed(i_samplesQ)*signed(sc_pilotQ); --# make conj(pilot)
--				pilotIQ<=signed(i_samplesI)*signed(sc_pilotQ); --# make conj(pilot)
--				pilotQI<=signed(i_samplesQ)*signed(s_pilotI);
				samples_cnt<=samples_cnt+1;
			end if;
		end if;

--		pilotmskI<=SXT(pilotII,pilotmskI'Length)-SXT(pilotQQ,pilotmskI'Length);	
--		pilotmskQ<=SXT(pilotIQ,pilotmskI'Length)+SXT(pilotQI,pilotmskI'Length);

		analog_pilotmskI<=SXT(analog_pilotII(31-5 downto 16-5),pilotmskI'Length)-SXT(analog_pilotQQ(31-5 downto 16-5),pilotmskI'Length);	
		analog_pilotmskQ<=SXT(analog_pilotIQ(31-5 downto 16-5),pilotmskI'Length)+SXT(analog_pilotQI(31-5 downto 16-5),pilotmskI'Length);

--		analog_pilotmskI<=SXT(analog_pilotII(31-3 downto 16-3),pilotmskI'Length)+SXT(analog_pilotQQ(31-3 downto 16-3),pilotmskI'Length);	
--		analog_pilotmskQ<=SXT(analog_pilotQI(31-3 downto 16-3),pilotmskI'Length)-SXT(analog_pilotIQ(31-3 downto 16-3),pilotmskI'Length);



		pilotmskI_w1<=pilotmskI;
		pilotmskQ_w1<=pilotmskQ;

		pilotmsk2I_w1<=pilotmskI;
		pilotmsk2Q_w1<=SXT(x"0000",pilotmsk2Q_w1'Length)-pilotmskQ;
	end if;
end process;

pilotmskI<=analog_pilotmskI;
pilotmskQ<=analog_pilotmskQ;

test_samplesI<=delay_samplesI(SIG_DELAY);
test_samplesQ<=delay_samplesQ(SIG_DELAY);


writepilot:process (clk)
begin		
	if rising_edge(clk) then
		i_samplesI_w1<=delay_samplesI(SIG_DELAY);
		i_samplesQ_w1<=delay_samplesQ(SIG_DELAY);


		if reset='1' then
			pwr_stm<=WAITING;
			p_wr<=(others=>'0');
			start_calc<='0';
			wr<='0';
		else
			case pwr_stm is 
			when WAITING=>
				if pilot_start_work='1' then
					
					if i_ce_w2='1' then
						wr<='1';
						pwr_stm<=INCR;
					else
						wr<='0';
						pwr_stm<=FIRST_WR;
					end if;
				else
					wr<='0';
				end if;
				p_wr<=(others=>'0');
				start_calc<='0';

				when FIRST_WR=>
					if i_ce_w2='1' then
						wr<='1';
						pwr_stm<=INCR;
					else
						wr<='0';
					end if; 
				when INCR=>
		    		if i_ce_w3='1' then
						if unsigned(p_wr)<PILOT_LEN*InterpolateRate-1 then
							p_wr<=p_wr+1;
							wr<='1';		
						else
							start_calc<='1';
							wr<='0';
							pwr_stm<=WAITING;
						end if;
						
			        else
						wr<='0';
						start_calc<='0';
					end if;
			when others=>
			end case;
		end if;

	end if;	--clk
end process;
		 

mem_engine:process (clk)
begin		
	if rising_edge(clk) then
		if wr='1' then
			memI(conv_integer(p_wr))<=pilotmskI_w1(pilotmskI_w1'Length-1 downto 1);
			memQ(conv_integer(p_wr))<=pilotmskQ_w1(pilotmskI_w1'Length-1 downto 1);
			mem2I(conv_integer(p_wr))<=pilotmsk2I_w1(pilotmskI_w1'Length-1 downto 1);
			mem2Q(conv_integer(p_wr))<=pilotmsk2Q_w1(pilotmskI_w1'Length-1 downto 1);
		end if;	
		from_m_I<=memI(conv_integer(p_rd));
		from_m_Q<=memQ(conv_integer(p_rd));
		from_m2_I<=mem2I(conv_integer(p_rd2));
		from_m2_Q<=mem2Q(conv_integer(p_rd2));
	end if;	--clk
end process;


Ml:process (clk)
begin		
	if rising_edge(clk) then
		if reset='1' then
			stm<=WAITING;
			sum_ce<='0';
			sum_ce_w1<='0';
			sum_ce_w2<='0';
			sum_ce_w3<='0';
			l_calc<='0';
			l_calc_w1<='0';
			l_calc_w2<='0';
			l_calc_w3<='0';
			l_calc_w4<='0';
			ml_sum_ce<='0';
			ml_sum_ce_w1<='0';
			angle_pilot_ce<='0';
			freq_ce<='0';
		else --# reset
			case stm is 
			when WAITING=>
				if start_calc='1' then
					stm<=ML_ARRAY_START;
					sum_ce<='1';
				else
					sum_ce<='0';
				end if;
				p_rd<=(others=>'0');
				p_rd2<=(others=>'0');
				l_cnt<=conv_std_logic_vector((PILOT_LEN*InterpolateRate)-1,l_cnt'Length);
				wind_cnt<=(others=>'0');
				ml_sum_ce<='0';
				l_calc<='1';
				first_l<='1';
				l_cnt_calc<=(others=>'0');
				WAIT_FREQ_FIN_need<='0';
				freq_ce<='0';
			when ML_ARRAY_START =>
				ml_sum_ce<='0';
				angle_pilot_ce<='0';
				if unsigned(wind_cnt)<conv_integer(l_cnt) then
					wind_cnt<=wind_cnt+1;
					p_rd<=p_rd+1;
					p_rd2<=p_rd2+1;
					l_calc<='0';
					sum_ce<='1';
				else
					sum_ce<='0';
					l_calc<='1';
					wind_cnt<=(others=>'0');
					p_rd<=l_cnt_calc+1;
					p_rd2<=(others=>'0');
					if unsigned(l_cnt)>(PILOT_LEN*InterpolateRate/2) then
						l_cnt<=l_cnt-1;
						l_cnt_calc<=l_cnt_calc+1;
						stm<=WAIT_SUM_SAVE;
						WAIT_FREQ_FIN_need<='0';
					else
						WAIT_FREQ_FIN_need<='1';
						stm<=WAIT_SUM_SAVE;
						--# дошли до конца расчета фунции ml
					end if;
				end if;
				ml_sum_ce<='0';
			when WAIT_SUM_SAVE=>
				l_calc<='0'; --# тут врем€ перемножени€
				stm<=WAIT_SUM_SAVE02;
			when WAIT_SUM_SAVE02=>
				stm<=WAIT_SUM_SAVE03; --# тут врем€ I,Q
			when WAIT_SUM_SAVE03=>
				stm<=WAIT_SUM_SAVE05; --# тут врем€ суммы в аккомул€торе
			when WAIT_SUM_SAVE05=>
				ml_sum_I<=acum_I(acum_I'Length-1-5 downto acum_I'Length-ml_sum_I'Length-5);
				ml_sum_Q<=acum_Q(acum_Q'Length-1-5 downto acum_Q'Length-ml_sum_Q'Length-5);
				ml_sum_ce<='1';
				if WAIT_FREQ_FIN_need='1' then
					stm<=WAIT_FREQ_FIN;
				else
					stm<=ML_ARRAY_START;
				end if;
				first_l<='0';
			when WAIT_FREQ_FIN=>
--				if freq_calc_fin='1' then
					stm<=WAITING;
					o_freq<=SXT(angels_to_sum_sum_div3,o_freq'Length);
					freq_ce<='1';
--				else
--					freq_ce<='0';
--				end if;
			when others=>
			end case;

            sum_ce_w1<=sum_ce;   --# ƒанные с пам€ти под sum_ce_w1 
			sum_ce_w2<=sum_ce_w1;
			sum_ce_w3<=sum_ce_w2;
			l_calc_w1<=l_calc;
			l_calc_w2<=l_calc_w1;
			l_calc_w3<=l_calc_w2;
			l_calc_w4<=l_calc_w3;  --# под l_calc_w4 - посчитанна€ сумма дл€ l
			ml_II<=signed(from_m_I)*signed(from_m2_I);   --# ѕеремноженные данные под sum_ce_w2
			ml_QQ<=signed(from_m_Q)*signed(from_m2_Q);
			ml_IQ<=signed(from_m_I)*signed(from_m2_Q);
			ml_QI<=signed(from_m_Q)*signed(from_m2_I);
			ml_I<=SXT(ml_II(ml_II'Length-1 downto ml_II'Length-NBITm1),NBIT)-SXT(ml_QQ(ml_QQ'Length-1 downto ml_QQ'Length-NBITm1),NBIT); --# нормальные I,Q под sum_ce_w3
			ml_Q<=SXT(ml_IQ(ml_II'Length-1 downto ml_II'Length-NBITm1),NBIT)+SXT(ml_QI(ml_QQ'Length-1 downto ml_QQ'Length-NBITm1),NBIT);

				if ml_sum_ce_w3='1' then
					t_ml_I<=ml_I;
					t_ml_Q<=ml_Q;
				end if;
				

			if stm/=ML_ARRAY_START and stm/=WAIT_SUM_SAVE and stm/=WAIT_SUM_SAVE02 and stm/=WAIT_SUM_SAVE03 then
				acum_I<=(others=>'0');
				acum_Q<=(others=>'0');
			else
				if sum_ce_w3='1' then
					acum_I<=acum_I+SXT(ml_I(ml_I'Length-1 downto ml_I'Length-NBIT+Ndiv),acum_I'Length);
					acum_Q<=acum_Q+SXT(ml_Q(ml_I'Length-1 downto ml_I'Length-NBIT+Ndiv),acum_I'Length);
				end if;
			end if;	
			ml_sum_ce_w1<=ml_sum_ce;
			ml_sum_ce_w2<=ml_sum_ce_w1;
			ml_sum_ce_w3<=ml_sum_ce_w2;
			first_l_w1<=first_l;
			if ml_sum_ce='1' then
				ml_sum_I_mul<=signed(div_tab(conv_integer(l_cnt_calc)))*signed(ml_sum_I);
				ml_sum_Q_mul<=signed(div_tab(conv_integer(l_cnt_calc)))*signed(ml_sum_Q);
				l_cnt_calc_to_angle<=l_cnt_calc-1;
			end if;
			if ml_sum_ce_w1='1' then

			end if;
			if ml_sum_ce_w2='1' then
				ml_sum_Q_mul_conj<=SXT("0",ml_sum_Q_mul_conj'Length)-ml_sum_Q_mul(ml_sum_Q_mul'Length-1-ML_R_BITS downto div_tab(0)'Length-ML_R_BITS);
				ml_sum_I_mul_prev<=ml_sum_I_mul(ml_sum_I_mul'Length-1-ML_R_BITS downto div_tab(0)'Length-ML_R_BITS);
				ml_sum_Q_mul_prev<=ml_sum_Q_mul(ml_sum_Q_mul'Length-1-ML_R_BITS downto div_tab(0)'Length-ML_R_BITS);

				if unsigned(l_cnt_calc)>1 then
					rx_p_II<=signed(ml_sum_I_mul_prev)*signed(ml_sum_I_mul(ml_sum_I_mul'Length-1-ML_R_BITS downto div_tab(0)'Length-ML_R_BITS));
					rx_p_QQ<=signed(ml_sum_Q_mul_conj)*signed(ml_sum_Q_mul(ml_sum_I_mul'Length-1-ML_R_BITS downto div_tab(0)'Length-ML_R_BITS));
					rx_p_IQ<=signed(ml_sum_I_mul_prev)*signed(ml_sum_Q_mul(ml_sum_I_mul'Length-1-ML_R_BITS downto div_tab(0)'Length-ML_R_BITS));
					rx_p_QI<=signed(ml_sum_Q_mul_conj)*signed(ml_sum_I_mul(ml_sum_I_mul'Length-1-ML_R_BITS downto div_tab(0)'Length-ML_R_BITS));
				end if;
			end if;
			if first_l_w1='0' and ml_sum_ce_w3='1' and ml_sum_ce_w2='0' then
				rx_p_I<=(SXT(rx_p_II(14+ML_R_BITS downto 0+ML_R_BITS),NBIT)-SXT(rx_p_QQ(14+ML_R_BITS downto 0+ML_R_BITS),NBIT));
				rx_p_Q<=(SXT(rx_p_IQ(14+ML_R_BITS downto 0+ML_R_BITS),NBIT)+SXT(rx_p_QI(14+ML_R_BITS downto 0+ML_R_BITS),NBIT));

				angle_pilot_ce<='1';
			else
				angle_pilot_ce<='0';
			end if;
		end if; --# reset
	end if;	--clk
end process;




process (clk) is
begin
	if rising_edge(clk) then
		calc_angle_ce_w1<=calc_angle_ce;
--		calc_angle_ce_W<=calc_angle_ce&calc_angle_ce_W(0 to calc_angle_ce_W'Length-2);
--		freq_calc_fin_pre<=calc_angle_ce_W(20); --# ”казываем что расчет частоты закончен
		freq_calc_fin<=freq_calc_fin_pre;
		freq_calc_fin_w1<=freq_calc_fin;
		if l_calc_w3='1' then
			l_cnt_calc_to_angle_w1<=l_cnt_calc_to_angle;
		end if;
		--if angle_pilot_ce_W(angle_pilot_ce_W'Length-1)='1' then
		if stm=WAITING then
			angels_to_sum_sum_I<=(others=>'0');
			angels_to_sum_sum_Q<=(others=>'0');
			sum_mult_preangle<='0'; --# –азрешение аккомулировани€ результата произвести smoofWindow на rx_p_I 
			sum_mult_preangle_cnt<=(others=>'0');
			calc_angle_ce<='0';			
		else --#reset by state mashine
			if angle_pilot_ce='1' and unsigned(l_cnt_calc)>1 then			
				smoofangels_I<=signed(conv_std_logic_vector(smoofWindow(conv_integer(l_cnt_calc_to_angle)),NBIT))*signed(rx_p_I);
				smoofangels_Q<=signed(conv_std_logic_vector(smoofWindow(conv_integer(l_cnt_calc_to_angle)),NBIT))*signed(rx_p_Q);
				sum_mult_preangle<='1';				
			else
				sum_mult_preangle<='0';
			end if;
			if sum_mult_preangle='1' then
				angels_to_sum_sum_I<=angels_to_sum_sum_I+SXT(smoofangels_I(smoofangels_I'Length-1 downto NBIT),angels_to_sum_sum_I'Length);
				angels_to_sum_sum_Q<=angels_to_sum_sum_Q+SXT(smoofangels_Q(smoofangels_Q'Length-1 downto NBIT),angels_to_sum_sum_Q'Length);
				if unsigned(sum_mult_preangle_cnt)<(PILOT_LEN*2-1)-2 then
					sum_mult_preangle_cnt<=sum_mult_preangle_cnt+1;
				else
					calc_angle_ce<='1';
				end if;
			else
				calc_angle_ce<='0';
			end if;
		end if; --#reset by state mashine
		
		if calc_angle_ce='1' then
			s_rx_p_I<=signed(angels_to_sum_sum_I(angels_to_sum_sum_I'Length-1 downto angels_to_sum_sum_I'Length-NBIT));
			s_rx_p_Q<=signed(angels_to_sum_sum_Q(angels_to_sum_sum_Q'Length-1 downto angels_to_sum_sum_Q'Length-NBIT));

			a_calc_ce<='1';
			a_calc_ce_cnt<=(others=>'0');
		else
			if unsigned(a_calc_ce_cnt)<20 then
				a_calc_ce_cnt<=a_calc_ce_cnt+1;
				a_calc_ce<='1';
			else
				a_calc_ce<='0';
			end if;
		end if;
		
	end if;
end process;


make_choose: process(clk) is
begin
	if rising_edge(clk) then
		--# ≈сли div_sign='0' тогда тогда поделенное значение будет положительным
		if calc_angle_ce='1' then
			div_sign<=angels_to_sum_sum_I(angels_to_sum_sum_I'Length-1) xor angels_to_sum_sum_Q(angels_to_sum_sum_Q'Length-1);
			if signed(angels_to_sum_sum_I)<0 then
				angels_to_sum_sum_I_uns<=0-angels_to_sum_sum_I;
			else
				angels_to_sum_sum_I_uns<=angels_to_sum_sum_I;
			end if;
			if signed(angels_to_sum_sum_Q)<0 then
				angels_to_sum_sum_Q_uns<=0-angels_to_sum_sum_Q;
			else
				angels_to_sum_sum_Q_uns<=angels_to_sum_sum_Q;
			end if;
		end if;
		if calc_angle_ce_w1='1' then
			if unsigned(angels_to_sum_sum_I_uns)>unsigned(angels_to_sum_sum_Q_uns) then
				angels_to_sum_sum_I_choose<=angels_to_sum_sum_I_uns;
				angels_to_sum_sum_Q_choose<=angels_to_sum_sum_Q_uns;
				need_pi2_sub<='0';  --# ≈сли '1' то тогда надо pi/2-angels_to_sum_sum_div
			else                    --# и уже это и будет арктангенсом так как число маленькое
				angels_to_sum_sum_I_choose<=angels_to_sum_sum_Q_uns;
				angels_to_sum_sum_Q_choose<=angels_to_sum_sum_I_uns;
				need_pi2_sub<='1';
			end if;
			calc_angle_ce_choose<='1';
		else
			calc_angle_ce_choose<='0';
		end if;
		angels_to_sum_sum_Q_choose2<=angels_to_sum_sum_Q_choose&EXT("0",angels_to_sum_sum_Q_choose'Length);
		angels_to_sum_sum_I_choose2<=EXT("0",angels_to_sum_sum_Q_choose'Length)&angels_to_sum_sum_I_choose;
		calc_angle_ce_choose2<=calc_angle_ce_choose;
	end if;
end process;


serial_divide_uu_inst: entity work.serial_divide_uu
  generic map( M_PP =>angels_to_sum_sum_Q_choose2'Length,           -- Size of dividend
            N_PP =>angels_to_sum_sum_Q_choose2'Length,            -- Size of divisor
            R_PP =>0,            -- Size of remainder
            S_PP =>0,            -- Skip this many bits (known leading zeros)
--            COUNT_WIDTH_PP : integer := 5;  -- 2^COUNT_WIDTH_PP-1 >= (M_PP+R_PP-S_PP-1)
            HELD_OUTPUT_PP =>1) -- Set to 1 if stable output should be held
                                            -- from previous operation, during current
                                            -- operation.  Using this option will increase
                                            -- the resource utilization (costs extra d-flip-flops.)
    port map(clk_i      =>clk,
             clk_en_i   =>'1',
             rst_i      =>reset,
             divide_i   =>calc_angle_ce_choose2,
		 		--# считаем что angels_to_sum_sum_I_choose>angels_to_sum_sum_Q_choose
             dividend_i =>angels_to_sum_sum_Q_choose2, --# если не так то помен€ем местами 
             divisor_i  =>angels_to_sum_sum_I_choose2,
		 		--# result=angels_to_sum_sum_I/angels_to_sum_sum_Q
             quotient_o =>angels_to_sum_sum_divB,
             done_o     =>div_done
    );

pi_div_2_val<="01"&EXT("0",pi_div_2_val'Length-2);
angels_to_sum_sum_div<=angels_to_sum_sum_divB(angels_to_sum_sum_div'Length-1 downto 0);

make_angleback: process(clk) is
begin
	if rising_edge(clk) then
		div_done_w1<=div_done;
		div_done_w2<=div_done_w1;
--		angels_to_sum_sum_divB_w1<=angels_to_sum_sum_divB;
		if div_done='1' and div_done_w1='0' then
			if need_pi2_sub='1' then
				angels_to_sum_sum_div2<=pi_div_2_val-angels_to_sum_sum_div;
			else
				angels_to_sum_sum_div2<=angels_to_sum_sum_div;
			end if;
			div_done2<='1';
		else
			div_done2<='0';
		end if;
		if div_done2='1' then
			if div_sign='1' then
				angels_to_sum_sum_div3<=0-angels_to_sum_sum_div2;
			else
				--# ≈сли это число разделить на 2^(angels_to_sum_sum_div2+1)
				--# то будет то что надо
				angels_to_sum_sum_div3<=angels_to_sum_sum_div2; 
			end if;
		end if;	
		freq_calc_fin_pre<=div_done2;	
	end if;
end process;


end freq_estimator;

