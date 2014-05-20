LIBRARY ieee;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;


entity tb is
end tb;


--clk по входу должна быть 115200*16=1843200

architecture tb of tb is

-- clkq = 31/25*clk125 

constant CLK_PERIOD_clk125: TIME := 8 ns; 
constant CLK_PERIOD_clkq: TIME := 100 ns; --# < 1/(125e6*(9/8)*(204/186))

constant FRAME_LEN:natural:=204;
constant CE_LEN:natural:=188;


constant SHFT:integer:=8;
component mult31_25
	PORT
	(
		areset		: IN STD_LOGIC  := '0';
		inclk0		: IN STD_LOGIC  := '0';
		c0		: OUT STD_LOGIC ;
		locked		: OUT STD_LOGIC 
	);
end component;


FUNCTION gen_lfsr(PSPNum: integer; pol : std_logic_vector; en : std_logic; nb_iter : natural) RETURN std_logic_vector IS
VARIABLE pol_int : std_logic_vector(pol'length-1 DOWNTO 0);
VARIABLE pol_gen : std_logic_vector(pol'length-1 DOWNTO 0);
BEGIN
CASE PSPNum is
when 0 => pol_gen := x"8000000D";
when 1 => pol_gen := x"00400007";
when 2 => pol_gen := x"00086001";
when 3 => pol_gen := x"02800003";
when 4 => pol_gen := x"21000005";
when others => pol_gen := "11"; -- x^2 + x + 1
END CASE;
pol_int := pol;
iteration : FOR i in 1 to nb_iter LOOP
IF en = '1' THEN
IF pol_int(pol'length-1)='1' THEN
pol_int := (pol_int(pol'length-2 DOWNTO 0)&'0') xor pol_gen;
ELSE
pol_int := (pol_int(pol'length-2 DOWNTO 0)&'0');
END IF;
ELSE pol_int := pol_int;
END IF;
END LOOP;
RETURN (pol_int);
END gen_lfsr;





signal clkq,clk125,clk125_div2,clk125_div4:std_logic:='0';
signal reset:std_logic:='1'; 
signal cnt_rd:std_logic_vector(64 downto 0):=(others=>'0');
signal cnt_wr:std_logic_vector(64 downto 0):=(others=>'0');

signal tx_cnt:integer:=0;


signal lfsr_reg:std_logic_vector(31 downto 0):=x"21322132";
signal bits:std_logic_vector(1 downto 0);


signal o_interp_ce,o_interp_ce_w1,sm_qam_ce:std_logic;
signal s_test_i,s_test_q,o_samplesI,o_samplesQ:std_logic_vector(1 downto 0);
signal qam_I,qam_Q,adc_i_im,adc_i_re:std_logic_vector(15 downto 0);

type Tadc_array is array(0 to 31) of std_logic_vector(15 downto 0);
signal adc_array_re,adc_array_im:Tadc_array;


signal pilot_start:std_logic;
signal file_read,file_read_w1,file_read_w2:std_logic_vector(0 to 31):=(others=>'0');
signal file_read_cnt:std_logic_vector(15 downto 0):=(others=>'0');

signal time_calc:integer:=0;

type Tfile_stm is (STARTING,WRITING,DELAY,ENDD);
signal file_stm:Tfile_stm;

signal string_cnt,infile_cnt,delay_cnt:integer:=0;
signal muxer:std_logic_vector(0 to 30):=(others=>'0');

signal file_read_whole_w1,file_read_whole_w2,file_read_whole:std_logic;
signal freq_ce:  std_logic;
signal o_freq:  std_logic_vector(NBITm1+log2roundup(PILOT_LEN*2) downto 0);
--signal o_freq:  std_logic_vector(31 downto 0);


signal cur_file:string(1 to 32+9);

type Tstr_a is array(0 to 30) of string(1 to 32+9);
constant real_str_a:Tstr_a:=(
"datfiles/resample_pilot_m1mhz_real.dat   ",
"datfiles/resample_pilot_m1mhz_realpi2.dat",--"datfiles/resample_pilot_p0mhz_real.dat   ",
"datfiles/resample_pilot_m0.25mhz_real.dat",
"datfiles/resample_pilot_m0.5mhz_real.dat ",
"datfiles/resample_pilot_m0.75mhz_real.dat",
"datfiles/resample_pilot_m1.25mhz_real.dat",
"datfiles/resample_pilot_m1.5mhz_real.dat ",
"datfiles/resample_pilot_m1.75mhz_real.dat",
"datfiles/resample_pilot_m2.5mhz_real.dat ",
"datfiles/resample_pilot_m2mhz_real.dat   ",
"datfiles/resample_pilot_m3.5mhz_real.dat ",
"datfiles/resample_pilot_m3mhz_real.dat   ",
"datfiles/resample_pilot_m4.5mhz_real.dat ",
"datfiles/resample_pilot_m4mhz_real.dat   ",
"datfiles/resample_pilot_m5.5mhz_real.dat ",
"datfiles/resample_pilot_m5mhz_real.dat   ",
"datfiles/resample_pilot_p0.25mhz_real.dat",
"datfiles/resample_pilot_p0.5mhz_real.dat ",
"datfiles/resample_pilot_p0.75mhz_real.dat",
"datfiles/resample_pilot_p1.25mhz_real.dat",
"datfiles/resample_pilot_p1.5mhz_real.dat ",
"datfiles/resample_pilot_p1.75mhz_real.dat",
"datfiles/resample_pilot_p1mhz_real.dat   ",
"datfiles/resample_pilot_p2.5mhz_real.dat ",
"datfiles/resample_pilot_p2mhz_real.dat   ",
"datfiles/resample_pilot_p3.5mhz_real.dat ",
"datfiles/resample_pilot_p3mhz_real.dat   ",
"datfiles/resample_pilot_p4.5mhz_real.dat ",
"datfiles/resample_pilot_p4mhz_real.dat   ",
"datfiles/resample_pilot_p5.5mhz_real.dat ",
"datfiles/resample_pilot_p5mhz_real.dat   "
);

constant imag_str_a:Tstr_a:=(
"datfiles/resample_pilot_m1mhz_imag.dat   ",
"datfiles/resample_pilot_m1mhz_imagpi2.dat", --"datfiles/resample_pilot_p0mhz_imag.dat   ",
"datfiles/resample_pilot_m0.25mhz_imag.dat",
"datfiles/resample_pilot_m0.5mhz_imag.dat ",
"datfiles/resample_pilot_m0.75mhz_imag.dat",
"datfiles/resample_pilot_m1.25mhz_imag.dat",
"datfiles/resample_pilot_m1.5mhz_imag.dat ",
"datfiles/resample_pilot_m1.75mhz_imag.dat",
"datfiles/resample_pilot_m2.5mhz_imag.dat ",
"datfiles/resample_pilot_m2mhz_imag.dat   ",
"datfiles/resample_pilot_m3.5mhz_imag.dat ",
"datfiles/resample_pilot_m3mhz_imag.dat   ",
"datfiles/resample_pilot_m4.5mhz_imag.dat ",
"datfiles/resample_pilot_m4mhz_imag.dat   ",
"datfiles/resample_pilot_m5.5mhz_imag.dat ",
"datfiles/resample_pilot_m5mhz_imag.dat   ",
"datfiles/resample_pilot_p0.25mhz_imag.dat",
"datfiles/resample_pilot_p0.5mhz_imag.dat ",
"datfiles/resample_pilot_p0.75mhz_imag.dat",
"datfiles/resample_pilot_p1.25mhz_imag.dat",
"datfiles/resample_pilot_p1.5mhz_imag.dat ",
"datfiles/resample_pilot_p1.75mhz_imag.dat",
"datfiles/resample_pilot_p1mhz_imag.dat   ",
"datfiles/resample_pilot_p2.5mhz_imag.dat ",
"datfiles/resample_pilot_p2mhz_imag.dat   ",
"datfiles/resample_pilot_p3.5mhz_imag.dat ",
"datfiles/resample_pilot_p3mhz_imag.dat   ",
"datfiles/resample_pilot_p4.5mhz_imag.dat ",
"datfiles/resample_pilot_p4mhz_imag.dat   ",
"datfiles/resample_pilot_p5.5mhz_imag.dat ",
"datfiles/resample_pilot_p5mhz_imag.dat   "
);

begin

reset<='0' after 30 ns;


CLK_GEN125: process(clkq)
begin
	clkq<= not clkq after CLK_PERIOD_clk125/2; 
end process;

process (clkq) is
begin
	if rising_edge(clkq) then
		if o_interp_ce='1' then
			lfsr_reg<=gen_lfsr(0,lfsr_reg,'1', bits'Length);
		end if;
        o_interp_ce_w1<=o_interp_ce;
		
		cnt_wr<=cnt_wr+1;
		if cnt_wr(5 downto 0)=0 then
			s_test_i<="01";
		else
			s_test_i<="00";
		end if;
		s_test_q<="00";


        file_read_w1<=file_read;
		file_read_w2<=file_read_w1;

          time_calc<=time_calc+1;



--type Tfile_stm is (STARTING,WRITING,DELAY);
--signal file_stm:Tfile_stm;
--signal string_cnt,infile_cnt:integer:=0;
--signal muxer:std_logic_vector(0 to 31):=(others=>'0');
	if reset='1' then
		file_stm<=STARTING;
		infile_cnt<=0;
		string_cnt<=0;
		pilot_start<='0';
		file_read<=(others=>'0');
	else
		case file_stm is
		when STARTING=>
			if infile_cnt<20 then
				infile_cnt<=infile_cnt+1;
				pilot_start<='0';
			else
				file_stm<=WRITING;
				pilot_start<='1';
				infile_cnt<=0;
			end if;
			file_read<=(others=>'0');
			file_read_whole<='0';
		when WRITING=>
			pilot_start<='0';
			if infile_cnt<256-1 then
				infile_cnt<=infile_cnt+1;
			else
				infile_cnt<=0;
				file_stm<=DELAY;
			end if;
			file_read<=(others=>'0');
			file_read(string_cnt)<='1';
			delay_cnt<=0;
			file_read_whole<='1';
			cur_file<=real_str_a(string_cnt);
		when DELAY=>
			file_read_whole<='0';
			file_read<=(others=>'0');
			if delay_cnt<26000 then
				delay_cnt<=delay_cnt+1;
				pilot_start<='0';
			else
				if string_cnt<31-1 then
					string_cnt<=string_cnt+1;
					pilot_start<='1';
					file_stm<=WRITING;					
				else
					file_stm<=ENDD;
				end if;
			end if;
            infile_cnt<=0;
		when ENDD=>
			file_read_whole<='0';
		when others=>
		end case;
	end if;
       file_read_whole_w1<=file_read_whole;
	   file_read_whole_w2<=file_read_whole_w1;

		for i in 0 to 30 loop
			if file_read_w1(i)='1' then
				adc_i_re<=adc_array_re(i);
				adc_i_im<=adc_array_im(i);
			end if;
		end loop;

	end if;
end process;
bits<=lfsr_reg(bits'Length-1 downto 0);

ce_manager_inst: entity work.ce_manager
	port map(
		clk =>clkq,
		reset =>reset,
		o_interp_ce =>o_interp_ce
		);


-----------------------------------------------

txtf: for i in 0 to 30 generate
ADC_EMUL_re:entity work.FromTextFile
	generic map(BitLen =>16,
			IsSigned=>1, -- you can choose signed or unsigned value you have in text file
			NameOfFile =>real_str_a(i))
	 port map(
		 clk =>clkq,
		 CE =>file_read(i),
		 DataFromFile =>adc_array_re(i)
	     );

ADC_EMUL_im:entity work.FromTextFile
	generic map(BitLen =>16,
			IsSigned=>1, -- you can choose signed or unsigned value you have in text file
			NameOfFile =>imag_str_a(i))
	 port map(
		 clk =>clkq,
		 CE =>file_read(i),
		 DataFromFile =>adc_array_im(i)
	     );
end generate;


freq_estimator_inst: entity work.freq_estimator
	port map(
		clk =>clkq,
		reset =>reset,
		pilot_start=>pilot_start,
		i_ce =>file_read_whole_w2,
		i_samplesI =>adc_i_im,
		i_samplesQ =>adc_i_re,
		freq_ce =>freq_ce,
		o_freq =>o_freq
		);


ToTextFile_inst:entity work.ToTextFile
	generic map(BitLen =>o_freq'Length,
			WriteHex=>0,  -- if need write file in hex format or std_logic_vector too long(>=64)
			NameOfFile=>"freqs.dat")
	 port map(
		 clk =>clkq,
		 CE =>freq_ce,
		 block_marker =>'0',
		 DataToSave =>o_freq
	     );

end tb;
