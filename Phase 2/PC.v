module PC (
    input [31:0] in,
    input clk,
    input startin,
    output reg [31:0] out
);

  always @(posedge clk) begin
    if (startin) out <= 32'b0;
    else out <= in;
  end
endmodule
