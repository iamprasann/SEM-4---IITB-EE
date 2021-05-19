
-- Declaring necessary tools and libraries
library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

-- Defining our main entity, Four bit adder
entity Four_Bit_Adder  is
	port (A0, A1, A2, A3, B0, B1, B2, B3: in std_logic; R0, R1, R2, R3, Cout: out std_logic);
end entity Four_Bit_Adder;

-- Defining architecture of our entity
architecture Struct of Four_Bit_Adder is
	
	-- Only full adder components are used
	component Full_Adder is
		port (A, B, Cin: in std_logic; S, Cout: out std_logic);
	end component Full_Adder;
	
	-- Carry signals are intermediate
	signal C1, C2, C3: std_logic;

-- Port maps explicitly depict the connections and logic of the circuit
begin
	-- component instances
	fa0: Full_Adder 
		 port map (A => A0, B => B0, Cin => '0', S => R0, Cout => C1);
		 
	fa1: Full_Adder 
		 port map (A => A1, B => B1, Cin => C1, S => R1, Cout => C2);
		 
	fa2: Full_Adder 
		 port map (A => A2, B => B2, Cin => C2, S => R2, Cout => C3);
	
	fa3: Full_Adder 
		 port map (A => A3, B => B3, Cin => C3, S => R3, Cout => Cout);

end Struct;
