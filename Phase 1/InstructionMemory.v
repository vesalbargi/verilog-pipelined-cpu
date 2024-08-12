module InstructionMemory (
    input [31:0] address,
    input startin,
    output [31:0] instruction
);
  reg [7:0] memory[39:0];

  always @(*) begin
    if (startin) begin
      {memory[0], memory[1], memory[2], memory[3]} <= 32'b10001101000010010000000000000000; // lw $t1, 0($t0)
      {memory[4], memory[5], memory[6], memory[7]} <= 32'b10001101000010100000000000000100; // lw $t2, 4($t0)
      {memory[8], memory[9], memory[10], memory[11]} <= 32'b00000000000000000000000000000000; // no-op
      {memory[12], memory[13], memory[14], memory[15]} <= 32'b00000000000000000000000000000000; // no-op
      {memory[16], memory[17], memory[18], memory[19]} <= 32'b00000000000000000000000000000000; // no-op
      {memory[20], memory[21], memory[22], memory[23]} <= 32'b00000001001010100101100000100000; // add $t3, $t1, $t2
      {memory[24], memory[25], memory[26], memory[27]} <= 32'b00000000000000000000000000000000; // no-op
      {memory[28], memory[29], memory[30], memory[31]} <= 32'b00000000000000000000000000000000; // no-op
      {memory[32], memory[33], memory[34], memory[35]} <= 32'b00000000000000000000000000000000; // no-op
      {memory[36], memory[37], memory[38], memory[39]} <= 32'b10101101000010110000000000001000; // sw $t3, 8($t0)
    end
  end
  assign instruction = {memory[address], memory[address+1], memory[address+2], memory[address+3]};
endmodule
