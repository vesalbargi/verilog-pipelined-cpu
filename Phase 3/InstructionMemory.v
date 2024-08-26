module InstructionMemory (
    input [31:0] address,
    input startin,
    output [31:0] instruction
);
  reg [7:0] memory[59:0];

  always @(*) begin
    if (startin) begin
      {memory[0], memory[1], memory[2], memory[3]} <= 32'b00100000000010010000000000001010; // addi $t1, $0, 10
      {memory[4], memory[5], memory[6], memory[7]} <= 32'b00000000000000000101000000100000; // add $t2, $0, $0
      {memory[8], memory[9], memory[10], memory[11]} <= 32'b00100000000010110000000000000001; // addi $t3, $0, 1
      {memory[12], memory[13], memory[14], memory[15]} <= 32'b00000000000000000110000000100000; // add $t4, $0, $0
      {memory[16], memory[17], memory[18], memory[19]} <= 32'b00000000000000000111000000100000; // add $t6, $0, $0
      {memory[20], memory[21], memory[22], memory[23]} <= 32'b00100000000011110000000000000100; // addi $t7, $0, 4
      {memory[24], memory[25], memory[26], memory[27]} <= 32'b00010001001010100000000000000111; // Loop: beq $t1, $t2, End
      {memory[28], memory[29], memory[30], memory[31]} <= 32'b00000001010010110101000000100000; // add $t2, $t2, $t3
      {memory[32], memory[33], memory[34], memory[35]} <= 32'b10001101100011010000000000000000; // lw $t5, 0($t4)
      {memory[36], memory[37], memory[38], memory[39]} <= 32'b00000001110011010111000000100000; // add $t6, $t6, $t5
      {memory[40], memory[41], memory[42], memory[43]} <= 32'b00000001110010111000000000100000; // add $s0, $t6, $t3
      {memory[44], memory[45], memory[46], memory[47]} <= 32'b00000001110010111000100000100000; // add $s1, $t6, $t3
      {memory[48], memory[49], memory[50], memory[51]} <= 32'b00010000000000001111111111111001; // beq $0, $0, Loop
      {memory[52], memory[53], memory[54], memory[55]} <= 32'b00000001100011110110000000100000; // add $t4, $t4, $t7
      {memory[56], memory[57], memory[58], memory[59]} <= 32'b10101101100011100000000000000000; // End: sw $t6, 0($t4)
    end
  end
  assign instruction = {memory[address], memory[address+1], memory[address+2], memory[address+3]};
endmodule
