module Main (
    input clk,
    input startin,
    input [4:0] regNo,
    output [31:0] val
);
  wire [31:0] pc_out, pc_next, pc_plus_4, IF_instr;

  wire [1:0] ID_wb, alu_op;
  wire [2:0] ID_m;
  wire [3:0] ID_ex, alu_ctrl;
  wire [31:0] ID_reg_data1, ID_reg_data2, ID_sign_ext_imm, ID_instr, ID_pc_plus_4;
  wire reg_dst, branch, mem_read, mem_to_reg, mem_write, alu_src, reg_write;

  wire [1:0] EX_wb, EX_alu_op;
  wire [2:0] EX_m;
  wire EX_reg_dst, EX_alu_src, EX_zero;
  wire [31:0] EX_instr, EX_pc_plus_4, EX_reg_data1, EX_reg_data2, EX_sign_ext_imm, EX_sign_ext_shifted;

  wire [1:0] forward_a, forward_b;
  wire [31:0] EX_alu_result, EX_forward_a_mux_out, EX_forward_b_mux_out, EX_branch_target, alu_input2;
  wire [4:0] EX_reg_dst_mux_out;

  wire [1:0] MEM_wb;
  wire MEM_branch, MEM_mem_read, MEM_mem_write, MEM_zero;
  wire [31:0] MEM_branch_target, MEM_alu_result, MEM_forward_b_mux_out, MEM_mem_data;
  wire [4:0] MEM_reg_dst_mux_out;

  wire WB_reg_write, WB_mem_to_reg;
  wire [31:0] WB_mem_data, WB_alu_result, WB_mem_to_reg_mux_out;
  wire [4:0] WB_reg_dst_mux_out;

  PC pc (
      .in(pc_next),
      .clk(clk),
      .startin(startin),
      .out(pc_out)
  );

  InstructionMemory instruction_memory (
      .address(pc_out),
      .startin(startin),
      .instruction(IF_instr)
  );

  Add pc_adder (
      .digit1(pc_out),
      .digit2(32'd4),
      .result(pc_plus_4)
  );

  IF_ID_reg if_id_reg (
      .clk(clk),
      .startin(startin),
      .IF_instr(IF_instr),
      .IF_pc_plus_4(pc_plus_4),
      .ID_instr(ID_instr),
      .ID_pc_plus_4(ID_pc_plus_4)
  );

  Control control (
      .instruction31_26(ID_instr[31:26]),
      .regdst(reg_dst),
      .branch(branch),
      .memread(mem_read),
      .memtoreg(mem_to_reg),
      .aluop(alu_op),
      .memwrite(mem_write),
      .alusrc(alu_src),
      .regwrite(reg_write)
  );

  RegisterFile register_file (
      .Read1(ID_instr[25:21]),
      .Read2(ID_instr[20:16]),
      .WriteReg(WB_reg_dst_mux_out),
      .WriteData(WB_mem_to_reg_mux_out),
      .RegWrite(WB_reg_write),
      .startin(startin),
      .clk(clk),
      .regNo(regNo),
      .Data1(ID_reg_data1),
      .Data2(ID_reg_data2),
      .val(val)
  );

  SignExtend sign_extend (
      .in(ID_instr[15:0]),
      .result(ID_sign_ext_imm)
  );

  ID_EX_reg id_ex_reg (
      .clk(clk),
      .startin(startin),
      .ID_wb({reg_write, mem_to_reg}),
      .ID_m({mem_read, mem_write, branch}),
      .ID_ex({alu_op, alu_src, reg_dst}),
      .ID_pc_plus_4(ID_pc_plus_4),
      .ID_reg_data1(ID_reg_data1),
      .ID_reg_data2(ID_reg_data2),
      .ID_sign_ext_imm(ID_sign_ext_imm),
      .ID_instr_25_21(ID_instr[25:21]),
      .ID_instr_20_16(ID_instr[20:16]),
      .ID_instr_20_16_extra(ID_instr[20:16]),
      .ID_instr_15_11(ID_instr[15:11]),
      .EX_wb(EX_wb),
      .EX_m(EX_m),
      .EX_reg_dst(EX_reg_dst),
      .EX_alu_op(EX_alu_op),
      .EX_alu_src(EX_alu_src),
      .EX_pc_plus_4(EX_pc_plus_4),
      .EX_reg_data1(EX_reg_data1),
      .EX_reg_data2(EX_reg_data2),
      .EX_sign_ext_imm(EX_sign_ext_imm),
      .EX_instr_25_21(EX_instr[25:21]),
      .EX_instr_20_16(EX_instr[20:16]),
      .EX_instr_20_16_extra(EX_instr[20:16]),
      .EX_instr_15_11(EX_instr[15:11])
  );

  forwarding_unit forwarding_unit (
      .EX_MEM_regWrite(MEM_wb[0]),
      .MEM_WB_regWrite(WB_reg_write),
      .ID_EX_rs(EX_instr[25:21]),
      .ID_EX_rt(EX_instr[20:16]),
      .EX_MEM_rd(MEM_reg_dst_mux_out),
      .MEM_WB_rd(WB_reg_dst_mux_out),
      .ForwardA(forward_a),
      .ForwardB(forward_b)
  );

  mux_32_3Inputs forward_a_mux (
      .input1(EX_reg_data1),
      .input2(WB_mem_to_reg_mux_out),
      .input3(MEM_alu_result),
      .op(forward_a),
      .out(EX_forward_a_mux_out)
  );

  mux_32_3Inputs forward_b_mux (
      .input1(EX_reg_data2),
      .input2(WB_mem_to_reg_mux_out),
      .input3(MEM_alu_result),
      .op(forward_b),
      .out(EX_forward_b_mux_out)
  );

  Mux32 alu_src_mux (
      .input1(EX_forward_b_mux_out),
      .input2(EX_sign_ext_imm),
      .op(EX_alu_src),
      .out(alu_input2)
  );

  ALUControl alu_control (
      .Func(EX_sign_ext_imm),
      .Aluop(EX_alu_op),
      .Alucontrol(alu_ctrl)
  );

  ALU alu (
      .in1(EX_forward_a_mux_out),
      .in2(alu_input2),
      .operation(alu_ctrl),
      .out(EX_alu_result),
      .zero(EX_zero)
  );

  Mux5 reg_dst_mux (
      .input1(EX_instr[20:16]),
      .input2(EX_instr[15:11]),
      .op(EX_reg_dst),
      .out(EX_reg_dst_mux_out)
  );

  ShiftLeft2 shift_left2 (
      .in (EX_sign_ext_imm),
      .out(EX_sign_ext_shifted)
  );

  Add branch_adder (
      .digit1(EX_pc_plus_4),
      .digit2(EX_sign_ext_shifted),
      .result(EX_branch_target)
  );

  EX_MEM_reg ex_mem_reg (
      .clk(clk),
      .startin(startin),
      .EX_wb(EX_wb),
      .EX_m(EX_m),
      .EX_branch_target(EX_branch_target),
      .EX_zero(EX_zero),
      .EX_alu_result(EX_alu_result),
      .EX_forward_b_mux_out(EX_forward_b_mux_out),
      .EX_reg_dst_mux_out(EX_reg_dst_mux_out),
      .MEM_wb(MEM_wb),
      .MEM_branch(MEM_branch),
      .MEM_mem_read(MEM_mem_read),
      .MEM_mem_write(MEM_mem_write),
      .MEM_branch_target(MEM_branch_target),
      .MEM_zero(MEM_zero),
      .MEM_alu_result(MEM_alu_result),
      .MEM_forward_b_mux_out(MEM_forward_b_mux_out),
      .MEM_reg_dst_mux_out(MEM_reg_dst_mux_out)
  );

  DataMemory data_memory (
      .Address(MEM_alu_result),
      .WriteData(MEM_forward_b_mux_out),
      .MemWrite(MEM_mem_write),
      .MemRead(MEM_mem_read),
      .Startin(startin),
      .clk(clk),
      .ReadData(MEM_mem_data)
  );

  MEM_WB_reg mem_wb_reg (
      .clk(clk),
      .startin(startin),
      .MEM_wb(MEM_wb),
      .MEM_mem_data(MEM_mem_data),
      .MEM_alu_result(MEM_alu_result),
      .MEM_reg_dst_mux_out(MEM_reg_dst_mux_out),
      .WB_reg_write(WB_reg_write),
      .WB_mem_to_reg(WB_mem_to_reg),
      .WB_mem_data(WB_mem_data),
      .WB_alu_result(WB_alu_result),
      .WB_reg_dst_mux_out(WB_reg_dst_mux_out)
  );

  Mux32 mem_to_reg_mux (
      .input1(WB_alu_result),
      .input2(WB_mem_data),
      .op(WB_mem_to_reg),
      .out(WB_mem_to_reg_mux_out)
  );

  Mux32 branch_mux (
      .input1(pc_plus_4),
      .input2(MEM_branch_target),
      .op(MEM_branch & MEM_zero),
      .out(pc_next)
  );
endmodule
