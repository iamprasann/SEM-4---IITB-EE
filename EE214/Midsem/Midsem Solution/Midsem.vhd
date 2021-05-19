library ieee;
use ieee.std_logic_1164.all;

library work;
use work.Gates.all;

entity Midsem is
	port(A3, A2, A1, A0, B3, B2, B1, B0: in std_logic; Y5, Y4, Y3, Y2, Y1, Y0: out std_logic);
end entity Midsem;

architecture Struct of Midsem is

	component Full_Adder is
		port (A, B, Cin: in std_logic; S, Cout: out std_logic);
	end component Full_Adder;
	
	component Four_Bit_Adder  is
		port (A0, A1, A2, A3, B0, B1, B2, B3: in std_logic; R0, R1, R2, R3, Cout: out std_logic);
	end component Four_Bit_Adder;
	
	component AND_4 is
		port (A, B, C, D: in std_logic; Y: out std_logic);
	end component AND_4;
	
	component FourIPMUX is
		port (X1, X2, X3, X4, S1, S2: in std_logic; Y: out std_logic);
	end component FourIPMUX;
	
	signal BCD0, BCD1, BCD2, BCD3, BCD4, BCD5, BCD_Carry, MUL0, MUL1, MUL2, MUL3, MUL4, AND0, AND1, AND2, AND3, EQ0, EQ1, EQ2, EQ3, t0, t1, t2, t3, EQ_t0, EQ_t1, EQ_t2, EQ_t3, flag: std_logic;
	
begin

BCD_1: Four_Bit_Adder
	port map(A0, A1, A2, A3, '0', '1', '1', '0', t0, t1, t2, t3, BCD_Carry);
	
BCD_2: Four_Bit_Adder
	port map(A0, A1, A2, A3, '0', BCD_Carry, BCD_Carry, '0', BCD0, BCD1, BCD2, BCD3, BCD4);
	
Doubler: Four_Bit_Adder
	port map(A0, A1, A2, A3, A0, A1, A2, A3, MUL0, MUL1, MUL2, MUL3, MUL4);
	
ander0: AND_2
	port map(A0, B0, AND0);
ander1: AND_2
	port map(A1, B1, AND1);
ander2: AND_2
	port map(A2, B2, AND2);
ander3: AND_2
	port map(A3, B3, AND3);

xorer0: XNOR_2
	port map(A0, B0, EQ_t0);
xorer1: XNOR_2
	port map(A1, B1, EQ_t1);
xorer2: XNOR_2
	port map(A2, B2, EQ_t2);
xorer3: XNOR_2
	port map(A3, B3, EQ_t3);
	
part4_flag: AND_4
	port map(EQ_t0, EQ_t1, EQ_t2, EQ_t3, flag);

ander4: AND_2
	port map(A0, flag, EQ0);
ander5: AND_2
	port map(A1, flag, EQ1);
ander6: AND_2
	port map(A2, flag, EQ2);
ander7: AND_2
	port map(A3, flag, EQ3);
	
mux0: FourIPMUX
	port map(BCD0, MUL0, AND0, EQ0, B2, B3, Y0);
mux1: FourIPMUX
	port map(BCD1, MUL1, AND1, EQ1, B2, B3, Y1);
mux2: FourIPMUX
	port map(BCD2, MUL2, AND2, EQ2, B2, B3, Y2);
mux3: FourIPMUX
	port map(BCD3, MUL3, AND3, EQ3, B2, B3, Y3);
mux4: FourIPMUX
	port map(BCD4, MUL4, '0', '0', B2, B3, Y4);

Y5 <= '0';

end Struct;
