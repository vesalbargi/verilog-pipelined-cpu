module test_comparator;
  reg [31:0] input1;
  reg [31:0] input2;
  wire out;

  comparator u1 (
      .input1(input1),
      .input2(input2),
      .out(out)
  );

  initial begin
    input1 = 32'h00000000;
    input2 = 32'h00000000;
    #10;
    input1 = 32'hFFFFFFFF;
    input2 = 32'hFFFFFFFF;
    #10;
    input1 = 32'h12345678;
    input2 = 32'h12345678;
    #10;
    input1 = 32'hA5A5A5A5;
    input2 = 32'h5A5A5A5A;
    #10;
    input1 = 32'hDEADBEEF;
    input2 = 32'hFEEDC0DE;
    #10;
    input1 = 32'h00000000;
    input2 = 32'hFFFFFFFF;
    #10;
    input1 = 32'hABCDEF01;
    input2 = 32'hABCDEF01;
    #10;
  end
endmodule
