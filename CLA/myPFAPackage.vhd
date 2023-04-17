
									----------------------------- MY PACKAGE for the PARTIAL FULL ADDER -------------------------------------
									
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package myPFAPackage is

	component PFA is
		 port (
				A : in STD_LOGIC;
				B : in STD_LOGIC;
				Cin : in STD_LOGIC;
				S : out STD_LOGIC;
				P : out STD_LOGIC;
				G : out STD_LOGIC
				);
	end component;

end package;
