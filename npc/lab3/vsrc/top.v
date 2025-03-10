module top(
   input clk,
    input [2:0] fun_sel,
    input signed [3:0] in_a,
    input signed  [3:0] in_b,
    output reg signed [3:0] res,
    output reg cout,
    output reg Overflow
);


    alu my_alu(
        .clk(clk),
        .fun_sel(fun_sel),
        .in_a(in_a),
        .in_b(in_b),
        .res(res),
        .cout(cout),
        .Overflow(Overflow)
    );
    
endmodule
