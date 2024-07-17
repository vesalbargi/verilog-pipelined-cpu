`timescale 1ns / 1ps

module test_EX_MEM_reg;
  reg clk;
  reg startin;
  reg [1:0] EX_wb;
  reg [2:0] EX_m;
  reg [31:0] EX_branch_target;
  reg EX_zero;
  reg [31:0] EX_alu_result;
  reg [31:0] EX_reg_data2;
  reg [4:0] EX_mux_out;
  wire [1:0] MEM_wb;
  wire MEM_branch;
  wire MEM_mem_read;
  wire MEM_mem_write;
  wire [31:0] MEM_branch_target;
  wire MEM_zero;
  wire [31:0] MEM_alu_result;
  wire [31:0] MEM_reg_data2;
  wire [4:0] MEM_mux_out;

  EX_MEM_reg u1 (
      .clk(clk),
      .startin(startin),
      .EX_wb(EX_wb),
      .EX_m(EX_m),
      .EX_branch_target(EX_branch_target),
      .EX_zero(EX_zero),
      .EX_alu_result(EX_alu_result),
      .EX_reg_data2(EX_reg_data2),
      .EX_mux_out(EX_mux_out),
      .MEM_wb(MEM_wb),
      .MEM_branch(MEM_branch),
      .MEM_mem_read(MEM_mem_read),
      .MEM_mem_write(MEM_mem_write),
      .MEM_branch_target(MEM_branch_target),
      .MEM_zero(MEM_zero),
      .MEM_alu_result(MEM_alu_result),
      .MEM_reg_data2(MEM_reg_data2),
      .MEM_mux_out(MEM_mux_out)
  );

  always #10 clk = ~clk;

  initial begin
    clk = 0;
    startin = 0;
    EX_wb = 2'b00;
    EX_m = 3'b000;
    EX_branch_target = 32'h00000000;
    EX_zero = 0;
    EX_alu_result = 32'h00000000;
    EX_reg_data2 = 32'h00000000;
    EX_mux_out = 5'b00000;
    #20;
    EX_wb = 2'b01;
    EX_m = 3'b110;
    EX_branch_target = 32'h00000010;
    EX_zero = 1;
    EX_alu_result = 32'hDEADBEEF;
    EX_reg_data2 = 32'hCAFEBABE;
    EX_mux_out = 5'b10101;
    #20;
    startin = 1;
    #20;
    startin = 0;
    EX_wb = 2'b11;
    EX_m = 3'b101;
    EX_branch_target = 32'h00000020;
    EX_zero = 0;
    EX_alu_result = 32'h12345678;
    EX_reg_data2 = 32'h87654321;
    EX_mux_out = 5'b01010;
    #20;
    startin = 1;
    #20;
    startin = 0;
    EX_wb = 2'b10;
    EX_m = 3'b011;
    EX_branch_target = 32'h00000030;
    EX_zero = 1;
    EX_alu_result = 32'h0F0F0F0F;
    EX_reg_data2 = 32'hF0F0F0F0;
    EX_mux_out = 5'b11111;
    #20;
  end
endmodule
