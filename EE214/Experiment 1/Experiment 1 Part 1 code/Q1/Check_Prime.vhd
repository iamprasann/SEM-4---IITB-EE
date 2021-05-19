
-- Declaring necessary tools and libraries
library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

-- Declaring main entity 
entity Check_Prime is
	port (A3, A2, A1, A0: in std_logic; Y: out std_logic);
end entity Check_Prime;

-- Declaring architecture by specifying main component and necessary intermediate signals
architecture Struct of Check_Prime is
	
	component AND_3 is
		port (A, B, C: in std_logic; Y: out std_logic);
	end component AND_3;
	
	component INVERTER is
   port (A: in std_logic; Y: out std_logic);
  end component INVERTER;

  component OR_4 is
   port (A, B, C, D: in std_logic; Y: out std_logic);
  end component OR_4;
	
	-- Signal names are self sufficient to understand when paired with component port maps
	signal I1, I2, I3, O1, O2, O3, O4: std_logic;

begin
	-- component instances
	not1: INVERTER
		port map(A=>A1, Y=>I1);
		
	not2: INVERTER
		port map(A=>A2, Y=>I2);
		
	not3: INVERTER
		port map(A=>A3, Y=>I3);
		
	and1: AND_3
		port map(A=>I2, B=>A1, C=>A0, Y=>O1);
	
	and2: AND_3
		port map(A=>I3, B=>I2, C=>A1, Y=>O2);
	
	and3: AND_3
		port map(A=>I3, B=>A2, C=>A0, Y=>O3);
		
	and4: AND_3
		port map(A=>A2, B=>I1, C=>A0, Y=>O4);
		
	or_final: OR_4
		port map(A=>O1, B=>O2, C=>O3, D=>O4, Y=>Y);
		
end Struct;
