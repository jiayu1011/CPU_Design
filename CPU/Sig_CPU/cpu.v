module cpu(
input clk, rst,
output [31:0]Inst, PC, ALUOut, MemOut
);

wire [31:0]Read2, RegWriteData;
wire [1:0]MemWrite;
cpu_dataflow df( clk, rst, Inst, MemOut, RegWriteData, PC, Read2, ALUOut, MemWrite);
IM instmem( PC, Inst);
DM datamem( clk, rst, Read2, ALUOut, MemWrite, MemOut);

endmodule

