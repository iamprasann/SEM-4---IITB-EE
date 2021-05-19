
-- Declaring necessary tools and libraries
library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

-- Declaring main entity 
entity OR_4 is
	port (A, B, C, D: in std_logic; Y: out std_logic);
end entity OR_4;

-- Declaring architecture by specifying main component and necessary intermediate signals
architecture Struct of OR_4 is
	
	component OR_2 is
		port (A, B: in std_logic; Y: out std_logic);
	end component OR_2;
	
	-- Signal names are self sufficient to understand when paired with component port maps
	signal I1, I2: std_logic;

begin
	-- component instances
	or1: OR_2
		port map(A=>A, B=>B, Y=>I1);
	or2: OR_2
		port map(A=>C, B=>D, Y=>I2);	
	
	or_final: OR_2
		port map(A=>I1, B=>I2, Y=>Y);
end Struct;
