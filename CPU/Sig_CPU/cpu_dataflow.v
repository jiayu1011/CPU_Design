module cpu_dataflow(
input clk, rst,
input [31:0]Inst, MemOut, RegWriteData,
output [31:0]pc, Read2, ALUOut,
output [1:0]MemWrite
);

wire [1:0]RegDst, NPCOp, MemtoReg;
wire [2:0]RegWrite;
wire ALUsrc1, ALUsrc2, EXTOp;
wire [3:0]ALUOp;
wire Zero,Sign,BranchZ;
wire [4:0]WriteReg;
wire [31:0]ExtImm;
wire [31:0]Read1, Jraddr;
wire shamt;
wire [31:0]ALUa;
wire [31:0]nextpc;
wire [31:0]ALUbb;
wire [31:0]ALUb;
control_unit cu( Inst[31:26], Inst[5:0], Inst[20:16], Zero, Sign,
 RegDst, RegWrite, NPCOp, MemWrite, MemtoReg, ALUsrc1, ALUsrc2, BranchZ, EXTOp, ALUOp);

EXT extension( Inst[15:0], EXTOp, ExtImm);

RF RegFile( clk, rst, RegWrite, Inst[25:21], Inst[20:16], WriteReg, RegWriteData, Read1, Read2, Inst[25:21], Jraddr);

mux4_5 RegD( Inst[20:16], Inst[15:11], 5'd31, 5'd31, RegDst, WriteReg);
mux2_32 ALU_a( Read1, {27'b0,Inst[10:6]}, ALUsrc1, ALUa);
mux2_32 ALU_bb( Read2, ExtImm, ALUsrc2, ALUbb);
mux2_32 ALU_b( ALUbb, 32'b0, BranchZ, ALUb);
mux4_32 Mem2Reg( ALUOut, MemOut, pc+4, 32'b0, MemtoReg, RegWriteData);

alu ALU( ALUa, ALUb, ALUOp, ALUOut, Zero, Sign);
NPC NextPC( pc, NPCOp, Inst[25:0], nextpc, Jraddr);
PC PC_unit( clk, rst, nextpc, pc);


endmodule
