module comparator (V, z);
	input [3:0]V;
	output [3:0]z;
	
	assign z[0] = V[3] & (V[1] | V[2]);
	assign z[3:1] = 1'b0;

endmodule 