library IEEE;
use IEEE.STD_LOGIC_1164.all;   
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.std_logic_arith.all;

entity small_lf_fir is
	generic(
		SHIFT:natural:=3;
		WIDTH:natural:=16
	);
	port(
		reset : in std_logic;
		clk : in std_logic;
		
		ce : in std_logic;
		sample : in std_logic_vector(WIDTH-1 downto 0); --# this is unsigned value!!!

		filtered: out std_logic_vector(WIDTH-1 downto 0);
		good_values: out std_logic;
		ce_out : out std_logic
	);
end small_lf_fir;

architecture small_lf_fir of small_lf_fir is


constant Nfir:natural:=16;
constant Nbit:natural:=9;

type Tcoefs_ints is array(0 to Nfir-1) of integer;
type Tcoefs is array(0 to Nfir-1) of std_logic_vector(Nbit-1 downto 0);
constant coefs_ints:Tcoefs_ints:=(43,62,97,137,177,213,240,254,254,240,213,177,137,97,62,43);
signal coefs:Tcoefs;

type Tdelay_line is array(0 to Nfir-1) of std_logic_vector(WIDTH-1 downto 0);
signal delay_line:Tdelay_line:=(others=>(others=>'0'));

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


signal acum:std_logic_vector(WIDTH+log2roundup(Nfir)+Nbit-1 downto 0);
signal cnt:std_logic_vector(log2roundup(Nfir)-1 downto 0);
signal cntl:std_logic_vector(log2roundup(Nfir+1)-1 downto 0);
signal filt_end,acum_end:std_logic;
signal mult:std_logic_vector(WIDTH+Nbit-1 downto 0);

begin

convcoefs:for i in 0 to Nfir-1 generate
	ceil: coefs(i)<=conv_std_logic_vector(coefs_ints(i),Nbit);
end generate;

process (clk) is
begin
	if rising_edge(clk) then
		if ce='1' then
			delay_line(0)<=sample;
			for i in 1 to Nfir-1 loop
				delay_line(i)<=delay_line(i-1);
			end loop;
		end if;	
	end if;
end process;


process (clk) is
begin
	if rising_edge(clk) then
		if reset='1' then
			good_values<='0';
			cntl<=(others=>'0');
		else
			if ce='1' then
				if unsigned(cntl)<=Nfir then
					cntl<=cntl+1;
					good_values<='0';
				else
					good_values<='1';
				end if;
			end if;
		end if;	
	end if;
end process;


process (clk) is
begin
	if rising_edge(clk) then
		if ce='1' then
			cnt<=(others=>'0');
			acum<=(others=>'0');
			filt_end<='0';
			acum_end<='0';
			ce_out<='0';
		else
			if unsigned(cnt)<Nfir-1 then 
				if acum_end='1' then
					cnt<=cnt+1;
					acum<=acum+SXT(mult,acum'Length);
					acum_end<='0';
				else
					mult<=signed(delay_line(conv_integer(cnt)))*signed(coefs(conv_integer(cnt)));
					acum_end<='1';
				end if;
				ce_out<='0';
			else
				filt_end<='1';
				if filt_end='0' then
					filtered<=acum(acum'Length-1-SHIFT downto acum'Length-filtered'Length-SHIFT);
					ce_out<='1';
				else
					ce_out<='0';
				end if;
			end if;
		end if;	
	end if;
end process;

end small_lf_fir;
	