-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the
--  Full-adder.

library ieee;
use ieee.std_logic_1164.all;
entity DUT is
   port(input_vector: in std_logic_vector(7 downto 0);
       	output_vector: out std_logic_vector(6 downto 0));
end entity;

-- Editted original DUT format to suit our needs as per given problem
architecture DutWrap of DUT is
   component Add_Subtract_Primes is
		port ( A3, A2, A1, A0, B3, B2, B1, B0: in std_logic; L1, L2, R0, R1, R2, R3, Cout: out std_logic); 
   end component Add_Subtract_Primes;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: Add_Subtract_Primes
			port map (
					A3 => input_vector(7),
					A2 => input_vector(6),
					A1 => input_vector(5),
					A0 => input_vector(4),
					
					B3 => input_vector(3),
					B2 => input_vector(2),
					B1 => input_vector(1),
					B0 => input_vector(0),
					
					L1 => output_vector(6),
					L2 => output_vector(5),
					Cout => output_vector(4),
					R3 => output_vector(3),
					R2 => output_vector(2),
					R1 => output_vector(1),
					R0 => output_vector(0));

end DutWrap;

