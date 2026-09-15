module D_flipflop (Clk, D, Qa, Qb);
   input Clk, D;
   output Qa, Qb;
   wire Q_m;
   D_latch U1 (~Clk, D, Q_m);
   D_latch U2 (Clk, Q_m, Qa, Qb);
endmodule