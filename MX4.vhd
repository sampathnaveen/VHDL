library ieee; use ieee.std_logic_1164.all;
entity MX4 is
  generic (delay: time:= 170 ps);
  port
  ( A, B, C, D: in std_logic;
    S1, S0 : in std_logic;
	Y: out std_logic
  );
end entity;

architecture dataFlow of MX4 is
  signal s : std_logic_vector (1 downto 0);
begin
  s <= S1 & S0 after delay;
  with s select 
	Y <= A when "00",
	B when "01",
	C when "10",
	D when others;
end dataFlow;
