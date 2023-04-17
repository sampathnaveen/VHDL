 ----------------------------------------------------
LIBRARY ieee;USE ieee.std_logic_1164.all;
USE std.textio.all;
 ----------------------------------------------------
 ENTITY bin_to_gray2_tb IS
 GENERIC (period: TIME := 100 ns;
 tp: TIME := 15 ns);
 END ENTITY;
 ----------------------------------------------------
 ARCHITECTURE testbench OF bin_to_gray2_tb IS
 ----DUT declaration:----------


 COMPONENT bin_to_gray2 IS
 PORT (bin: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
 gray: OUT STD_LOGIC_VECTOR(2 DOWNTO 0));
 END COMPONENT;
 ----Signal declarations:------
 SIGNAL b: STD_LOGIC_VECTOR(2 DOWNTO 0);
 SIGNAL g, gtest: std_logic_vector(2 DOWNTO 0);
 FILE f: TEXT OPEN READ_MODE IS "template.txt";
 BEGIN
 ---DUT instantiation:-------------------
 dut: bin_to_gray2 PORT MAP (bin => b, gray => g);
 ---Output verification:-----------------
 PROCESS
 VARIABLE l: LINE;
 VARIABLE good_value: BOOLEAN;
 VARIABLE space: CHARACTER;
 VARIABLE bfile, gfile: BIT_VECTOR(2 DOWNTO 0);
 BEGIN
 WHILE NOT ENDFILE (f) LOOP
 READLINE(f, l);
 READ(l, bfile, good_value);
 ASSERT (good_value)
 REPORT "Improper value for 'bin' in file!"
 SEVERITY FAILURE;
 b <= to_stdlogicvector(bfile);
 READ(l, space);
 READ(l, gfile, good_value);
 ASSERT (good_value)
 REPORT "Improper value for 'gray' in file!"
 SEVERITY FAILURE;
gtest <= to_stdlogicvector(gfile);
 WAIT FOR tp;
 ASSERT (gtest=g)
 REPORT "Data mismatch!"
 SEVERITY FAILURE;
 WAIT FOR period-tp;
 END LOOP;
 ASSERT FALSE
 REPORT "No errors found!"
 SEVERITY NOTE;
 WAIT;
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
 
 ----------------------------------------------------
