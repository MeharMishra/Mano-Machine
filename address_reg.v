module add_reg( ar_in, clk, load, clr, inc,ar_out);
output reg [11:0]ar_out;
input [11:0] ar_in;
input clk, load, inc, clr;
reg [11:0] temp;
always @ (posedge clk)

if(clr)
temp <= 12'b0;
else if(load)
temp <= ar_in;
else if(inc)
temp <= temp + 1'b1;

always @ (posedge clk)
ar_out <= temp;

endmodule