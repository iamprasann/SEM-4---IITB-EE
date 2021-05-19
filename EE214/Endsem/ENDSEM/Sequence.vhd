library ieee;
use ieee.std_logic_1164.all;

library work;
use work.D_FF.all;
use work.Gates.all;

entity Sequence is
	port(RST, IP, CLK: in std_logic; N: out std_logic_vector(2 downto 0));
end entity Sequence;

architecture struct of Sequence is

	signal RST_bar, IP_bar, P2_bar, P1_bar, P0_bar, 
	MIN1, MIN2, MIN3, MIN4, MIN5, MIN6, MIN7, MIN8, MIN9, MIN10, MIN11, MIN12, MIN13, MIN14, MIN15, 
	P2, P1, P0,
	N2, N1, N0: std_logic;
	
	component AND_3 is
		port(A, B, C: in std_logic; Y: out std_logic);
	end component;

	component AND_4 is
		port(A, B, C, D: in std_logic; Y: out std_logic);
	end component;
	
	component AND_5 is
		port(A, B, C, D, E: in std_logic; Y: out std_logic);
	end component;

	component OR_5 is
		port(A, B, C, D, E: in std_logic; Y: out std_logic);
	end component;
	
	
begin
	INV_RST: INVERTER
		port map(RST, RST_bar);
	INV_IP: INVERTER
		port map(IP, IP_bar);
	INV_P0: INVERTER
		port map(P0, P0_bar);
	INV_P1: INVERTER
		port map(P1, P1_bar);
	INV_P2: INVERTER
		port map(P2, P2_bar);
	
	N2_1: AND_4
		port map(P2_bar, P1, RST_bar, IP_bar, MIN1);
	N2_2: AND_4
		port map(P2_bar, RST_bar, IP, P0, MIN2);
	N2_3: AND_4
		port map(P2_bar, P1_bar, P0_bar, RST_bar, MIN3);
	N2_4: AND_4
		port map(P1_bar, P0_bar, IP_bar, RST_bar, MIN4);
	N2_5: AND_4
		port map(P1_bar, P0, RST_bar, IP, MIN5);
	N2_out: OR_5
		port map(MIN1, MIN2, MIN3, MIN4, MIN5, N2);

	--D Flip Flop 2--

	FF2 : dFlipFlop
		port map('0', N2, CLK, P2);
	
	
	N1_1: AND_3
		port map(P2_bar, P1_bar, RST_bar, MIN6);
	N1_2: AND_4
		port map(P2_bar, P0, RST_bar, IP_bar, MIN7);
	N1_3: AND_4
		port map(P1_bar, P0, RST_bar, IP_bar, MIN8);
	N1_4: AND_4
		port map(P1_bar, P0_bar, RST_bar, IP, MIN9);
	N1_5: AND_5
		port map(P2, P1, P0, RST_bar, IP, MIN10);
	N1_out: OR_5
		port map(MIN6, MIN7, MIN8, MIN9, MIN10, N1);

	--D Flip Flop 1--
	
	FF1 : dFlipFlop
		port map('0', N1, CLK, P1);
	
	N0_1: AND_4
		port map(P2_bar, P1, P0, RST_bar, MIN11);
	N0_2: AND_4
		port map(P2_bar, P0_bar, RST_bar, IP, MIN12);
	N0_3: AND_4
		port map(P2, P1_bar, RST_bar, IP_bar, MIN13);
	N0_4: AND_4
		port map(P2, P0_bar, RST_bar, IP_bar, MIN14);
	N0_5: AND_4
		port map(P1, P0, RST_bar, IP, MIN15);
	N0_out: OR_5
		port map(MIN11, MIN12, MIN13, MIN14, MIN15, N0);
	
	--D Flip Flop 0--

	FF0 : dFlipFlop
		port map('0', N0, CLK, P0);
	
	N(2) <= N2;
	N(1) <= N1;
	N(0) <= N0;
	
end struct;