module EX_MEM_reg (
    input clk,
    input startin,
    input [1:0] EX_wb,
    input [2:0] EX_m,
    input [31:0] EX_branch_target,
    input EX_zero,
    input [31:0] EX_alu_result,
    input [31:0] EX_reg_data2,
    input [4:0] EX_mux_out,
    output reg [1:0] MEM_wb,
    output reg MEM_branch,
    output reg MEM_mem_read,
    output reg MEM_mem_write,
    output reg [31:0] MEM_branch_target,
    output reg MEM_zero,
    output reg [31:0] MEM_alu_result,
    output reg [31:0] MEM_reg_data2,
    output reg [4:0] MEM_mux_out
);

  always @(posedge clk) begin
    if (startin) begin
      MEM_wb <= 2'b0;
      MEM_branch <= 1'b0;
      MEM_mem_read <= 1'b0;
      MEM_mem_write <= 1'b0;
      MEM_branch_target <= 32'b0;
      MEM_zero <= 1'b0;
      MEM_alu_result <= 32'b0;
      MEM_reg_data2 <= 32'b0;
      MEM_mux_out <= 5'b0;
    end else begin
      MEM_wb <= EX_wb;
      MEM_branch <= EX_m[2];
      MEM_mem_read <= EX_m[1];
      MEM_mem_write <= EX_m[0];
      MEM_branch_target <= EX_branch_target;
      MEM_zero <= EX_zero;
      MEM_alu_result <= EX_alu_result;
      MEM_reg_data2 <= EX_reg_data2;
      MEM_mux_out <= EX_mux_out;
    end
  end
endmodule
