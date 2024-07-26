module mux_8_2Inputs (
    input [7:0] input1,
    input [7:0] input2,
    input op,
    output [7:0] out
);
  assign out = (op) ? input2 : input1;
endmodule
