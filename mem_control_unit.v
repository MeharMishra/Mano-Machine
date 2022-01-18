module control_unit_mem ( clk, reset, control_mem, opcode);
input clk, reset;
input [2:0] opcode;
output reg [16:0] control_mem;

reg[5:0] state_mem;

parameter
AND = 3'b001,
ADD = 3'b010,
LDA = 3'b011,
STA = 3'b100,
BUN = 3'b101,
BSA = 3'b110;

always @ (posedge clk or posedge reset)
begin
if (reset || (state_mem == 6'b100000))
state_mem <= 6'b000001;

else
state_mem <= state_mem << 1'b1;
end 

always @ ( state_mem or posedge reset)
begin
if ( !reset)
begin
case(state_mem)
6'b000001: begin control_mem = 17'b10000000000010010; end
6'b000010: begin control_mem = 17'b00000100001000111; end
6'b000100: begin control_mem = 17'b10000000000000101; end
6'b001000: begin
			if((opcode == AND)||(opcode==ADD)||(opcode==LDA))
			control_mem = 17'b00000000100010111;
			else if ( opcode == STA)
			control_mem = 17'b00000000000001100;
			else if(opcode ==BUN)
			control_mem = 17'b00001000000000001;
			else if(opcode == BSA)
			control_mem = 17'b01000000000001010;
			end 
6'b010000: begin
			if((opcode == AND)||(opcode==ADD))
			control_mem = 17'b0;
			else if(opcode ==LDA)
			control_mem = 17'b00000000000000011;
			else if(opcode == BSA)
			control_mem = 17'b00001000000000001;
			end
default: begin control_mem = 17'b0; end
endcase
end
end

endmodule

