library ieee; use ieee.std_logic_1164.all;
entity HS65_GH_FA1 is
  generic (SUMdelay: time:= 86.85 ps;
		   Coutdelay: time:= 64.17 ps
		  );
  port (A0, B0, CI: in bit;
        S0, CO: out bit
  );
end HS65_GH_FA1;

architecture dataflow of HS65_GH_FA1 is
begin
  S0 <= A0 xor B0 xor CI after SUMdelay;
  CO <= (A0 and B0) or (A0 and CI) or (B0 and CI) after Coutdelay;
end dataflow;
