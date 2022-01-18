module control_unit_reg( clk, reset,ir, control_reg);
input clk, reset;
input [11:0] ir;
output reg [20:0] control_reg;

reg [3:0]state_reg;

parameter
CLA = 11'b00000000001,
CLE = 11'b00000000010,
CIR = 11'b00000000100,
CIL = 11'b00000001000,
INC = 11'b00000010000,
HLT = 11'b00000100000;


always @ (posedge clk or posedge reset)
begin
if (reset || (state_reg == 4'b1000))
state_reg <= 4'b0001;

else
state_reg <= state_reg << 1'b1;
end 



always @ ( state_reg or posedge reset)
begin
if ( !reset)
begin
case(state_reg)
4'b0001: begin control_reg = 21'b100000000000000010010; end
4'b0010: begin control_reg = 21'b000000100001000000111; end
4'b0100: begin control_reg = 21'b100000000000000000101; end
4'b1000: begin
			if(ir==CLA)
			control_reg = 21'b001000000000000000100 ;
			else if(ir==CLE)
			control_reg = 21'b000000000000000100100 ;
			else if(ir==CIR)
			control_reg = 21'b000100000000010000100;
			else if(ir==CIL)
			control_reg = 21'b000100000000010000100;
			else if(ir==INC)
			control_reg = 21'b000010000000000000100;
			else if(ir==HLT)
			control_reg = 21'b000000000000000000000;
			end
default: begin control_reg = 21'b000000000000000000000; end
endcase
end
end

endmodule

			