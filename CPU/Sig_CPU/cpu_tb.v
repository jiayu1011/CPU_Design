`timescale 1ns/1ps
module cpu_tb;
reg clk,rst;
wire [31:0]Inst, PC, ALUOut, MemOut;
initial
begin 
  clk=0;
  rst=1;
  #500;
  rst=0;

  
end
always #500
  begin
  clk=~clk;
  end

cpu cpu_test( clk, rst, Inst, PC, ALUOut, MemOut);

endmodule
