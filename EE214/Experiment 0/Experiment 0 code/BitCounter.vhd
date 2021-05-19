
-- Declaring necessary tools and libraries
library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

-- Declaring main entity which counts bits and gives output in binary representation
entity Bit_Counter  is
	port (X0, X1, X2, X3, X4, X5, X6, X7: in std_logic; Y0, Y1, Y2, Y3: out std_logic);
end entity Bit_Counter;

-- Declaring Bit Counters architecture by specifying main component and necessary intermediate signals
architecture Struct of Bit_Counter is
	
	component Full_Adder is
		port (A, B, Cin: in std_logic; S, Cout: out std_logic);
	end component Full_Adder;
	
	-- Signal names are self sufficient to understand when paired with component port maps
	signal S0, S1, S2, C0, C1, C2, C3, CS0, CC0, CC1: std_logic;

begin
	-- component instances
	fa0: Full_Adder 
		 port map (A => X1, B => X2, Cin => X0, S => S0, Cout => C0);
		 
	fa1: Full_Adder 
		 port map (A => S0, B => X4, Cin => X3, S => S1, Cout => C1);
		 
	fa2: Full_Adder 
		 port map (A => S1, B => X6, Cin => X5, S => S2, Cout => C2);
	
	fa3: Full_Adder 
		 port map (A => S2, B => X7, Cin => '0', S => Y0, Cout => C3);
		 
	fa4: Full_Adder 
		 port map (A => C0, B => C1, Cin => C2, S => CS0, Cout => CC0);
		 
	fa5: Full_Adder 
		 port map (A => CS0, B => C3, Cin => '0', S => Y1, Cout => CC1);
	
	fa6: Full_Adder 
		 port map (A => CC0, B => CC1, Cin => '0', S => Y2, Cout => Y3);

end Struct;
