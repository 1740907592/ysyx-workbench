module top(
   input  [3:0] b,
    output reg [7:0] h,
    input en,
    input [7:0] x,
    output reg [2:0] y,
    output reg wok

);
    bcd7seg my_seg(
        .b(y),
        .h(h)
    );
    encode42 my_encode(
        .x(x),
        .y(y),
        .wok(wok),
        .en(en)
    );
endmodule
