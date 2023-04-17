library ieee; use ieee.std_logic_1164.all;
entity HS65_GH_AOI22_tb is
end;

architecture tb of HS65_GH_AOI22_tb is
	component HS65_GH_AOI22
		port
		(A, B, C, D: in std_logic;
		Z: out std_logic
		);
	end component;
		signal A, B, C, D : std_logic := '0';
		signal Z: std_logic;
	begin
	
	uut : HS65_GH_AOI22
		port map
				( 
					A => A, 
					B => B, 
					C => C, 
					D => D, 
					Z => Z);
					
				A <= not A after 2 ns;
				B <= not B after 4 ns;
				C <= not C after 8 ns;
				D <= not D after 16 ns;
	
	timeBomb: process
	begin
		wait for 34 ns;
		assert false
		report "Simulation ended by SN at " & time 'image(now)
		severity failure;
		end process;
end tb; 
