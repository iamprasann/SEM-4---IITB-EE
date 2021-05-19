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
-- VERSION "Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"

-- DATE "03/06/2021 11:52:40"

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
	output_vector : BUFFER std_logic_vector(5 DOWNTO 0)
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
SIGNAL ww_output_vector : std_logic_vector(5 DOWNTO 0);
SIGNAL \add_instance|ander5|Y~0_combout\ : std_logic;
SIGNAL \add_instance|xorer0|Y~0_combout\ : std_logic;
SIGNAL \add_instance|ander5|Y~1_combout\ : std_logic;
SIGNAL \add_instance|mux0|or_final|or_final|Y~0_combout\ : std_logic;
SIGNAL \add_instance|mux0|or_final|or_final|Y~1_combout\ : std_logic;
SIGNAL \add_instance|mux1|or_final|or_final|Y~0_combout\ : std_logic;
SIGNAL \add_instance|mux1|or_final|or_final|Y~1_combout\ : std_logic;
SIGNAL \add_instance|mux1|or_final|or_final|Y~2_combout\ : std_logic;
SIGNAL \add_instance|mux1|or_final|or_final|Y~3_combout\ : std_logic;
SIGNAL \add_instance|mux2|or_final|or_final|Y~0_combout\ : std_logic;
SIGNAL \add_instance|mux2|or_final|or_final|Y~1_combout\ : std_logic;
SIGNAL \add_instance|mux3|or_final|or_final|Y~1_combout\ : std_logic;
SIGNAL \add_instance|BCD_1|fa3|a1|Y~0_combout\ : std_logic;
SIGNAL \add_instance|mux3|or_final|or_final|Y~0_combout\ : std_logic;
SIGNAL \add_instance|mux3|or_final|or_final|Y~2_combout\ : std_logic;
SIGNAL \add_instance|mux4|or_final|or1|Y~0_combout\ : std_logic;
SIGNAL \input_vector~combout\ : std_logic_vector(7 DOWNTO 0);

BEGIN

ww_input_vector <= input_vector;
output_vector <= ww_output_vector;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: PIN_79,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_vector[4]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_input_vector(4),
	combout => \input_vector~combout\(4));

-- Location: PIN_88,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_vector[3]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_input_vector(3),
	combout => \input_vector~combout\(3));

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

-- Location: PIN_89,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_vector[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_input_vector(2),
	combout => \input_vector~combout\(2));

-- Location: PIN_85,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_vector[6]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_input_vector(6),
	combout => \input_vector~combout\(6));

-- Location: LC_X16_Y4_N8
\add_instance|ander5|Y~0\ : maxv_lcell
-- Equation(s):
-- \add_instance|ander5|Y~0_combout\ = (\input_vector~combout\(3) & (\input_vector~combout\(7) & (\input_vector~combout\(2) $ (!\input_vector~combout\(6))))) # (!\input_vector~combout\(3) & (!\input_vector~combout\(7) & (\input_vector~combout\(2) $ 
-- (!\input_vector~combout\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "9009",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector~combout\(3),
	datab => \input_vector~combout\(7),
	datac => \input_vector~combout\(2),
	datad => \input_vector~combout\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|ander5|Y~0_combout\);

-- Location: PIN_97,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_vector[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_input_vector(0),
	combout => \input_vector~combout\(0));

-- Location: LC_X16_Y4_N7
\add_instance|xorer0|Y~0\ : maxv_lcell
-- Equation(s):
-- \add_instance|xorer0|Y~0_combout\ = ((\input_vector~combout\(4) $ (\input_vector~combout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0ff0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \input_vector~combout\(4),
	datad => \input_vector~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|xorer0|Y~0_combout\);

-- Location: PIN_87,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_vector[5]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_input_vector(5),
	combout => \input_vector~combout\(5));

-- Location: PIN_80,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_vector[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_input_vector(1),
	combout => \input_vector~combout\(1));

-- Location: LC_X16_Y4_N1
\add_instance|ander5|Y~1\ : maxv_lcell
-- Equation(s):
-- \add_instance|ander5|Y~1_combout\ = (\add_instance|ander5|Y~0_combout\ & (!\add_instance|xorer0|Y~0_combout\ & (\input_vector~combout\(5) $ (!\input_vector~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "2002",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \add_instance|ander5|Y~0_combout\,
	datab => \add_instance|xorer0|Y~0_combout\,
	datac => \input_vector~combout\(5),
	datad => \input_vector~combout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|ander5|Y~1_combout\);

-- Location: LC_X16_Y4_N5
\add_instance|mux0|or_final|or_final|Y~0\ : maxv_lcell
-- Equation(s):
-- \add_instance|mux0|or_final|or_final|Y~0_combout\ = (\input_vector~combout\(3) & ((\input_vector~combout\(2) & (\add_instance|ander5|Y~1_combout\)) # (!\input_vector~combout\(2) & ((\input_vector~combout\(0)))))) # (!\input_vector~combout\(3) & 
-- (((!\input_vector~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8f85",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector~combout\(3),
	datab => \add_instance|ander5|Y~1_combout\,
	datac => \input_vector~combout\(2),
	datad => \input_vector~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|mux0|or_final|or_final|Y~0_combout\);

-- Location: LC_X16_Y4_N2
\add_instance|mux0|or_final|or_final|Y~1\ : maxv_lcell
-- Equation(s):
-- \add_instance|mux0|or_final|or_final|Y~1_combout\ = (\input_vector~combout\(4) & (((\add_instance|mux0|or_final|or_final|Y~0_combout\))))

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
	datac => \add_instance|mux0|or_final|or_final|Y~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|mux0|or_final|or_final|Y~1_combout\);

-- Location: LC_X16_Y4_N9
\add_instance|mux1|or_final|or_final|Y~0\ : maxv_lcell
-- Equation(s):
-- \add_instance|mux1|or_final|or_final|Y~0_combout\ = (\input_vector~combout\(5) & (((!\add_instance|xorer0|Y~0_combout\ & \add_instance|ander5|Y~0_combout\)) # (!\input_vector~combout\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "7050",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector~combout\(2),
	datab => \add_instance|xorer0|Y~0_combout\,
	datac => \input_vector~combout\(5),
	datad => \add_instance|ander5|Y~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|mux1|or_final|or_final|Y~0_combout\);

-- Location: LC_X16_Y4_N3
\add_instance|mux1|or_final|or_final|Y~1\ : maxv_lcell
-- Equation(s):
-- \add_instance|mux1|or_final|or_final|Y~1_combout\ = (\input_vector~combout\(2) & (((\input_vector~combout\(4))))) # (!\input_vector~combout\(2) & (((\input_vector~combout\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f5a0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector~combout\(2),
	datac => \input_vector~combout\(4),
	datad => \input_vector~combout\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|mux1|or_final|or_final|Y~1_combout\);

-- Location: LC_X16_Y4_N6
\add_instance|mux1|or_final|or_final|Y~2\ : maxv_lcell
-- Equation(s):
-- \add_instance|mux1|or_final|or_final|Y~2_combout\ = (\add_instance|mux1|or_final|or_final|Y~0_combout\ & (\add_instance|mux1|or_final|or_final|Y~1_combout\ $ ((\input_vector~combout\(2))))) # (!\add_instance|mux1|or_final|or_final|Y~0_combout\ & 
-- (\add_instance|mux1|or_final|or_final|Y~1_combout\ & ((\input_vector~combout\(2)) # (\input_vector~combout\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "6a68",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \add_instance|mux1|or_final|or_final|Y~1_combout\,
	datab => \add_instance|mux1|or_final|or_final|Y~0_combout\,
	datac => \input_vector~combout\(2),
	datad => \input_vector~combout\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|mux1|or_final|or_final|Y~2_combout\);

-- Location: LC_X16_Y4_N4
\add_instance|mux1|or_final|or_final|Y~3\ : maxv_lcell
-- Equation(s):
-- \add_instance|mux1|or_final|or_final|Y~3_combout\ = (\input_vector~combout\(3) & (\input_vector~combout\(1) & (\add_instance|mux1|or_final|or_final|Y~0_combout\))) # (!\input_vector~combout\(3) & ((\add_instance|mux1|or_final|or_final|Y~0_combout\ $ 
-- (\add_instance|mux1|or_final|or_final|Y~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "883c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector~combout\(1),
	datab => \add_instance|mux1|or_final|or_final|Y~0_combout\,
	datac => \add_instance|mux1|or_final|or_final|Y~2_combout\,
	datad => \input_vector~combout\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|mux1|or_final|or_final|Y~3_combout\);

-- Location: LC_X16_Y5_N8
\add_instance|mux2|or_final|or_final|Y~0\ : maxv_lcell
-- Equation(s):
-- \add_instance|mux2|or_final|or_final|Y~0_combout\ = (\input_vector~combout\(2) & (((\input_vector~combout\(5))))) # (!\input_vector~combout\(2) & (\input_vector~combout\(6) & ((\input_vector~combout\(5)) # (!\input_vector~combout\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f1c0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector~combout\(7),
	datab => \input_vector~combout\(2),
	datac => \input_vector~combout\(5),
	datad => \input_vector~combout\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|mux2|or_final|or_final|Y~0_combout\);

-- Location: LC_X16_Y5_N2
\add_instance|mux2|or_final|or_final|Y~1\ : maxv_lcell
-- Equation(s):
-- \add_instance|mux2|or_final|or_final|Y~1_combout\ = (\input_vector~combout\(3) & (\add_instance|ander5|Y~1_combout\ & (\input_vector~combout\(2)))) # (!\input_vector~combout\(3) & (((\add_instance|mux2|or_final|or_final|Y~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8f80",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \add_instance|ander5|Y~1_combout\,
	datab => \input_vector~combout\(2),
	datac => \input_vector~combout\(3),
	datad => \add_instance|mux2|or_final|or_final|Y~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|mux2|or_final|or_final|Y~1_combout\);

-- Location: LC_X16_Y5_N9
\add_instance|mux3|or_final|or_final|Y~1\ : maxv_lcell
-- Equation(s):
-- \add_instance|mux3|or_final|or_final|Y~1_combout\ = (((!\input_vector~combout\(3) & \input_vector~combout\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0f00",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \input_vector~combout\(3),
	datad => \input_vector~combout\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|mux3|or_final|or_final|Y~1_combout\);

-- Location: LC_X16_Y5_N7
\add_instance|BCD_1|fa3|a1|Y~0\ : maxv_lcell
-- Equation(s):
-- \add_instance|BCD_1|fa3|a1|Y~0_combout\ = (((!\input_vector~combout\(5) & !\input_vector~combout\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "000f",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \input_vector~combout\(5),
	datad => \input_vector~combout\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|BCD_1|fa3|a1|Y~0_combout\);

-- Location: LC_X16_Y5_N4
\add_instance|mux3|or_final|or_final|Y~0\ : maxv_lcell
-- Equation(s):
-- \add_instance|mux3|or_final|or_final|Y~0_combout\ = (\input_vector~combout\(3) & ((\add_instance|ander5|Y~1_combout\) # ((!\input_vector~combout\(2))))) # (!\input_vector~combout\(3) & (((\add_instance|BCD_1|fa3|a1|Y~0_combout\ & 
-- !\input_vector~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a0fc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \add_instance|ander5|Y~1_combout\,
	datab => \add_instance|BCD_1|fa3|a1|Y~0_combout\,
	datac => \input_vector~combout\(3),
	datad => \input_vector~combout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|mux3|or_final|or_final|Y~0_combout\);

-- Location: LC_X16_Y5_N6
\add_instance|mux3|or_final|or_final|Y~2\ : maxv_lcell
-- Equation(s):
-- \add_instance|mux3|or_final|or_final|Y~2_combout\ = (\input_vector~combout\(7) & ((\add_instance|mux3|or_final|or_final|Y~0_combout\) # ((\add_instance|mux3|or_final|or_final|Y~1_combout\ & \input_vector~combout\(2))))) # (!\input_vector~combout\(7) & 
-- (\add_instance|mux3|or_final|or_final|Y~1_combout\ & ((\input_vector~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "eca0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector~combout\(7),
	datab => \add_instance|mux3|or_final|or_final|Y~1_combout\,
	datac => \add_instance|mux3|or_final|or_final|Y~0_combout\,
	datad => \input_vector~combout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|mux3|or_final|or_final|Y~2_combout\);

-- Location: LC_X16_Y5_N5
\add_instance|mux4|or_final|or1|Y~0\ : maxv_lcell
-- Equation(s):
-- \add_instance|mux4|or_final|or1|Y~0_combout\ = (\input_vector~combout\(7) & (!\input_vector~combout\(3) & ((\input_vector~combout\(2)) # (!\add_instance|BCD_1|fa3|a1|Y~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0a02",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector~combout\(7),
	datab => \add_instance|BCD_1|fa3|a1|Y~0_combout\,
	datac => \input_vector~combout\(3),
	datad => \input_vector~combout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \add_instance|mux4|or_final|or1|Y~0_combout\);

-- Location: PIN_84,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\output_vector[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \add_instance|mux0|or_final|or_final|Y~1_combout\,
	oe => VCC,
	padio => ww_output_vector(0));

-- Location: PIN_81,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\output_vector[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \add_instance|mux1|or_final|or_final|Y~3_combout\,
	oe => VCC,
	padio => ww_output_vector(1));

-- Location: PIN_91,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\output_vector[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \add_instance|mux2|or_final|or_final|Y~1_combout\,
	oe => VCC,
	padio => ww_output_vector(2));

-- Location: PIN_94,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\output_vector[3]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \add_instance|mux3|or_final|or_final|Y~2_combout\,
	oe => VCC,
	padio => ww_output_vector(3));

-- Location: PIN_95,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\output_vector[4]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \add_instance|mux4|or_final|or1|Y~0_combout\,
	oe => VCC,
	padio => ww_output_vector(4));

-- Location: PIN_69,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\output_vector[5]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_output_vector(5));
END structure;


