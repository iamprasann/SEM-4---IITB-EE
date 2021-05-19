
-- Declaring necessary tools and libraries
library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

-- Declaring main entity which form the MUX and gives output in binary representation
entity TwosComp is
	port (X1, X2, X3, X4: in std_logic; Y1, Y2, Y3, Y4: out std_logic);
end entity TwosComp;

-- Declaring architecture by specifying main component and necessary intermediate signals
architecture Struct of TwosComp is

	component INVERTER is
		port (A: in std_logic; Y: out std_logic);
	end component INVERTER;
	
	component Four_Bit_Adder  is
	port (A0, A1, A2, A3, B0, B1, B2, B3: in std_logic; R0, R1, R2, R3, Cout: out std_logic);
	end component Four_Bit_Adder;
	
	-- Signal names are self sufficient to understand when paired with component port maps
	signal X1_bar, X2_bar, X3_bar, X4_bar, ExtraCarry: std_logic;

begin
	-- component instances
	inv1: INVERTER
		port map(A=>X1, Y=>X1_bar);
	inv2: INVERTER
		port map(A=>X2, Y=>X2_bar);
	inv3: INVERTER
		port map(A=>X3, Y=>X3_bar);
	inv4: INVERTER
		port map(A=>X4, Y=>X4_bar);
	
	final_comp: Four_Bit_Adder
		port map(X1_bar, X2_bar, X3_bar, X4_bar, '1', '0', '0', '0', Y1, Y2, Y3, Y4, ExtraCarry);
end Struct;
