module DM(
input clk,rst,
input [31:0]MemIn,
input [31:0]addr,
input [1:0]MemWrite,
output [31:0]MemOut
);
reg [0:7]DataMem[0:1023];
integer i;

initial
for(i=0;i<1024;i=i+1) DataMem[i]=0;

always@(posedge clk,posedge rst)
begin
if(rst)
for(i=0;i<1024;i=i+1) DataMem[i]<=0;
else
begin
case(MemWrite)
  2'b01:
        begin
        DataMem[addr]=MemIn[7:0];//sw
        DataMem[addr+1]=MemIn[15:8];
        DataMem[addr+2]=MemIn[23:16];
        DataMem[addr+3]=MemIn[31:24];
        $display("DataMem[%2d]=%2h",addr,MemIn[7:0]);
        $display("DataMem[%2d]=%2h",addr+1,MemIn[15:8]);
        $display("DataMem[%2d]=%2h",addr+2,MemIn[23:16]);
        $display("DataMem[%2d]=%2h",addr+3,MemIn[31:24]);        
        end
  2'b10:
        begin
        DataMem[addr]=MemIn[7:0];//sh
        DataMem[addr+1]=MemIn[15:8];
        $display("DataMem[%2d]=%2h",addr,MemIn[7:0]);
        $display("DataMem[%2d]=%2h",addr+1,MemIn[15:8]);
        end

  2'b11:
        begin
        DataMem[addr]=MemIn[7:0];//sb
        $display("DataMem[%2d]=%2h",addr,MemIn[7:0]);
        end
  default:DataMem[addr]<=DataMem[addr];
endcase
end
end

assign MemOut={DataMem[addr+3],DataMem[addr+2],DataMem[addr+1],DataMem[addr]};

endmodule
