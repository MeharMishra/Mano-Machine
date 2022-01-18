module bus_mux ( mem_out, addreg_out, pc_out, datareg_out, acc_out, instreg_out, temp_out, sel, busmux_out);
input [15:0] mem_out, datareg_out, acc_out, instreg_out,temp_out;
input [11:0] addreg_out, pc_out;
input [2:0] sel;
output reg [15:0] busmux_out;

parameter
a= 3'b000,
b= 3'b001,
c= 3'b010,
d= 3'b011,
e= 3'b100,
f= 3'b101,
g= 3'b110,
h= 3'b111;

always @ (*)
case(sel)

a: busmux_out <= {4'b0, addreg_out};
b: busmux_out <= {4'b0, pc_out};
c: busmux_out <= datareg_out;
d: busmux_out <= acc_out;
e: busmux_out <= instreg_out;
f: busmux_out <= mem_out;
g: busmux_out <= temp_out;
default: busmux_out <= 16'b0;


endcase
endmodule