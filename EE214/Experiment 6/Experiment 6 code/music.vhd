LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity music is
port (toneOut : out std_logic;
	clk_50, resetn : in std_logic;
	LED : out std_logic_vector(7 downto 0));
end entity music;

architecture fsm of music is

type state_type is (Silent,sa,ga,ma,re,ni);

signal y_present : state_type;
signal LED_2:std_logic_vector(7 downto 0);
signal count : integer := 0 ;
signal clock_music:std_logic :='0';

component toneGenerator is
port (toneOut : out std_logic; --this pin will give your notes output
clk : in std_logic;
LED : out std_logic_vector(7 downto 0);
switch : in std_logic_vector(7 downto 0));
end component;

begin
	process(clk_50,resetn,y_present,clock_music)	-- Fill sensitivity list
	variable y_next_var : state_type;
	variable n_count : integer := 0;
	variable timecounter : integer range 0 to 1E8 := 0;
	
	begin
	
		y_next_var := y_present;
		n_count := count;

		case y_present is
			when Silent=>
			y_next_var := sa;
			LED_2 <= (0 =>'0',others => '0');
			
			WHEN sa =>	--if the machine in Sa state
				if((n_count=2) or  (n_count=6) or (n_count=10)) then
				y_next_var := ga;
				elsif ((n_count=16) or (n_count=31)) then
				y_next_var := ni;
				else
				y_next_var := sa;
				end if;
				LED_2 <= (0=>'1',others=>'0');
				
						
			WHEN re =>
				if ((n_count=15) or (n_count=30)) then
				y_next_var := sa;
				elsif ((n_count=20) or (n_count=24)) then
				y_next_var := ni;
				elsif((n_count = 28)) then
				y_next_var := ga;
				else
				y_next_var := re;
				end if;
				LED_2 <= (1=>'1',others=>'0');

			WHEN ga => 
				if ((n_count=4) or (n_count=8)) then
				y_next_var := sa;
				elsif ((n_count=12)) then
				y_next_var := ma;
				elsif ((n_count=14) or (n_count=29)) then
				y_next_var := re;
				else
				y_next_var := ga;
				end if;
				LED_2 <= (2=>'1',others=>'0');
			
			WHEN ma =>
				y_next_var := ga;
				LED_2 <= (3=>'1',others=>'0');
			
			WHEN ni =>
				if((n_count=18) or (n_count=22) or (n_count=26)) then
				y_next_var := re;
				elsif ((n_count=32)) then
				y_next_var := Silent;
				else
				y_next_var := ni;
				end if;
				LED_2 <= (6=>'1',others=>'0');
				
				
		END CASE ;
	
--		generate 4Hz clock (0.25s time period) from 50MHz clock (clock_music)
		if (clk_50 = '1' and clk_50' event) then
			if (resetn = '0') then
				if timecounter = 6250000 then -- The cycles in which clk is 1 or 0
					timecounter := 1;		
					clock_music <= not clock_music;		-- this variable will toggle
				else
					timecounter := timecounter + 1;	-- Counter will be incremented till it reaches max count
					
				end if;
			elsif resetn = '1' then
				timecounter := 1;
				clock_music <= '0';
			end if;
		end if;
		
--		state transition	
		if (clock_music = '1' and clock_music' event) then
			if (resetn = '1') then
				y_present <= Silent;
				count <= 0;
			else 
				y_present <= y_next_var;
				count <= n_count + 1;
			end if;
		end if;
	end process;
	
TG: toneGenerator
port map(toneOut,clk_50,LED,LED_2);

end fsm;