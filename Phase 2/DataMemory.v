module DataMemory (
    input [31:0] Address,
    input [31:0] WriteData,
    input MemWrite,
    input MemRead,
    input Startin,
    input clk,
    output [31:0] ReadData
);
  reg [7:0] memory[43:0];

  assign ReadData = (MemRead) ? {memory[Address], memory[Address+1], memory[Address+2], memory[Address+3]} : 32'bx;

  integer i;
  always @(posedge clk) begin
    if (Startin) begin
      for (i = 0; i < 41; i = i + 4) begin
        {memory[i], memory[i+1], memory[i+2], memory[i+3]} <= 32'b1;
      end
    end
    if (MemWrite) begin
      {memory[Address], memory[Address+1], memory[Address+2], memory[Address+3]} <= WriteData;
    end
  end
endmodule
