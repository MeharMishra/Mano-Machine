module instr_reg (  instr_out, clk, reset, instr_in, load);
input [15:0] instr_in;
input load, clk, reset;
output reg [2:0] opcode;
output reg [15:0] instr_out;

always @(posedge clk or posedge reset)
if (reset)
instr_out <= 16'b0;

else if(load)
instr_out <= instr_in;

endmodule



