module part1 (SW, KEY, HEX3, HEX2, HEX1, HEX0);
    input [1:0] SW;
    input [0:0] KEY;
    output [6:0] HEX3, HEX2, HEX1, HEX0;

    wire Clock, Clear, Enable;
    wire In1, In2, In3, In4, In5, In6, In7;
    wire Qa, Qb, Qc, Qd, Qe, Qf, Qg, Qh;
    wire [7:0]Q;

    assign Clock = KEY;
    assign Clear = SW[0];
    assign Enable = SW[1];

    T_FlipFlop U1 (Enable, Clock, Clear, Qa, In1);
    T_FlipFlop U2 (Qa & In1, Clock, Clear, Qb, In2);
    T_FlipFlop U3 (Qb & In2, Clock, Clear, Qc, In3);
    T_FlipFlop U4 (Qc & In3, Clock, Clear, Qd, In4);
    T_FlipFlop U5 (Qd & In4, Clock, Clear, Qe, In5);
    T_FlipFlop U6 (Qe & In5, Clock, Clear, Qf, In6);
    T_FlipFlop U7 (Qf & In6, Clock, Clear, Qg, In7);
    T_FlipFlop U8 (Qg & In7, Clock, Clear, Qh);

    wire [3:0] Q1, Q2;

    assign Q2[0] = Qa;
    assign Q2[1] = Qb;
    assign Q2[2] = Qc;
    assign Q2[3] = Qd;

    assign Q1[0] = Qe;
    assign Q1[1] = Qf;
    assign Q1[2] = Qg;
    assign Q1[3] = Qh;

    wire [7:0]Count;

    assign Count[3:0] = Q2;
    assign Count[7:4] = Q1;

    wire [6:0] decQ1, decQ2, hexQ1, hexQ2;

    displayDecimal DQ1 (Q1, decQ1);
    displayDecimal DQ2 (Q2, decQ2);

    displayHex HQ1 (Q1, hexQ1);
    displayHex HQ2 (Q2, hexQ2);

    reg[6:0] hex0, hex1;

    always @ (Q1)
        if ((Q1[3] & ~Q1[0]) | (Q1[3]& Q1[2])| (Q1[3] & Q1[1]))
            hex1 = hexQ1;
        else
            hex1 = decQ1;
    always @ (Q2)
        if ((Q2[3] & ~Q2[0]) | (Q2[3]& Q2[2])| (Q2[3] & Q2[1]))
            hex0 = hexQ2;
        else
            hex0 = decQ2;

    assign HEX1 = hex1;
    assign HEX0 = hex0;
endmodule