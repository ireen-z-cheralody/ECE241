module displayDecimal(v, h);
    input [3:0]v;
    output [6:0]h;

    assign h[0] = (~v[3] & ~v[1]) & ((~v[2] & v[0]) | (v[2] & ~v[0]));
    assign h[1] = (~v[3] & v[2]) & ((~v[1] & v[0]) | (v[1] & ~v[0]));
    assign h[2] = ~v[3] & ~v[2] & v[1] & ~v[0];
    assign h[3] = ~v[3] & ((~v[2] & ~v[1] & v[0])| (v[2] & ((~v[1] & ~v[0]) | (v[1] & v[0]))));
    assign h[4] = (~v[3] & ~v[2] & v[0]) | (~v[3] & v[2] & ~v[1]) | (v[0] & ((~v[3] & v[2] & v[1]) | (v[3] & ~v[2] & ~v[1])));
    assign h[5] = ~v[3] & ((~v[2] & (v[0] | v[1])) | (v[2] & v[1] & v[0]));
    assign h[6] = ~v[3] & ((~v[2] & ~v[1]) | (v[2] & v[1] & v[0]));
endmodule
