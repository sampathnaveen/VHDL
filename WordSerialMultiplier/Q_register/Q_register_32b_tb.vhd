----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------Q Register Testbench--------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Q_register_32b_tb IS
END ENTITY;
 
ARCHITECTURE tb OF Q_register_32b_tb IS
 

COMPONENT Q_register_32b

	PORT(clk : IN STD_LOGIC;
             op  : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
	     QQ  : IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
             f0  : IN STD_LOGIC;
	     q_1 : IN STD_LOGIC := '0';
	     Qn_1: OUT STD_LOGIC_VECTOR(32 DOWNTO 0);
	     q0_1: OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	     
            );

END COMPONENT;

--Inputs
SIGNAL clk_tb : STD_LOGIC := '0';
SIGNAL op_tb  : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000000";
SIGNAL QQ_tb  : STD_LOGIC_VECTOR(31 DOWNTO 0) := x"0000_0000"; 
SIGNAL f0_tb  : STD_LOGIC := '0';
SIGNAL q_1_tb : STD_LOGIC := '0'; 
--Outputs

SIGNAL Qn_1_tb  : STD_LOGIC_VECTOR(32 DOWNTO 0):= "000000000000000000000000000000000";
SIGNAL q0_1_tb: STD_LOGIC_VECTOR(1 DOWNTO 0):= "00";


CONSTANT period : time := 100 ns;
 
BEGIN
 

uut: Q_register_32b       
			PORT MAP (clk => clk_tb,
				  op  => op_tb,
				  QQ  => QQ_tb,
				  f0  => f0_tb,
				  q_1 => q_1_tb,
		          q0_1=> q0_1_tb,
				  Qn_1=> Qn_1_tb
				  );

			clk_tb <= NOT clk_tb after period/2;
	  	
			op_tb  <= "1101010","0010101" AFTER 250 ns, "0000000" AFTER 1050 ns, "1101010" AFTER 1350 ns, "1001100" AFTER 1600 ns;
			QQ_tb  <= x"5353_5353", x"0000_0000" AFTER 500 ns;
			f0_tb  <= '0', '1' AFTER 250 ns, '0' AFTER 1050 ns,'1' AFTER 1350 ns, '1' AFTER 1600 ns;  
			q_1_tb <= '0', '0' AFTER 15 ns;

		

 timebomb: PROCESS
 BEGIN
	WAIT FOR 1600 ns; 
		ASSERT FALSE
			REPORT "Simulation ended by SN at" & time'image(now)
		SEVERITY FAILURE;
	END PROCESS;
END tb;

