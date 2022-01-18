module acc_reg( acc_in, clk, load, clr, inc,acc_out);
output reg [15:0]acc_out;
input [15:0] acc_in;
input clk, load, inc, clr;
reg [15:0] temp;
always @ (posedge clk)

if(clr)
temp <= 12'b0;
else if(load)
temp <= acc_in;
else if(inc)
temp <= temp +1'b1;

always @ (posedge clk)
acc_out <= temp;

endmodule