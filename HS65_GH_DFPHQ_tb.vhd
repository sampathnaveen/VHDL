library ieee; use ieee.std_logic_1164.all;
entity HS65_GH_DFPHQ_tb is
end;

architecture tb of HS65_GH_DFPHQ_tb is
component HS65_GH_DFPHQ is
	port
	(D, CP, E: in std_logic;
	 Q: out std_logic
	);
end component;
	signal D : std_logic := '0';
	signal CP : std_logic := '0';
    signal E : std_logic := '0';
	signal Q : std_logic;
	constant period : time := 6 ns; --167 MHz
begin
uut : HS65_GH_DFPHQ
	port map( D => D, CP => CP, E => E, Q => Q );

	CP <= not CP after period/2;
	E <= '1', '0' after 7 ns, '1' after 8 ns, '0' after 22 ns, '1' after 23 ns;
	D <= '0', '1' after 5 ns, '0' after 11 ns, '1' after 19 ns, '0' after 25 ns, '1' after 34 ns;

	timeBomb: process
	begin
	  wait for 40 ns;
	  assert false
		report "simulation ended by SN at " & time'image(now)
		severity failure;
	end process;
end tb;
