LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity toneGenerator is
	port (toneOut : out std_logic; --this pin will give your notes output
	clk : in std_logic;
	LED : out std_logic_vector(7 downto 0);
	switch : in std_logic_vector(7 downto 0));
	end entity toneGenerator;
--...............Start the architecture here......................
architecture behavioral of toneGenerator is
begin
process(clk)
variable count_sa1 : integer := 0;
variable sa1 : std_logic := '0';
begin
if(clk = '1' and clk' event) then
	if(switch(0) = '1') then
		if (count_sa1 = 104167) then--240Hz
			count_sa1 := 1;
			sa1 := not sa1;
		else
			count_sa1 := count_sa1 + 1;
		end if;
			toneOut <= sa1;
			LED <= (0 => '1', others => '0');

	elsif(switch(1) = '1') then
		if (count_sa1 = 92593) then--270Hz
			count_sa1 := 1;
			sa1 := not sa1;
		else
			count_sa1 := count_sa1 + 1;
		end if;
			toneOut <= sa1;
			LED <= (1 => '1', others => '0');
			
	elsif(switch(2) = '1') then
		if (count_sa1 = 83333) then--300Hz
			count_sa1 := 1;
			sa1 := not sa1;
		else
			count_sa1 := count_sa1 + 1;
		end if;
			toneOut <= sa1;
			LED <= (2 => '1', others => '0');
			
	elsif(switch(3) = '1') then
		if (count_sa1 = 78125) then--320Hz
			count_sa1 := 1;
			sa1 := not sa1;
		else
			count_sa1 := count_sa1 + 1;
		end if;
			toneOut <= sa1;
			LED <= (3 => '1', others => '0');
			
	elsif(switch(4) = '1') then
		if (count_sa1 = 69444) then--360Hz
			count_sa1 := 1;
			sa1 := not sa1;
		else
			count_sa1 := count_sa1 + 1;
		end if;
			toneOut <= sa1;
			LED <= (4 => '1', others => '0');
			
	elsif(switch(5) = '1') then
		if (count_sa1 = 62500) then--400Hz
			count_sa1 := 1;
			sa1 := not sa1;
		else
			count_sa1 := count_sa1 + 1;
		end if;
			toneOut <= sa1;
			LED <= (5 => '1', others => '0');
			
	elsif(switch(6) = '1') then
		if (count_sa1 = 55556) then--450Hz
			count_sa1 := 1;
			sa1 := not sa1;
		else
			count_sa1 := count_sa1 + 1;
		end if;
			toneOut <= sa1;
			LED <= (6 => '1', others => '0');
			
	elsif(switch(7) = '1') then
		if (count_sa1 = 52083) then--480Hz
			count_sa1 := 1;
			sa1 := not sa1;
		else
			count_sa1 := count_sa1 + 1;
		end if;
			toneOut <= sa1;
			LED <= (7 => '1', others => '0');
	end if;
end if;
end process;
end behavioral;	