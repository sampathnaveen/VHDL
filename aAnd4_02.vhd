-- aAnd4 gate logic
LIBRARY ieee;
use ieee.std_logic_1164.ALL;
entity aAnd4 is
  generic (width : integer := 1; delay : time := 150.6 ps);
  port
  ( A : std_logic_vector ((width-1) downto 0);
    B : std_logic_vector ((width-1) downto 0);
	C : std_logic_vector ((width-1) downto 0);    
	D : std_logic_vector ((width-1) downto 0);
	Y : out std_logic_vector ((width-1) downto 0)
  );
end aAnd4;

architecture behavior of aAnd4 is
begin
  stimuli_proc : process (A, B, C, D)
    variable result : std_logic_vector (width-1 downto 0);
  begin
    outer :
    for n in width - 1 downto 0 loop
      result (n) := A (n) and B (n) and C (n) and D(n);
    end loop outer;
    Y <= result after delay;
  end process stimuli_proc;
end behavior;

----------------------A simple aAnd4 gate logic---------------------------------
--LIBRARY ieee;
--use ieee.std_logic_1164.ALL;

--entity aAnd4 is
--generic (delay : tim := 151 ps);
--	port 
--	( A, B, C, D : in std_logic;
--		Y : out std_logic
--	);
--end entity;

--architecture dataFlow is aAnd4 is
--
--	begin
--		Y <= A and B and C and D after delay;
--	end dataFlow;


