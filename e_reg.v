module e_reg(clk,reset,in,out);
  input clk,reset,in;
  output reg out;
  always @(posedge clk or posedge reset)
    begin
      if(reset)
        out<=1'b0;
      else
        out<=in;
    end
endmodule