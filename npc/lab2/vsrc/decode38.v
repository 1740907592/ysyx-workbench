module decode24 (
    input en,
    input [2:0] x,
    output reg [7:0] y

);
integer i;
    always @(x,en) begin
        for (i = 0;i <= 7 ;i = i + 1 ) begin
            if (x == i[2:0])
                y[i] = 1;
            else
                y[i] = 0;
        end
        if (en == 0) 
            y = 0;
    end
endmodule