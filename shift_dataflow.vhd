library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity shift_dataflow is
	port(
		clk : in STD_LOGIC;
		reset : in std_logic;
		offset: in std_logic_vector(31 downto 0);
		in_sampleI: in std_logic_vector(15 downto 0);
		in_sampleQ: in std_logic_vector(15 downto 0);
		ce_in: in std_logic;

		out_sampleI: out std_logic_vector(15 downto 0);
		out_sampleQ: out std_logic_vector(15 downto 0);
		ce_out: out std_logic
		);
end shift_dataflow;



architecture shift_dataflow of shift_dataflow is
	
signal dds_cos,dds_sin:std_logic_vector(15 downto 0);

signal Icos,Qcos,Qsin,Isin:std_logic_vector(31 downto 0);

signal s_out_sampleI,s_out_sampleQ:std_logic_vector(31 downto 0);
signal ce_in_w1:std_logic;


begin

process (clk)
begin		
	if rising_edge(clk) then
		if reset='1' then
			s_out_sampleI<=(others=>'0');
			s_out_sampleQ<=(others=>'0');
		else --#reset

            s_out_sampleI<=Icos-Qsin;
			s_out_sampleQ<=Isin+Qcos;
		end if; --#reset
		Icos<=signed(in_sampleI)*signed(dds_cos);
		Qsin<=signed(in_sampleQ)*signed(dds_sin);

		Isin<=signed(in_sampleI)*signed(dds_sin);
		Qcos<=signed(in_sampleQ)*signed(dds_cos);

		ce_in_w1<=ce_in;
		ce_out<=ce_in_w1;
		out_sampleI<=s_out_sampleI(31 downto 16);
		out_sampleQ<=s_out_sampleQ(31 downto 16);
	end if;	--clk
end process;
		 


dds_I_inst:entity work.dds_synthesizer
  generic map(
    ftw_width =>32
    )
  port map(
    clk_i   =>clk,
    rst_i   =>reset, --# потом поставить сигнал найденного конца пилота
    ftw_i   =>offset,
    phase_i =>x"4000",
    phase_o =>open,
    ampl_o  =>dds_cos
    );

dds_Q_inst:entity work.dds_synthesizer
  generic map(
    ftw_width =>32
    )
  port map(
    clk_i   =>clk,
    rst_i   =>reset,
    ftw_i   =>offset,
    phase_i =>x"0000",
    phase_o =>open,
    ampl_o  =>dds_sin
    );

	
end shift_dataflow;
