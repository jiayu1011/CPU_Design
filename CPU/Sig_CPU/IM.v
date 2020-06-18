module IM(
    input [31:0] PC,
    output reg [31:0] instruction
    );
    reg [31:0] mem [0:255];
    initial begin
        $readmemh("mipstestloopjal_sim.txt", mem);
   end

    always@(PC) begin
            assign instruction = mem[PC >> 2];
            $display("the instruction now is %h", instruction);
        end
endmodule
