`timescale 1ns / 1ps

module test_mux_8_2Inputs;
  reg [7:0] input1;
  reg [7:0] input2;
  reg op;
  wire [7:0] out;

  mux_8_2Inputs u1 (
      .input1(input1),
      .input2(input2),
      .op(op),
      .out(out)
  );

  initial begin
    input1 = 8'hA5;
    input2 = 8'h5A;
    op = 0;
    #10;
    op = 1;
    #10;
    input1 = 8'hFF;
    input2 = 8'h00;
    op = 0;
    #10;
    op = 1;
    #10;
    input1 = 8'h12;
    input2 = 8'h34;
    op = 0;
    #10;
    op = 1;
    #10;
    input1 = 8'hDE;
    input2 = 8'hBE;
    op = 0;
    #10;
    op = 1;
    #10;
  end
endmodule
