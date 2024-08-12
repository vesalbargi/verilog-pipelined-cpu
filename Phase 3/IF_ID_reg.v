module IF_ID_reg (
    input clk,
    input startin,
    input IF_IDWrite,
    input [31:0] IF_instr,
    input [31:0] IF_pc_plus_4,
    output reg [31:0] ID_instr,
    output reg [31:0] ID_pc_plus_4
);

  always @(posedge clk) begin
    if (startin) begin
      ID_instr <= 32'b0;
      ID_pc_plus_4 <= 32'b0;
    end else if (IF_IDWrite) begin
      ID_instr <= IF_instr;
      ID_pc_plus_4 <= IF_pc_plus_4;
    end
  end
endmodule
