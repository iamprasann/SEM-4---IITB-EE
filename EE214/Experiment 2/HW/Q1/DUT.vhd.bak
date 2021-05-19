-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the
--  Full-adder.

library ieee;
use ieee.std_logic_1164.all;
entity DUT is
   port(input_vector: in std_logic_vector(7 downto 0);
       	output_vector: out std_logic_vector(3 downto 0));
end entity;

-- Editted original DUT format to suit our needs as per given problem
architecture DutWrap of DUT is
   component Bit_Counter is
		port (X0, X1, X2, X3, X4, X5, X6, X7: in std_logic; Y0, Y1, Y2, Y3: out std_logic);     
   end component Bit_Counter;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: Bit_Counter 
			port map (
					X7 => input_vector(7),
					X6 => input_vector(6),
					X5 => input_vector(5),
					X4 => input_vector(4),
					X3 => input_vector(3),
					X2 => input_vector(2),
					X1 => input_vector(1),
					X0 => input_vector(0),
					
					Y3 => output_vector(3),
					Y2 => output_vector(2),
					Y1 => output_vector(1),
					Y0 => output_vector(0) );

end DutWrap;

