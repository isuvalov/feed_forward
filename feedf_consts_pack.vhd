library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
PACKAGE feedf_consts_pack IS


constant INOUT_FILTER_ON:integer:=1; --# При 1 включаются фильтры по входу и выходу
constant GLOBAL_DEBUG:integer:=0;  --# При этом специально расстройка частоты постулируется равной 0 (freq offset=0)

constant PILOT_LEN:natural:=64;
--constant PILOT_LEN:natural:=128;
constant InterpolateRate:natural:=4;
constant GUARD_SAMPLES:natural:=6;
constant Ndiv:natural:=0; --# Количество бит которые отсекаются еще до сложения в аккомуляторе
constant NBIT:natural:=17; --# Разрядность матиматики в алгоритме расчета частотной расстройки
--constant NBIT:natural:=24; --# Разрядность матиматики в алгоритме расчета частотной расстройки
constant NBITm1:natural:=NBIT-1;
constant PERIOD_OF_PILOT:natural:=8192;

constant FREQ_FD:natural:=100; --# frequncy of discretization
constant PILOTSIN_FREQ:natural:=4;

--# '1' it is +1, '0' it is -1
constant PILOT:std_logic_vector(0 to PILOT_LEN-1):="1100111001001001000010001100001010000001101011000100000100000001";
--constant PILOT:std_logic_vector(0 to PILOT_LEN-1):="11001110010010010000100011000010100000011010110001000001000000011100111001001001000010001100001010000001101011000100000100000001";
constant PILOT_PERIOD:natural:=PERIOD_OF_PILOT;
--constant PILOT_PERIOD:natural:=30000;


type TsmoofWindow is array(0 to (PILOT_LEN*InterpolateRate/2)-2) of integer;
constant smoofWindow:TsmoofWindow:=(32767,32755,32731,32696,32650,32592,32524,32444,32354,32254,32143,32022,31892,31752,31602,31443,31275,31098,30913,30718,30516,30305,30087,29860,29626,29385,29136,28881,28618,28349,28073,27791,27503,27209,26910,26605,26294,25978,25658,25332,25002,24668,24329,23987,23640,23290,22936,22579,22219,21857,21491,21123,20752,20380,20005,19628,19250,18871,18490,18109,17726,17343,16959,16576,16191,15808,15424,15041,14658,14277,13896,13517,13139,12762,12387,12015,11644,11276,10910,10548,10188,9831,9477,9127,8780,8438,8099,7765,7435,7109,6789,6473,6162,5857,5558,5264,4976,4694,4418,4149,3886,3631,3382,3141,2907,2680,2462,2251,2049,1854,1669,1492,1324,1165,1015,875,745,624,513,413,323,243,175,117,71,36,12);
--constant smoofWindow:TsmoofWindow:=(32767,32764,32758,32749,32737,32723,32705,32685,32661,32635,32607,32575,32541,32504,32464,32422,32377,32329,32279,32226,32171,32113,32052,31990,31924,31857,31787,31714,31639,31562,31483,31401,31317,31231,31142,31052,30959,30864,30767,30668,30566,30463,30358,30251,30141,30030,29917,29802,29685,29566,29445,29323,29198,29072,28944,28815,28684,28551,28416,28280,28142,28003,27862,27719,27575,27430,27283,27134,26985,26833,26681,26527,26372,26215,26057,25898,25738,25576,25414,25250,25085,24919,24751,24583,24414,24244,24072,23900,23727,23553,23377,23201,23025,22847,22669,22489,22309,22129,21947,21765,21582,21399,21215,21030,20845,20659,20473,20286,20098,19911,19723,19534,19345,19156,18966,18776,18586,18395,18204,18013,17822,17630,17439,17247,17055,16863,16671,16479,16288,16096,15904,15712,15520,15328,15137,14945,14754,14563,14372,14181,13991,13801,13611,13422,13233,13044,12856,12669,12481,12294,12108,11922,11737,11552,11368,11185,11002,10820,10638,10458,10278,10098,9920,9742,9566,9390,9214,9040,8867,8695,8523,8353,8184,8016,7848,7682,7517,7353,7191,7029,6869,6710,6552,6395,6240,6086,5934,5782,5633,5484,5337,5192,5048,4905,4764,4625,4487,4351,4216,4083,3952,3823,3695,3569,3444,3322,3201,3082,2965,2850,2737,2626,2516,2409,2304,2201,2099,2000,1903,1808,1715,1625,1536,1450,1366,1284,1205,1128,1053,980,910,843,777,715,654,596,541,488,438,390,345,303,263,226,192,160,132,106,82,62,44,30,18,9,3);

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
