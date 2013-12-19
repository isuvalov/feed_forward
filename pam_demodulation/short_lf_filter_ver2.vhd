library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;


entity short_lf_filter is
	port(
		clk : in std_logic;
		init: in std_logic;
		init_phase: in std_logic_vector(15 downto 0);
		i_ce : in std_logic;		
		i_phase: in std_logic_vector(15 downto 0);
		o_phase: out std_logic_vector(19 downto 0);
		out_ce: out std_logic
		);
end short_lf_filter;



architecture short_lf_filter of short_lf_filter is

constant TAPS:integer:=32;
constant IN_ONETICK:integer:=32;
constant MUL_CUT:integer:=21;

type Tfilter_taps is array(0 to TAPS-1) of integer;
constant filter_taps:Tfilter_taps:=(-81, 8, 47, 116, 221, 363, 543, 757, 998, 1257, 1519, 1771, 1996, 2180,
	      2311, 2378, 2378, 2311, 2180, 1996, 1771, 1519, 1257, 998, 757, 543, 363, 221, 116, 47, 8, -81);



type Tdelay_line is array(0 to TAPS-1) of std_logic_vector(15 downto 0);
signal delay_line,delay_line_c:Tdelay_line:=(others=>(others=>'0'));

type Tmuls_array is array(0 to IN_ONETICK-1) of std_logic_vector(2*delay_line(0)'Length-1 downto 0);
signal muls_array:Tmuls_array;

signal sums,sums_fin:std_logic_vector(MUL_CUT+log2roundup(TAPS)-1 downto 0):=(others=>'0');
type Tsums_array is array(0 to IN_ONETICK-1) of std_logic_vector(sums'Length-1 downto 0);
signal sums_array:Tsums_array;
signal ce_1w,ce_2w,ce_3w:std_logic;

signal cnt:std_logic_vector(1 downto 0):=(others=>'0');

begin
	
process (clk) is
variable v_sums:std_logic_vector(sums'Length-1 downto 0);
begin
	if rising_edge(clk) then

		if init='1' then
			for i in 0 to TAPS-1 loop
				delay_line(i)<=init_phase;
				delay_line_c(i)<=init_phase;
			end loop;			
			sums<=SXT(init_phase&"0000",sums_fin'Length);
		else  --# init					
			if i_ce='1' then
				delay_line_c<=delay_line;
				delay_line(0)<=i_phase;
				for i in 1 to TAPS-1 loop
				delay_line(i)<=delay_line(i-1);
				end loop;
			end if;		

			v_sums:=(others=>'0');
			for x in 0 to IN_ONETICK-1 loop
				muls_array(x)<=signed(delay_line_c(x+0*IN_ONETICK))*signed(conv_std_logic_vector(filter_taps(x+0*IN_ONETICK),delay_line(0)'Length));
				v_sums:=v_sums+SXT(muls_array(x)(muls_array(0)'Length-1 downto muls_array(0)'Length-MUL_CUT),sums'Length);
			end loop;
			sums<=v_sums;


		end if; --# init

		if i_ce='1' then
--			cnt<=conv_std_logic_vector(InterpolateRate-1,cnt'Length);--  (others=>'0');
			cnt<=conv_std_logic_vector(1,cnt'Length);--  (others=>'0');
		else
			cnt<=cnt+1;
		end if;

        ce_1w<=i_ce;
		ce_2w<=ce_1w;
		ce_3w<=ce_2w;
		if init='1' then
			sums_fin<=SXT(init_phase&"0000",sums_fin'Length);	
		elsif ce_2w='1' then
			sums_fin<=sums;	
		end if;

        out_ce<=ce_2w;

	end if;
end process;
		o_phase<=SXT(sums_fin(sums_fin'Length-1 downto sums_fin'Length-o_phase'Length+2),o_phase'Length);
--        o_phase<=conv_std_logic_vector(0,o_phase'Length);




end short_lf_filter;

