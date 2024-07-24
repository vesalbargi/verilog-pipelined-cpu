module mux_32_3Inputs (
    input [31:0] input1,
    input [31:0] input2,
    input [31:0] input3,
    input [1:0] op,
    output reg [31:0] out
);

  always @(*) begin
    case (op)
      2'b00:   out = input1;
      2'b01:   out = input2;
      2'b10:   out = input3;
      default: out = 32'b0;
    endcase
  end
endmodule
