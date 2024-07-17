`timescale 1ns / 1ps

module test_MEM_WB_reg;
  reg clk;
  reg startin;
  reg [1:0] MEM_wb;
  reg [31:0] MEM_mem_data;
  reg [31:0] MEM_alu_result;
  reg [4:0] MEM_mux_out;
  wire WB_reg_write;
  wire WB_mem_to_reg;
  wire [31:0] WB_mem_data;
  wire [31:0] WB_alu_result;
  wire [4:0] WB_mux_out;

  MEM_WB_reg u1 (
      .clk(clk),
      .startin(startin),
      .MEM_wb(MEM_wb),
      .MEM_mem_data(MEM_mem_data),
      .MEM_alu_result(MEM_alu_result),
      .MEM_mux_out(MEM_mux_out),
      .WB_reg_write(WB_reg_write),
      .WB_mem_to_reg(WB_mem_to_reg),
      .WB_mem_data(WB_mem_data),
      .WB_alu_result(WB_alu_result),
      .WB_mux_out(WB_mux_out)
  );

  always #10 clk = ~clk;

  initial begin
    clk = 0;
    startin = 0;
    MEM_wb = 2'b00;
    MEM_mem_data = 32'h00000000;
    MEM_alu_result = 32'h00000000;
    MEM_mux_out = 5'b00000;
    #20;
    MEM_wb = 2'b11;
    MEM_mem_data = 32'h11111111;
    MEM_alu_result = 32'hAABBCCDD;
    MEM_mux_out = 5'b11001;
    #20;
    startin = 1;
    #20;
    startin = 0;
    MEM_wb = 2'b10;
    MEM_mem_data = 32'h22222222;
    MEM_alu_result = 32'hBBCCDDEE;
    MEM_mux_out = 5'b10101;
    #20;
    startin = 1;
    #20;
    startin = 0;
    MEM_wb = 2'b01;
    MEM_mem_data = 32'h33333333;
    MEM_alu_result = 32'hCCDDEEFF;
    MEM_mux_out = 5'b01101;
    #20;
  end
endmodule
