library ieee; use ieee.std_logic_1164.all;
entity JKFFS is
	generic (delay: time:= 275.4 ps;
			setDelay: time:= 158.4 ps;
			invDelay: time:= 19.95 ps
			);
  port ( J, K, CK, SN : in std_logic;
         Q, QN : out std_logic
	   );
end entity;
architecture dataFlow of JKFFS is
begin
  process (SN, CK, J, K)
  begin
    if (SN = '0') then 
      Q <= '1' after setDelay;
    elsif rising_edge(CK) and J /= K then
        Q <= J after delay;
	end if;
  end process;
  QN <= not Q after invDelay;
end dataFlow;
