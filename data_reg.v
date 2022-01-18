module data_reg( data_in, clk, load, clr, inc,data_out);
output reg [15:0]data_out;
input [15:0] data_in;
input clk, load, inc, clr;
reg [15:0] temp;
always @ (posedge clk)

if(clr)
temp <= 12'b0;
else if(load)
temp <= data_in;
else if(inc)
temp <= temp +1'b1;

always @ (posedge clk)
data_out <= temp;

endmodule