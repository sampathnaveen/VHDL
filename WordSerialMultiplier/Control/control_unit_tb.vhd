library ieee;
use ieee.std_logic_1164.all;
 
ENTITY cntu_tb IS
END ENTITY;
 
ARCHITECTURE tb OF cntu_tb IS
 

component cntu

	port ( clk: in std_logic ;
	       rst: in std_logic ;
	       st : in std_logic ;
	       zi : in std_logic ;
	       op : out std_logic_vector(6 downto 0) ;
	      rdy : out std_logic
	     );


end component;
 
--Inputs
signal clk_tb : std_logic := '1';
signal rst_tb : std_logic := '0';
signal st_tb  : std_logic := '0'; 
signal zi_tb  : std_logic := '0';

--Outputs
signal op_tb  : std_logic_vector(6 downto 0); --:= "0000000";
signal rdy_tb : std_logic := '0';

CONSTANT period : time := 100 ns;
 
BEGIN
 
uut: cntu       
			PORT MAP (clk  => clk_tb,
				  rst  => rst_tb,
				  st   => st_tb,
				  zi   => zi_tb,
				  op   => op_tb,
			          rdy  => rdy_tb
				  );

			clk_tb <= NOT clk_tb after period/2;
	  	
			rst_tb  <= '1', '0' AFTER 20 ns, '1' AFTER 80 ns;
			st_tb   <= '0', '1' AFTER 170 ns, '0' AFTER 670 ns; 
			zi_tb   <= '0', '1' AFTER 430 ns, '0' AFTER 530 ns;  


 timebomb: PROCESS
 BEGIN
	WAIT FOR 800 ns; -- Total Simulation Time
		ASSERT FALSE
			REPORT "Simulation ended by SN at" & time'image(now)
		SEVERITY FAILURE;
	END PROCESS;
END tb;