module eightbit_reg(clk,reset,in,out);
  input clk,reset;
  input [7:0]in;
  output reg [7:0]out;
  always @(posedge clk or posedge reset)
    begin
      if(reset)
        out<=1'b0;
      else
        out<=in;
    end
endmodule