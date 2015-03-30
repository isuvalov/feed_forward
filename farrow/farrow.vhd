library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity farrow is
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
end farrow;



architecture farrow of farrow is

constant MSHFT:integer:=23;

constant SHFT:integer:=3;
constant SHFT0:integer:=2;

constant MU_SIZE_TABLE:integer:=6;

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

type Tcoefs is array(0 to 3) of integer;
constant coe_m01:Tcoefs:=(5461,-16384,16384,-5461);     --# [1/6 -1/2 1/2 -1/6]
--constant coe_m01:Tcoefs:=(-5461,16384,-16384,5461);     --# [1/6 -1/2 1/2 -1/6]
constant coe_m02:Tcoefs:=(0	  , 16384,32767, 16384);    --# [0 1/2 -1 1/2]
constant coe_m03:Tcoefs:=(-5461,32767,-16384,-10923);   --# [-1/6 1 -1/2 -1/3]
constant coe_m04:Tcoefs:=(0,0,32767,0);     --# [0 0 1 0]

type Tdels is array(0 to 3) of std_logic_vector(15 downto 0);
signal dels:Tdels:=(others=>(others=>'0'));

type Tmuls is array(0 to 3) of std_logic_vector(31 downto 0);
signal muls_m1,muls_m2,muls_m3,muls_m4:Tmuls;


type Tsums_i is array(0 to 1) of std_logic_vector(32 downto 0);
signal sums_i_m1,sums_i_m2,sums_i_m3,sums_i_m4:Tsums_i;

signal sums_ii_m1,sums_ii_m2,sums_ii_m3,sums_ii_m4:std_logic_vector(33 downto 0);


signal mulmu_m1,mulmu_m2,mulmu_m3,mulmu_m4:std_logic_vector(16+16-1 downto 0); --# 32 bit

--signal mulmu_sum_1m2,mulmu_sum_3m4:std_logic_vector(16 downto 0);
signal mulmu_sum_1m2,mulmu_sum_3m4:std_logic_vector(23 downto 0);
signal mulmu_sum:std_logic_vector(24 downto 0);

signal s_sample:std_logic_vector(15 downto 0);

signal sums_reg_1m2,sums_reg_3m4:std_logic_vector(16 downto 0);
signal inv_mul:std_logic_vector(invers_nums(0)'Length-1 downto 0);
signal ss_sample:std_logic_vector(32 downto 0);

signal adr_inv_mul:std_logic_vector(MU_SIZE_TABLE-1 downto 0);

signal mu_power4,mu_power3,mu_power2,mu_power1:std_logic_vector(MU_SIZE*4-1 downto 0);
signal mul_mu_power4,mul_mu_power3,mul_mu_power2,mul_mu_power1:std_logic_vector(inv_mul'Length+1+MU_SIZE*4-1 downto 0);

begin




adr_inv_mul<=mu_power1(MU_SIZE-1 downto MU_SIZE-MU_SIZE_TABLE);


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


process (clk) is
begin
	if rising_edge(clk) then

		inv_mul<=invers_nums(conv_integer(unsigned(mu_power1(MU_SIZE-1 downto MU_SIZE-MU_SIZE_TABLE))));

		if i_ce='1' then
			for i in 1 to 3 loop
				if (i-1)=0 then
					dels(i)<=i_sample;
				else
					dels(i)<=dels(i-1);
				end if;
			end loop;
			for i in 0 to 3 loop
				if (i)=0 then
					muls_m1(i)<=signed(i_sample)*signed(conv_std_logic_vector(coe_m01(i),16));
					muls_m2(i)<=signed(i_sample)*signed(conv_std_logic_vector(coe_m02(i),16));
					muls_m3(i)<=signed(i_sample)*signed(conv_std_logic_vector(coe_m03(i),16));
					muls_m4(i)<=signed(i_sample)*signed(conv_std_logic_vector(coe_m04(i),16));
				else
					muls_m1(i)<=signed(dels(i))*signed(conv_std_logic_vector(coe_m01(i),16));
					muls_m2(i)<=signed(dels(i))*signed(conv_std_logic_vector(coe_m02(i),16));
					muls_m3(i)<=signed(dels(i))*signed(conv_std_logic_vector(coe_m03(i),16));
					muls_m4(i)<=signed(dels(i))*signed(conv_std_logic_vector(coe_m04(i),16));
				end if;
			end loop;
		end if; --# ce

		sums_i_m1(0)<=SXT(muls_m1(0),33)+SXT(muls_m1(1),33);
		sums_i_m1(1)<=SXT(muls_m1(2),33)+SXT(muls_m1(3),33);
		sums_ii_m1<=SXT(sums_i_m1(0),34)+SXT(sums_i_m1(1),34);

		sums_i_m2(0)<=SXT(muls_m2(0),33)+SXT(muls_m2(1),33);
		sums_i_m2(1)<=SXT(muls_m2(2),33)+SXT(muls_m2(3),33);
		sums_ii_m2<=SXT(sums_i_m2(0),34)+SXT(sums_i_m2(1),34);

		sums_i_m3(0)<=SXT(muls_m3(0),33)+SXT(muls_m3(1),33);
		sums_i_m3(1)<=SXT(muls_m3(2),33)+SXT(muls_m3(3),33);
		sums_ii_m3<=SXT(sums_i_m3(0),34)+SXT(sums_i_m3(1),34);

		sums_i_m4(0)<=SXT(muls_m4(0),33)+SXT(muls_m4(1),33);
		sums_i_m4(1)<=SXT(muls_m4(2),33)+SXT(muls_m4(3),33);
		sums_ii_m4<=SXT(sums_i_m4(0),34)+SXT(sums_i_m4(1),34);
		

		mul_mu_power1<=signed(mu_power1)*unsigned(inv_mul);
		mul_mu_power2<=signed(mu_power2)*unsigned(inv_mul);
		mul_mu_power3<=signed(mu_power3)*unsigned(inv_mul);
		mul_mu_power4<=signed(mu_power4)*unsigned(inv_mul);


		mulmu_m1<=signed(sums_ii_m1(33-SHFT0 downto 34-16-SHFT0))*signed(mul_mu_power1(mul_mu_power1'Length-1-MSHFT downto mul_mu_power1'Length-16-MSHFT));
		mulmu_m2<=signed(sums_ii_m2(33-SHFT0 downto 34-16-SHFT0))*signed(mul_mu_power2(mul_mu_power1'Length-1-MSHFT downto mul_mu_power1'Length-16-MSHFT));
		mulmu_m3<=signed(sums_ii_m3(33-SHFT0 downto 34-16-SHFT0))*signed(mul_mu_power3(mul_mu_power1'Length-1-MSHFT downto mul_mu_power1'Length-16-MSHFT));
		mulmu_m4<=signed(sums_ii_m4(33-SHFT0 downto 34-16-SHFT0))*signed(mul_mu_power4(mul_mu_power1'Length-1-MSHFT downto mul_mu_power1'Length-16-MSHFT));

		sums_reg_1m2<=SXT(sums_ii_m1(33-SHFT0 downto 34-16-SHFT0),17)+SXT(sums_ii_m2(33-SHFT0 downto 34-16-SHFT0),17);
		sums_reg_3m4<=SXT(sums_ii_m3(33-SHFT0 downto 34-16-SHFT0),17)+SXT(sums_ii_m4(33-SHFT0 downto 34-16-SHFT0),17);
		
		mulmu_sum_1m2<=SXT(mulmu_m1(31-SHFT downto 32-24-SHFT),24)+SXT(mulmu_m2(31-SHFT downto 32-24-SHFT),24);
		mulmu_sum_3m4<=SXT(mulmu_m3(31-SHFT downto 32-24-SHFT),24)+SXT(mulmu_m4(31-SHFT downto 32-24-SHFT),24);

		mulmu_sum<=SXT(mulmu_sum_1m2,25)+SXT(mulmu_sum_3m4,25);

		s_sample<=mulmu_sum(mulmu_sum'Length-1-1 downto mulmu_sum'Length-16-1);
		o_sample<=s_sample(s_sample'Length-1 downto s_sample'Length-o_sample'Length); --s_sample(s_sample'Length-1 downto s_sample'Length-16);
	
	end if;
end process;

	
end farrow;

--# Generate table by Matlab
--# mmua=[];
--# clc;
--# for i=0:1:255
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
--# %      fprintf('%i %f --> %f => %i(%i)\n',i,mmu,m_all,round(1/m_all),ceil(log2(round(1/m_all))));
--# %      fprintf('"%s",',num2str(dec2bin(round(1/m_all),16))); if (mod(i,10)==0 && i>0) fprintf('\n'); end;
--# 
--# %      fprintf('%i %f --> %f => %i(%i)\n',i,mmu,m_all,round(m_all*4096),ceil(log2(round(m_all*4096))));
--#       fprintf('"%s",',num2str(dec2bin(round(m_all*4096),16))); if (mod(i,10)==0 && i>0) fprintf('\n'); end;
--# 
--# end
--# fprintf('\n');
