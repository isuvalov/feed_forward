library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;

entity rotate_demod is
	port(
		clk : in STD_LOGIC;
		reset : in std_logic;

		stop_demod: in std_logic;
		start_demod: in std_logic;
		start_rotateI: in std_logic_vector(15 downto 0); --# считаем что тут указано на сколько повернуто(а не на сколько надо повернуть обратно)
		start_rotateQ: in std_logic_vector(15 downto 0);

		i_sampleI: in std_logic_vector(15 downto 0);
		i_sampleQ: in std_logic_vector(15 downto 0);

		demodI: out std_logic_vector(15 downto 0);
		demodQ: out std_logic_vector(15 downto 0);
		demod_ce: out std_logic
		);
end rotate_demod;



architecture rotate_demod of rotate_demod is

signal rotate_it_ce,demod_it_ce:std_logic;
signal A_I: std_logic_vector(15 downto 0);
signal B_Q: std_logic_vector(15 downto 0);
signal C_I: std_logic_vector(15 downto 0);
signal D_Q: std_logic_vector(15 downto 0);

signal demod_it_I,demod_it_Q: std_logic_vector(15 downto 0);
type Tstm is (WAITING,STARTING,ROTATING);
signal stm:Tstm;

signal pre_demod_bits:std_logic_vector(1 downto 0);

begin

complex_mult_inst: entity work.complex_mult
	generic (
		CONJUGATION:std_logic:='1' --# умножение на сопряженное число, если '1' - то сопрягать
	);
	port(
		clk =>clk,
		i_ce =>rotate_it_ce,
		A_I =>A_I,
		B_Q =>B_Q,

		C_I =>C_I,
		D_Q =>D_Q,


		o_I=>open,
		o_Q=>open,
		out_ce =>open
		);


qam4_demod_inst:entity work.qam4_demod
	port map(
		clk =>clk,
		i_ce =>demod_it_ce,
		i_samplesI=>demod_it_I,
		i_samplesQ=>demod_it_Q,

		o_value =>pre_demod_bits,
		out_ce=>open
		);



process (clk) is
begin		
	if rising_edge(clk) then
        A_I<=i_sampleI;
		B_Q<=i_sampleQ;
		

		if reset='1' or stop_demod='1' then
			stm<=WAITING;
			demod_it_ce<='0';
			rotate_it_ce<='0';
		else
			case stm is
			when WAITING=>
				if start_demod='1' then
					rotate_it_ce<='1';
				else
					rotate_it_ce<='0';
				end if;
				C_I<=start_rotateI;
				D_Q<=start_rotateQ;
			when STARTING=>
			when others=>
			end case;
		end if;
	end if;
end process;

	
end rotate_demod;
