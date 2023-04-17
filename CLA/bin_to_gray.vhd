 LIBRARY ieee; USE ieee. std_logic_1164.all;
 ---------------------------------------------------
 ENTITY bin_to_gray is
 generic (N: natural := 3);
 port (bin: IN std_logic_vector(N-1 DOWNTO 0);
 gray: OUT std_logic_vector(N-1 DOWNTO 0));
 end ENTITY;
 ---------------------------------------------------
 ARCHITECTURE dataFlow OF bin_to_gray is
 begin
 gray(N-1) <= bin(N-1);
 gen: FOR i IN 1 TO N-1 GENERATE
 gray(N-1-i) <= bin(N-i) XOR bin(N-1-i);
 end GENERATE;
 end ARCHITECTURE;
 ---------------------------------------------------