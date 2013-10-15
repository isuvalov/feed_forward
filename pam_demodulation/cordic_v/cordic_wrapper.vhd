library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

--i.e. angle(0+1i)*(2^14)=(pi/2)*(2^15)=25735[matlab]=25747[cordic]

entity cordic_wrapper is
	port(
		clk : in STD_LOGIC;
		i_ce : in std_logic;		
		i_samplesI: in std_logic_vector(15 downto 0);
		i_samplesQ: in std_logic_vector(15 downto 0);

		phase: out std_logic_vector(19 downto 0)
		);
end cordic_wrapper;

--# pi/2=25748
--# -pi/2=-28563
--# pi/4=12857
--# -pi/4=2826
--# (pi/2+n)=13368 error!


--# -3/4pi=-19308
--# 3/4pi=12938
--# pi/4=6428
--# -pi/4=12803


architecture cordic_wrapper of cordic_wrapper is

--# данные по€вл€ютс€ на 16 такте

signal xx,yy,xx2,yy2: signed(16 downto 0);
--signal xx,yy: signed(32 downto 0);
signal theta_o,theta_o_p2,theta_o_p1: signed(33 downto 0);

--signal theta_o,xx,yy: signed(3 downto 0);
component cordic 
 port(
  clk: in std_logic;
  rst: in std_logic;
  x_i: in signed(16 downto 0);
  y_i: in signed(16 downto 0);
--  x_i: in signed(32 downto 0);
--  y_i: in signed(32 downto 0);

  theta_i: in signed(33 downto 0);
  
  x_o: out signed(16 downto 0);
  y_o: out signed(16 downto 0);
--  x_o: out signed(32 downto 0);
--  y_o: out signed(32 downto 0);

  theta_o: out signed(33 downto 0)
);
end component;

constant MAXBIT:natural:=32;

signal theta:signed(16 downto 0):=(others=>'0');
--signal Exx,Eyy:std_logic_vector(MAXBIT-1 downto 0);

signal sign_a:std_logic_vector(24 downto 0);
signal plus_half_pi:std_logic_vector(sign_a'Length-1 downto 0);

begin

--xx<=signed(SXT(i_samplesI&'0',xx'Length));
--yy<=signed(SXT(i_samplesQ&'0',xx'Length));

--xx<=signed(SXT(i_samplesI,xx'Length-1));
--yy<=signed(SXT(i_samplesQ,xx'Length-1));

xx2<=signed(SXT(std_logic_vector(xx(xx'Length-1 downto 1)),xx2'Length));
yy2<=signed(SXT(std_logic_vector(yy(yy'Length-1 downto 1)),xx2'Length));

process(clk) is
begin
	if rising_edge(clk) then
		sign_a<=sign_a(sign_a'Length-2 downto 0)&i_samplesQ(i_samplesQ'Length-1);
		plus_half_pi<=plus_half_pi(plus_half_pi'Length-2 downto 0)&i_samplesI(i_samplesI'Length-1);
		if i_samplesI(i_samplesI'Length-1)='1' then
			xx<=0-signed(SXT(i_samplesI,xx'Length));
		else
			xx<=signed(SXT(i_samplesI,xx'Length));
		end if;
		if i_samplesQ(i_samplesQ'Length-1)='1' then
			yy<=0-signed(SXT(i_samplesQ,yy'Length));
		else
			yy<=signed(SXT(i_samplesQ,yy'Length));
		end if;
		
--		if sign_a(sign_a'Length-2)='1' then
--			theta_o_p1<=0-theta_o;
--		else
--			theta_o_p1<=theta_o;
--		end if;

--		if plus_half_pi(plus_half_pi'Length-1)='1' then
--			if sign_a(sign_a'Length-1)='1' then
--				theta_o_p2<=theta_o_p1-(26354393);
--			else
--				theta_o_p2<=(26366681)+theta_o_p1;
--			end if;
--		else
--			theta_o_p2<=theta_o_p1;
--		end if;

		if plus_half_pi(plus_half_pi'Length-2)='1' then
			theta_o_p1<=(26366681*2)-theta_o;
		else
			theta_o_p1<=theta_o;
		end if;

        if sign_a(sign_a'Length-1)='1' then
			theta_o_p2<=0-theta_o_p1;
		else
			theta_o_p2<=theta_o_p1;
		end if;

	end if;
end process;


r2p_inst: cordic 
port map(
  clk=>clk,
  rst=>'0',
  x_i=>xx2,
  y_i=>yy2,
  theta_i=>(others=>'0'),
  
  x_o=>open,
  y_o=>open,
  theta_o=>theta_o
);

phase<=std_logic_vector(theta_o_p2(theta_o'Length-1-7 downto theta_o'Length-phase'Length-7));
--phase<=std_logic_vector(theta_o_p2(theta_o'Length-1-3 downto theta_o'Length-phase'Length-3));

end cordic_wrapper;

