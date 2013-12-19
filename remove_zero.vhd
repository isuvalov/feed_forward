library IEEE;
use IEEE.STD_LOGIC_1164.all;   
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.std_logic_arith.all;

--# y(n) = x(n) - x(n-1) + R * y(n-1)
--# "R" 0.9 .. 1
--# для -3dB: R = 1 - (pi*2 * frequency /samplerate)

--# может более привычный вид 
--# 1-st Order Filter of the Form:
--# y(n)=b0*x(n)+b1*x(n-1)+a1*y(n-1)

entity remove_zero is
	generic(
		WIDTH:natural:=16
	);
	port(
		clk : in std_logic;
		reset : in std_logic;
		ce : in std_logic;

		sampleI : in std_logic_vector(WIDTH-1 downto 0);
		sampleQ : in std_logic_vector(WIDTH-1 downto 0);

		filtered_I : out std_logic_vector(WIDTH-1 downto 0);
		filtered_Q : out std_logic_vector(WIDTH-1 downto 0);

		ce_out : out std_logic
	);
end remove_zero;

architecture remove_zero of remove_zero is


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


signal filterrrI,filterrrQ : std_logic_vector(WIDTH-1 downto 0):=(others=>'0');
signal ce_filt,ce_filt_1w: std_logic;
signal sample_removeI,sample_removeQ: std_logic_vector(WIDTH-1 downto 0):=(others=>'0');

begin


bihI: entity work.bih_filter_integrator_sign
	generic map(
		ALPHA_NUM=>12,  --# коэффициент интегрирования, чем он больше тем большую историю храним
		SCALE_FACTOR=>9,  --# маштаб - чем он больше тем меньше значение на выходе
		WIDTH=>WIDTH
	)
	port map(
		clk =>clk,
		reset=>reset,
		ce =>ce,
		sample =>sampleI,

		filtered =>filterrrI,
		ce_out =>ce_filt
	);


bihQ: entity work.bih_filter_integrator_sign
	generic map(
		ALPHA_NUM=>12,  --# коэффициент интегрирования, чем он больше тем большую историю храним
		SCALE_FACTOR=>9,  --# маштаб - чем он больше тем меньше значение на выходе
		WIDTH=>WIDTH
	)
	port map(
		clk =>clk,
		reset=>reset,
		ce =>ce,
		sample =>sampleQ,

		filtered =>filterrrQ,
		ce_out =>open
	);


process (clk) is
begin
	if rising_edge(clk) then
		if ce_filt='1' then
			sample_removeI<=sampleI-filterrrI;	
			sample_removeQ<=sampleQ-filterrrQ;
		end if; --# ce_filt
		ce_filt_1w<=ce_filt;
		filtered_I<=sample_removeI;
		filtered_Q<=sample_removeQ;
		ce_out<=ce_filt_1w;
	end if;
end process;



end remove_zero;
	