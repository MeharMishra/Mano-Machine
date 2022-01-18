
module top(clk, reset, control_reg, control_mem, opcode, ar_in, ir_in, pc_in, acc_in, dr_in, tr_in, mem_in, ar_out, ir_out, pc_out, acc_out, dr_out, tr_out, mem_out);
input clk, reset;
input [20:0]control_reg;
input [16:0]control_mem;
input e_in;
input [11:0] ar_in, ir_in, pc_in;
input [15:0] acc_in, dr_in, tr_in, mem_in;
output reg[11:0] ar_out, ir_out, pc_out;
output reg[15:0] acc_out, dr_out, tr_out, mem_out;
output reg [15:0] bus_mux;
output reg e_out;


acc_reg AC(acc_in, clk, control_reg[18], control_reg[19], control_reg[17],acc_out);

mem_unit M( mem_in, mem_out, control_mem[3], control_mem[4], clk, reset, ar_out);

add_reg AR( ar_in, clk, control_mem[16], reset, control_mem[15], ar_out);

program_counter PC( pr_in, clk, control_mem[12], reset, control_mem[11], pr_out);

temp_reg TR( tr_in, clk, control_mem[10], reset, control_mem[9],tr_out);

bus_mux BM (mem_out, ar_out, pc_out, dr_out, acc_out, ir_out, tr_out, control_reg[2:0], busmux);

data_reg DR( dr_in, clk, control_mem[8], reset, control_mem[7],dr_out);

instr_reg IR ( ir_out, clk, reset, ir_in, control_mem[6]);

control_unit_reg CUR( clk, reset,ir_out, control_reg);

e_reg ER(clk,reset,e_in,e_out);

decoder_reg DECR( clk, reset, control_reg, ir_out, acc_out, e_out);

control_unit_mem CUM ( clk, reset, control_mem, ir_out[2:0]);

decoder_mem DECM( clk, reset, ir_out[2:0], control_mem, pc_out, ar_out, dr_out, acc_out, ir_out);

endmodule