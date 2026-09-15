module part4 (SW, LEDR, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);
	input [8:0] SW;
	output [9:0] LEDR;
	output [6:0] HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;
	
	//display nothing
	assign HEX4[6:0] = 7'b1111111;
	assign HEX2[6:0] = 7'b1111111;
	
	//display X and Y
	hexDisplay E (SW[7:4], HEX5);
	hexDisplay F (SW[3:0], HEX3);
	
	wire Cin;
	assign Cin = SW[8];
	
	wire [3:0]X;
	assign X = SW[7:4];
	
	wire [3:0]Y;
	assign Y = SW[3:0];
	
	//display sum
	wire [3:0]Cout;
	wire [3:0]rippleAdderOut;
	wire [3:0]comparatorOut;
	wire [3:0]circuit_A_Out;
	wire [3:0]circuit_B_Out;
	wire [3:0]circuit_C_Out;
	wire [3:0]mux1Out;
	wire [3:0]mux2Out;
	
	
	rippleCarryAdder_4bit U1 (X, Y, Cin, rippleAdderOut, Cout);
	
	comparator U2 (rippleAdderOut, comparatorOut);
	circuitA U3 (rippleAdderOut, circuit_A_Out);
	
	mux_2to1_4bit U4(comparatorOut[0], rippleAdderOut, circuit_A_Out, mux1Out);
	
	circuitB U5 (mux1Out, circuit_B_Out);
	
	mux_2to1_4bit U6(Cout[0], mux1Out, circuit_B_Out, mux2Out);
	hexDisplay U7 (mux2Out, HEX0);
	
	circuitC U8 (comparatorOut, Cout, circuit_C_Out);
	hexDisplay U9 (circuit_C_Out, HEX1); 
	
endmodule 