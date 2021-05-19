
-- Declaring necessary tools and libraries
library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

-- Declaring main entity 
entity AND_3 is
	port (A, B, C: in std_logic; Y: out std_logic);
end entity AND_3;

-- Declaring architecture by specifying main component and necessary intermediate signals
architecture Struct of AND_3 is
	
	component AND_2 is
		port (A, B: in std_logic; Y: out std_logic);
	end component AND_2;
	
	-- Signal names are self sufficient to understand when paired with component port maps
	signal I1: std_logic;

begin
	-- component instances
	and1: AND_2
		port map(A=>A, B=>B, Y=>I1);
	and_final: AND_2
		port map(A=>C, B=>I1, Y=>Y);	
end Struct;
