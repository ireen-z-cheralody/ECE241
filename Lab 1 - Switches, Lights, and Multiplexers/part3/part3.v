module part3 (SW, LEDR);
	input [9:0] SW;
	output [9:0] LEDR;
	
	wire [1:0] m;
	
	mux3to1 U1 (SW[4], SW[2], SW[0], SW[9:8], m[0]);
	mux3to1 U2 (SW[5], SW[3], SW[1], SW[9:8], m[1]);
	
	assign LEDR[1:0] = m[1:0];
endmodule 