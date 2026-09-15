module mux_2to1_4bit (z, v, a, m);
	input z;
	input [3:0] v, a;
	output [3:0]m;
	
	assign m[0] = (~z & v[0])| (z & a[0]);
	assign m[1] = (~z & v[1])| (z & a[1]);
	assign m[2] = (~z & v[2])| (z & a[2]);
	assign m[3] = (~z & v[3])| (z & a[3]);
	
endmodule 