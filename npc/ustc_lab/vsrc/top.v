module top(
    input           [1:0]         a,
    input           [1:0]         b,
    output   reg    [1:0]         out,
    output   reg                  Cout
);

// Write your code here
always @(*) begin
    {Cout, out} = a + b;
end
// End of your code
endmodule
