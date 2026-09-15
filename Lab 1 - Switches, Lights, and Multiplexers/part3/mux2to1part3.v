module mux2to1part3 (x, y, s, m);
	input s;
	input x, y;
	output m;
	
	assign m = (~s & x)|(s & y);
endmodule