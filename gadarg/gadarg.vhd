library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;

--# STEP = AcumSize_dt1 = dt*(1<<FILTER_ACUM_WIDTH)

entity gadarg is
	generic(               --# PS=5.5942e+008 by signal star in input! =sum(abs(<input signal>).^2)/NS
		RM:integer:=5856428;     --# RM=1.34*PS/(4*KKK)
		STEP:integer:=471; --# (2^(AcumLen-1)) * (2^(BitsInADC*2+RM)/(PS^2))
		KKK:integer:=5   --# ceil(log2(STEP)/2)
	);
	port(
		clk : in STD_LOGIC;
		reset : in std_logic;

		i_sampleI: in std_logic_vector(15 downto 0);
		i_sampleQ: in std_logic_vector(15 downto 0);
		i_ce: in std_logic;

		o_sampleI: out std_logic_vector(15 downto 0);
		o_sampleQ: out std_logic_vector(15 downto 0)
		);
end gadarg;



architecture gadarg of gadarg is

constant FILTER_LEN:natural:=8;
constant FILTER_COEF_WIDTH:natural:=16;
constant FILTER_ACUM_WIDTH:natural:=32;
constant FILTER_WORK_WIDTH:natural:=FILTER_ACUM_WIDTH/2;
constant MULSUM_LATENCY:natural:=6-2;
constant COPY_STEP:natural:=80;





constant FILTER_ADDER_SHIFT:natural:=FILTER_WORK_WIDTH-2;

type Tlatency_delay is array(MULSUM_LATENCY-1 downto 0) of std_logic_vector(i_sampleI'Length-1 downto 0);
signal latency_delay_re,latency_delay_im:Tlatency_delay:=(others=>(others=>'0'));



type Tdelay_line_with_step is array(1+MULSUM_LATENCY+1+FILTER_LEN-1 downto 0) of std_logic_vector(FILTER_ACUM_WIDTH-1 downto 0);
signal delay_line_with_step_i,delay_line_with_step_q:Tdelay_line_with_step:=(others=>(others=>'0'));

type Tdelay_line is array(FILTER_LEN-1 downto 0) of std_logic_vector(i_sampleI'Length-1 downto 0);
signal delay_line_I,delay_line_Q:Tdelay_line:=(others=>(others=>'0'));

type Tcoefs is array(FILTER_LEN-1 downto 0) of std_logic_vector(FILTER_WORK_WIDTH+FILTER_ACUM_WIDTH-1 downto 0);


constant DEFAULT_COEFS:Tcoefs:=(
conv_std_logic_vector(0,FILTER_WORK_WIDTH+FILTER_ACUM_WIDTH),
conv_std_logic_vector(0,FILTER_WORK_WIDTH+FILTER_ACUM_WIDTH),
conv_std_logic_vector(0,FILTER_WORK_WIDTH+FILTER_ACUM_WIDTH),
--conv_std_logic_vector(RM*61,FILTER_WORK_WIDTH+FILTER_ACUM_WIDTH),
conv_std_logic_vector(354334800,FILTER_WORK_WIDTH+FILTER_ACUM_WIDTH),
conv_std_logic_vector(0,FILTER_WORK_WIDTH+FILTER_ACUM_WIDTH),
conv_std_logic_vector(0,FILTER_WORK_WIDTH+FILTER_ACUM_WIDTH),
conv_std_logic_vector(0,FILTER_WORK_WIDTH+FILTER_ACUM_WIDTH),
conv_std_logic_vector(0,FILTER_WORK_WIDTH+FILTER_ACUM_WIDTH)
);


signal coefs_work,coefs_ii,coefs_qq,coefs_iq,coefs_qi:Tcoefs:=DEFAULT_COEFS;

type Tc_mul is array(FILTER_LEN-1 downto 0) of std_logic_vector(FILTER_ACUM_WIDTH-1 downto 0);
signal c_mul_i,c_mul_q:Tc_mul:=(others=>(others=>'0'));

signal step_cnt:std_logic_vector(log2roundup(COPY_STEP)-1 downto 0);


type Tc_mul_sum is array(2*FILTER_LEN-1 downto 0) of std_logic_vector(FILTER_ACUM_WIDTH-1 downto 0);
signal c_mul_sum_i,c_mul_sum_q:Tc_mul_sum:=(others=>(others=>'0'));
signal sumed_muls_i,sumed_muls_q:std_logic_vector(FILTER_WORK_WIDTH-1 downto 0):=(others=>'0');
signal sq_sumed_muls_i,sq_sumed_muls_q:std_logic_vector(FILTER_ACUM_WIDTH-1 downto 0):=(others=>'0');
signal vr2r,vr3r,vi2r:std_logic_vector(FILTER_ACUM_WIDTH-1 downto 0):=(others=>'0');
signal vr2i,vr3i,vi3r,vi2i,vi3i:std_logic_vector(FILTER_ACUM_WIDTH-1 downto 0):=(others=>'0');


type TWx0_div is array(FILTER_LEN-1 downto 0) of std_logic_vector(FILTER_WORK_WIDTH+FILTER_ACUM_WIDTH-1 downto 0);
type TWx_div is array(FILTER_LEN-1 downto 0) of std_logic_vector(2*FILTER_WORK_WIDTH+FILTER_ACUM_WIDTH-1 downto 0);
signal WR0r_div,WR0i_div,WI0r_div,WI0i_div:TWx0_div:=(others=>(others=>'0'));
signal WRr,WRi,WIr,WIi:TWx_div:=(others=>(others=>'0'));

begin



process (clk) is
begin		
	if rising_edge(clk) then
--		if reset='1' then
--			delay_line_with_step_i<=(others=>(others=>'0'));
--			delay_line_with_step_q<=(others=>(others=>'0'));
--			delay_line_I<=(others=>(others=>'0'));
--			delay_line_Q<=(others=>(others=>'0'));
		if i_ce='1' then
			delay_line_I(0)<=latency_delay_re(MULSUM_LATENCY-1);--i_sampleI;
			delay_line_Q(0)<=latency_delay_im(MULSUM_LATENCY-1);


			latency_delay_re(0)<=i_sampleI;
			latency_delay_im(0)<=i_sampleQ;
			for i in 0 to MULSUM_LATENCY-2 loop
				latency_delay_re(i+1)<=latency_delay_re(i);
				latency_delay_im(i+1)<=latency_delay_im(i);			
			end loop;


			delay_line_with_step_i(0)<=signed(i_sampleI)*signed(conv_std_logic_vector(STEP,16));
			delay_line_with_step_q(0)<=signed(i_sampleQ)*signed(conv_std_logic_vector(STEP,16));
			for i in 0 to MULSUM_LATENCY+1+FILTER_LEN-1 loop
				delay_line_with_step_i(i+1)<=delay_line_with_step_i(i);
				delay_line_with_step_q(i+1)<=delay_line_with_step_q(i);			
			end loop;

			for i in 0 to FILTER_LEN-2 loop
				delay_line_I(i+1)<=delay_line_I(i);
				delay_line_Q(i+1)<=delay_line_Q(i);
			end loop;
		end if;
	end if;
end process;

vr2i<=vr2r;
vr3i<=vr3r;
vi2i<=vi2r;
vi3i<=vi3r;

process (clk) is
begin		
	if rising_edge(clk) then
		if reset='1' then
			coefs_ii<=DEFAULT_COEFS;
			coefs_qq<=DEFAULT_COEFS;
			coefs_iq<=DEFAULT_COEFS;
			coefs_qi<=DEFAULT_COEFS;
			step_cnt<=conv_std_logic_vector(COPY_STEP-1,step_cnt'Length);
		else    --# reset
			if i_ce='1' then
				if unsigned(step_cnt)>0 then
					step_cnt<=step_cnt-1;
				else
					step_cnt<=conv_std_logic_vector(COPY_STEP-1,step_cnt'Length);
				end if;
			
				for i in 0 to FILTER_LEN-1 loop
					c_mul_i(i)<=signed(coefs_work(i)(FILTER_WORK_WIDTH-1 downto 0))*signed(delay_line_I(i));
					c_mul_q(i)<=signed(coefs_work(i)(FILTER_WORK_WIDTH-1 downto 0))*signed(delay_line_Q(i));
				end loop;
				--# to-do: Надо засумировать каждую с  c_mul_i и c_mul_q



				--# (1)sum of sums, result of this have latency=2
				c_mul_sum_i(0)<=SXT(c_mul_i(0)(FILTER_ACUM_WIDTH-1 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH),FILTER_ACUM_WIDTH)+
						SXT(c_mul_i(1)(FILTER_ACUM_WIDTH-1 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH),FILTER_ACUM_WIDTH);
	        
				c_mul_sum_i(1)<=SXT(c_mul_i(2)(FILTER_ACUM_WIDTH-1 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH),FILTER_ACUM_WIDTH)+
						SXT(c_mul_i(3)(FILTER_ACUM_WIDTH-1 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH),FILTER_ACUM_WIDTH);
	        
				c_mul_sum_i(2)<=SXT(c_mul_i(3)(FILTER_ACUM_WIDTH-1 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH),FILTER_ACUM_WIDTH)+
						SXT(c_mul_i(4)(FILTER_ACUM_WIDTH-1 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH),FILTER_ACUM_WIDTH);
	        
				c_mul_sum_i(3)<=SXT(c_mul_i(5)(FILTER_ACUM_WIDTH-1 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH),FILTER_ACUM_WIDTH)+
						SXT(c_mul_i(6)(FILTER_ACUM_WIDTH-1 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH),FILTER_ACUM_WIDTH);
	        
				c_mul_sum_i(4)<=SXT(c_mul_i(7)(FILTER_ACUM_WIDTH-1 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH),FILTER_ACUM_WIDTH);
	        
				--# (2)sum of sums, result of this have latency=3
				c_mul_sum_i(5)<=c_mul_sum_i(0)+c_mul_sum_i(1);
				c_mul_sum_i(6)<=c_mul_sum_i(2)+c_mul_sum_i(3);
				c_mul_sum_i(7)<=c_mul_sum_i(4);
	        
				--# (3)sum of sums, result of this have latency=4
				c_mul_sum_i(8)<=c_mul_sum_i(5)+c_mul_sum_i(6);
				c_mul_sum_i(9)<=c_mul_sum_i(7);
				
				--# (4)sum of sums, result of this have latency=5
				c_mul_sum_i(10)<=c_mul_sum_i(8)+c_mul_sum_i(9);
	        
				--# (5)cut of sum and make trigger of it, result of this have latency=6 ==> MULSUM_LATENCY=6
				sumed_muls_i<=c_mul_sum_i(10)(FILTER_ACUM_WIDTH-1-FILTER_ADDER_SHIFT-2 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH-FILTER_ADDER_SHIFT-2); 		--# sumed_muls =I(k)
				-------------------

				--# (1)sum of sums, result of this have latency=2
				c_mul_sum_q(0)<=SXT(c_mul_q(0)(FILTER_ACUM_WIDTH-1 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH),FILTER_ACUM_WIDTH)+
						SXT(c_mul_q(1)(FILTER_ACUM_WIDTH-1 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH),FILTER_ACUM_WIDTH);
	        
				c_mul_sum_q(1)<=SXT(c_mul_q(2)(FILTER_ACUM_WIDTH-1 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH),FILTER_ACUM_WIDTH)+
						SXT(c_mul_q(3)(FILTER_ACUM_WIDTH-1 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH),FILTER_ACUM_WIDTH);
	        
				c_mul_sum_q(2)<=SXT(c_mul_q(3)(FILTER_ACUM_WIDTH-1 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH),FILTER_ACUM_WIDTH)+
						SXT(c_mul_q(4)(FILTER_ACUM_WIDTH-1 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH),FILTER_ACUM_WIDTH);
	        
				c_mul_sum_q(3)<=SXT(c_mul_q(5)(FILTER_ACUM_WIDTH-1 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH),FILTER_ACUM_WIDTH)+
						SXT(c_mul_q(6)(FILTER_ACUM_WIDTH-1 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH),FILTER_ACUM_WIDTH);
	        
				c_mul_sum_q(4)<=SXT(c_mul_q(7)(FILTER_ACUM_WIDTH-1 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH),FILTER_ACUM_WIDTH);
	        
				--# (2)sum of sums, result of this have latency=3
				c_mul_sum_q(5)<=c_mul_sum_q(0)+c_mul_sum_q(1);
				c_mul_sum_q(6)<=c_mul_sum_q(2)+c_mul_sum_q(3);
				c_mul_sum_q(7)<=c_mul_sum_q(4);
	        
				--# (3)sum of sums, result of this have latency=4
				c_mul_sum_q(8)<=c_mul_sum_q(5)+c_mul_sum_q(6);
				c_mul_sum_q(9)<=c_mul_sum_q(7);
				
				--# (4)sum of sums, result of this have latency=5
				c_mul_sum_q(10)<=c_mul_sum_q(8)+c_mul_sum_q(9);
	        
				--# (5)cut of sum and make trigger of it, result of this have latency=6 ==> MULSUM_LATENCY=6
				sumed_muls_q<=c_mul_sum_q(10)(FILTER_ACUM_WIDTH-FILTER_ADDER_SHIFT-1-2 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH-FILTER_ADDER_SHIFT-2); 		--# sumed_muls =I(k)


				-------------------
				--# result latency=7 from signal
				sq_sumed_muls_i<=signed(sumed_muls_i)*signed(sumed_muls_i);
				sq_sumed_muls_q<=signed(sumed_muls_q)*signed(sumed_muls_q);

                o_sampleI<=sumed_muls_i(FILTER_WORK_WIDTH-1 downto FILTER_WORK_WIDTH-o_sampleI'Length);
                o_sampleQ<=sumed_muls_q(FILTER_WORK_WIDTH-1 downto FILTER_WORK_WIDTH-o_sampleI'Length);
--                o_sampleI<=sq_sumed_muls_i(o_sampleI'Length-1+FILTER_ADDER_SHIFT/2 downto 0+FILTER_ADDER_SHIFT/2);
--                o_sampleQ<=sq_sumed_muls_q(o_sampleI'Length-1+FILTER_ADDER_SHIFT/2 downto 0+FILTER_ADDER_SHIFT/2);

				-------------------
				--# result of this have latency=7
				vr2r<=signed(sumed_muls_i)*signed(conv_std_logic_vector(STEP,16));

				--# result latency=8 from signal
                vr3r<=SXT(sq_sumed_muls_i(sq_sumed_muls_i'Length-1 downto KKK-2),FILTER_ACUM_WIDTH)-RM;

				--# because max latency=8 =>use (8-1)=7
				for i in 0 to FILTER_LEN-1 loop 
					--# MULSUM_LATENCY+2 because have addition square and minus
					WR0r_div(i)<=signed(vr2r(FILTER_ACUM_WIDTH-1 downto FILTER_WORK_WIDTH))*signed(delay_line_with_step_i(2+MULSUM_LATENCY+i));
					--# but may be it can be cut... because we have some KKK  ... !!!!!!!!!!!!!!!!!!!!!!
					WRr(i)<=signed(WR0r_div(i))*signed(vr3r(FILTER_ACUM_WIDTH-1 downto FILTER_WORK_WIDTH));
				end loop;
				-------------------
				--#vr2i=vr2r
                --#vr3i=vr3r
				for i in 0 to FILTER_LEN-1 loop 
					--# MULSUM_LATENCY+2 because have addition square and minus
					WR0i_div(i)<=signed(vr2i(FILTER_ACUM_WIDTH-1 downto FILTER_WORK_WIDTH))*signed(delay_line_with_step_q(2+MULSUM_LATENCY+i));
					--# but may be it can be cut... because we have some KKK  ... !!!!!!!!!!!!!!!!!!!!!!
					WRi(i)<=signed(WR0i_div(i))*signed(vr3i(FILTER_ACUM_WIDTH-1 downto FILTER_WORK_WIDTH));
				end loop;
				-------------------
                vi2r<=signed(sumed_muls_q)*signed(conv_std_logic_vector(STEP,16));
				vi3r<=SXT(sq_sumed_muls_q(sq_sumed_muls_i'Length-1 downto KKK-2),FILTER_ACUM_WIDTH)-RM;
				for i in 0 to FILTER_LEN-1 loop 
					--# MULSUM_LATENCY+2 because have addition square and minus
					WI0r_div(i)<=signed(vi2r(FILTER_ACUM_WIDTH-1 downto FILTER_WORK_WIDTH))*signed(delay_line_with_step_i(2+MULSUM_LATENCY+i));
					--# but may be it can be cut... because we have some KKK  ... !!!!!!!!!!!!!!!!!!!!!!
					WIr(i)<=signed(WI0r_div(i))*signed(vi3r(FILTER_ACUM_WIDTH-1 downto FILTER_WORK_WIDTH));
				end loop;
				-------------------
				--#vi2i=vi2r
				--#vi3i=vi3r
				for i in 0 to FILTER_LEN-1 loop 
					--# MULSUM_LATENCY+2 because have addition square and minus
					WI0i_div(i)<=signed(vi2i(FILTER_ACUM_WIDTH-1 downto FILTER_WORK_WIDTH))*signed(delay_line_with_step_q(2+MULSUM_LATENCY+i));
					--# but may be it can be cut... because we have some KKK  ... !!!!!!!!!!!!!!!!!!!!!!
					WIi(i)<=signed(WI0i_div(i))*signed(vi3i(FILTER_ACUM_WIDTH-1 downto FILTER_WORK_WIDTH));
				end loop;
				--#===============================
--				if step_cnt=0 then
			 	for i in 0 to FILTER_LEN-1 loop 
				  coefs_work(i)<=coefs_ii(i)-SXT(WRr(i)(coefs_work(i)'Length-1+KKK downto KKK),FILTER_WORK_WIDTH+FILTER_ACUM_WIDTH);

                	coefs_ii(i)<=coefs_ii(i)-SXT(WRr(i)(coefs_ii(i)'Length-1+KKK downto KKK),FILTER_WORK_WIDTH+FILTER_ACUM_WIDTH);
                	coefs_qq(i)<=coefs_qq(i)+SXT(WIi(i)(coefs_qq(i)'Length-1+KKK downto KKK),FILTER_WORK_WIDTH+FILTER_ACUM_WIDTH);

                	coefs_qi(i)<=coefs_qi(i)-SXT(WIr(i)(coefs_qi(i)'Length-1+KKK downto KKK),FILTER_WORK_WIDTH+FILTER_ACUM_WIDTH);
                	coefs_iq(i)<=coefs_iq(i)+SXT(WRi(i)(coefs_iq(i)'Length-1+KKK downto KKK),FILTER_WORK_WIDTH+FILTER_ACUM_WIDTH);
				end loop;
--			end if;	
			end if; --# i_ce

		end if;  --# reset




		if i_ce='1' then
		end if;	 --# i_ce


	end if;
end process;

	
end gadarg;
