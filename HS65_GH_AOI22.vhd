library ieee; use ieee.std_logic_1164.all;
entity HS65_GH_AOI22 is
	generic (delay: time:= 25.4 ps);
	port
	( A, B, C, D: in std_logic;
	  Z: out std_logic
	);
end entity;

architecture dataFlow of HS65_GH_AOI22 is
begin
	Z <= (A and B) nor (C and D) after delay;
end dataFlow;
