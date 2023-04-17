library ieee; use ieee.std_logic_1164.all;
entity HS65_GH_AO31 is
	generic (delay: time:= 51.4 ps);
	port
	( A, B, C, D: in std_logic;
	  Z: out std_logic
	);
end entity;

architecture dataFlow of HS65_GH_AO31 is
begin
	Z <= (A and B and C) or D after delay;
end dataFlow;
