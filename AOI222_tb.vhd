library ieee;
use ieee.std_logic_1164.all;

	entity AOI222_tb is
	end entity;
	
	
	architecture tb of AOI222_tb is
	
	component AOI222
	
		port 
		(
				A0 : in std_logic;
				A1 : in std_logic;
				B0 : in std_logic;
				B1 : in std_logic;
				C0 : in std_logic;
				C1 : in std_logic;
				Y : out std_logic
		);
	end component;
	
-- instantiate the signal with the initial value := 0 for all the inputs

	signal A0, A1, B0, B1, C0, C1 : std_logic := '0';
	
	signal Y : std_logic;
	
	begin
	
	dut : AOI222
	
	port map 
			(	
				A0 => A0,
				A1 => A1,
				B0 => B0,
				B1 => B1,
				C0 => C0,
				C1 => C1,
				Y => Y
				
			);

				A0 <= not A0 after 3 ns;
                A1 <= not A1 after 6 ns;
                B0 <= not B0 after 12 ns;
                B1 <= not B1 after 24 ns;
                C0 <= not C0 after 48 ns;
                C1 <= not C1 after 96 ns;
				
		timebomb : process
		
		
		begin
			wait for 200 ns;
			assert false 
				report "Simulation ended by SN at " & time'image(now)
				severity failure;
			end process;
	
	end tb;