module MEM_WB_reg (
    input clk,
    input startin,
    input [1:0] MEM_wb,
    input [31:0] MEM_mem_data,
    input [31:0] MEM_alu_result,
    input [4:0] MEM_mux_out,
    output reg WB_reg_write,
    output reg WB_mem_to_reg,
    output reg [31:0] WB_mem_data,
    output reg [31:0] WB_alu_result,
    output reg [4:0] WB_mux_out
);

  always @(posedge clk) begin
    if (startin) begin
      WB_reg_write <= 1'b0;
      WB_mem_to_reg <= 1'b0;
      WB_alu_result <= 32'b0;
      WB_mem_data <= 32'b0;
      WB_mux_out <= 5'b0;
    end else begin
      WB_reg_write <= MEM_wb[1];
      WB_mem_to_reg <= MEM_wb[0];
      WB_alu_result <= MEM_alu_result;
      WB_mem_data <= MEM_mem_data;
      WB_mux_out <= MEM_mux_out;
    end
  end
endmodule
