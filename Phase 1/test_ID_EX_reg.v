`timescale 1ns / 1ps

module test_ID_EX_reg;
  reg clk;
  reg startin;
  reg [1:0] ID_wb;
  reg [2:0] ID_m;
  reg [3:0] ID_ex;
  reg [31:0] ID_pc_plus_4;
  reg [31:0] ID_reg_data1;
  reg [31:0] ID_reg_data2;
  reg [31:0] ID_sign_ext_imm;
  reg [4:0] ID_instr_20_16;
  reg [4:0] ID_instr_15_11;
  wire [1:0] EX_wb;
  wire [2:0] EX_m;
  wire EX_reg_dst;
  wire [1:0] EX_alu_op;
  wire EX_alu_src;
  wire [31:0] EX_pc_plus_4;
  wire [31:0] EX_reg_data1;
  wire [31:0] EX_reg_data2;
  wire [31:0] EX_sign_ext_imm;
  wire [4:0] EX_instr_20_16;
  wire [4:0] EX_instr_15_11;

  ID_EX_reg u1 (
      .clk(clk),
      .startin(startin),
      .ID_wb(ID_wb),
      .ID_m(ID_m),
      .ID_ex(ID_ex),
      .ID_pc_plus_4(ID_pc_plus_4),
      .ID_reg_data1(ID_reg_data1),
      .ID_reg_data2(ID_reg_data2),
      .ID_sign_ext_imm(ID_sign_ext_imm),
      .ID_instr_20_16(ID_instr_20_16),
      .ID_instr_15_11(ID_instr_15_11),
      .EX_wb(EX_wb),
      .EX_m(EX_m),
      .EX_reg_dst(EX_reg_dst),
      .EX_alu_op(EX_alu_op),
      .EX_alu_src(EX_alu_src),
      .EX_pc_plus_4(EX_pc_plus_4),
      .EX_reg_data1(EX_reg_data1),
      .EX_reg_data2(EX_reg_data2),
      .EX_sign_ext_imm(EX_sign_ext_imm),
      .EX_instr_20_16(EX_instr_20_16),
      .EX_instr_15_11(EX_instr_15_11)
  );

  always #10 clk = ~clk;

  initial begin
    clk = 0;
    startin = 0;
    ID_wb = 2'b00;
    ID_m = 3'b000;
    ID_ex = 4'b0000;
    ID_pc_plus_4 = 32'h00000000;
    ID_reg_data1 = 32'h00000000;
    ID_reg_data2 = 32'h00000000;
    ID_sign_ext_imm = 32'h00000000;
    ID_instr_20_16 = 5'b00000;
    ID_instr_15_11 = 5'b00000;
    #20;
    ID_wb = 2'b10;
    ID_m = 3'b101;
    ID_ex = 4'b1101;
    ID_pc_plus_4 = 32'h00000004;
    ID_reg_data1 = 32'h12345678;
    ID_reg_data2 = 32'h87654321;
    ID_sign_ext_imm = 32'h0000ABCD;
    ID_instr_20_16 = 5'b10101;
    ID_instr_15_11 = 5'b01010;
    #20;
    startin = 1;
    #20;
    startin = 0;
    ID_wb = 2'b11;
    ID_m = 3'b010;
    ID_ex = 4'b0011;
    ID_pc_plus_4 = 32'h00000008;
    ID_reg_data1 = 32'hDEADBEEF;
    ID_reg_data2 = 32'hCAFEBABE;
    ID_sign_ext_imm = 32'h00001234;
    ID_instr_20_16 = 5'b11111;
    ID_instr_15_11 = 5'b00001;
    #20;
    startin = 1;
    #20;
    startin = 0;
    ID_wb = 2'b01;
    ID_m = 3'b011;
    ID_ex = 4'b1110;
    ID_pc_plus_4 = 32'h0000000C;
    ID_reg_data1 = 32'h0F0F0F0F;
    ID_reg_data2 = 32'hF0F0F0F0;
    ID_sign_ext_imm = 32'h0000FFFF;
    ID_instr_20_16 = 5'b11011;
    ID_instr_15_11 = 5'b00101;
    #20;
  end
endmodule
