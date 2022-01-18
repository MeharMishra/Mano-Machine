module decoder_reg( clk, reset, control_reg, ir, acc_out, e_out);
input clk, reset;
input [11:0] ir;
output reg[15:0] acc_out;
output reg e_out;
input [20:0] control_reg;

always @(posedge clk or posedge reset)
if (!reset)
begin 
case(control_reg)
21'b001000000000000000100 : begin acc_out <= 16'b0; end
21'b000000000000000100100 : begin e_out <= 1'b0; end
21'b000100000000010000100 : begin if ( ir == 11'b00000000100)begin
									acc_out <= { e_out, acc_out[15:1]}; e_out <= acc_out[0]; end
									else begin
									acc_out <= {acc_out[14:0], e_out}; e_out <= acc_out[15]; end
									end
21'b000010000000000000100 : begin acc_out <= acc_out + 1'b1; end
21'b000000000000000000000 : $stop;
default: begin acc_out <= 16'b0; e_out <= 1'b0; end

endcase
end 
endmodule 



