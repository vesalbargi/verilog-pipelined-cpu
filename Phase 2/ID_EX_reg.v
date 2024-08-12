module ID_EX_reg (
    input clk,
    input startin,
    input [1:0] ID_wb,
    input [2:0] ID_m,
    input [3:0] ID_ex,
    input [31:0] ID_pc_plus_4,
    input [31:0] ID_reg_data1,
    input [31:0] ID_reg_data2,
    input [31:0] ID_sign_ext_imm,
    input [4:0] ID_instr_25_21,
    input [4:0] ID_instr_20_16,
    input [4:0] ID_instr_20_16_extra,
    input [4:0] ID_instr_15_11,
    output reg [1:0] EX_wb,
    output reg [2:0] EX_m,
    output reg EX_alu_src,
    output reg [1:0] EX_alu_op,
    output reg EX_reg_dst,
    output reg [31:0] EX_pc_plus_4,
    output reg [31:0] EX_reg_data1,
    output reg [31:0] EX_reg_data2,
    output reg [31:0] EX_sign_ext_imm,
    output reg [4:0] EX_instr_25_21,
    output reg [4:0] EX_instr_20_16,
    output reg [4:0] EX_instr_20_16_extra,
    output reg [4:0] EX_instr_15_11
);

  always @(posedge clk) begin
    if (startin) begin
      EX_wb <= 2'b0;
      EX_m <= 3'b0;
      EX_alu_src <= 1'b0;
      EX_alu_op <= 2'b0;
      EX_reg_dst <= 1'b0;
      EX_pc_plus_4 <= 32'b0;
      EX_reg_data1 <= 32'b0;
      EX_reg_data2 <= 32'b0;
      EX_sign_ext_imm <= 32'b0;
      EX_instr_25_21 <= 5'b0;
      EX_instr_20_16 <= 5'b0;
      EX_instr_20_16_extra <= 5'b0;
      EX_instr_15_11 <= 5'b0;
    end else begin
      EX_wb <= ID_wb;
      EX_m <= ID_m;
      EX_alu_src <= ID_ex[3];
      EX_alu_op <= ID_ex[2:1];
      EX_reg_dst <= ID_ex[0];
      EX_pc_plus_4 <= ID_pc_plus_4;
      EX_reg_data1 <= ID_reg_data1;
      EX_reg_data2 <= ID_reg_data2;
      EX_sign_ext_imm <= ID_sign_ext_imm;
      EX_instr_25_21 <= ID_instr_25_21;
      EX_instr_20_16 <= ID_instr_20_16;
      EX_instr_20_16_extra <= ID_instr_20_16_extra;
      EX_instr_15_11 <= ID_instr_15_11;
    end
  end
endmodule
