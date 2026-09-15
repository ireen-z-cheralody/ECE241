module part3 (SW, LEDR);
   input [1:0]SW;
   output [9:0]LEDR;
   wire Qm, Qs;
   assign LEDR[0] = Qs;
   D_latch U1 (~(SW[1]), SW[0], Qm);
   D_latch U2 (SW[1], Qm, Qs);
endmodule