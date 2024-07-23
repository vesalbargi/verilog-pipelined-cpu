module comparator (
    input [31:0] input1,
    input [31:0] input2,
    output out
);
  assign out = (input1 == input2);
endmodule
