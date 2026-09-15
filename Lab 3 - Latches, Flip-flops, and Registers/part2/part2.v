module part2 (SW, LEDR);
   input [1:0] SW;
   output [9:0] LEDR;
   D_latch U1 (SW[1], SW[0], LEDR[0]);
endmodule