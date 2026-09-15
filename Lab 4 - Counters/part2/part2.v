module part2 (SW, KEY, HEX3, HEX2, HEX1, HEX0);
    input [1:0] SW;
    input [0:0] KEY;
    output [6:0] HEX3, HEX2, HEX1, HEX0;

    wire Clock, Clear, Enable;
    wire [15:0]Count;

    assign Clock = KEY;
    assign Clear = SW[0];
    assign Enable = SW[1];

    D_FlipFlops_16bit U1 (Enable, Clock, Clear, Count);

    wire [3:0] Q1, Q2, Q3, Q4;

    assign Q4 = Count[3:0];
    assign Q3 = Count[7:4];
    assign Q2 = Count[11:8];
    assign Q1 = Count[15:12];

    wire [6:0] decQ1, decQ2, decQ3, decQ4;
    wire [6:0] hexQ1, hexQ2, hexQ3, hexQ4;

    displayDecimal DQ1 (Q1, decQ1);
    displayDecimal DQ2 (Q2, decQ2);
    displayDecimal DQ3 (Q3, decQ3);
    displayDecimal DQ4 (Q4, decQ4);

    displayHex HQ1 (Q1, hexQ1);
    displayHex HQ2 (Q2, hexQ2);
    displayHex HQ3 (Q3, hexQ3);
    displayHex HQ4 (Q4, hexQ4);

    reg[6:0] hex0, hex1, hex2, hex3;

    always @ (Q1)
        if ((Q1[3] & ~Q1[0]) | (Q1[3]& Q1[2])| (Q1[3] & Q1[1]))
            hex3 = hexQ1;
        else
            hex3 = decQ1;

    always @ (Q2)
        if ((Q2[3] & ~Q2[0]) | (Q2[3]& Q2[2])| (Q2[3] & Q2[1]))
            hex2 = hexQ2;
        else
            hex2 = decQ2;

    always @ (Q3)
        if ((Q3[3] & ~Q3[0]) | (Q3[3]& Q3[2])| (Q3[3] & Q3[1]))
            hex1 = hexQ3;
        else
            hex1 = decQ3;

    always @ (Q4)
        if ((Q4[3] & ~Q4[0]) | (Q4[3]& Q4[2])| (Q4[3] & Q4[1]))
            hex0 = hexQ4;
        else
            hex0 = decQ4;

    assign HEX3 = hex3;
    assign HEX2 = hex2;
    assign HEX1 = hex1;
    assign HEX0 = hex0;
endmodule