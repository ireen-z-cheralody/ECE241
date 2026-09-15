module SmallCounterFlipFlop (Enable, Clock, Clear, Q);
    input Enable, Clear, Clock;
    output reg [3:0]Q;

    always @ (posedge Clock)
        if (Clear == 0)
            Q <= 4'd0;
        else if (Enable == 1)
            Q <= Q + 1;
endmodule