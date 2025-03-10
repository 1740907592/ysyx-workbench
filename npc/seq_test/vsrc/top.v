module top(
   input clk,
   input rst,
output [7:0] seg [7:0],

input  [1:0] x0,
  input  [1:0] x1,
  input  [1:0] x2,
  input  [1:0] x3,   // 4-bit 输入信号
    input [1:0] s,   // 2-bit 选择信号
    output [1:0] y        // 输出信号
);

    // 实例化 mux41 模块
    mux41 my_mux41 (
        .x0(x0),   // 连接到mux41模块的a端口
        .x1(x1),
        .x2(x2),
        .x3(x3),
        .s(s),   // 连接到mux41模块的y端口
        .y(y)    // 连接到mux41模块的f端口
    );
    seg my_seg(
        .clk(clk),
        .rst(rst),
        .seg(seg)


    );
endmodule
