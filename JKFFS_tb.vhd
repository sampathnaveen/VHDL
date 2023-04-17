library ieee; use ieee.std_logic_1164.all;
entity JKFFS_tb is
end;
architecture tb of JKFFS_tb is
component JKFFS is
	port
	(J, K, CK, SN: in std_logic;
	 Q, QN: out std_logic
	);
end component;
	signal J : std_logic := '0';
    signal K : std_logic := '0';
	signal CK : std_logic := '0';
	signal Q, QN: std_logic;
	signal SN : std_logic := '1';
	constant period : time := 6 ns; --167 MHz
begin
uut : JKFFS
	port map( J => J, K => K, CK => CK, SN => SN, Q => Q, QN => QN);

	CK <= not CK after period/2;
	SN <= '1', '0' after 7 ns, '1' after 8 ns, '0' after 22 ns, '1' after 23 ns;
	J <= '0', '1' after 5 ns, '0' after 11 ns, '1' after 19 ns, '0' after 25 ns, '1' after 34 ns;
    K <= '0', '1' after 5 ns, '0' after 11 ns, '0' after 19 ns, '1' after 25 ns, '1' after 34 ns;
	timeBomb: process
	begin
	  wait for 40 ns;
	  assert false
		report "simulation ended by SN at " & time'image(now)
		severity failure;
	end process;
end tb;
