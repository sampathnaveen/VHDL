library ieee; use ieee.std_logic_1164.all;
entity DFFNR is
	generic (delay: time:= 320.2 ps;
			rstDelay: time:= 224.5 ps;
			invDelay: time:= 19.95 ps
			);
  port ( D, CKN, RN : in std_logic;
         Q, QN : out std_logic
	   );
end entity;
architecture dataFlow of DFFNR is
begin
  process (RN, CKN)
  begin
    if (RN = '0') then 
      Q <= '0' after rstDelay;
    elsif falling_edge(CKN) then
        Q <= D after delay;
	end if;
  end process;
  QN <= not Q after invDelay;
end dataFlow;
