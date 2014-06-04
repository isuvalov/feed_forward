library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;

--# STEP = AcumSize_dt1 = dt*(1<<FILTER_ACUM_WIDTH)

entity gadarg is
	generic(               --# PS=5.5942e+008 by signal star in input! =sum(abs(<input signal>).^2)/NS
		RM:integer:=5856428;     --# RM=1.34*PS/(4*KKK) , like target maximum of signal
		STEP:integer:=471; --# (2^(AcumLen-1)) * (2^(BitsInADC*2+RM)/(PS^2))
		KKK:integer:=5   --# ceil(log2(STEP)/2) , must be more or equal than 2
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

constant FILTER_LEN:natural:=4;
constant FILTER_COEF_WIDTH:natural:=16;
constant FILTER_ACUM_WIDTH:natural:=32;
constant FILTER_WORK_WIDTH:natural:=FILTER_ACUM_WIDTH/2;
--constant MULSUM_LATENCY:natural:=9-2;
constant MULSUM_LATENCY:natural:=2;
constant IT_SCALE:natural:=0; --# inner scale for make constant in range
constant COPY_STEP:natural:=4;

--constant RM_STEP:std_logic_vector(FILTER_ACUM_WIDTH-1 downto 0):="01010010001101001010111010111111"; --# for IT_SCALE=1
--constant RM_STEP:std_logic_vector(FILTER_ACUM_WIDTH-1 downto 0):="00101001000110100101011101011111"; --# for IT_SCALE=2
--  constant RM_STEP:std_logic_vector(FILTER_ACUM_WIDTH-1 downto 0):="00001010010001101001010111010111"; --# for IT_SCALE=2  div 4
  constant RM_STEP:std_logic_vector(FILTER_ACUM_WIDTH downto 0):="0"&x"00595CAC"; --# for IT_SCALE=2 
   


constant FILTER_ADDER_SHIFT:natural:=0;--FILTER_WORK_WIDTH;

type Tlatency_delay is array(MULSUM_LATENCY downto 0) of std_logic_vector(i_sampleI'Length-1 downto 0);
signal latency_delay_re,latency_delay_im:Tlatency_delay:=(others=>(others=>'0'));



type Tdelay_line_with_step is array(FILTER_LEN-1 downto 0) of std_logic_vector(FILTER_ACUM_WIDTH-1 downto 0);
signal delay_line_with_step_i,delay_line_with_step_q:Tdelay_line_with_step:=(others=>(others=>'0'));
signal delay_line_with_step_i_copy,delay_line_with_step_q_copy:Tdelay_line_with_step:=(others=>(others=>'0'));

type Tdelay_line is array(FILTER_LEN-1 downto 0) of std_logic_vector(i_sampleI'Length-1 downto 0);
signal delay_line_I,delay_line_Q:Tdelay_line:=(others=>(others=>'0'));
signal delay_line_I_copy,delay_line_Q_copy:Tdelay_line:=(others=>(others=>'0'));

type Tcoefs is array(FILTER_LEN-1 downto 0) of std_logic_vector(FILTER_ACUM_WIDTH-1 downto 0);

--constant DEFAULT_COEFS:Tcoefs:=(others=>conv_std_logic_vector(8388608,FILTER_ACUM_WIDTH));
constant DEFAULT_COEFS:Tcoefs:=(
conv_std_logic_vector(0,FILTER_ACUM_WIDTH),
conv_std_logic_vector(0,FILTER_ACUM_WIDTH),
conv_std_logic_vector(8388608,FILTER_ACUM_WIDTH),
conv_std_logic_vector(0,FILTER_ACUM_WIDTH)
);


signal coefs_work,coefs_qq,coefs_iq,coefs_qi:Tcoefs:=DEFAULT_COEFS;
signal coefs_ii:Tcoefs:=DEFAULT_COEFS;

type Tc_mul is array(FILTER_LEN-1 downto 0) of std_logic_vector(FILTER_ACUM_WIDTH-1 downto 0);
signal c_mul_i,c_mul_q:Tc_mul:=(others=>(others=>'0'));

signal step_cnt:std_logic_vector(log2roundup(COPY_STEP)-1 downto 0);


type Tc_mul_sum is array(2*FILTER_LEN-1 downto 0) of std_logic_vector(FILTER_ACUM_WIDTH-1 downto 0);
signal c_mul_sum_i,c_mul_sum_q:Tc_mul_sum:=(others=>(others=>'0'));
signal sumed_muls_i_1w,sumed_muls_i,sumed_muls_q:std_logic_vector(FILTER_WORK_WIDTH-1 downto 0):=(others=>'0');
signal sumed_muls_i_copy,sumed_muls_q_copy:std_logic_vector(FILTER_WORK_WIDTH-1 downto 0):=(others=>'0');
signal sq_sumed_muls_i,sq_sumed_muls_q:std_logic_vector(FILTER_ACUM_WIDTH-1 downto 0):=(others=>'0');
signal vr3r:std_logic_vector(FILTER_ACUM_WIDTH downto 0):=(others=>'0');
signal vr2r,vi2r:std_logic_vector(FILTER_ACUM_WIDTH-1 downto 0):=(others=>'0');
signal vr2i,vr3i,vi3r,vi2i,vi3i:std_logic_vector(FILTER_ACUM_WIDTH-1 downto 0):=(others=>'0');

type Tshort_array is array(FILTER_LEN-1 downto 0) of std_logic_vector(FILTER_WORK_WIDTH-1 downto 0);
signal short_array,short_array0:Tshort_array;

type TWx0_norm is array(FILTER_LEN-1 downto 0) of std_logic_vector(FILTER_ACUM_WIDTH-1 downto 0);

type TWx0_div is array(FILTER_LEN-1 downto 0) of std_logic_vector(FILTER_ACUM_WIDTH-1 downto 0);
type TWx_div is array(FILTER_LEN-1 downto 0) of std_logic_vector(FILTER_ACUM_WIDTH-1 downto 0);
signal WR0r_div,WR0i_div,WI0r_div,WI0i_div:TWx0_div:=(others=>(others=>'0'));
--signal WR0r_div_1w,WR0i_div_1w,WI0r_div_1w,WI0i_div_1w:TWx0_div:=(others=>(others=>'0'));
signal WR0r_div_1w,WR0i_div_1w,WI0r_div_1w,WI0i_div_1w:TWx0_norm:=(others=>(others=>'0'));
signal WRr,WRi,WIr,WIi:TWx_div:=(others=>(others=>'0'));

signal vr2r_mul,vi2r_mul,vr2i_mul,vi2i_mul:std_logic_vector(FILTER_WORK_WIDTH+FILTER_ACUM_WIDTH-1 downto 0):=(others=>'0');

type Tstm is (GET_SAMPLES,WORKING,COPING);
signal stm:Tstm;
signal sampl_cnt:std_logic_vector(log2roundup(FILTER_LEN+MULSUM_LATENCY) downto 0);
signal work_cnt:std_logic_vector(log2roundup(FILTER_LEN+MULSUM_LATENCY) downto 0);

signal reset_local,reset_reg:std_logic:='1';

begin


process (clk) is
begin		
	if rising_edge(clk) then
		if reset='1' then
			reset_reg<='1';
		else
			if i_ce='1' then
				reset_reg<='0';
			end if;			
		end if;
		reset_local<=reset_reg;

		if reset_local='1' then
			stm<=GET_SAMPLES;
			sampl_cnt<=(others=>'0');
		else --# reset			
			case stm is
			when GET_SAMPLES=>
				if i_ce='1' then
					if unsigned(sampl_cnt)<FILTER_LEN+MULSUM_LATENCY then
						sampl_cnt<=sampl_cnt+1;
					else
						stm<=WORKING;
					end if;
				end if;
				work_cnt<=(others=>'0');
			when WORKING=>
				if i_ce='1' then
					if unsigned(work_cnt)<MULSUM_LATENCY+4 then
						work_cnt<=work_cnt+1;
					else
						stm<=COPING;
					end if;
				end if;
				sampl_cnt<=(others=>'0');
			when COPING=>
	           stm<=GET_SAMPLES;
			when others=>
			end case;

	
			if step_cnt=0 then
				delay_line_with_step_i_copy<=delay_line_with_step_i;
				delay_line_with_step_q_copy<=delay_line_with_step_q;
				delay_line_I_copy<=delay_line_I;
				delay_line_Q_copy<=delay_line_Q;
			end if;
			if step_cnt=7 then
				sumed_muls_i_copy<=sumed_muls_i;
				sumed_muls_q_copy<=sumed_muls_q;
			end if;

		end if; --# reset
	end if;
end process;


process (clk) is
begin		
	if rising_edge(clk) then
--		if reset='1' then
--			delay_line_with_step_i<=(others=>(others=>'0'));
--			delay_line_with_step_q<=(others=>(others=>'0'));
--			delay_line_I<=(others=>(others=>'0'));
--			delay_line_Q<=(others=>(others=>'0'));
		if i_ce='1' and reset_local='0' then --and stm=GET_SAMPLES then
			delay_line_I(0)<=rats(i_sampleI);--latency_delay_re(MULSUM_LATENCY-1);--i_sampleI;
			delay_line_Q(0)<=rats(i_sampleQ);--latency_delay_im(MULSUM_LATENCY-1);

			latency_delay_re(0)<=rats(i_sampleI);
			latency_delay_im(0)<=rats(i_sampleQ);
			for i in 0 to MULSUM_LATENCY-1 loop
				latency_delay_re(i+1)<=latency_delay_re(i);
				latency_delay_im(i+1)<=latency_delay_im(i);			
			end loop;


			delay_line_with_step_i(0)<=signed(latency_delay_re(MULSUM_LATENCY-1))*signed(conv_std_logic_vector(STEP,16));
			delay_line_with_step_q(0)<=signed(latency_delay_im(MULSUM_LATENCY-1))*signed(conv_std_logic_vector(STEP,16));
--			delay_line_with_step_i(0)<=signed(i_sampleI)*signed(conv_std_logic_vector(STEP,16));
--			delay_line_with_step_q(0)<=signed(i_sampleQ)*signed(conv_std_logic_vector(STEP,16));

			for i in 0 to FILTER_LEN-2 loop
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

--vr2i<=vr2r;
--vr3i<=vr3r;
--vi2i<=vi2r;
--vi3i<=vi3r;

vr2r<=signed(sumed_muls_i)*signed(conv_std_logic_vector(STEP,16));
vr3r<=SXT(sq_sumed_muls_i,FILTER_ACUM_WIDTH+1)-RM*4;--RM_STEP;

www: for i in 0 to FILTER_LEN-1 generate
	WRr(i)<=SXT(WR0r_div(i)(FILTER_ACUM_WIDTH-1-KKK-IT_SCALE downto 0)&EXT("0",KKK+IT_SCALE),FILTER_ACUM_WIDTH) when signed(vr3r)>0 else
			0-SXT(WR0r_div(i)(FILTER_ACUM_WIDTH-1-KKK-IT_SCALE downto 0)&EXT("0",KKK+IT_SCALE),FILTER_ACUM_WIDTH);
end generate;


mainloop: process (clk) is
variable v_sumed_muls_i,v_sumed_muls_q:std_logic_vector(c_mul_i(0)'Length-1 downto 0);
variable v_vr2r_mul:std_logic_vector(vr2r_mul'Length-1 downto 0);
variable v_WRr:TWx_div:=(others=>(others=>'0'));
variable v_vr2r:std_logic_vector(vr2r'Length-1 downto 0);
variable v_vr3r:std_logic_vector(FILTER_ACUM_WIDTH downto 0):=(others=>'0');
variable v_WR0r_div:TWx0_div:=(others=>(others=>'0'));
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
					c_mul_i(i)<=signed(coefs_work(i)(FILTER_ACUM_WIDTH-1 downto FILTER_WORK_WIDTH))*signed(delay_line_I(i));
					c_mul_q(i)<=signed(coefs_work(i)(FILTER_ACUM_WIDTH-1 downto FILTER_WORK_WIDTH))*signed(delay_line_Q(i));
				end loop;
                v_sumed_muls_i:=c_mul_i(0)+c_mul_i(1)+c_mul_i(2)+c_mul_i(3);
                v_sumed_muls_q:=c_mul_q(0)+c_mul_q(1)+c_mul_q(2)+c_mul_q(3);
				sumed_muls_i<=v_sumed_muls_i(FILTER_ACUM_WIDTH-1 downto FILTER_WORK_WIDTH); --# sumed_muls =I(k)
				sumed_muls_q<=v_sumed_muls_q(FILTER_ACUM_WIDTH-1 downto FILTER_WORK_WIDTH); --# sumed_muls =I(k)
				-------------------

				-------------------
				--# result latency=7 from signal
				sq_sumed_muls_i<=signed(sumed_muls_i)*signed(sumed_muls_i);
				sq_sumed_muls_q<=signed(sumed_muls_q)*signed(sumed_muls_q);

--                o_sampleI<=sumed_muls_i(FILTER_WORK_WIDTH-1 downto FILTER_WORK_WIDTH-o_sampleI'Length);
--                o_sampleQ<=sumed_muls_q(FILTER_WORK_WIDTH-1 downto FILTER_WORK_WIDTH-o_sampleI'Length);
--				  o_sampleI<=sumed_muls_i(FILTER_ACUM_WIDTH-1-FILTER_ADDER_SHIFT downto FILTER_WORK_WIDTH-FILTER_ADDER_SHIFT);
--				  o_sampleQ<=sumed_muls_i(FILTER_ACUM_WIDTH-1-FILTER_ADDER_SHIFT downto FILTER_WORK_WIDTH-FILTER_ADDER_SHIFT);
				  o_sampleI<=sumed_muls_i(FILTER_WORK_WIDTH-1 downto 0);
				  o_sampleQ<=sumed_muls_q(FILTER_WORK_WIDTH-1 downto 0);

--                o_sampleI<=sq_sumed_muls_i(o_sampleI'Length-1+FILTER_ADDER_SHIFT/2 downto 0+FILTER_ADDER_SHIFT/2);
--                o_sampleQ<=sq_sumed_muls_q(o_sampleI'Length-1+FILTER_ADDER_SHIFT/2 downto 0+FILTER_ADDER_SHIFT/2);

				-------------------
				--# result of this have latency=7
				sumed_muls_i_1w<=sumed_muls_i;
--				v_vr2r:=signed(sumed_muls_i)*signed(conv_std_logic_vector(STEP,16));

				--# result latency=8 from signal
--				v_vr2r_mul:=signed(SXT(sq_sumed_muls_i(sq_sumed_muls_i'Length-1 downto 0),FILTER_ACUM_WIDTH))*signed(conv_std_logic_vector(STEP,16));
--                v_vr3r:=SXT(sq_sumed_muls_i,FILTER_ACUM_WIDTH+1)-RM*4;--RM_STEP;

				--# because max latency=8 =>use (8-1)=7
				for i in 0 to FILTER_LEN-1 loop 
					--# MULSUM_LATENCY+2 because have addition square and minus
					--v_WR0r_div(i):=signed(vr2r(FILTER_ACUM_WIDTH-1 downto FILTER_WORK_WIDTH))*signed(delay_line_with_step_i(i)(FILTER_ACUM_WIDTH-1 downto FILTER_WORK_WIDTH)); --# vr2r*vr1r
					WR0r_div(i)<=signed(vr2r(FILTER_ACUM_WIDTH-1 downto FILTER_WORK_WIDTH))*signed(delay_line_with_step_i(i)(FILTER_ACUM_WIDTH-1 downto FILTER_WORK_WIDTH)); --# vr2r*vr1r
					short_array0(i)<=vr2r(FILTER_ACUM_WIDTH-1 downto FILTER_WORK_WIDTH);
--					WR0r_div_1w(i)<=WR0r_div(i)(WR0r_div(i)'Length-1 downto FILTER_ACUM_WIDTH);
					WR0r_div_1w(i)<=WR0r_div(i);--(FILTER_ACUM_WIDTH-1+KKK-IT_SCALE downto FILTER_WORK_WIDTH+KKK-IT_SCALE);
					--# but may be it can be cut... because we have some KKK  ... !!!!!!!!!!!!!!!!!!!!!!
				    --if signed(vr3r)>0 then
					--	v_WRr(i):=SXT(WR0r_div(i)(FILTER_ACUM_WIDTH-1-KKK-IT_SCALE downto 0)&EXT("0",KKK+IT_SCALE),FILTER_ACUM_WIDTH);
					--else
					--	v_WRr(i):=0-SXT(WR0r_div(i)(FILTER_ACUM_WIDTH-1-KKK-IT_SCALE downto 0)&EXT("0",KKK+IT_SCALE),FILTER_ACUM_WIDTH);
					--end if;
--					WRr(i)<=signed(WR0r_div_1w(i))*signed(vr3r(FILTER_ACUM_WIDTH-1 downto FILTER_WORK_WIDTH));
					short_array(i)<=vr3r(FILTER_ACUM_WIDTH-1 downto FILTER_WORK_WIDTH);
				end loop;
				-------------------
				--#===============================
--				if step_cnt=COPY_STEP-1 then
--				if stm=COPING then
			 	for i in 0 to FILTER_LEN-1 loop 
--				  coefs_work(i)<=coefs_ii(i)-SXT(WRr(i)(coefs_work(i)'Length-1+KKK downto KKK),FILTER_WORK_WIDTH+FILTER_ACUM_WIDTH);
--				  coefs_work(i)<=coefs_ii(i)-SXT(WRr(i)(WRr(i)'Length-1 downto WRr(i)'Length-coefs_work(i)'Length+KKK),coefs_work(i)'Length);
		  coefs_work(i)<=coefs_work(i)-WRr(i);
		  coefs_ii(i)<=v_WRr(i);

--		  coefs_work(i)<=coefs_work(i)-SXT(WRr(i)(WRr(i)'Length-1 downto 14-KKK-5),FILTER_ACUM_WIDTH);
--		  coefs_ii(i)<=SXT(WRr(i)(WRr(i)'Length-1 downto 14-KKK-5),FILTER_ACUM_WIDTH);


				end loop;
--			end if;	
			end if; --# i_ce

		end if;  --# reset

		


		if i_ce='1' then
		end if;	 --# i_ce


	end if;
end process;

	
end gadarg;
