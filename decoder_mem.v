module decoder_mem( clk, reset,opcode, control_mem, pc_out, ar_out, dr_out, acc_out, ir_out);
input clk, reset;
input [2:0] opcode;
input[16:0] control_mem;
output reg [11:0] pc_out;
output reg [15:0] dr_out;
output reg [11:0] ir_out;
output reg [11:0] ar_out;
output reg [15:0] acc_out;

reg [11:0] mem [4095:0];

always @(posedge clk or posedge reset)
if (!reset)
begin 
case(control_mem)
17'b10000000000010010: begin ar_out <= pc_out; end
17'b00000100001000111: begin ir_out <= mem[ar_out]; pc_out <= pc_out+1'b1; end
17'b10000000000000101: begin ar_out <= mem[ar_out]; end
17'b00000000100010111: begin if(opcode == 3'b001) begin dr_out <= mem[ar_out]; end
							else if(opcode == 3'b010) begin dr_out <= mem[ar_out];  end
							else if(opcode == 3'b011) begin dr_out <= mem[ar_out];  end
							
							
					   end
17'b00000000000001100: begin mem[ar_out]<= acc_out; end 
17'b00001000000000001: begin ar_out<= pc_out; end
17'b01000000000001010: begin mem[ar_out] <= pc_out; ar_out<= ar_out + 1'b1; end
17'b00000000000000000: begin 
							if(opcode == 3'b001) begin  acc_out <= acc_out && dr_out; end
							else if(opcode == 3'b010) begin acc_out <= acc_out + dr_out; end
					   end
17'b00000000000000011: begin acc_out <= dr_out; end
17'b00001000000000001: begin pc_out <= ar_out; end
default: begin pc_out <= 12'b0; acc_out <= 16'b0; ar_out <= 12'b0; dr_out<=16'b0; ir_out <= 12'b0; end
endcase
end

endmodule


							

					   
