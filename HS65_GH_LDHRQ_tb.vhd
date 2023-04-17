library ieee; use ieee.std_logic_1164.all;
entity HS65_GH_LDHRQ_tb is
end;

architecture tb of HS65_GH_LDHRQ_tb is
component HS65_GH_LDHRQ is
	port
	(D, G, RN: in std_logic;
	 Q : out std_logic
	);
end component;
	signal D : std_logic := '0';
	signal G : std_logic := '0';
	signal Q : std_logic;
	signal RN : std_logic := '1';

begin
uut : HS65_GH_LDHRQ
	port map( D => D, G => G, RN => RN, Q => Q );
 
    G <= '1', '0' after 3 ns, '1' after 7 ns, '0' after 10 ns, '1' after 13 ns, '0' after 16 ns, '1' after 19 ns, '0' after 23 ns, '1' after 26 ns, '0' after 30 ns, '1' after 35.7 ns;
	RN <= '1', '0' after 7 ns, '1' after 8 ns, '0' after 22 ns, '1' after 23 ns;
	D <= '0', '1' after 5 ns, '0' after 11 ns, '1' after 19 ns, '0' after 25 ns, '1' after 34 ns;

	timeBomb: process
	begin
	  wait for 40 ns;
	  assert false
		report "simulation ended by OH at " & time'image(now)
		severity failure;
	end process;
end tb;
