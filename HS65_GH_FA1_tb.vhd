library ieee; use ieee.std_logic_1164.all;
entity HS65_GH_FA1_tb is
end;

architecture tb of HS65_GH_FA1_tb is
  component HS65_GH_FA1 is
    port
    ( A0, B0, CI: in bit;
      S0, CO: out bit
    );
  end component;

  signal A0, B0, CI: bit := '0';
  signal S0, CO: bit;
begin
  uut : HS65_GH_FA1
    port map( A0, B0, CI, S0, CO);

  A0 <= not A0 after 5 ns;
  B0 <= not B0 after 10 ns;
  CI <= not CI after 20 ns;

stop: process
begin
 wait for 100 ns;
 assert false
   report "Simulation ended by SN at " & time'image(now)
   severity failure;
end process;
end tb;
