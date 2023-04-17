library ieee; use ieee.std_logic_1164.all;
entity MX4_tb is 
end;

architecture tb of MX4_tb is
component MX4 is
  port (
	A, B, C, D: in std_logic;
	S1, S0 : in std_logic;
	Y: out std_logic
	);
end component;
	signal A : std_logic := '0';
	signal B : std_logic := '0';
	signal C : std_logic := '0';
	signal D : std_logic := '0';
	signal S0 : std_logic := '0';
	signal S1 : std_logic := '0';
	signal Y : std_logic;
begin

uut : MX4
  port map( A => A, B => B, C => C, D => D, S0 => S0, S1 => S1, Y => Y);
  A <= not A after 2 ns;
  B <= not B after 4 ns;
  C <= not C after 8 ns;
  D <= not D after 16 ns;
  S0 <= not S0 after 3 ns;
  S1 <= not S1 after 6 ns;

timeBomb: process
	begin
	  wait for 30 ns;
	  assert false
		report "simulation ended by OH at " & time'image(now)
		severity failure;
	end process;
end tb;
