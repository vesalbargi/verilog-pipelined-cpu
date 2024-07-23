`timescale 1ns / 1ps

module test_mux_32_2Inputs;
  reg [31:0] input1;
  reg [31:0] input2;
  reg op;
  wire [31:0] out;

  mux_32_2Inputs u1 (
      .input1(input1),
      .input2(input2),
      .op(op),
      .out(out)
  );

  initial begin
    input1 = 32'hA5A5A5A5;
    input2 = 32'h5A5A5A5A;
    op = 0;
    #10;
    op = 1;
    #10;
    input1 = 32'hFFFFFFFF;
    input2 = 32'h00000000;
    op = 0;
    #10;
    op = 1;
    #10;
    input1 = 32'h12345678;
    input2 = 32'h87654321;
    op = 0;
    #10;
    op = 1;
    #10;
    input1 = 32'hDEADBEEF;
    input2 = 32'hFEEDC0DE;
    op = 0;
    #10;
    op = 1;
    #10;
  end
endmodule
