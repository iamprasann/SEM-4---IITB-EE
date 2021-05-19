
-- Declaring necessary tools and libraries
library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

-- Declaring main entity which form the MUX and gives output in binary representation
entity FourIPMUX is
	port (X1, X2, X3, X4, S1, S2: in std_logic; Y: out std_logic);
end entity FourIPMUX;

-- Declaring architecture by specifying main component and necessary intermediate signals
architecture Struct of FourIPMUX is
	
	component AND_4 is
		port (A, B, C, D: in std_logic; Y: out std_logic);
	end component AND_4;
	
	component OR_4 is
		port (A, B, C, D: in std_logic; Y: out std_logic);
	end component OR_4;
	
	component INVERTER is
		port (A: in std_logic; Y: out std_logic);
	end component INVERTER;
	
	-- Signal names are self sufficient to understand when paired with component port maps
	signal S1_bar, S2_bar, O1, O2, O3, O4 : std_logic;

begin
	-- component instances
	inv1: INVERTER
		port map(A=>S1, Y=>S1_bar);
	inv2: INVERTER
		port map(A=>S2, Y=>S2_bar);	
		
	and1: AND_4
		port map(A=>X1, B=>S1_bar, C=>S2_bar, D=>'1', Y=>O1);
		
	and2: AND_4
		port map(A=>X2, B=>S1, C=>S2_bar, D=>'1', Y=>O2);
		
	and3: AND_4
		port map(A=>X3, B=>S1_bar, C=>S2, D=>'1', Y=>O3);
		
	and4: AND_4
		port map(A=>X4, B=>S1, C=>S2, D=>'1', Y=>O4);
		
	or_final: OR_4
		port map(A=>O1, B=>O2, C=>O3, D=>O4, Y=>Y);

end Struct;
