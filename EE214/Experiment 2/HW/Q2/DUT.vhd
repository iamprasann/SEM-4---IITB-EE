-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the
--  Full-adder.

library ieee;
use ieee.std_logic_1164.all;
entity DUT is
   port(input_vector: in std_logic_vector(15 downto 0);
       	output_vector: out std_logic_vector(8 downto 0));
end entity;

-- Editted original DUT format to suit our needs as per given problem
architecture DutWrap of DUT is
   component add_8bit is
		port (A:in std_logic_vector(7 downto 0); B:in std_logic_vector(7 downto 0); 
		sum:out std_logic_vector(7 downto 0); carry_out :out std_logic);
	end component add_8bit;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: add_8bit 
			port map (
					A(7) => input_vector(15),
					A(6) => input_vector(14),
					A(5) => input_vector(13),
					A(4) => input_vector(12),
					A(3) => input_vector(11),
					A(2) => input_vector(10),
					A(1) => input_vector(9),
					A(0) => input_vector(8),
					
					B(7) => input_vector(7),
					B(6) => input_vector(6),
					B(5) => input_vector(5),
					B(4) => input_vector(4),
					B(3) => input_vector(3),
					B(2) => input_vector(2),
					B(1) => input_vector(1),
					B(0) => input_vector(0),
					
					carry_out => output_vector(8),
					sum(7) => output_vector(7),
					sum(6) => output_vector(6),
					sum(5) => output_vector(5),
					sum(4) => output_vector(4),
					sum(3) => output_vector(3),
					sum(2) => output_vector(2),
					sum(1) => output_vector(1),
					sum(0) => output_vector(0) );

end DutWrap;

