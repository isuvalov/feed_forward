library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;

--#  оррел€тор надо делать на 4-й частоте потому как € не знаю с какой фазы
--# начинать децемировать... € же могу очень сильно ошибатьс€ с положнением.
--# »спользуем тот факт что i_samplesI исключительно +-1
--# ѕри этом пилот у нас не комплексный

entity pilot_correlator is 
	port(
		clk : in STD_LOGIC;
		reset : in std_logic;
		ce: in std_logic;
		i_samplesI: in std_logic_vector(15 downto 0);
		i_samplesQ: in std_logic_vector(15 downto 0);
		o_sampleI: out std_logic_vector(15 downto 0);  --# выход в два раза меньше максимума
		o_sampleQ: out std_logic_vector(15 downto 0)
		);
end pilot_correlator;



architecture pilot_correlator of pilot_correlator is


constant ACUMBIT:natural:=o_sampleI'Length*2; --# устанавливаем максимальное значение аккомул€тора
constant NM:natural:=InterpolateRate*PILOT_LEN;

--constant multloop:natural:=0;



type Tdelayline is array (0 to NM-1) of std_logic_vector(i_samplesI'Length-1 downto 0);
signal delaylineI,delaylineQ:Tdelayline;

type Tshifts is array(0 to log2roundup(NM)) of natural;
constant shifts:Tshifts:=(1,1,1,1,1,0,1,0,1);
--constant shifts:Tshifts:=(1,1,1,1,1,1,1,1,1,1);

type Tmult_col is array(0 to NM-1) of std_logic_vector(i_samplesI'Length downto 0);
type Tmultarray is array(0 to log2roundup(NM)) of Tmult_col;
signal multarrayI,multarrayQ:Tmultarray;

begin

process (clk)
begin		
	if rising_edge(clk) then
		if ce='1' then
			delaylineI(0)<=i_samplesI;
			delaylineQ(0)<=i_samplesQ;
			for i in 1 to NM-1 loop
				delaylineI(i)<=delaylineI(i-1);
				delaylineQ(i)<=delaylineQ(i-1);
			end loop;

			for y in 0 to PILOT_LEN-1 loop  --#делаем цикл по линии задержки дл€ умножений
				for x in 0 to InterpolateRate-1 loop 
--					if PILOT(PILOT_LEN-y-1)='1' then
					if PILOT(y)='1' then
						multarrayI(0)(y*InterpolateRate+x)<=SXT(delaylineI(y*InterpolateRate+x),i_samplesI'Length+1);
						multarrayQ(0)(y*InterpolateRate+x)<=0-SXT(delaylineQ(y*InterpolateRate+x),i_samplesI'Length+1); --# make conj
					else
						multarrayI(0)(y*InterpolateRate+x)<=0-SXT(delaylineI(y*InterpolateRate+x),i_samplesI'Length+1);
						multarrayQ(0)(y*InterpolateRate+x)<=SXT(delaylineQ(y*InterpolateRate+x),i_samplesI'Length+1);   --# make conj
					end if;
				end loop;
			end loop;
			o_sampleI<=multarrayI(log2roundup(NM))(0)(i_samplesI'Length downto i_samplesI'Length+1-o_sampleI'Length);
			o_sampleQ<=multarrayQ(log2roundup(NM))(0)(i_samplesI'Length downto i_samplesI'Length+1-o_sampleI'Length);
		end if;		
	end if;	--clk
end process;
		 

upstais_inst: for upstais in 0 to log2roundup(NM)-1 generate --#делаем цикл по конвееру суматорной лестницы
	multfor: for multloop in 0 to ((NM/2)/power_of_2(upstais))-1 generate --# !!!!!!!!!!!!! power у мен€ тут нету!
				process(clk)
				begin
					if rising_edge(clk) then
					multarrayI(upstais+1)(multloop)<=SXT(multarrayI(upstais)(multloop*2)(i_samplesI'Length downto shifts(upstais)),i_samplesI'Length+1)+
													 SXT(multarrayI(upstais)(multloop*2+1)(i_samplesI'Length downto shifts(upstais)),i_samplesI'Length+1);
					multarrayQ(upstais+1)(multloop)<=SXT(multarrayQ(upstais)(multloop*2)(i_samplesI'Length downto shifts(upstais)),i_samplesI'Length+1)+
													 SXT(multarrayQ(upstais)(multloop*2+1)(i_samplesI'Length downto shifts(upstais)),i_samplesI'Length+1);
--					multarrayI(upstais+1)(multloop)<=(others=>'0');
--					multarrayQ(upstais+1)(multloop)<=(others=>'0');

					end if;
				end process;
			 end generate; --# multloop          
end generate; --# upstais

	
end pilot_correlator;
