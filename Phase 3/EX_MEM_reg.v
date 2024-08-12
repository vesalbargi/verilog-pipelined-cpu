module EX_MEM_reg (
    input clk,
    input startin,
    input [1:0] EX_wb,
    input [1:0] EX_m,
    input [31:0] EX_alu_result,
    input [31:0] EX_forward_b_mux_out,
    input [4:0] EX_reg_dst_mux_out,
    output reg [1:0] MEM_wb,
    output reg MEM_mem_read,
    output reg MEM_mem_write,
    output reg [31:0] MEM_alu_result,
    output reg [31:0] MEM_forward_b_mux_out,
    output reg [4:0] MEM_reg_dst_mux_out
);

  always @(posedge clk) begin
    if (startin) begin
      MEM_wb <= 2'b0;
      MEM_mem_read <= 1'b0;
      MEM_mem_write <= 1'b0;
      MEM_alu_result <= 32'b0;
      MEM_forward_b_mux_out <= 32'b0;
      MEM_reg_dst_mux_out <= 5'b0;
    end else begin
      MEM_wb <= EX_wb;
      MEM_mem_read <= EX_m[1];
      MEM_mem_write <= EX_m[0];
      MEM_alu_result <= EX_alu_result;
      MEM_forward_b_mux_out <= EX_forward_b_mux_out;
      MEM_reg_dst_mux_out <= EX_reg_dst_mux_out;
    end
  end
endmodule
