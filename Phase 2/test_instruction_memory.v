module test_instruction_memory;
  reg [31:0] address;
  reg startin;
  wire [31:0] instruction;

  instruction_memory u1 (
      .address(address),
      .startin(startin),
      .instruction(instruction)
  );

  initial begin
    address = 32'd0;
    startin = 1'b1;
    #20;
    startin = 1'b0;
    address = 32'd0;
    #10;
    address = 32'd4;
    #10;
    address = 32'd8;
    #10;
    address = 32'd12;
    #10;
    address = 32'd16;
    #10;
    address = 32'd20;
    #10;
    address = 32'd24;
    #10;
    address = 32'd28;
    #10;
    address = 32'd32;
    #10;
    address = 32'd36;
    #10;
    address = 32'd40;
    #10;
    address = 32'd44;
    #10;
  end
endmodule
