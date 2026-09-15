module T_FlipFlop (Enable, Clock, Clear, Q, Input);
    input Clear, Clock, Enable;
    output Input;
    output reg Q;

    assign Input = Enable;

    always @ (negedge Clear, posedge Clock)
        if (Clear == 0)
            Q <= 1'b0;
        else
            Q <= Q ^ Enable;
endmodule
