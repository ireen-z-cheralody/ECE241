module part3 (SW, LEDR);
	
	input [8:0]SW;
	output [4:0]LEDR;
	
	wire Cin;
	assign Cin = SW[8];
	
	wire [3:0] A, B;
	assign A = SW[7:4];
	assign B = SW[3:0];
	
	wire Cout;
	wire c1, c2, c3;
	
	wire [3:0]s;
	
	fullAdder U1 (A[0], B[0], Cin, s[0], c1);
	fullAdder U2 (A[1], B[1], c1, s[1], c2);
	fullAdder U3 (A[2], B[2], c2, s[2], c3);
	fullAdder U4 (A[3], B[3], c3, s[3], Cout);
	
	assign LEDR[4] = Cout;
	assign LEDR[3:0] = s;
	
endmodule 