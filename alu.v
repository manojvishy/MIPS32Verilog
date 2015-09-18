`timescale 1ns/1ps
//`define DEBUG
module alu(input      [31:0] a, b,
           input      [2:0]  alucont,
           output reg [31:0] result
           );

  wire [31:0] b2, sum, slt;

`ifdef DEBUG
  initial begin
    $dumpvars(0, a, b, alucont, result);
  end
`endif
  assign b2 = alucont[2] ? ~b : b;
  assign sum = a + b2 + alucont[2];
  assign slt = sum[31];

  always @(*) begin
    case(alucont[1:0])
      2'b00: result = a & b;
      2'b01: result = a | b;
      2'b10: result = sum;
      2'b11: result = slt;
    endcase
  end
endmodule





































































































































