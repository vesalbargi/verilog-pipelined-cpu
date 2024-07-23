`timescale 1ns / 1ps

module test_hazard_detection_unit;
  reg ID_EX_memRead;
  reg [4:0] ID_EX_rt;
  reg [4:0] IF_ID_rs;
  reg [4:0] IF_ID_rt;
  wire PCWrite;
  wire IF_IDWrite;
  wire memRegWriteSelection;

  hazard_detection_unit u1 (
      .ID_EX_memRead(ID_EX_memRead),
      .ID_EX_rt(ID_EX_rt),
      .IF_ID_rs(IF_ID_rs),
      .IF_ID_rt(IF_ID_rt),
      .PCWrite(PCWrite),
      .IF_IDWrite(IF_IDWrite),
      .memRegWriteSelection(memRegWriteSelection)
  );

  initial begin
    ID_EX_memRead = 0;
    ID_EX_rt = 5'b00000;
    IF_ID_rs = 5'b00000;
    IF_ID_rt = 5'b00000;
    #10;
    ID_EX_memRead = 1;
    ID_EX_rt = 5'b00001;
    IF_ID_rs = 5'b00001;
    IF_ID_rt = 5'b00010;
    #10;
    ID_EX_rt = 5'b00010;
    IF_ID_rs = 5'b00001;
    IF_ID_rt = 5'b00010;
    #10;
    ID_EX_memRead = 0;
    ID_EX_rt = 5'b00011;
    IF_ID_rs = 5'b00100;
    IF_ID_rt = 5'b00101;
    #10;
    ID_EX_memRead = 1;
    ID_EX_rt = 5'b00100;
    IF_ID_rs = 5'b00100;
    IF_ID_rt = 5'b00101;
    #10;
    ID_EX_rt = 5'b00101;
    IF_ID_rs = 5'b00100;
    IF_ID_rt = 5'b00101;
    #10;
  end
endmodule
