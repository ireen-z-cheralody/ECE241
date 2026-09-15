module circuitA (v, a);
	input [3:0]v;
	output [3:0]a;
	
	assign a[3] = 0;
	assign a[2] = v[2] & v[1];
	assign a[1] = v[2] & ~v[1];
	assign a[0] = v[0] & (v[1] | v[2]);

endmodule 