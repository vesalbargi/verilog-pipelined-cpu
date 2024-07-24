module forwarding_unit (
    input EX_MEM_regWrite,
    input MEM_WB_regWrite,
    input [4:0] ID_EX_rt,
    input [4:0] ID_EX_rs,
    input [4:0] EX_MEM_rd,
    input [4:0] MEM_WB_rd,
    output reg [1:0] ForwardA,
    output reg [1:0] ForwardB
);

  always @(*) begin
    ForwardA = 2'b00;
    ForwardB = 2'b00;
    if (EX_MEM_regWrite && (EX_MEM_rd != 0) && (EX_MEM_rd == ID_EX_rs)) ForwardA = 2'b10;
    if (EX_MEM_regWrite && (EX_MEM_rd != 0) && (EX_MEM_rd == ID_EX_rt)) ForwardB = 2'b10;
    if (MEM_WB_regWrite && (MEM_WB_rd != 0) && (MEM_WB_rd == ID_EX_rs)) ForwardA = 2'b01;
    if (MEM_WB_regWrite && (MEM_WB_rd != 0) && (MEM_WB_rd == ID_EX_rt)) ForwardB = 2'b01;
  end
endmodule
