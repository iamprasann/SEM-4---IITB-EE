-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "03/03/2021 16:31:01"

-- 
-- Device: Altera 5M1270ZT144C5 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY IEEE;
LIBRARY MAXV;
USE IEEE.STD_LOGIC_1164.ALL;
USE MAXV.MAXV_COMPONENTS.ALL;

ENTITY 	DUT IS
    PORT (
	input_vector : IN std_logic_vector(7 DOWNTO 0);
	output_vector : BUFFER std_logic_vector(7 DOWNTO 0)
	);
END DUT;

-- Design Ports Information


ARCHITECTURE structure OF DUT IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_input_vector : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_output_vector : std_logic_vector(7 DOWNTO 0);
SIGNAL \add_instance|multiplier:pps[0][0]~combout\ : std_logic;
SIGNAL \add_instance|multiplier:t1[2]~4_combout\ : std_logic;
SIGNAL \add_instance|multiplier:t1[2]~5_combout\ : std_logic;
SIGNAL \add_instance|carry~5_combout\ : std_logic;
SIGNAL \add_instance|carry~18_combout\ : std_logic;
SIGNAL \add_instance|multiplier:pps[0][3]~combout\ : std_logic;
SIGNAL \add_instance|multiplier:t1[3]~combout\ : std_logic;
SIGNAL \add_instance|multiplier:pps[2][3]~combout\ : std_logic;
SIGNAL \add_instance|multiplier:pps[2][2]~combout\ : std_logic;
SIGNAL \add_instance|multiplier:t2[3]~combout\ : std_logic;
SIGNAL \add_instance|carry~12_combout\ : std_logic;
SIGNAL \add_instance|carry~11_combout\ : std_logic;
SIGNAL \add_instance|multiplier:pps[1][4]~combout\ : std_logic;
SIGNAL \add_instance|multiplier:pps[2][4]~combout\ : std_logic;
SIGNAL \add_instance|multiplier:t2[4]~combout\ : std_logic;
SIGNAL \add_instance|multiplier:pps[3][4]~combout\ : std_logic;
SIGNAL \add_instance|multiplier:pps[3][3]~combout\ : std_logic;
SIGNAL \add_instance|multiplier:pps[3][5]~combout\ : std_logic;
SIGNAL \add_instance|carry~13_combout\ : std_logic;
SIGNAL \add_instance|carry~17_combout\ : std_logic;
SIGNAL \add_instance|carry~14_combout\ : std_logic;
SIGNAL \add_instance|multiplier:pps[2][5]~combout\ : std_logic;
SIGNAL \add_instance|carry~15_combout\ : std_logic;
SIGNAL \add_instance|carry~16_combout\ : std_logic;
SIGNAL \add_instance|M[6]~4_combout\ : std_logic;
SIGNAL \add_instance|M[7]~5_combout\ : std_logic;
SIGNAL \add_instance|M\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \input_vector~combout\ : std_logic_vector(7 DOWNTO 0);

BEGIN

ww_input_vector <= input_vector;
output_vector <= ww_output_vector;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: PIN_53,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_vector[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_input_vector(0),
	combout => \input_vector~combout\(0));

-- Location: PIN_61,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_vector[4]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_input_vector(4),
	combout => \input_vector~combout\(4));

-- Location: LC_X11_Y5_N8
\add_instance|multiplier:pps[0][0]\ : maxv_lcell
-- Equation(s):
-- \add_instance|multiplier:pps[0][0]~combout\ = ((\input_vector~combout\(0) & ((\input_vector~combout\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cc00",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \input_vector~combout\(0),
	datad => \input_vector~combout\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|multiplier:pps[0][0]~combout\);

-- Location: PIN_62,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_vector[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_input_vector(1),
	combout => \input_vector~combout\(1));

-- Location: PIN_96,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_vector[5]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_input_vector(5),
	combout => \input_vector~combout\(5));

-- Location: LC_X11_Y5_N6
\add_instance|M[1]\ : maxv_lcell
-- Equation(s):
-- \add_instance|M\(1) = (\input_vector~combout\(4) & (\input_vector~combout\(1) $ (((\input_vector~combout\(0) & \input_vector~combout\(5)))))) # (!\input_vector~combout\(4) & (\input_vector~combout\(0) & ((\input_vector~combout\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "6ca0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector~combout\(4),
	datab => \input_vector~combout\(0),
	datac => \input_vector~combout\(1),
	datad => \input_vector~combout\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|M\(1));

-- Location: PIN_57,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_vector[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_input_vector(2),
	combout => \input_vector~combout\(2));

-- Location: PIN_63,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_vector[6]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_input_vector(6),
	combout => \input_vector~combout\(6));

-- Location: LC_X11_Y5_N9
\add_instance|multiplier:t1[2]~4\ : maxv_lcell
-- Equation(s):
-- \add_instance|multiplier:t1[2]~4_combout\ = \input_vector~combout\(6) $ (((!\input_vector~combout\(4) & (\input_vector~combout\(1) & \input_vector~combout\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "9ccc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector~combout\(4),
	datab => \input_vector~combout\(6),
	datac => \input_vector~combout\(1),
	datad => \input_vector~combout\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|multiplier:t1[2]~4_combout\);

-- Location: LC_X11_Y5_N0
\add_instance|multiplier:t1[2]~5\ : maxv_lcell
-- Equation(s):
-- \add_instance|multiplier:t1[2]~5_combout\ = (\input_vector~combout\(0) & (((\add_instance|multiplier:t1[2]~4_combout\)))) # (!\input_vector~combout\(0) & (\input_vector~combout\(5) & (\input_vector~combout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ec20",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector~combout\(5),
	datab => \input_vector~combout\(0),
	datac => \input_vector~combout\(1),
	datad => \add_instance|multiplier:t1[2]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|multiplier:t1[2]~5_combout\);

-- Location: LC_X12_Y7_N6
\add_instance|M[2]\ : maxv_lcell
-- Equation(s):
-- \add_instance|M\(2) = \add_instance|multiplier:t1[2]~5_combout\ $ (((\input_vector~combout\(2) & ((\input_vector~combout\(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "66cc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector~combout\(2),
	datab => \add_instance|multiplier:t1[2]~5_combout\,
	datad => \input_vector~combout\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|M\(2));

-- Location: PIN_114,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_vector[3]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_input_vector(3),
	combout => \input_vector~combout\(3));

-- Location: LC_X11_Y5_N4
\add_instance|carry~5\ : maxv_lcell
-- Equation(s):
-- \add_instance|carry~5_combout\ = ((\input_vector~combout\(6)) # ((\input_vector~combout\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ffcc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \input_vector~combout\(6),
	datad => \input_vector~combout\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|carry~5_combout\);

-- Location: LC_X11_Y5_N3
\add_instance|carry~18\ : maxv_lcell
-- Equation(s):
-- \add_instance|carry~18_combout\ = (\add_instance|carry~5_combout\ & (\input_vector~combout\(0) & (\input_vector~combout\(1) & \input_vector~combout\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \add_instance|carry~5_combout\,
	datab => \input_vector~combout\(0),
	datac => \input_vector~combout\(1),
	datad => \input_vector~combout\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|carry~18_combout\);

-- Location: PIN_86,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_vector[7]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_input_vector(7),
	combout => \input_vector~combout\(7));

-- Location: LC_X11_Y5_N1
\add_instance|multiplier:pps[0][3]\ : maxv_lcell
-- Equation(s):
-- \add_instance|multiplier:pps[0][3]~combout\ = ((\input_vector~combout\(0) & ((\input_vector~combout\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cc00",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \input_vector~combout\(0),
	datad => \input_vector~combout\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|multiplier:pps[0][3]~combout\);

-- Location: LC_X11_Y5_N5
\add_instance|multiplier:t1[3]\ : maxv_lcell
-- Equation(s):
-- \add_instance|multiplier:t1[3]~combout\ = \add_instance|carry~18_combout\ $ (\add_instance|multiplier:pps[0][3]~combout\ $ (((\input_vector~combout\(6) & \input_vector~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "956a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \add_instance|carry~18_combout\,
	datab => \input_vector~combout\(6),
	datac => \input_vector~combout\(1),
	datad => \add_instance|multiplier:pps[0][3]~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|multiplier:t1[3]~combout\);

-- Location: LC_X12_Y7_N0
\add_instance|multiplier:pps[2][3]\ : maxv_lcell
-- Equation(s):
-- \add_instance|multiplier:pps[2][3]~combout\ = (\input_vector~combout\(2) & (((\input_vector~combout\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a0a0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector~combout\(2),
	datac => \input_vector~combout\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|multiplier:pps[2][3]~combout\);

-- Location: LC_X12_Y7_N1
\add_instance|multiplier:pps[2][2]\ : maxv_lcell
-- Equation(s):
-- \add_instance|multiplier:pps[2][2]~combout\ = (\input_vector~combout\(2) & (((\input_vector~combout\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "aa00",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector~combout\(2),
	datad => \input_vector~combout\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|multiplier:pps[2][2]~combout\);

-- Location: LC_X12_Y7_N8
\add_instance|multiplier:t2[3]\ : maxv_lcell
-- Equation(s):
-- \add_instance|multiplier:t2[3]~combout\ = \add_instance|multiplier:t1[3]~combout\ $ (\add_instance|multiplier:pps[2][3]~combout\ $ (((\add_instance|multiplier:t1[2]~5_combout\ & \add_instance|multiplier:pps[2][2]~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "965a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \add_instance|multiplier:t1[3]~combout\,
	datab => \add_instance|multiplier:t1[2]~5_combout\,
	datac => \add_instance|multiplier:pps[2][3]~combout\,
	datad => \add_instance|multiplier:pps[2][2]~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|multiplier:t2[3]~combout\);

-- Location: LC_X12_Y7_N9
\add_instance|M[3]\ : maxv_lcell
-- Equation(s):
-- \add_instance|M\(3) = (\add_instance|multiplier:t2[3]~combout\ $ (((\input_vector~combout\(4) & \input_vector~combout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "5fa0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector~combout\(4),
	datac => \input_vector~combout\(3),
	datad => \add_instance|multiplier:t2[3]~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|M\(3));

-- Location: LC_X12_Y7_N7
\add_instance|carry~12\ : maxv_lcell
-- Equation(s):
-- \add_instance|carry~12_combout\ = (\add_instance|multiplier:t1[3]~combout\ & ((\add_instance|multiplier:pps[2][3]~combout\) # ((\add_instance|multiplier:t1[2]~5_combout\ & \add_instance|multiplier:pps[2][2]~combout\)))) # 
-- (!\add_instance|multiplier:t1[3]~combout\ & (\add_instance|multiplier:t1[2]~5_combout\ & (\add_instance|multiplier:pps[2][3]~combout\ & \add_instance|multiplier:pps[2][2]~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "e8a0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \add_instance|multiplier:t1[3]~combout\,
	datab => \add_instance|multiplier:t1[2]~5_combout\,
	datac => \add_instance|multiplier:pps[2][3]~combout\,
	datad => \add_instance|multiplier:pps[2][2]~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|carry~12_combout\);

-- Location: LC_X11_Y5_N2
\add_instance|carry~11\ : maxv_lcell
-- Equation(s):
-- \add_instance|carry~11_combout\ = (\add_instance|carry~18_combout\ & ((\add_instance|multiplier:pps[0][3]~combout\) # ((\input_vector~combout\(6) & \input_vector~combout\(1))))) # (!\add_instance|carry~18_combout\ & (\input_vector~combout\(6) & 
-- (\input_vector~combout\(1) & \add_instance|multiplier:pps[0][3]~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ea80",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \add_instance|carry~18_combout\,
	datab => \input_vector~combout\(6),
	datac => \input_vector~combout\(1),
	datad => \add_instance|multiplier:pps[0][3]~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|carry~11_combout\);

-- Location: LC_X12_Y5_N6
\add_instance|multiplier:pps[1][4]\ : maxv_lcell
-- Equation(s):
-- \add_instance|multiplier:pps[1][4]~combout\ = ((\input_vector~combout\(1) & ((\input_vector~combout\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cc00",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \input_vector~combout\(1),
	datad => \input_vector~combout\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|multiplier:pps[1][4]~combout\);

-- Location: LC_X11_Y5_N7
\add_instance|multiplier:pps[2][4]\ : maxv_lcell
-- Equation(s):
-- \add_instance|multiplier:pps[2][4]~combout\ = (\input_vector~combout\(2) & (((\input_vector~combout\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "aa00",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector~combout\(2),
	datad => \input_vector~combout\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|multiplier:pps[2][4]~combout\);

-- Location: LC_X12_Y5_N5
\add_instance|multiplier:t2[4]\ : maxv_lcell
-- Equation(s):
-- \add_instance|multiplier:t2[4]~combout\ = \add_instance|carry~12_combout\ $ (\add_instance|carry~11_combout\ $ (\add_instance|multiplier:pps[1][4]~combout\ $ (\add_instance|multiplier:pps[2][4]~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "6996",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \add_instance|carry~12_combout\,
	datab => \add_instance|carry~11_combout\,
	datac => \add_instance|multiplier:pps[1][4]~combout\,
	datad => \add_instance|multiplier:pps[2][4]~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|multiplier:t2[4]~combout\);

-- Location: LC_X12_Y7_N4
\add_instance|multiplier:pps[3][4]\ : maxv_lcell
-- Equation(s):
-- \add_instance|multiplier:pps[3][4]~combout\ = (\input_vector~combout\(5) & (((\input_vector~combout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a0a0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector~combout\(5),
	datac => \input_vector~combout\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|multiplier:pps[3][4]~combout\);

-- Location: LC_X12_Y7_N2
\add_instance|multiplier:pps[3][3]\ : maxv_lcell
-- Equation(s):
-- \add_instance|multiplier:pps[3][3]~combout\ = (\input_vector~combout\(4) & (((\input_vector~combout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a0a0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector~combout\(4),
	datac => \input_vector~combout\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|multiplier:pps[3][3]~combout\);

-- Location: LC_X12_Y7_N3
\add_instance|M[4]\ : maxv_lcell
-- Equation(s):
-- \add_instance|M\(4) = \add_instance|multiplier:t2[4]~combout\ $ (\add_instance|multiplier:pps[3][4]~combout\ $ (((\add_instance|multiplier:t2[3]~combout\ & \add_instance|multiplier:pps[3][3]~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "963c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \add_instance|multiplier:t2[3]~combout\,
	datab => \add_instance|multiplier:t2[4]~combout\,
	datac => \add_instance|multiplier:pps[3][4]~combout\,
	datad => \add_instance|multiplier:pps[3][3]~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|M\(4));

-- Location: LC_X12_Y4_N2
\add_instance|multiplier:pps[3][5]\ : maxv_lcell
-- Equation(s):
-- \add_instance|multiplier:pps[3][5]~combout\ = (\input_vector~combout\(6) & (((\input_vector~combout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a0a0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector~combout\(6),
	datac => \input_vector~combout\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|multiplier:pps[3][5]~combout\);

-- Location: LC_X12_Y5_N9
\add_instance|carry~13\ : maxv_lcell
-- Equation(s):
-- \add_instance|carry~13_combout\ = (\add_instance|carry~12_combout\ & ((\add_instance|multiplier:pps[2][4]~combout\) # (\add_instance|carry~11_combout\ $ (\add_instance|multiplier:pps[1][4]~combout\)))) # (!\add_instance|carry~12_combout\ & 
-- (\add_instance|multiplier:pps[2][4]~combout\ & (\add_instance|carry~11_combout\ $ (\add_instance|multiplier:pps[1][4]~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "be28",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \add_instance|carry~12_combout\,
	datab => \add_instance|carry~11_combout\,
	datac => \add_instance|multiplier:pps[1][4]~combout\,
	datad => \add_instance|multiplier:pps[2][4]~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|carry~13_combout\);

-- Location: LC_X12_Y5_N7
\add_instance|carry~17\ : maxv_lcell
-- Equation(s):
-- \add_instance|carry~17_combout\ = (\input_vector~combout\(7) & (\input_vector~combout\(2) $ (((\input_vector~combout\(1) & \add_instance|carry~11_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "60a0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector~combout\(2),
	datab => \input_vector~combout\(1),
	datac => \input_vector~combout\(7),
	datad => \add_instance|carry~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|carry~17_combout\);

-- Location: LC_X12_Y7_N5
\add_instance|carry~14\ : maxv_lcell
-- Equation(s):
-- \add_instance|carry~14_combout\ = (\add_instance|multiplier:t2[4]~combout\ & ((\add_instance|multiplier:pps[3][4]~combout\) # ((\add_instance|multiplier:t2[3]~combout\ & \add_instance|multiplier:pps[3][3]~combout\)))) # 
-- (!\add_instance|multiplier:t2[4]~combout\ & (\add_instance|multiplier:t2[3]~combout\ & (\add_instance|multiplier:pps[3][4]~combout\ & \add_instance|multiplier:pps[3][3]~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "e8c0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \add_instance|multiplier:t2[3]~combout\,
	datab => \add_instance|multiplier:t2[4]~combout\,
	datac => \add_instance|multiplier:pps[3][4]~combout\,
	datad => \add_instance|multiplier:pps[3][3]~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|carry~14_combout\);

-- Location: LC_X12_Y5_N8
\add_instance|M[5]\ : maxv_lcell
-- Equation(s):
-- \add_instance|M\(5) = \add_instance|multiplier:pps[3][5]~combout\ $ (\add_instance|carry~13_combout\ $ (\add_instance|carry~17_combout\ $ (\add_instance|carry~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "6996",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \add_instance|multiplier:pps[3][5]~combout\,
	datab => \add_instance|carry~13_combout\,
	datac => \add_instance|carry~17_combout\,
	datad => \add_instance|carry~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|M\(5));

-- Location: LC_X12_Y5_N0
\add_instance|multiplier:pps[2][5]\ : maxv_lcell
-- Equation(s):
-- \add_instance|multiplier:pps[2][5]~combout\ = ((\input_vector~combout\(2) & ((\input_vector~combout\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cc00",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \input_vector~combout\(2),
	datad => \input_vector~combout\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|multiplier:pps[2][5]~combout\);

-- Location: LC_X12_Y5_N2
\add_instance|carry~15\ : maxv_lcell
-- Equation(s):
-- \add_instance|carry~15_combout\ = (\add_instance|multiplier:pps[2][5]~combout\ & ((\add_instance|carry~13_combout\) # ((\add_instance|multiplier:pps[1][4]~combout\ & \add_instance|carry~11_combout\)))) # (!\add_instance|multiplier:pps[2][5]~combout\ & 
-- (\add_instance|multiplier:pps[1][4]~combout\ & (\add_instance|carry~11_combout\ & \add_instance|carry~13_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f880",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \add_instance|multiplier:pps[1][4]~combout\,
	datab => \add_instance|carry~11_combout\,
	datac => \add_instance|multiplier:pps[2][5]~combout\,
	datad => \add_instance|carry~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|carry~15_combout\);

-- Location: LC_X12_Y5_N4
\add_instance|carry~16\ : maxv_lcell
-- Equation(s):
-- \add_instance|carry~16_combout\ = (\add_instance|multiplier:pps[3][5]~combout\ & ((\add_instance|carry~14_combout\) # (\add_instance|carry~13_combout\ $ (\add_instance|carry~17_combout\)))) # (!\add_instance|multiplier:pps[3][5]~combout\ & 
-- (\add_instance|carry~14_combout\ & (\add_instance|carry~13_combout\ $ (\add_instance|carry~17_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "be28",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \add_instance|multiplier:pps[3][5]~combout\,
	datab => \add_instance|carry~13_combout\,
	datac => \add_instance|carry~17_combout\,
	datad => \add_instance|carry~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|carry~16_combout\);

-- Location: LC_X12_Y5_N3
\add_instance|M[6]~4\ : maxv_lcell
-- Equation(s):
-- \add_instance|M[6]~4_combout\ = \add_instance|carry~15_combout\ $ (\add_instance|carry~16_combout\ $ (((\input_vector~combout\(3) & \input_vector~combout\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "963c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector~combout\(3),
	datab => \add_instance|carry~15_combout\,
	datac => \add_instance|carry~16_combout\,
	datad => \input_vector~combout\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|M[6]~4_combout\);

-- Location: LC_X12_Y5_N1
\add_instance|M[7]~5\ : maxv_lcell
-- Equation(s):
-- \add_instance|M[7]~5_combout\ = (\add_instance|carry~15_combout\ & ((\add_instance|carry~16_combout\) # ((\input_vector~combout\(3) & \input_vector~combout\(7))))) # (!\add_instance|carry~15_combout\ & (\input_vector~combout\(3) & 
-- (\add_instance|carry~16_combout\ & \input_vector~combout\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "e8c0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector~combout\(3),
	datab => \add_instance|carry~15_combout\,
	datac => \add_instance|carry~16_combout\,
	datad => \input_vector~combout\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|M[7]~5_combout\);

-- Location: PIN_55,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\output_vector[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \add_instance|multiplier:pps[0][0]~combout\,
	oe => VCC,
	padio => ww_output_vector(0));

-- Location: PIN_102,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\output_vector[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \add_instance|M\(1),
	oe => VCC,
	padio => ww_output_vector(1));

-- Location: PIN_103,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\output_vector[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \add_instance|M\(2),
	oe => VCC,
	padio => ww_output_vector(2));

-- Location: PIN_101,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\output_vector[3]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \add_instance|M\(3),
	oe => VCC,
	padio => ww_output_vector(3));

-- Location: PIN_105,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\output_vector[4]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \add_instance|M\(4),
	oe => VCC,
	padio => ww_output_vector(4));

-- Location: PIN_87,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\output_vector[5]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \add_instance|M\(5),
	oe => VCC,
	padio => ww_output_vector(5));

-- Location: PIN_91,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\output_vector[6]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \add_instance|M[6]~4_combout\,
	oe => VCC,
	padio => ww_output_vector(6));

-- Location: PIN_89,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\output_vector[7]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \add_instance|M[7]~5_combout\,
	oe => VCC,
	padio => ww_output_vector(7));
END structure;


