
`timescale 1ns/1ps
module aludec(input      [5:0] funct,
              input      [1:0] aluop,
              output reg [2:0] alucontrol);

  always @(*)
    case(aluop)
      2'b00: alucontrol = 3'b010;  // add
      2'b01: alucontrol = 3'b110;  // sub
      default: case(funct)         // RTYPE
     //     6'b000000: // sll - shift left logical
//          6'b000010: // srl - shift right logical
//          6'b000011: // sra - shift right arithmetic
//          6'b000100: // sllv
//          6'b000110: // srlv
//          6'b000111: // srav
//          6'b001000: // jr
//          6'b001001: // jalr
//          6'b001100: // syscall
//          6'b001101: // break
          6'b100000: alucontrol = 3'b010; // ADD
         // 6'b100001: // ADDU
          6'b100010: alucontrol = 3'b110; // SUB
          //6'b100011: // SUBU
          6'b100100: alucontrol = 3'b000; // AND
          6'b100101: alucontrol = 3'b001; // OR
          //6'b100110: // XOR
          6'b101010: alucontrol = 3'b111; // SLT
          //6'b101011: // SLTU
          default:   alucontrol = 3'bxxx; // ???
        endcase
    endcase
endmodule
