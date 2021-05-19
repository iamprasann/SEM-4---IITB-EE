-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the
--  Full-adder.

library ieee;
use ieee.std_logic_1164.all;
entity DUT is
   port(input_vector: in std_logic_vector(2 downto 0);
       	output_vector: out std_logic_vector(2 downto 0));
end entity;

-- Editted original DUT format to suit our needs as per given problem
architecture DutWrap of DUT is
   component Sequence is
		port(RST, IP, CLK: in std_logic; N: out std_logic_vector(2 downto 0));
	end component Sequence;
begin
   add_instance: Sequence
			port map (
					IP => input_vector(2),
					RST => input_vector(1),
					CLK => input_vector(0),
					
					N(2) => output_vector(2),
					N(1) => output_vector(1),
					N(0) => output_vector(0) );
end DutWrap;

