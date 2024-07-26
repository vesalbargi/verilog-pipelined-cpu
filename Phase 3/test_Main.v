`timescale 1ns / 1ps

module test_Main;
  reg clk;
  reg startin;
  reg [4:0] regNo;
  wire [31:0] val;

  Main u1 (
      .clk(clk),
      .startin(startin),
      .regNo(regNo),
      .val(val)
  );

  always #10 clk = ~clk;

  initial begin
    clk = 1;
    startin = 1;
    regNo = 5'd14;
    #20;
    startin = 0;
    #10;
  end
endmodule
