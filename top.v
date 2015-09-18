//------------------------------------------------
// toppipelined.v
// Top level system including MIPS pipelined
// processor and external data and instruction
// memories
//------------------------------------------------

`timescale 1ns/1ps
`define DEBUG
module top(input         clk, reset,
           output [31:0] writedata, dataadr,
           output        memwrite);

  wire [31:0] pc, instr, readdata;

`ifdef DEBUG
  initial begin
    $dumpvars(0, clk, reset, writedata, dataadr, memwrite, pc, instr, readdata);
  end
`endif
  // instantiate processor and memories
  mips mips(clk, reset, pc, instr, memwrite, dataadr, writedata, readdata);
  imem imem(pc[7:2], instr);
  dmem dmem(clk, memwrite, dataadr, writedata, readdata);

endmodule

module dmem(input         clk, we,
            input  [31:0] a, wd,
            output [31:0] rd);

  reg  [31:0] RAM[63:0];

  assign rd = RAM[a[31:2]]; // word aligned

  always @(posedge clk) begin
    if (we)
      RAM[a[31:2]] <= wd;
  end
endmodule

