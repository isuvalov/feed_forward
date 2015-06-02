library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity farrow_32bit is
	generic (
		MU_SIZE:natural:=8
	);
	port(
		clk : in STD_LOGIC;
		reset : in std_logic;

		i_mu: in std_logic_vector(MU_SIZE-1 downto 0); --# signed 2.14 i.e. 15bit for fraction (signed Q0.14)
												--# when i_mu(14)='1' then i_mu(13 downto 0)=0
		i_sample: in std_logic_vector(15 downto 0);
		i_ce: in std_logic;

		o_sample: out std_logic_vector(15 downto 0);
		o_ce: out std_logic
		);
end farrow_32bit;



architecture farrow_32bit of farrow_32bit is

constant MSHFT:integer:=23;

--constant SHFT:integer:=3-1;
--constant SHFT0:integer:=2;

constant SHFT:integer:=1;
constant SHFT0:integer:=1;


constant MU_SIZE_TABLE:integer:=6;

--constant MU_SIZE:integer:=15;

--type Tinvers_nums is array(0 to 15) of std_logic_vector(15 downto 0);
--constant invers_nums:Tinvers_nums:=("0000000010000000","0000101101010110","0001100010101010","0010010111111111","0011001101010100","0100000010101001","0100110111111110","0101101101010010","0110100010100111","0111010111111100","1000001101010001","1001000010100110","1001110111111011","1010101101010000","1011100010100101","1100010111111010");

type Tinvers_nums is array(0 to 63) of std_logic_vector(24 downto 0);
constant invers_nums:Tinvers_nums:=("1000000000000000000000000","1000000000000000000000000","0000100000000000000000000","0000000110010100100010110","0000000010000000000000000","0000000000110100011011100","0000000000011001010010001","0000000000001101101001100","0000000000001000000000000","0000000000000100111111101","0000000000000011010001110",
"0000000000000010001111010","0000000000000001100101001","0000000000000001001001011","0000000000000000110110101","0000000000000000101001011","0000000000000000100000000","0000000000000000011001001","0000000000000000010100000","0000000000000000010000001","0000000000000000001101001",
"0000000000000000001010110","0000000000000000001001000","0000000000000000000111100","0000000000000000000110011","0000000000000000000101011","0000000000000000000100101","0000000000000000000100000","0000000000000000000011011","0000000000000000000011000","0000000000000000000010101",
"0000000000000000000010010","0000000000000000000010000","0000000000000000000001110","0000000000000000000001101","0000000000000000000001011","0000000000000000000001010","0000000000000000000001001","0000000000000000000001000","0000000000000000000000111","0000000000000000000000111",
"0000000000000000000000110","0000000000000000000000101","0000000000000000000000101","0000000000000000000000100","0000000000000000000000100","0000000000000000000000100","0000000000000000000000011","0000000000000000000000011","0000000000000000000000011","0000000000000000000000011",
"0000000000000000000000010","0000000000000000000000010","0000000000000000000000010","0000000000000000000000010","0000000000000000000000010","0000000000000000000000010","0000000000000000000000010","0000000000000000000000001","0000000000000000000000001","0000000000000000000000001",
"0000000000000000000000001","0000000000000000000000001","0000000000000000000000001");

--type Tcoefs is array(0 to 3) of integer;
--constant coe_m01:Tcoefs:=(5461,-16384,16384,-5461);     --# [1/6 -1/2 1/2 -1/6]
--constant coe_m02:Tcoefs:=(0	  , 16384,32767, 16384);    --# [0 1/2 -1 1/2]
--constant coe_m03:Tcoefs:=(-5461,32767,-16384,-10923);   --# [-1/6 1 -1/2 -1/3]
--constant coe_m04:Tcoefs:=(0,0,32767,0);     --# [0 0 1 0]

type Tcoefs is array(0 to 3) of std_logic_vector(31 downto 0);
constant coe_m01:Tcoefs:=(x"15555555",x"C0000000",x"40000000",x"EAAAAAAB");     --# [1/6 -1/2 1/2 -1/6] =((2**31)/6)
--constant coe_m01:Tcoefs:=(x"EAAAAAAB",x"40000000",x"C0000000",x"15555555");     --# [-1/6 1/2 -1/2 1/6] =((2**31)/6)
constant coe_m02:Tcoefs:=(x"00000000",x"C0000000",x"80000000",x"40000000");    --# [0 1/2 -1 1/2]
constant coe_m03:Tcoefs:=(x"EAAAAAAB",x"7FFFFFFF",x"C0000000",x"D5555556");   --# [-1/6 1 -1/2 -1/3]
constant coe_m04:Tcoefs:=(x"00000000",x"00000000",x"7FFFFFFF",x"00000000");     --# [0 0 1 0]



type Tdels is array(0 to 3) of std_logic_vector(15 downto 0);
signal dels:Tdels:=(others=>(others=>'0'));

type Tmuls is array(0 to 3) of std_logic_vector(47 downto 0);
signal muls_m1,muls_m2,muls_m3,muls_m4:Tmuls;


type Tsums_i is array(0 to 1) of std_logic_vector(48 downto 0);
signal sums_i_m1,sums_i_m2,sums_i_m3,sums_i_m4:Tsums_i;

signal sums_ii_m1,sums_ii_m2,sums_ii_m3,sums_ii_m4:std_logic_vector(49 downto 0);

signal mu_power4,mu_power3,mu_power2,mu_power1:std_logic_vector(MU_SIZE*4-1 downto 0);

signal inv_mul:std_logic_vector(invers_nums(0)'Length-1 downto 0);
signal mul_mu_power4,mul_mu_power3,mul_mu_power2,mul_mu_power1:std_logic_vector(inv_mul'Length+1+MU_SIZE*4-1 downto 0);

signal mulmu_m1,mulmu_m2,mulmu_m3,mulmu_m4:std_logic_vector(MU_SIZE*4+32-1 downto 0); --# 48 bit

signal mulmu_sum_1m2,mulmu_sum_3m4:std_logic_vector(32 downto 0);
signal mulmu_sum:std_logic_vector(33 downto 0);

signal s_sample:std_logic_vector(31 downto 0);

signal adr_inv_mul:std_logic_vector(MU_SIZE_TABLE-1 downto 0);

signal delay_ce:std_logic_vector(10 downto 0):=(others=>'0');
signal ss_sample:std_logic_vector(32+inv_mul'Length downto 0);

begin



make_powers_i: entity work.make_powers
	generic map(
		WIDTH=>MU_SIZE
	)
	port map(
		clk =>clk,

		i_val=>i_mu,
		i_ce=>'1',

		o_sq1=>mu_power1,  --# WIDTH*1
		o_sq2=>mu_power2,  --# WIDTH*2
		o_sq3=>mu_power3,  --# WIDTH*3
		o_sq4=>mu_power4,  --# WIDTH*4
		o_ce=>open
		);

adr_inv_mul<=mu_power1(MU_SIZE-1 downto MU_SIZE-MU_SIZE_TABLE);

process (clk) is
begin
	if rising_edge(clk) then

		inv_mul<=invers_nums(conv_integer(unsigned(mu_power1(MU_SIZE-1 downto MU_SIZE-MU_SIZE_TABLE))));

--		if i_ce='1' then
			for i in 1 to 3 loop
				if (i-1)=0 then
					dels(i)<=i_sample;
				else
					dels(i)<=dels(i-1);
				end if;
			end loop;
			for i in 0 to 3 loop
				if (i)=0 then
					muls_m1(i)<=signed(i_sample)*signed(coe_m01(i));
					muls_m2(i)<=signed(i_sample)*signed(coe_m02(i));
					muls_m3(i)<=signed(i_sample)*signed(coe_m03(i));
					muls_m4(i)<=signed(i_sample)*signed(coe_m04(i));
				else
					muls_m1(i)<=signed(dels(i))*signed(coe_m01(i));
					muls_m2(i)<=signed(dels(i))*signed(coe_m02(i));
					muls_m3(i)<=signed(dels(i))*signed(coe_m03(i));
					muls_m4(i)<=signed(dels(i))*signed(coe_m04(i));
				end if;
			end loop;
--		end if; --# ce

		sums_i_m1(0)<=SXT(muls_m1(0),49)+SXT(muls_m1(1),49);
		sums_i_m1(1)<=SXT(muls_m1(2),49)+SXT(muls_m1(3),49);
		sums_ii_m1<=SXT(sums_i_m1(0),50)+SXT(sums_i_m1(1),50);

		sums_i_m2(0)<=SXT(muls_m2(0),49)+SXT(muls_m2(1),49);
		sums_i_m2(1)<=SXT(muls_m2(2),49)+SXT(muls_m2(3),49);
		sums_ii_m2<=SXT(sums_i_m2(0),50)+SXT(sums_i_m2(1),50);

		sums_i_m3(0)<=SXT(muls_m3(0),49)+SXT(muls_m3(1),49);
		sums_i_m3(1)<=SXT(muls_m3(2),49)+SXT(muls_m3(3),49);
		sums_ii_m3<=SXT(sums_i_m3(0),50)+SXT(sums_i_m3(1),50);

		sums_i_m4(0)<=SXT(muls_m4(0),49)+SXT(muls_m4(1),49);
		sums_i_m4(1)<=SXT(muls_m4(2),49)+SXT(muls_m4(3),49);
		sums_ii_m4<=SXT(sums_i_m4(0),50)+SXT(sums_i_m4(1),50);

		mul_mu_power1<=signed(mu_power1)*unsigned(inv_mul);
		mul_mu_power2<=signed(mu_power2)*unsigned(inv_mul);
		mul_mu_power3<=signed(mu_power3)*unsigned(inv_mul);
		mul_mu_power4<=signed(mu_power4)*unsigned(inv_mul);


		if mu_power1(MU_SIZE-1 downto MU_SIZE-MU_SIZE_TABLE)=0 then
			mulmu_m1<=(others=>'0');
			mulmu_m2<=(others=>'0');
			mulmu_m3<=(others=>'0');
			mulmu_m4<=sums_ii_m4(49-SHFT0 downto 50-32-SHFT0)&EXT("0",MU_SIZE*4);
		else				
			mulmu_m1<=signed(sums_ii_m1(49-SHFT0 downto 50-32-SHFT0))*signed(mul_mu_power1(mul_mu_power1'Length-1-MSHFT downto mul_mu_power1'Length-MU_SIZE*4-MSHFT));
			mulmu_m2<=signed(sums_ii_m2(49-SHFT0 downto 50-32-SHFT0))*signed(mul_mu_power2(mul_mu_power1'Length-1-MSHFT downto mul_mu_power1'Length-MU_SIZE*4-MSHFT));
			mulmu_m3<=signed(sums_ii_m3(49-SHFT0 downto 50-32-SHFT0))*signed(mul_mu_power3(mul_mu_power1'Length-1-MSHFT downto mul_mu_power1'Length-MU_SIZE*4-MSHFT));
			mulmu_m4<=signed(sums_ii_m4(49-SHFT0 downto 50-32-SHFT0))*signed(mul_mu_power4(mul_mu_power1'Length-1-MSHFT downto mul_mu_power1'Length-MU_SIZE*4-MSHFT));
		end if;				
		mulmu_sum_1m2<=SXT(mulmu_m1(mulmu_m1'Length-1-SHFT downto mulmu_m1'Length-32-SHFT),33)+SXT(mulmu_m2(mulmu_m1'Length-1-SHFT downto mulmu_m1'Length-32-SHFT),33);
		mulmu_sum_3m4<=SXT(mulmu_m3(mulmu_m1'Length-1-SHFT downto mulmu_m1'Length-32-SHFT),33)+SXT(mulmu_m4(mulmu_m1'Length-1-SHFT downto mulmu_m1'Length-32-SHFT),33);

		mulmu_sum<=SXT(mulmu_sum_1m2,34)+SXT(mulmu_sum_3m4,34);

		s_sample<=mulmu_sum(mulmu_sum'Length-1-2 downto mulmu_sum'Length-32-2);
--		s_sample<=mulmu_sum(s_sample'Length-1 downto 0);

--		s_sample<=mulmu_sum(mulmu_sum'Length-1-8 downto mulmu_sum'Length-24-8);
--		ss_sample<=signed(s_sample)*unsigned(inv_mul);

		o_sample<=s_sample(s_sample'Length-1 downto s_sample'Length-o_sample'Length); --s_sample(s_sample'Length-1 downto s_sample'Length-16);

--		o_sample<=s_sample(o_sample'Length-1+12 downto 0+12); --s_sample(s_sample'Length-1 downto s_sample'Length-16);


		delay_ce<=delay_ce(delay_ce'Length-2 downto 0)&i_ce;
		o_ce<=delay_ce(delay_ce'Length-1);

	
	end if;
end process;

	
end farrow_32bit;

--# Generate table by Matlab
--# mmua=[];
--# clc;
--# for i=0:1:15
--#     if (i==0)
--#         m_all=4*1;
--#         mmu=0;
--#         mmuf=0;
--#     else
--#         mmu=1/(i); 
--#         mmuf=0.15*mmu;
--#         m_all=mmuf^4+mmuf^3+mmuf^2+mmuf;
--#     end;
--#     mmua=[mmua m_all];
--# %      fprintf('%i %f --> %f => %i(%i)\n',i,mmu,m_all,round((1/16)*8191/m_all),ceil(log2(round((1/16)*8191/m_all))));
--#     fprintf('"%s",',num2str(dec2bin(round((1/16)*8191/m_all),16)));
--# end
--# fprintf('\n');
