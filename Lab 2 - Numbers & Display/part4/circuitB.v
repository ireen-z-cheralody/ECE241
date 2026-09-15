module circuitB (s, z);
	input [3:0]s;
	output [3:0]z;
	
	assign z[3] = ~s[3] & ~s[2] & s[1];
	assign z[2] = ~s[3] & ~s[2] & ~s[1];
	assign z[1] = ~s[3] & ~s[2] & ~s[1];
	assign z[0] = ~s[3] & ~s[2] & s[0];
	
endmodule