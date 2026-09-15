module displayHex(s, h);
    input [3:0] s;
    output [6:0] h;

    assign h[0] = (s[3] & s[0]) & (s[2] ^ s[1]);
    assign h[1] = s[3] & ((s[2] & ~s[1] & ~s[0])|(s[1] & s[0])|(s[2] & s[1]));
    assign h[2] = (s[3] & s[2]) & ((~s[1] & ~s[0]) | s[1]);
    assign h[3] = (s[3] & s[1]) & ((s[2] & s[0])|(~s[2] & ~s[0]));
    assign h[4] = 0;
    assign h[5] = s[3] & s[2] & ~s[1] & s[0];
    assign h[6] = s[3] & s[2] & ~s[1] & ~s[0];
endmodule
