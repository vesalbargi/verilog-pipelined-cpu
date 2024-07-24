module ALUControl (
    input [5:0] Func,
    input [1:0] Aluop,
    output reg [3:0] Alucontrol
);

  always @(*) begin
    case (Aluop)
      2'b00:   Alucontrol = 4'b0010;
      2'b01:   Alucontrol = 4'b0110;
      2'b10: begin
        case (Func)
          6'b100000: Alucontrol = 4'b0010;
          6'b100010: Alucontrol = 4'b0110;
          6'b100100: Alucontrol = 4'b0000;
          6'b100101: Alucontrol = 4'b0001;
          6'b101010: Alucontrol = 4'b0111;
          default:   Alucontrol = 4'bxxxx;
        endcase
      end
      default: Alucontrol = 4'bxxxx;
    endcase
  end
endmodule
