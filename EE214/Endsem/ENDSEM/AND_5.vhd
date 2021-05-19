
-- Declaring necessary tools and libraries
library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

-- Declaring main entity 
entity AND_5 is
	port (A, B, C, D, E: in std_logic; Y: out std_logic);
end entity AND_5;

-- Declaring architecture by specifying main component and necessary intermediate signals
architecture Struct of AND_5 is
	
	component AND_2 is
		port (A, B: in std_logic; Y: out std_logic);
	end component AND_2;
	
	-- Signal names are self sufficient to understand when paired with component port maps
	signal I1, I2, I3: std_logic;

begin
	-- component instances
	and1: AND_2
		port map(A=>A, B=>B, Y=>I1);
	and2: AND_2
		port map(A=>C, B=>D, Y=>I2);	
	and3: AND_2
		port map(A=>I1, B=>I2, Y=>I3);
	and_final: AND_2
		port map(A=>I3, B=>E, Y=>Y);
end Struct;
