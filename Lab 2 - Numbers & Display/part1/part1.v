module part1 (SW, LEDR, HEX1, HEX0);
	input [7:0] SW;
	output [7:0] LEDR;
	output [6:0] HEX1, HEX0;
	
	hexDisplay U1 (SW[7:4], HEX1);
	hexDisplay U2 (SW[3:0], HEX0);
		
	assign LEDR = SW;
	
endmodule