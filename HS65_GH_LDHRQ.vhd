library ieee; use ieee.std_logic_1164.all;
entity HS65_GH_LDHRQ is
	generic (delay: time:= 72.1 ps;
			 rstDelay: time:= 61.3 ps
			);
  port ( D, G, RN : in std_logic;
         Q : out std_logic
	   );
end entity;
architecture dataFlow of HS65_GH_LDHRQ is
begin
  process (RN, G, D)
  begin
    if (RN = '0') then 
      Q <= '0' after rstDelay;
      elsif G = '1' then
        Q <= D after delay;
	end if;
  end process;
end dataFlow;
