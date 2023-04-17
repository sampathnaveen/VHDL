-- aAnd4_tb
use Std.Textio.all;
library IEEE;
use ieee.std_logic_1164.ALL;
entity aAnd4_tb is
end;

architecture tb of aAnd4_tb is
  component aAnd4
    generic (width : integer := 1);
    port (A : std_logic_vector ((width - 1) downto 0);
      B : std_logic_vector ((width - 1) downto 0);
   	  C : std_logic_vector ((width - 1) downto 0);
	  D : std_logic_vector ((width - 1) downto 0);
	  Y : out std_logic_vector ((width - 1) downto 0));
  end component;

  for all : aAnd4 use entity work.aAnd4 (behavior);

  signal A : std_logic_vector (3 downto 0);
  signal B : std_logic_vector (3 downto 0);
  signal C : std_logic_vector (3 downto 0);
  signal D : std_logic_vector (3 downto 0);
  signal Y : std_logic_vector (3 downto 0);
begin
  A4 : aAnd4 generic map (4)
    --port map ( A <= A, B <= B, C <= C, D <= D, Y <= Y);
	port map ( A => A, B => B, C => C, D => D, Y => Y);

  testProcess : process
  begin
    A <= "0001" ;
    B <= "0001" ;
	C <= "0001" ;
	D <= "0001" ;
    wait for 10 ns;

    A <= "1111" ;
    B <= "0001" ;
	C <= "1111" ;
	D <= "0001" ;
    wait for 10 ns;

    A <= "1111" ;
    B <= "0101" ;
	C <= "1111" ;
    D <= "0101" ;
	wait for 10 ns;

    A <= "1010" ;
    B <= "0101" ;
	C <= "1010" ;
    D <= "0101" ;
    wait for 10 ns;

    wait;
  end process testProcess;
end tb;
