library IEEE;
use IEEE.STD_LOGIC_1164.all;   
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.std_logic_arith.all;

entity bih_filter_integrator is
	generic(
		ALPHA_NUM:natural:=2;  --# ����������� ��������������, ��� �� ������ ��� ������� ������� ������
		SCALE_FACTOR:natural:=5;  --# ������ - ��� �� ������ ��� ������ �������� �� ������
		WIDTH:natural:=16
	);
	port(
		clk : in std_logic;
		
		ce : in std_logic;
		sample : in std_logic_vector(WIDTH-1 downto 0); --# this is signed value!!!

		filtered: out std_logic_vector(WIDTH-1 downto 0);
		ce_out : out std_logic
	);
end bih_filter_integrator;

architecture bih_filter_integrator of bih_filter_integrator is


	FUNCTION log2roundup (data_value : integer) RETURN integer IS		
		VARIABLE width       : integer := 0;
		VARIABLE cnt         : integer := 1;
		CONSTANT lower_limit : integer := 1;
		CONSTANT upper_limit : integer := 8;		
	BEGIN
		IF (data_value <= 1) THEN
			width   := 0;
		ELSE
			WHILE (cnt < data_value) LOOP
				width := width + 1;
				cnt   := cnt *2;
			END LOOP;
		END IF;
		RETURN width;
	END log2roundup;


signal acum_p,acum,acum_w1,acum0: std_logic_vector(2*WIDTH+log2roundup(ALPHA_NUM)-1 downto 0):=(others=>'0');
signal ce_w3,ce_w2,ce_w1:std_logic;
signal sample_w1,sample_w2 : std_logic_vector(WIDTH-1 downto 0);
begin

process (clk) is
begin
	if rising_edge(clk) then
--		if reset='1' then
--			acum<=(others=>'0');
--			ce_w1<='0';
--			ce_w2<=ce_w1;
--			ce_out<='0';
--			acum_w1<=(others=>'0');
--		else
			
			ce_w1<=ce;
			ce_w2<=ce_w1;
			ce_w3<=ce_w2;
			if ce='1' then
				acum0<=SXT(acum(acum'Length-1 downto ALPHA_NUM),acum0'Length);
				acum_w1<=acum;
				sample_w1<=sample;
			end if;
			if ce_w1='1' then
				acum_p<=signed(acum_w1)-signed(acum0);
				sample_w2<=sample_w1;
			end if;
			if ce_w2='1' then				
				acum<=signed(acum_p)+unsigned(sample_w2);
			end if;

			filtered<=acum(filtered'Length-1+SCALE_FACTOR+log2roundup(ALPHA_NUM)-1 downto SCALE_FACTOR+log2roundup(ALPHA_NUM)-1);
			ce_out<=ce_w3;
--		end if; --# reset
	end if;
end process;



end bih_filter_integrator;
	