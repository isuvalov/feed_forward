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
constant MULSUM_LATENCY:natural:=6;
constant COPY_STEP:natural:=8000;

type Tdelay_line_with_step is array(MULSUM_LATENCY+1+FILTER_LEN-1 downto 0) of std_logic_vector(FILTER_ACUM_WIDTH-1 downto 0);
signal delay_line_with_step_i,delay_line_with_step_q:Tdelay_line_with_step;

type Tdelay_line is array(FILTER_LEN-1 downto 0) of std_logic_vector(i_sampleI'Length-1 downto 0);
signal delay_line_I,delay_line_Q:Tdelay_line;

type Tcoefs is array(FILTER_LEN-1 downto 0) of std_logic_vector(FILTER_COEF_WIDTH-1 downto 0);
signal coefs_work,coefs_i,coefs_q:Tcoefs;

type Tc_mul is array(FILTER_LEN-1 downto 0) of std_logic_vector(FILTER_ACUM_WIDTH-1 downto 0);
signal c_mul_i,c_mul_q:Tc_mul;

signal step_cnt:std_logic_vector(log2roundup(COPY_STEP)-1 downto 0);


type Tc_mul_sum is array(2*FILTER_LEN-1 downto 0) of std_logic_vector(FILTER_ACUM_WIDTH-1 downto 0);
signal c_mul_sum_i,c_mul_sum_q:Tc_mul_sum;
signal sumed_muls_i,sumed_muls_q:std_logic_vector(FILTER_WORK_WIDTH-1 downto 0);
signal sq_sumed_muls_i,sq_sumed_muls_q:std_logic_vector(FILTER_ACUM_WIDTH-1 downto 0);
signal vr2r,vr3r,vi2r:std_logic_vector(FILTER_ACUM_WIDTH-1 downto 0);
signal vr2i,vr3i,vi3r:std_logic_vector(FILTER_ACUM_WIDTH-1 downto 0);


type TWx0_div is array(FILTER_LEN-1 downto 0) of std_logic_vector(FILTER_WORK_WIDTH+FILTER_ACUM_WIDTH-1 downto 0);
type TWx_div is array(FILTER_LEN-1 downto 0) of std_logic_vector(2*FILTER_WORK_WIDTH+FILTER_ACUM_WIDTH-1 downto 0);
signal WR0r_div,WR0i_div,WI0r_div:TWx0_div;
signal WRr,WRi,WIr:TWx_div;

begin



process (clk) is
begin		
	if rising_edge(clk) then
		if i_ce='1' then
			delay_line_I(0)<=i_sampleI;
			delay_line_Q(0)<=i_sampleQ;
			delay_line_with_step_i(0)<=signed(i_sampleI)*signed(conv_std_logic_vector(STEP,16));
			delay_line_with_step_q(0)<=signed(i_sampleQ)*signed(conv_std_logic_vector(STEP,16));
			for i in 0 to MULSUM_LATENCY+1+FILTER_LEN-1 loop
				delay_line_with_step_i(i+1)<=delay_line_with_step_i(i);
				delay_line_with_step_q(i+1)<=delay_line_with_step_q(i);			
			end loop;

			for i in 0 to FILTER_LEN-1 loop
				delay_line_I(i+1)<=delay_line_I(i);
				delay_line_Q(i+1)<=delay_line_Q(i);
			end loop;
		end if;
	end if;
end process;

vr2i<=vr2r;
vr3i<=vr3r;

process (clk) is
begin		
	if rising_edge(clk) then
		if reset='1' then
			coefs_i<=(others=>(others=>'0'));
			coefs_q<=(others=>(others=>'0'));
			step_cnt<=conv_std_logic_vector(COPY_STEP-1,step_cnt'Length);
		else    --# reset
			if i_ce='1' then
				if unsigned(step_cnt)>0 then
					step_cnt<=step_cnt-1;
				else
					step_cnt<=conv_std_logic_vector(COPY_STEP-1,step_cnt'Length);
				end if;
			
				for i in 0 to FILTER_LEN-1 loop
					c_mul_i(i)<=signed(coefs_work(i))*signed(delay_line_I(i));
					c_mul_q(i)<=signed(coefs_work(i))*signed(delay_line_Q(i));
				end loop;
				--# to-do: Надо засумировать каждую с  c_mul_i и c_mul_q



				--# (1)sum of sums, result of this have latency=2
				c_mul_sum_i(0)<=SXT(c_mul_i(0)(FILTER_ACUM_WIDTH-1 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH),FILTER_ACUM_WIDTH)+
						SXT(c_mul_i(1)(FILTER_ACUM_WIDTH-1 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH),FILTER_ACUM_WIDTH);
	        
				c_mul_sum_i(1)<=SXT(c_mul_i(2)(FILTER_ACUM_WIDTH-1 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH),FILTER_ACUM_WIDTH)+
						SXT(c_mul_i(3)(FILTER_ACUM_WIDTH-1 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH),FILTER_ACUM_WIDTH);
	        
				c_mul_sum_i(3)<=SXT(c_mul_i(3)(FILTER_ACUM_WIDTH-1 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH),FILTER_ACUM_WIDTH)+
						SXT(c_mul_i(4)(FILTER_ACUM_WIDTH-1 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH),FILTER_ACUM_WIDTH);
	        
				c_mul_sum_i(4)<=SXT(c_mul_i(5)(FILTER_ACUM_WIDTH-1 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH),FILTER_ACUM_WIDTH)+
						SXT(c_mul_i(6)(FILTER_ACUM_WIDTH-1 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH),FILTER_ACUM_WIDTH);
	        
				c_mul_sum_i(5)<=SXT(c_mul_i(7)(FILTER_ACUM_WIDTH-1 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH),FILTER_ACUM_WIDTH);
	        
				--# (2)sum of sums, result of this have latency=3
				c_mul_sum_i(6)<=c_mul_sum_i(0)+c_mul_sum_i(1);
				c_mul_sum_i(7)<=c_mul_sum_i(2)+c_mul_sum_i(3);
				c_mul_sum_i(8)<=c_mul_sum_i(4)+c_mul_sum_i(5);
	        
				--# (3)sum of sums, result of this have latency=4
				c_mul_sum_i(9)<=c_mul_sum_i(6)+c_mul_sum_i(7);
				c_mul_sum_i(10)<=c_mul_sum_i(8);
				
				--# (4)sum of sums, result of this have latency=5
				c_mul_sum_i(11)<=c_mul_sum_i(9)+c_mul_sum_i(10);
	        
				--# (5)cut of sum and make trigger of it, result of this have latency=6 ==> MULSUM_LATENCY=6
				sumed_muls_i<=c_mul_sum_i(11)(FILTER_ACUM_WIDTH-1 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH); 		--# sumed_muls =I(k)
				-------------------

				--# (1)sum of sums, result of this have latency=2
				c_mul_sum_q(0)<=SXT(c_mul_q(0)(FILTER_ACUM_WIDTH-1 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH),FILTER_ACUM_WIDTH)+
						SXT(c_mul_q(1)(FILTER_ACUM_WIDTH-1 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH),FILTER_ACUM_WIDTH);
	        
				c_mul_sum_q(1)<=SXT(c_mul_q(2)(FILTER_ACUM_WIDTH-1 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH),FILTER_ACUM_WIDTH)+
						SXT(c_mul_q(3)(FILTER_ACUM_WIDTH-1 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH),FILTER_ACUM_WIDTH);
	        
				c_mul_sum_q(3)<=SXT(c_mul_q(3)(FILTER_ACUM_WIDTH-1 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH),FILTER_ACUM_WIDTH)+
						SXT(c_mul_q(4)(FILTER_ACUM_WIDTH-1 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH),FILTER_ACUM_WIDTH);
	        
				c_mul_sum_q(4)<=SXT(c_mul_q(5)(FILTER_ACUM_WIDTH-1 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH),FILTER_ACUM_WIDTH)+
						SXT(c_mul_q(6)(FILTER_ACUM_WIDTH-1 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH),FILTER_ACUM_WIDTH);
	        
				c_mul_sum_q(5)<=SXT(c_mul_q(7)(FILTER_ACUM_WIDTH-1 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH),FILTER_ACUM_WIDTH);
	        
				--# (2)sum of sums, result of this have latency=3
				c_mul_sum_q(6)<=c_mul_sum_q(0)+c_mul_sum_q(1);
				c_mul_sum_q(7)<=c_mul_sum_q(2)+c_mul_sum_q(3);
				c_mul_sum_q(8)<=c_mul_sum_q(4)+c_mul_sum_q(5);
	        
				--# (3)sum of sums, result of this have latency=4
				c_mul_sum_q(9)<=c_mul_sum_q(6)+c_mul_sum_q(7);
				c_mul_sum_q(10)<=c_mul_sum_q(8);
				
				--# (4)sum of sums, result of this have latency=5
				c_mul_sum_q(11)<=c_mul_sum_q(9)+c_mul_sum_q(10);
	        
				--# (5)cut of sum and make trigger of it, result of this have latency=6 ==> MULSUM_LATENCY=6
				sumed_muls_q<=c_mul_sum_q(11)(FILTER_ACUM_WIDTH-1 downto FILTER_ACUM_WIDTH-FILTER_WORK_WIDTH); 		--# sumed_muls =I(k)


				-------------------
				--# result latency=7 from signal
				sq_sumed_muls_i<=signed(sumed_muls_i)*signed(sumed_muls_i);
				sq_sumed_muls_q<=signed(sumed_muls_q)*signed(sumed_muls_q);


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
					WIr(i)<=signed(WR0r_div(i))*signed(vi3r(FILTER_ACUM_WIDTH-1 downto FILTER_WORK_WIDTH));
				end loop;




			end if; --# i_ce

		end if;  --# reset




		if i_ce='1' then
		end if;	 --# i_ce


	end if;
end process;

	
end gadarg;
