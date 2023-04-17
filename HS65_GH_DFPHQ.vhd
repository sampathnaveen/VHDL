library ieee; use ieee.std_logic_1164.all;
entity HS65_GH_DFPHQ is
	generic (delay: time:= 74.2 ps);
  port ( D, CP, E : in std_logic;
         Q : out std_logic
	   );
end entity;
architecture dataFlow of HS65_GH_DFPHQ is
begin
  process (E, CP)
  begin
    if (E = '1') and rising_edge(CP) then
      Q <= D after delay;
	end if;
  end process;
end dataFlow;
