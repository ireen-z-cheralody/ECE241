module mux3to1 (u, v, w, s, m);
	input [1:0]s;
	input u, v, w;
	output m;
	
	wire f;
	
	mux2to1part3 U1 (u, v, s[0], f);
	mux2to1part3 U2 (f, w, s[1], m);
endmodule 