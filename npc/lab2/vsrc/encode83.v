module encode42(
    input [7:0] x,
    input  en,
    output reg [2:0] y,
    output reg wok
);
integer i;
integer st;
always @(x,en) begin
    st = 1;
    y = 0;
    wok = 0;
    for (i = 7; i >= 0; i--) begin
        if (x[i] == 1 && st[0]) begin
            y = i[2:0];
            st = 0;
            wok = 1;
        end
            
            
    end
    if (en == 0)
        y = 3'b00;
end
endmodule