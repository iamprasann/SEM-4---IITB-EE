-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the
--  Full-adder.

library ieee;
use ieee.std_logic_1164.all;
entity DUT is
   port(input_vector: in std_logic_vector(3 downto 0);
       	output_vector: out std_logic_vector(0 downto 0));
end entity;

-- Editted original DUT format to suit our needs as per given problem
architecture DutWrap of DUT is
   component Check_Prime is
		port (A3, A2, A1, A0: in std_logic; Y: out std_logic);  
   end component Check_Prime;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: Check_Prime
			port map (
					A3 => input_vector(3),
					A2 => input_vector(2),
					A1 => input_vector(1),
					A0 => input_vector(0),
					
					Y => output_vector(0) );

end DutWrap;

