 ----------------------------------------------------------------------
 LIBRARY ieee;
 USE ieee. std_logic_1164.all;
 ----------------------------------------------------------------------
 ENTITY bin_to_gray_tb IS
	GENERIC (period: TIME := 100 ns;
			 tp: TIME := 15 ns);
END ENTITY;
 ----------------------------------------------------------------------
ARCHITECTURE testbench OF bin_to_gray_tb IS
 ----DUT declaration:--------------------
		COMPONENT bin_to_gray IS
			PORT (bin: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
				 gray: OUT STD_LOGIC_VECTOR(2 DOWNTO 0));
		END COMPONENT;
 ----Signal declarations:----------------

	SIGNAL b: STD_LOGIC_VECTOR(2 DOWNTO 0); --binary in
	SIGNAL g: STD_LOGIC_VECTOR(2 DOWNTO 0); --gray out
		  TYPE data_pair IS RECORD
			col1: STD_LOGIC_VECTOR(2 DOWNTO 0);
			col2: STD_LOGIC_VECTOR(2 DOWNTO 0);
		  END RECORD;
		
		  TYPE table IS ARRAY (1 TO 8) OF data_pair;
			CONSTANT templates: table := (
			("000", "000"), ("001", "011"), ("010", "011"), ("011", "010"),
			("100", "110"), ("101", "111"), ("110", "101"), ("111", "100"));
 BEGIN
 ---DUT instantiation:--------------------
 dut: bin_to_gray PORT MAP (bin => b, gray => g);
 ---Stimuli generation and comparison:----
  PROCESS BEGIN
	FOR i IN table'RANGE LOOP
		b <= templates(i).col1;
		WAIT FOR tp;
		ASSERT g=templates(i).col2
		  REPORT "Mismatch at iteration=" & INTEGER'IMAGE(i)
		  SEVERITY FAILURE;
		WAIT FOR period-tp;
    END LOOP;
	ASSERT FALSE
	  REPORT "No error found!"
	  SEVERITY NOTE;
  END PROCESS;

 ----------------------------------------------------------------------
timebomb: process
  begin
   wait for 800 ns;
   assert false
     report "Simulation ended by SN at " & time'image(now)
     severity failure;
  end process;
END ARCHITECTURE;
