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
    regNo = 5'd11;
    #20;
    startin = 0;
    $monitor("Control out: %b, ID_wb: %b, ID_m: %b, ID_ex: %b}", {
             u1.reg_write, u1.mem_to_reg, u1.mem_read, u1.mem_write, u1.alu_src, u1.alu_op,
             u1.reg_dst}, u1.ID_wb, u1.ID_m, u1.ID_ex);
    #10;
  end
endmodule
