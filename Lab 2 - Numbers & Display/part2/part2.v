module part2 (SW, HEX1, HEX0);
	 input [3:0] SW;
	 output [0:6] HEX1, HEX0;

	 wire [3:0]A;
	 wire [3:0]M;
	 wire [3:0]Z;
	 
	 comparator U1 (SW, Z);
	 
	 circuitA U2 (SW, A);
	 
	 mux_2to1_4bit U3 (Z[0], SW, A, M);
	 
	 hexDisplay U4 (Z, HEX1);
	 hexDisplay U5 (M, HEX0);
	 
endmodule