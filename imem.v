`timescale 1ns/1ps
module imem(input  [5:0]  a,
            output [31:0] rd);

  reg  [31:0] RAM[63:0];

  initial
    begin
     RAM [0]= 32'h00000000;
     RAM [1]= 32'h00000000;
     RAM [2]= 32'h00000000;
     RAM [3]= 32'h00000000;
     RAM [4]= 32'h00000000;
     RAM [5]= 32'h00000000;
     RAM [6]= 32'h00000000;
     RAM [7]= 32'h00000000;
     end

  assign rd = RAM[a]; // word aligned
endmodule