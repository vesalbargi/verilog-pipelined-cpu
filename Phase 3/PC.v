module PC (
    input [31:0] in,
    input PCWrite,
    input clk,
    input startin,
    output reg [31:0] out
);

  always @(posedge clk) begin
    if (startin) begin
      out <= 32'b0;
    end else if (PCWrite) begin
      out <= in;
    end
  end
endmodule
