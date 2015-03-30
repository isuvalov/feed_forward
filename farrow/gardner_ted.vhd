library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.feedf_consts_pack.all;

entity gardner_ted is
	port(
		clk : in STD_LOGIC;
		reset : in std_logic;

		i_sampleI: in std_logic_vector(15 downto 0);
		i_sampleQ: in std_logic_vector(15 downto 0);
		i_ce: in std_logic;

		o_mu: out std_logic_vector(15 downto 0);
		o_ce: out std_logic
		);
end gardner_ted;



architecture gardner_ted of gardner_ted is

type Tdelay_array is array(InterpolateRate-1 downto 0) of std_logic_vector(i_sampleI'Length-1 downto 0);
signal delay_array_I,delay_array_Q:Tdelay_array:=(others=>(others=>'0'));

signal val_prev05_i,val_prev05_q,val_prev1_i,val_prev1_q:std_logic_vector(i_sampleI'Length-1 downto 0):=(others=>'0');
signal vali_delta,valq_delta:std_logic_vector(i_sampleI'Length-1 downto 0):=(others=>'0');

signal err_val_q,err_val_i:std_logic_vector((2*i_sampleI'Length)-1 downto 0):=(others=>'0');

signal err_val:std_logic_vector(15 downto 0):=(others=>'0');
signal ce_del:std_logic_vector(3 downto 0):=(others=>'0');

--#   val_prev05=rx_transfer_filt_shift(zz-floor(InterpolateRate/2));
--#   val_prev1=rx_transfer_filt_shift(zz-InterpolateRate);    
--#   err_val=imag(val_prev05)*(imag(val)-imag(val_prev1)) + real(val_prev05)*(real(val)-real(val_prev1));

begin


delay_array_I(0)<=i_sampleI;
delay_array_Q(0)<=i_sampleI;



val_prev1_i<=delay_array_I(InterpolateRate-1);
val_prev1_q<=delay_array_Q(InterpolateRate-1);

o_ce<=ce_del(3);

process (clk) is
begin
	if rising_edge(clk) then
		ce_del<=ce_del(ce_del'Length-2 downto 0)&i_ce;
		val_prev05_i<=delay_array_I(InterpolateRate/2);
		val_prev05_q<=delay_array_Q(InterpolateRate/2);

		err_val_i<=signed(val_prev05_i)*signed(vali_delta);
		err_val_q<=signed(val_prev05_q)*signed(valq_delta);

		err_val<=SXT(err_val_i(err_val_i'Length-1 downto err_val_i'Length-err_val'Length+1),16)+SXT(err_val_q(err_val_q'Length-1 downto err_val_q'Length-err_val'Length+1),16);
        o_mu<=err_val;

		if i_ce='1' then
			vali_delta<=i_sampleI-val_prev1_i;
			valq_delta<=i_sampleQ-val_prev1_q;

			for i in 0 to InterpolateRate-2 loop
				delay_array_I(i+1)<=delay_array_I(i);
				delay_array_Q(i+1)<=delay_array_Q(i);
			end loop;
		end if;
	end if;
end process;

	
end gardner_ted;
