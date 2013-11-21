library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
PACKAGE feedf_consts_pack IS

constant GLOBAL_DEBUG:integer:=0;  --# При этом специально расстройка частоты постулируется равной 0 (freq offset=0)

constant PILOT_LEN:natural:=64;
constant InterpolateRate:natural:=4;
constant Ndiv:natural:=0; --# Количество бит которые отсекаются еще до сложения в аккомуляторе
constant NBIT:natural:=17; --# Разрядность матиматики в алгоритме расчета частотной расстройки
constant NBITm1:natural:=NBIT-1;


--# '1' it is +1, '0' it is -1
constant PILOT:std_logic_vector(0 to PILOT_LEN-1):="1100111001001001000010001100001010000001101011000100000100000001";
constant PILOT_PERIOD:natural:=8192;
--constant PILOT_PERIOD:natural:=30000;


type TsmoofWindow is array(0 to (PILOT_LEN*InterpolateRate/2)-2) of integer;
constant smoofWindow:TsmoofWindow:=(32767,32755,32731,32696,32650,32592,32524,32444,32354,32254,32143,32022,31892,31752,31602,31443,31275,31098,30913,30718,30516,30305,30087,29860,29626,29385,29136,28881,28618,28349,28073,27791,27503,27209,26910,26605,26294,25978,25658,25332,25002,24668,24329,23987,23640,23290,22936,22579,22219,21857,21491,21123,20752,20380,20005,19628,19250,18871,18490,18109,17726,17343,16959,16576,16191,15808,15424,15041,14658,14277,13896,13517,13139,12762,12387,12015,11644,11276,10910,10548,10188,9831,9477,9127,8780,8438,8099,7765,7435,7109,6789,6473,6162,5857,5558,5264,4976,4694,4418,4149,3886,3631,3382,3141,2907,2680,2462,2251,2049,1854,1669,1492,1324,1165,1015,875,745,624,513,413,323,243,175,117,71,36,12);

function power_of_2(data_value:natural) return integer;
FUNCTION log2roundup (data_value : integer) RETURN integer;
FUNCTION mydivroundup (data_value : integer; divisor : integer) RETURN integer;	
FUNCTION rat( value : std_logic ) RETURN std_logic;
FUNCTION rats( value : std_logic_vector ) RETURN std_logic_vector;
function BusOr(B:std_logic_vector) return std_logic;
function BusAnd(B:std_logic_vector) return std_logic;
function fliplr(A:std_logic_vector) return std_logic_vector;

END feedf_consts_pack;


library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

package body feedf_consts_pack is

function power_of_2(data_value:natural) return integer is
variable rett:std_logic_vector(data_value downto 0);
begin
	rett:=(others=>'0');
	rett(data_value):='1';
	return conv_integer(rett);
end power_of_2;




FUNCTION log2roundup (data_value : integer)
		RETURN integer IS
		
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


FUNCTION mydivroundup (data_value : integer; divisor : integer)
		RETURN integer IS
		VARIABLE div                   : integer;
	BEGIN  
		if (divisor>data_value) or (divisor=0) then return 0; else
		div   := data_value/divisor;
		IF ( (data_value MOD divisor) /= 0) THEN
			div := div+1;
		END IF;
		RETURN div;
		end if;
END mydivroundup;


function fliplr(A:std_logic_vector) return std_logic_vector is
variable R:std_logic_vector(A'Range);
begin
  for i in A'Low to A'High loop
	  R(A'High-(i-A'Low)):=A(i);
  end loop; 
  return R;
end function;


FUNCTION rat( value : std_logic )
    RETURN std_logic IS
  BEGIN
    CASE value IS
      WHEN '0' | '1' => RETURN value;
      WHEN 'H' => RETURN '1';
      WHEN 'L' => RETURN '0';
      WHEN OTHERS => RETURN '0';
    END CASE;
END rat;

FUNCTION rats( value : std_logic_vector )
RETURN std_logic_vector IS
variable rtt:std_logic_vector(value'Length-1 downto 0);
  BEGIN					   
	for i in 0 to value'Length-1 loop
		rtt(i):=rat(value(i));
	end loop;
	return rtt;
END rats;

function BusOr(B:std_logic_vector) return std_logic is
    variable R:std_logic;
begin   
    R:='0';
    for i in B'Range Loop
        R:=R or B(i);
    end loop;
    return R;
end function;


function BusAnd(B:std_logic_vector) return std_logic is
    variable R:std_logic;
begin   
    R:='1';
    for i in B'Range Loop
        R:=R and B(i);
    end loop;
    return R;
end function;




end package body feedf_consts_pack;
