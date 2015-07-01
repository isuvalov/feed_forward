library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;
use work.math_real.all;


entity freq_estimator_by_phase is
	port(
		clk : in STD_LOGIC;
		reset : in std_logic;
		i_ce : in std_logic;		
		i_samplesI: in std_logic_vector(7 downto 0);
		i_samplesQ: in std_logic_vector(7 downto 0);
		freq_ce: out std_logic;
		o_freq: out std_logic_vector(31 downto 0)
		);
end freq_estimator_by_phase;



architecture freq_estimator_by_phase of freq_estimator_by_phase is

signal to_c_i,to_c_q:std_logic_vector(15 downto 0);
signal ph_angle,ph_angle_1w,ph_angle_delta,ph_angle_d_filt:std_logic_vector(19 downto 0);
signal s_freq_1p: std_logic_vector(31 downto 0);

begin


to_c_i<=SXT(i_samplesI,16);
to_c_q<=SXT(i_samplesQ,16);

cordic_wrapper_i: entity work.cordic_wrapper
	port map(
		clk =>clk,
		i_ce =>i_ce,
		i_samplesI=>to_c_i,
		i_samplesQ=>to_c_q,

		phase=>ph_angle
		);

process (clk) is
begin
	if rising_edge(clk) then
		if i_ce='1' then
			ph_angle_1w<=ph_angle;
			ph_angle_delta<=ph_angle-ph_angle_1w;
	    	s_freq_1p<=signed(ph_angle_delta(ph_angle_delta'Length-1-4 downto 0)&"0000")*unsigned(conv_std_logic_vector(integer(real(2**9)/3.14159265358979324),11)); --FREQ_FD
			o_freq<=s_freq_1p;
		end if;
        freq_ce<=i_ce;

	end if;
end process;

bih_filter_freq_i: entity work.bih_filter_integrator_sign
	generic map(
		ALPHA_NUM=>9,  --# коэффициент интегрирования, чем он больше тем большую историю храним
		SCALE_FACTOR=>6,  --# маштаб - чем он больше тем меньше значение на выходе
		WIDTH=>ph_angle_delta'Length
	)
	port map(
		clk =>clk,
		reset=>reset,
		ce =>i_ce,
		sample =>ph_angle_delta,

		filtered =>ph_angle_d_filt,
		ce_out =>open
	);


end freq_estimator_by_phase;

