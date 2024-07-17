`timescale 1ns / 1ps

module test_IF_ID_reg;
  reg clk;
  reg startin;
  reg [31:0] IF_instr;
  reg [31:0] IF_pc_plus_4;
  wire [31:0] ID_instr;
  wire [31:0] ID_pc_plus_4;

  IF_ID_reg u1 (
      .clk(clk),
      .startin(startin),
      .IF_instr(IF_instr),
      .IF_pc_plus_4(IF_pc_plus_4),
      .ID_instr(ID_instr),
      .ID_pc_plus_4(ID_pc_plus_4)
  );

  always #10 clk = ~clk;

  initial begin
    clk = 0;
    startin = 0;
    IF_instr = 32'h00000000;
    IF_pc_plus_4 = 32'h00000000;
    #20;
    IF_instr = 32'h12345678;
    IF_pc_plus_4 = 32'h00000004;
    #20;
    startin = 1;
    #20;
    startin = 0;
    IF_instr = 32'h87654321;
    IF_pc_plus_4 = 32'h00000008;
    #20;
    startin = 1;
    #20;
    startin = 0;
    IF_instr = 32'hDEADBEEF;
    IF_pc_plus_4 = 32'h0000000C;
    #20;
  end
endmodule
