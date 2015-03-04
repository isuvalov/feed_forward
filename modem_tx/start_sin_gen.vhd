library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.math_real.all;


entity start_sin_gen is
	generic (
		FREQ_FD:integer:=100; --# Frequncy of discretization
		FREQ_VAL:integer:=1; --# it means Fs=fd/freq_val, where Fs - frequncy of sin
		LEN:natural:=16
	);
	port(
		clk : in STD_LOGIC;
		i_ce : in STD_LOGIC;
		i_reset : in std_logic;

		o_ce : out STD_LOGIC;
		o_samples: out std_logic_vector(LEN-1 downto 0)
		);
end start_sin_gen;



architecture start_sin_gen of start_sin_gen is

constant PERIOD_LEN:integer:=(FREQ_FD/FREQ_VAL)/4+1;

type Tsin_quarter is array(0 to PERIOD_LEN-1) of integer;
--# constant const_quarter:Tsin_quarter:=(0, 2053, 4099, 6128, 8133, 10105, 12038, 13924, 15754, 17523, 19222, 20845, 22386, 23839, 25197, 26456, 27611, 28657, 29590, 30406, 31101, 31675, 32123, 32444, 32637, 32702);

signal sin_quarter:Tsin_quarter;

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


function make_sin_quarter(val:natural) return Tsin_quarter is
variable ret:Tsin_quarter;
begin
	for i in 0 to PERIOD_LEN-1 loop
		ret(i):=integer(ROUND( ((2.0**(LEN-1))-1.0)*sin(real(i)*MATH_2_PI*real(FREQ_VAL)/real(FREQ_FD)) ));
	end loop; 
	return ret;
end make_sin_quarter;

signal ce_1w,ce_2w,ce_3w:std_logic;
signal cnt,cnt_1w:std_logic_vector(1 downto 0):="00";
signal cnt_q_period,cnt_q_period_inv,cnt_q_period_inv_1w:std_logic_vector(log2roundup(PERIOD_LEN)-1 downto 0):=(others=>'0');

signal sin_val,sin_val_inv,sin_val_mux:std_logic_vector(LEN-1 downto 0);

begin

sin_quarter<=make_sin_quarter(0); --# const_quarter

process (clk)
begin		
	if rising_edge(clk) then
		if i_reset='1' then
			cnt_q_period<=(others=>'0');
			cnt_q_period_inv<=conv_std_logic_vector(PERIOD_LEN-1,cnt_q_period'Length);
			cnt<="00";
		else
			if i_ce='1' then
				if unsigned(cnt_q_period)<PERIOD_LEN-1 then
					cnt_q_period<=cnt_q_period+1;
					cnt_q_period_inv<=cnt_q_period_inv-1;
				else
					cnt_q_period<=conv_std_logic_vector(1,cnt_q_period'Length);
					cnt_q_period_inv<=conv_std_logic_vector(PERIOD_LEN-2,cnt_q_period'Length);
					cnt<=cnt+1;
				end if;
			end if;
		end if;

        cnt_q_period_inv_1w<=cnt_q_period_inv;

		sin_val<=conv_std_logic_vector(sin_quarter(conv_integer(cnt_q_period)),LEN);
		sin_val_inv<=conv_std_logic_vector(sin_quarter(conv_integer(cnt_q_period_inv)),LEN);
		cnt_1w<=cnt;
		ce_1w<=i_ce;
		ce_2w<=ce_1w;
		ce_3w<=ce_2w;

		case cnt_1w is 
		when "00" => sin_val_mux<=sin_val;
		when "01" => sin_val_mux<=sin_val_inv;
		when "10" => sin_val_mux<=0-sin_val;
		when "11" => sin_val_mux<=0-sin_val_inv;
		when others=>
		end case;

		o_samples<=sin_val_mux;	
		o_ce<=ce_3w;

	end if;	--clk
end process;
		 
	
end start_sin_gen;
