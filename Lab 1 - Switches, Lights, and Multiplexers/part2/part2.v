module part2 (SW, LEDR);
	input [9:0] SW;
	output [9:0] LEDR;
	
	wire S = SW[9];
	wire [3:0] M;

	mux2to1 U1 (SW[3:0], SW[7:4], S, M);
	
	assign LEDR[9] = S;
	assign LEDR[3:0] = M;
	assign LEDR[8:4] = 6'b0;
endmodule