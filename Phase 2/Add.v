module Add (
    input  [31:0] digit1,
    input  [31:0] digit2,
    output [31:0] result
);
  assign result = digit1 + digit2;
endmodule
