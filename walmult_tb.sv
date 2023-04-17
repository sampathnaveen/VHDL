module walmult8x8_test ();

	logic [7:0]a, b;
	logic [15:0]z;
	
	
walmult8x8

	walmul (.a(a), .b(b), .z(z));
	
	Initial
		begin
			//Define the inputs
			// 5 different vectors presented  below
			a = 3;
			b = 7;
			
			#10; // after 10ns Sumulation run time
			
			
			a = 21;
			b = 21;
			
			#10; // simulation run time for 10ns

			a = 90;
			b = 88;
			
			#10;

			a = 123;
			b = 321;
			
			#10;

			a = 054;
			b = 170;
			
			#10;
			
		$stop
				
		end
		

// TimeBomb

		initial
		
		begin : timebomb
		 #70ns // total simulation time
		 
		 assert ($time < 70ns)
		 
			else if $failure (" Simulation ended by SN at %t ns", $time);
		end;
		
		
		
		
		// timebomb: PROCESS
 // BEGIN
	// WAIT FOR 300 ns; -- Total Simulation Time
		// ASSERT FALSE
			// REPORT "Simulation ended by SN at" & time'image(now)
		// SEVERITY FAILURE;
	// END PROCESS;
		
	endmodule
