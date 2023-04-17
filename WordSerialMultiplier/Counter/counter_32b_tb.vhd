----------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------Counter--------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY counter_b_tb IS
END ENTITY;

ARCHITECTURE tb OF counter_b_tb IS
 

COMPONENT counter_b
	PORT(clk : IN STD_LOGIC;
             op  : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
	     zI  : OUT STD_LOGIC
            );
END COMPONENT;

--Inputs
SIGNAL clk_tb : STD_LOGIC := '0';
SIGNAL op_tb  : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000000";
 
 
--Outputs
SIGNAL zI_tb   : STD_LOGIC;
CONSTANT period : time := 25 ns;
 
BEGIN
 

uut: counter_b       
			PORT MAP (clk => clk_tb,
				   op => op_tb,
				   zI => zI_tb
				  );
			clk_tb <= NOT clk_tb after period/2;
	  	
			op_tb <= "1101010", "0010101" AFTER 250 ns, "0010000" AFTER 1050 ns, "1101001" AFTER 1350 ns; 					

 timebomb: PROCESS
 BEGIN
	WAIT FOR 1600 ns; -- Total Simulation Time
		ASSERT FALSE
			REPORT "Simulation ended by SN at" & time'image(now)
		SEVERITY FAILURE;
	END PROCESS;
END tb;