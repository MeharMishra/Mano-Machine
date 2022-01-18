module program_counter( pr_in, clk, load, clr, inc, pr_out);
output reg [11:0]pr_out;
input [11:0] pr_in;
input clk, load, inc, clr;
reg [11:0] temp;
always @ (posedge clk)

if(clr)
temp <= 12'b0;
else if(load)
temp <= pr_in;
else if(inc)
temp <= temp + 1'b1;

always @ (posedge clk)
pr_out <= temp;

endmodule