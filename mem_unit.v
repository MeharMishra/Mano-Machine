module mem_unit ( data_in, data_out, wr, rd, clk, reset, addr);
input [15:0]  data_in;
input clk, wr, rd, reset;
input [11:0] addr;
output reg [15:0] data_out;

reg [11:0] mem [4095:0];

always @ (posedge clk or posedge reset)

if (reset)
data_out <= 16'b0;

else if(wr)
mem[addr] <= data_in;

else if(rd)
data_out <= mem[addr];

endmodule
