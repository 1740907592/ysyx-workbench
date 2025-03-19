module alu (
    input clk,
    input [2:0] fun_sel,
    input signed [31:0] in_a,
    input signed  [31:0] in_b,
    output reg signed [31:0] res,
    output reg cout,
    output reg Overflow

);
    reg signed [31:0] temp_res;
    reg temp_overflow; // 修改为 1 位

    always @(fun_sel, in_a, in_b) begin
        // 默认值
        cout = 0;
        Overflow = 0;
        temp_res = 0;

        case (fun_sel)
            0: begin // 加法
                {cout, temp_res} = in_a + in_b;
                Overflow = (in_a[31] == in_b[31]) && (temp_res[31] != in_a[31]);
            end
            1: begin // 减法
                {cout, temp_res} = in_a + in_b;
                Overflow = (in_a[31] != in_b[31]) && (temp_res[31] != in_a[31]);
            end
            2: begin // 取反
                temp_res = ~in_a;
                cout = 0;
                Overflow = 0;
            end
            3: begin // 与操作
                temp_res = in_a & in_b;
                cout = 0;
                Overflow = 0;
            end
            4: begin // 或操作
                temp_res = in_a | in_b;
                cout = 0;
                Overflow = 0;
            end
            5: begin // 异或操作
                temp_res = in_a ^ in_b;
                cout = 0;
                Overflow = 0;
            end
            6: begin // 有符号比较（in_a < in_b）
                {cout, temp_res} = in_a + in_b;
                Overflow = (in_a[31] != in_b[31]) && (temp_res[31] != in_a[31]);
                if (!Overflow) begin
                    temp_res = (temp_res[31] == 1) ? 1 : 0;
                end else begin
                    temp_res = (temp_res[31] == 0) ? 1 : 0;
                end
                cout = 0; // 比较操作不需要进位
            end
            7: begin // 相等比较
                temp_res = (in_a == in_b) ? 1 : 0;
                cout = 0;
                Overflow = 0;
            end
            default: begin
                temp_res = 0;
                cout = 0;
                Overflow = 0;
            end
        endcase
    end

    assign res = temp_res; // 输出结果
endmodule