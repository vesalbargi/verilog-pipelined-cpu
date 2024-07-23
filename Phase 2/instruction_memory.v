module instruction_memory (
    input [31:0] address,
    input startin,
    output [31:0] instruction
);
  reg [7:0] memory[0:47];

  always @(*) begin
    if (startin) begin
      {memory[0], memory[1], memory[2], memory[3]} <= 32'b10001100000100000000000000000000; // lw $s0, 0($0)
      {memory[4], memory[5], memory[6], memory[7]} <= 32'b10001100000100010000000000000100; // lw $s1, 4($0)
      {memory[8], memory[9], memory[10], memory[11]} <= 32'b10001100000100100000000000001000; // lw $s2, 8($0)
      {memory[12], memory[13], memory[14], memory[15]} <= 32'b10001100000100110000000000001100; // lw $s3, 12($0)
      {memory[16], memory[17], memory[18], memory[19]} <= 32'b00000000000000000000000000000000; // nop
      {memory[20], memory[21], memory[22], memory[23]} <= 32'b00000000000000000000000000000000; // nop
      {memory[24], memory[25], memory[26], memory[27]} <= 32'b00000000000000000000000000000000; // nop
      {memory[28], memory[29], memory[30], memory[31]} <= 32'b00000000000000000000000000000000; // nop
      {memory[32], memory[33], memory[34], memory[35]} <= 32'b00000010000100010100000000100000; // add $t0, $s0, $s1
      {memory[36], memory[37], memory[38], memory[39]} <= 32'b00000010010100110100100000100000; // add $t1, $s2, $s3
      {memory[40], memory[41], memory[42], memory[43]} <= 32'b00000001001010000101100000100000; // add $t3, $t1, $t0
      {memory[44], memory[45], memory[46], memory[47]} <= 32'b10101100000010110000000000101000; // sw $t3, 40($0)
    end
  end
  assign instruction = {memory[address], memory[address+1], memory[address+2], memory[address+3]};
endmodule
