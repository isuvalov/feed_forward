library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;


entity save_complexdata is
	port(
		clk : in STD_LOGIC;
		i_ce : in std_logic;		
		i_samplesI: in std_logic_vector(15 downto 0);
		i_samplesQ: in std_logic_vector(15 downto 0);

		i_ce2 : in std_logic;		
		i_samplesI2: in std_logic_vector(15 downto 0);
		i_samplesQ2: in std_logic_vector(15 downto 0)
		);
end save_complexdata;



architecture save_complexdata of save_complexdata is


signal saveit4,saveit3,saveit2_1w,saveit2,saveit,saveit_1w,saveit_mask:std_logic:='0';
signal savenum,save_cnt:integer:=0;


begin


saveit_mask<=saveit and i_ce;

process(clk)
begin
	if i_ce2='1' and savenum=0 then
		saveit<='1';
		save_cnt<=PILOT_PERIOD*InterpolateRate+1;
		savenum<=savenum+1;
--	if rising_edge(clk) then
--		if after_pilot_start='1' and savenum=0 then
--			saveit<='1';
--			save_cnt<=PILOT_PERIOD*InterpolateRate;
--			savenum<=savenum+1;
		elsif  rising_edge(clk) then
			if save_cnt>0 then
				save_cnt<=save_cnt-1;
			else
				saveit<='0';
			end if;
--		end if;
	end if;
end process;

process(clk)
begin
	if rising_edge(clk) then
		saveit_1w<=saveit;
		if saveit='1' and saveit_1w='0' then
			saveit2<='1';
		else
			saveit2<='0';
		end if;
		saveit2_1w<=saveit2;
	end if;
end process;


process (clk) is
begin		
	if rising_edge(clk) then
	end if;
end process;


	sph01: entity work.ToTextFile
	generic map(BitLen =>i_samplesI'Length,
			WriteHex =>0,  -- if need write file in hex format or std_logic_vector too long(>=64)
			NameOfFile =>"frame_phase_init_I.txt")
	 port map(
		 clk =>clk,
		 CE =>saveit2,
		 block_marker =>'0',
		 DataToSave =>i_samplesI2
	     );

	sph02: entity work.ToTextFile
	generic map(BitLen =>i_samplesI'Length,
			WriteHex =>0,  -- if need write file in hex format or std_logic_vector too long(>=64)
			NameOfFile =>"frame_phase_init_Q.txt")
	 port map(
		 clk =>clk,
		 CE =>saveit2,
		 block_marker =>'0',
		 DataToSave =>i_samplesQ2
	     );


	s01: entity work.ToTextFile
	generic map(BitLen =>i_samplesI'Length,
			WriteHex =>0,  -- if need write file in hex format or std_logic_vector too long(>=64)
			NameOfFile =>"frame_I.txt")
	 port map(
		 clk =>clk,
		 CE =>saveit_mask,
		 block_marker =>'0',
		 DataToSave =>i_samplesI
	     );


	s02: entity work.ToTextFile
	generic map(BitLen =>i_samplesI'Length,
			WriteHex =>0,  -- if need write file in hex format or std_logic_vector too long(>=64)
			NameOfFile =>"frame_Q.txt")
	 port map(
		 clk =>clk,
		 CE =>saveit_mask,
		 block_marker =>'0',
		 DataToSave =>i_samplesQ
	     );


end save_complexdata;


