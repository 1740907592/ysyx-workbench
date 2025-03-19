module seg(
    input clk,
    input rst,
    output reg [7:0] seg [7:0]  // 将 seg 声明为 reg 类型，以便在 always 块内赋值
);

wire [7:0] segs[0:9];  // 七段显示对应的编码
assign segs[0] = 8'b11111101;
assign segs[1] = 8'b01100000;
assign segs[2] = 8'b11011010;
assign segs[3] = 8'b11110010;
assign segs[4] = 8'b01100110;
assign segs[5] = 8'b10110110;
assign segs[6] = 8'b10111110;
assign segs[7] = 8'b11100000;
assign segs[8] = 8'b11111110;
assign segs[9] = 8'b11100110;

parameter CLK_NUM = 5000000;

reg [31:0] count;  // 使用 32 位来避免 65 位宽度的问题
reg [31:0] offset;  // 使用 32 位
integer i;

// 计数器和状态机
always @(posedge clk or posedge rst) begin
    if (rst) begin
        count <= 0;
        offset <= 0;
    end
    else begin
        if (count == CLK_NUM) begin
            count <= 0;
            offset <= offset + 1;  // 每次递增 offset
        end
        else begin
            count <= count + 1;
        end
    end
end
assign seg[0] = ~segs[offset % 10];
assign               seg[1] = ~segs[offset / 10 % 10];
assign                seg[2] = ~segs[offset / 100 % 10];
assign               seg[3] = ~segs[offset / 1000 % 10];
assign                seg[4] = ~segs[offset / 10000 % 10];
assign                seg[5] = ~segs[offset / 100000 % 10];
assign                seg[6] = ~segs[offset / 1000000 % 10];
assign                seg[7] = ~segs[offset / 10000000% 10];


endmodule
