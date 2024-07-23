module hazard_detection_unit (
    input ID_EX_memRead,
    input [4:0] ID_EX_rt,
    input [4:0] IF_ID_rs,
    input [4:0] IF_ID_rt,
    output reg PCWrite,
    output reg IF_IDWrite,
    output reg memRegWriteSelection
);

  always @(*) begin
    if (ID_EX_memRead && ((ID_EX_rt == IF_ID_rs) || (ID_EX_rt == IF_ID_rt))) begin
      PCWrite = 0;
      IF_IDWrite = 0;
      memRegWriteSelection = 1;
    end else begin
      PCWrite = 1;
      IF_IDWrite = 1;
      memRegWriteSelection = 0;
    end
  end
endmodule
