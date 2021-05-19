
-- Declaring necessary tools and libraries
library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

-- Declaring main entity 
entity Add_Subtract_Primes is
	port (A3, A2, A1, A0, B3, B2, B1, B0: in std_logic; L1, L2, R0, R1, R2, R3, Cout: out std_logic);
end entity Add_Subtract_Primes;

-- Declaring architecture by specifying main component and necessary intermediate signals
architecture Struct of Add_Subtract_Primes is
	
	component Check_Prime is
		port (A3, A2, A1, A0: in std_logic; Y: out std_logic);
	end component Check_Prime;

	component Four_Bit_Adder  is
	port (A0, A1, A2, A3, B0, B1, B2, B3: in std_logic; R0, R1, R2, R3, Cout: out std_logic);
	end component Four_Bit_Adder;
	
	component TwosComp is
		port (X1, X2, X3, X4: in std_logic; Y1, Y2, Y3, Y4: out std_logic);
	end component TwosComp;
	
	component FourIPMUX is
		port (X1, X2, X3, X4, S1, S2: in std_logic; Y: out std_logic);
	end component FourIPMUX;
	
	component INVERTER is
   port (A: in std_logic; Y: out std_logic);
  end component INVERTER;
	
	-- Signal names are self sufficient to understand when paired with component port maps
	signal Log1, Log2, I0, I1, I2, I3, Sub0, Sub1, Sub2, Sub3, CSFinal, CarrySub, Add0, Add1, Add2, Add3, CarryAdd: std_logic;

begin
	-- component instances
	logical1: Check_Prime
		port map(A3=>A3, A2=>A2, A1=>A1, A0=>A0, Y=>Log1);
		
	logical2: Check_Prime
		port map(A3=>B3, A2=>B2, A1=>B1, A0=>B0, Y=>Log2);
		
	minus_b: TwosComp
		port map(B0, B1, B2, B3, I0, I1, I2, I3);
		
	sub: Four_Bit_Adder
		port map(A0, A1, A2, A3, I0, I1, I2, I3, Sub0, Sub1, Sub2, Sub3, CarrySub);
		
	add: Four_Bit_Adder
		port map(A0, A1, A2, A3, B0, B1, B2, B3, Add0, Add1, Add2, Add3, CarryAdd);
		
	mux1: FourIPMUX
		port map('0', Add0, Add0, Sub0, Log1, Log2, R0);
		
	mux2: FourIPMUX
		port map('0', Add1, Add1, Sub1, Log1, Log2, R1);
		
	mux3: FourIPMUX
		port map('0', Add2, Add2, Sub2, Log1, Log2, R2);
		
	mux4: FourIPMUX
		port map('0', Add3, Add3, Sub3, Log1, Log2, R3);
		
	inv : INVERTER
		port map(CarrySub, CSFinal);
		
	mux5: FourIPMUX
		port map('0', CarryAdd, CarryAdd, CSFinal, Log1, Log2, Cout);
	
	L1 <= Log1;
	L2 <= Log2;
end Struct;
