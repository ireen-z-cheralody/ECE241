module part4 (Clk, D, Qa, Qb, Qc);
   input Clk, D;
   output Qa, Qb, Qc;
   D_latch U1 (Clk, D, Qa);
   D_flipflop U2 (Clk, D, Qb);
   D_flipflop U3 (~Clk, D, Qc);
endmodule