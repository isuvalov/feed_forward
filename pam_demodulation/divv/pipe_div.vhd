-- megafunction wizard: %LPM_DIVIDE%
-- GENERATION: STANDARD
-- VERSION: WM1.0
-- MODULE: LPM_DIVIDE 

-- ============================================================
-- File Name: pipe_div.vhd
-- Megafunction Name(s):
-- 			LPM_DIVIDE
--
-- Simulation Library Files(s):
-- 			lpm
-- ============================================================
-- ************************************************************
-- THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
--
-- 12.1 Build 177 11/07/2012 SJ Full Version
-- ************************************************************


--Copyright (C) 1991-2012 Altera Corporation
--Your use of Altera Corporation's design tools, logic functions 
--and other software and tools, and its AMPP partner logic 
--functions, and any output files from any of the foregoing 
--(including device programming or simulation files), and any 
--associated documentation or information are expressly subject 
--to the terms and conditions of the Altera Program License 
--Subscription Agreement, Altera MegaCore Function License 
--Agreement, or other applicable license agreement, including, 
--without limitation, that your use is for the sole purpose of 
--programming logic devices manufactured by Altera and sold by 
--Altera or its authorized distributors.  Please refer to the 
--applicable agreement for further details.


LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY lpm;
USE lpm.all;

ENTITY pipe_div IS
	PORT
	(
		aclr		: IN STD_LOGIC ;
		clken		: IN STD_LOGIC ;
		clock		: IN STD_LOGIC ;
		denom		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		numer		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		quotient		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
		remain		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
END pipe_div;


ARCHITECTURE SYN OF pipe_div IS

	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (15 DOWNTO 0);
	SIGNAL sub_wire1	: STD_LOGIC_VECTOR (15 DOWNTO 0);



	COMPONENT lpm_divide
	GENERIC (
		lpm_drepresentation		: STRING;
		lpm_hint		: STRING;
		lpm_nrepresentation		: STRING;
		lpm_pipeline		: NATURAL;
		lpm_type		: STRING;
		lpm_widthd		: NATURAL;
		lpm_widthn		: NATURAL
	);
	PORT (
			aclr	: IN STD_LOGIC ;
			clock	: IN STD_LOGIC ;
			remain	: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
			clken	: IN STD_LOGIC ;
			denom	: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			numer	: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			quotient	: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
	END COMPONENT;

BEGIN
	remain    <= sub_wire0(15 DOWNTO 0);
	quotient    <= sub_wire1(15 DOWNTO 0);

	LPM_DIVIDE_component : LPM_DIVIDE
	GENERIC MAP (
		lpm_drepresentation => "SIGNED",
		lpm_hint => "MAXIMIZE_SPEED=6,LPM_REMAINDERPOSITIVE=TRUE",
		lpm_nrepresentation => "SIGNED",
		lpm_pipeline => 16,
		lpm_type => "LPM_DIVIDE",
		lpm_widthd => 16,
		lpm_widthn => 16
	)
	PORT MAP (
		aclr => aclr,
		clock => clock,
		clken => clken,
		denom => denom,
		numer => numer,
		remain => sub_wire0,
		quotient => sub_wire1
	);



END SYN;

-- ============================================================
-- CNX file retrieval info
-- ============================================================
-- Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone IV GX"
-- Retrieval info: PRIVATE: PRIVATE_LPM_REMAINDERPOSITIVE STRING "TRUE"
-- Retrieval info: PRIVATE: PRIVATE_MAXIMIZE_SPEED NUMERIC "6"
-- Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
-- Retrieval info: PRIVATE: USING_PIPELINE NUMERIC "1"
-- Retrieval info: PRIVATE: VERSION_NUMBER NUMERIC "2"
-- Retrieval info: PRIVATE: new_diagram STRING "1"
-- Retrieval info: LIBRARY: lpm lpm.lpm_components.all
-- Retrieval info: CONSTANT: LPM_DREPRESENTATION STRING "SIGNED"
-- Retrieval info: CONSTANT: LPM_HINT STRING "MAXIMIZE_SPEED=6,LPM_REMAINDERPOSITIVE=TRUE"
-- Retrieval info: CONSTANT: LPM_NREPRESENTATION STRING "SIGNED"
-- Retrieval info: CONSTANT: LPM_PIPELINE NUMERIC "16"
-- Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_DIVIDE"
-- Retrieval info: CONSTANT: LPM_WIDTHD NUMERIC "16"
-- Retrieval info: CONSTANT: LPM_WIDTHN NUMERIC "16"
-- Retrieval info: USED_PORT: aclr 0 0 0 0 INPUT NODEFVAL "aclr"
-- Retrieval info: USED_PORT: clken 0 0 0 0 INPUT NODEFVAL "clken"
-- Retrieval info: USED_PORT: clock 0 0 0 0 INPUT NODEFVAL "clock"
-- Retrieval info: USED_PORT: denom 0 0 16 0 INPUT NODEFVAL "denom[15..0]"
-- Retrieval info: USED_PORT: numer 0 0 16 0 INPUT NODEFVAL "numer[15..0]"
-- Retrieval info: USED_PORT: quotient 0 0 16 0 OUTPUT NODEFVAL "quotient[15..0]"
-- Retrieval info: USED_PORT: remain 0 0 16 0 OUTPUT NODEFVAL "remain[15..0]"
-- Retrieval info: CONNECT: @aclr 0 0 0 0 aclr 0 0 0 0
-- Retrieval info: CONNECT: @clken 0 0 0 0 clken 0 0 0 0
-- Retrieval info: CONNECT: @clock 0 0 0 0 clock 0 0 0 0
-- Retrieval info: CONNECT: @denom 0 0 16 0 denom 0 0 16 0
-- Retrieval info: CONNECT: @numer 0 0 16 0 numer 0 0 16 0
-- Retrieval info: CONNECT: quotient 0 0 16 0 @quotient 0 0 16 0
-- Retrieval info: CONNECT: remain 0 0 16 0 @remain 0 0 16 0
-- Retrieval info: GEN_FILE: TYPE_NORMAL pipe_div.vhd TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL pipe_div.inc FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL pipe_div.cmp TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL pipe_div.bsf FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL pipe_div_inst.vhd TRUE
-- Retrieval info: LIB_FILE: lpm
