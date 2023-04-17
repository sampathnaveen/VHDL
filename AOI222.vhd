library ieee;
use ieee.std_logic_1164.all;

	entity AOI222 is

		generic (delay : time := 106.88 ps); -- X2 time delay from the databook

		port (
				A0 : in std_logic;
				A1 : in std_logic;
				B0 : in std_logic;
				B1 : in std_logic;
				C0 : in std_logic;
				C1 : in std_logic;
				Y : out std_logic
		);
		
	end entity;
	
	architecture df of AOI222 is
	
	begin
	
		Y <= not ((A0 and A1) or (B0 and B1) or (C0 and C1)) after delay;
	
	end df;
	