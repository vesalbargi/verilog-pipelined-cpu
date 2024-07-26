module ALU (
    input [31:0] in1,
    input [31:0] in2,
    input [3:0] operation,
    output reg [31:0] out
);

  always @(*) begin
    case (operation)
      4'b0000: out <= in1 & in2;
      4'b0001: out <= in1 | in2;
      4'b0010: out <= in1 + in2;
      4'b0110: out <= in1 - in2;
      4'b0111: out <= in1 < in2;
      4'b1100: out <= !(in1 | in2);
      default: out <= 32'b0;
    endcase
  end
endmodule
