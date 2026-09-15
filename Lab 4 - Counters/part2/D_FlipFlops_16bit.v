module D_FlipFlops_16bit (Enable, Clock, Clear, Q);
    input Clear, Clock, Enable;
    output reg [15:0]Q;

    always @ (negedge Clear, posedge Clock)
        if (Clear == 0)
            Q <= 16'd0;
        else if (Enable == 1)
            Q <= Q + 1;
endmodule