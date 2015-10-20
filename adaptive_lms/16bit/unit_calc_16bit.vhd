--  Copyright (C) 2004-2005 Digish Pandya <digish.pandya@gmail.com>

--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 2 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program; if not, write to the Free Software
--  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

-- A.8
-- unit program module of filter core
-- we have to cascade instance of this module to make multi tap filter


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;


entity unit_calc_16bit is
    Port ( x_in : in std_logic_vector(15 downto 0);
           x_N_in : in std_logic_vector(15 downto 0);
           ue_in : in std_logic_vector(15 downto 0);
           y_in : in std_logic_vector(15 downto 0);
           x_out : out std_logic_vector(15 downto 0);
           x_N_out : out std_logic_vector(15 downto 0);
           ue_out : out std_logic_vector(15 downto 0);
		 y_out: out std_logic_vector(15 downto 0);
           clock : in std_logic);

end unit_calc_16bit;

architecture standard of unit_calc_16bit is
	-- component declarations
	-- 8 bit multiplier 
	component mul8
	    Port ( d1_in : in std_logic_vector(7 downto 0);
	           d2_in : in std_logic_vector(7 downto 0);
	           d_out : out std_logic_vector(15 downto 0));

	end component;
	-- 16 bit adder
	component add16
	    Port ( d1_in : in std_logic_vector(15 downto 0);
	           d2_in : in std_logic_vector(15 downto 0);
	           d_out : out std_logic_vector(15 downto 0));

	end component;

	-- saturation circuit
	component saturation 
     	Port ( d_in : in std_logic_vector(15 downto 0);
           	  d_out : out std_logic_vector(15 downto 0));
	end component;

	-- one sample delay

	constant LEN:integer:=16;

	signal shiftx: std_logic_vector(LEN*4-1 downto 0); --#change
	signal shiftxn: std_logic_vector(LEN*4-1 downto 0); --#change
	signal shiftue: std_logic_vector(LEN*3-1 downto 0); --#change
	signal shifty: std_logic_vector(LEN*2-1 downto 0); --#change

	signal coeff16_pre: std_logic_vector(15 downto 0);
    signal coeff8: std_logic_vector(15 downto 0); --#change
	signal coeff16:std_logic_vector(15 downto 0); --# use it
	signal coeff32:std_logic_vector(31 downto 0); --#change
	signal xnin_ue:std_logic_vector(31 downto 0); --#change
	signal xnin_ue_scaled:std_logic_vector(31 downto 0); --#change
	signal new_coeff_true:std_logic_vector(31 downto 0); --#change
	signal delayed_new_coeff_true:std_logic_vector(31 downto 0); --# change
	signal y_out16:std_logic_vector(31 downto 0);  --# change
	signal y_out8:std_logic_vector(LEN-1 downto 0); --# change
begin
	-- basic pipelining 
	unit_process:
	process (clock)
	begin
		if(clock'event and clock = '1') then

			shiftx <= x_in & shiftx(LEN*4-1 downto LEN);
			shiftxn <= x_N_in & shiftxn(LEN*4-1 downto LEN);
			shiftue <= ue_in & shiftue(LEN*3-1 downto LEN);
			shifty <= y_in & shifty(LEN*2-1 downto LEN);

   		end if;
	end process;

	x_out <= shiftx(LEN-1 downto 0);
	x_N_out <= shiftxn(LEN-1 downto 0);
	ue_out <= shiftue(LEN-1 downto 0);

    mul_xnin_ue: entity work.mul16	   -- no delay
    port map( d1_in => x_N_in,
              d2_in => ue_in,
              d_out => xnin_ue);

    u1: process(clock)  --# u_scaling		   -- 1 clock cycle
	begin
		if rising_edge(clock) then
			xnin_ue_scaled<=SXT(xnin_ue(xnin_ue'Length-1 downto 4),xnin_ue_scaled'Length);
		end if;
	end process;
		
    add1:entity work.add32			  -- no delay
    port map(	d1_in => xnin_ue_scaled,
              	d2_in => coeff32,
              	d_out => new_coeff_true
			);

    delay_2:entity work.shift_1d_32	   -- each clock
    port map( 	clock => clock,
    		    	xin => new_coeff_true,
		   	xout => delayed_new_coeff_true	
    			);

    
    sat_1:saturation
    port map(	d_in  => delayed_new_coeff_true(31 downto 16),
    			d_out => coeff16_pre
    				);

	coeff32<=coeff16_pre&x"0000";

    trunc_1:entity work.truncation_16
    port map(
    			d_in  => coeff32,
    			d_out => coeff8	
    		   );
    	
    mul_coeff_x_in:entity work.mul16
    port map( d1_in => coeff8,
              d2_in => shiftx(LEN*4-1 downto LEN*3),
              d_out => y_out16
		    );
    trunc_2:entity work.truncation_16
    port map(
    			d_in  => y_out16,
    			d_out => y_out8	
    		   );
    y_out <= y_out8 + shifty(LEN-1 downto 0);
end standard;

