module test_forwarding_unit;
  reg EX_MEM_regWrite;
  reg MEM_WB_regWrite;
  reg [4:0] ID_EX_rt;
  reg [4:0] ID_EX_rs;
  reg [4:0] EX_MEM_rd;
  reg [4:0] MEM_WB_rd;
  wire [1:0] ForwardA;
  wire [1:0] ForwardB;

  forwarding_unit u1 (
      .EX_MEM_regWrite(EX_MEM_regWrite),
      .MEM_WB_regWrite(MEM_WB_regWrite),
      .ID_EX_rt(ID_EX_rt),
      .ID_EX_rs(ID_EX_rs),
      .EX_MEM_rd(EX_MEM_rd),
      .MEM_WB_rd(MEM_WB_rd),
      .ForwardA(ForwardA),
      .ForwardB(ForwardB)
  );

  initial begin
    EX_MEM_regWrite = 0;
    MEM_WB_regWrite = 0;
    ID_EX_rt = 5'd0;
    ID_EX_rs = 5'd0;
    EX_MEM_rd = 5'd0;
    MEM_WB_rd = 5'd0;
    #10;
    EX_MEM_regWrite = 1;
    MEM_WB_regWrite = 0;
    ID_EX_rt = 5'd10;
    ID_EX_rs = 5'd10;
    EX_MEM_rd = 5'd10;
    MEM_WB_rd = 5'd0;
    #10;
    EX_MEM_regWrite = 0;
    MEM_WB_regWrite = 1;
    ID_EX_rt = 5'd20;
    ID_EX_rs = 5'd20;
    EX_MEM_rd = 5'd0;
    MEM_WB_rd = 5'd20;
    #10;
    EX_MEM_regWrite = 1;
    MEM_WB_regWrite = 1;
    ID_EX_rt = 5'd15;
    ID_EX_rs = 5'd15;
    EX_MEM_rd = 5'd15;
    MEM_WB_rd = 5'd15;
    #10;
    EX_MEM_regWrite = 1;
    MEM_WB_regWrite = 1;
    ID_EX_rt = 5'd1;
    ID_EX_rs = 5'd2;
    EX_MEM_rd = 5'd1;
    MEM_WB_rd = 5'd2;
    #10;
    EX_MEM_regWrite = 1;
    MEM_WB_regWrite = 1;
    ID_EX_rt = 5'd5;
    ID_EX_rs = 5'd6;
    EX_MEM_rd = 5'd5;
    MEM_WB_rd = 5'd6;
    #10;
    EX_MEM_regWrite = 1;
    MEM_WB_regWrite = 0;
    ID_EX_rt = 5'd3;
    ID_EX_rs = 5'd4;
    EX_MEM_rd = 5'd3;
    MEM_WB_rd = 5'd0;
    #10;
    EX_MEM_regWrite = 0;
    MEM_WB_regWrite = 1;
    ID_EX_rt = 5'd7;
    ID_EX_rs = 5'd8;
    EX_MEM_rd = 5'd0;
    MEM_WB_rd = 5'd7;
    #10;
  end
endmodule
