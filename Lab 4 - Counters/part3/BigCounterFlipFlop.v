module BigCounterFlipFlop (Clock, Clear, Q);
    input Clear, Clock;
    output reg [25:0]Q;

    always @ (posedge Clock)
        if (Clear == 0 || Q == 26'd50000000)
            Q <= 26'd0;
        else
            Q <= Q + 1;
endmodule
