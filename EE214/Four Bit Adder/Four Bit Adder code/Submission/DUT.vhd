-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the
--  Full-adder.

library ieee;
use ieee.std_logic_1164.all;
entity DUT is
   port(input_vector: in std_logic_vector(7 downto 0);
       	output_vector: out std_logic_vector(4 downto 0));
end entity;

-- Editing standard DUT format to meet requirements of experiment
architecture DutWrap of DUT is
	component Four_Bit_Adder is
		port (A0, A1, A2, A3, B0, B1, B2, B3: in std_logic; R0, R1, R2, R3, Cout: out std_logic);
	end component;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: Four_Bit_Adder 
			port map (
					B3 => input_vector(7),
					B2 => input_vector(6),
					B1 => input_vector(5),
					B0 => input_vector(4),
					
					A3 => input_vector(3),
					A2 => input_vector(2),
					A1 => input_vector(1),
					A0 => input_vector(0),
					
					Cout => output_vector(4),
					R3 => output_vector(3),
					R2 => output_vector(2),
					R1 => output_vector(1),
					R0 => output_vector(0) );

end DutWrap;

