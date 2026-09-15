module part3 (KEY, CLOCK_50, HEX0);
    input [0:0] KEY;
    input CLOCK_50;
    output [6:0] HEX0;

    wire [25:0]Count;
    wire [3:0]SmallCount;
    reg Enable;

    BigCounterFlipFlop U1 (CLOCK_50, KEY, Count);

    always @ (Count)
        if (Count == 26'd0)
            Enable = 1;
        else
            Enable = 0;

    SmallCounterFlipFlop U2 (Enable, CLOCK_50, KEY, SmallCount);
    displayDecimal U3 (SmallCount, HEX0);
endmodule
