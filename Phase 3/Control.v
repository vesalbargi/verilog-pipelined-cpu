module Control (
    input [5:0] instruction31_26,
    output reg regdst,
    output reg branch,
    output reg memread,
    output reg memtoreg,
    output reg [1:0] aluop,
    output reg memwrite,
    output reg alusrc,
    output reg regwrite
);

  always @(*) begin
    case (instruction31_26)
      6'b000000: begin
        regdst = 1;
        branch = 0;
        memread = 0;
        memtoreg = 0;
        aluop = 2'b10;
        memwrite = 0;
        alusrc = 0;
        regwrite = 1;
      end
      6'b100011: begin
        regdst = 0;
        branch = 0;
        memread = 1;
        memtoreg = 1;
        aluop = 2'b00;
        memwrite = 0;
        alusrc = 1;
        regwrite = 1;
      end
      6'b101011: begin
        regdst = 1'bx;
        branch = 0;
        memread = 0;
        memtoreg = 1'bx;
        aluop = 2'b00;
        memwrite = 1;
        alusrc = 1;
        regwrite = 0;
      end
      6'b000100: begin
        regdst = 1'bx;
        branch = 1;
        memread = 0;
        memtoreg = 1'bx;
        aluop = 2'b01;
        memwrite = 0;
        alusrc = 0;
        regwrite = 0;
      end
      6'b000010: begin
        regdst = 1'bx;
        branch = 0;
        memread = 0;
        memtoreg = 1'bx;
        aluop = 2'bxx;
        memwrite = 0;
        alusrc = 1'bx;
        regwrite = 0;
      end
      default: begin
        regdst = 1'bx;
        branch = 0;
        memread = 0;
        memtoreg = 0;
        aluop = 2'b00;
        memwrite = 0;
        alusrc = 0;
        regwrite = 0;
      end
    endcase
  end
endmodule
