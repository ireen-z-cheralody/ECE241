module circuitC (z, Cout, out);
	input [3:0]z;
	input [3:0]Cout;
	output [3:0] out;
	
	assign out[0] = z[0] | Cout[0];
	assign out[3:1] = 0;

endmodule 