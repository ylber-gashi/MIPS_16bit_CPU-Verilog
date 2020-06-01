`timescale 1ns / 1ps

module CPU_16bit(input clk, input pc_start, output pc_next,
                 output finalresult, output rd1, output sec_value,
                 output opcode, output ALUSrc, output MemRead,
                 output MemWrite, output AdresaHyrese, output WriteData, output dataFromMem);

wire [1:0] opcode;
wire RegDst;
wire ALUSrc;
wire MemToReg;
wire RegWrite;
wire MemRead;
wire MemWrite;
wire ALUOp;
wire [15:0] finalresult;
wire [15:0] rd1;
wire [15:0] sec_value;
wire [15:0] pc_start;
wire [15:0] pc_next;


wire [15:0] AdresaHyrese;
wire [15:0] WriteData;
wire [15:0] dataFromMem;


//Control Unit
cu ControlUnit (opcode, RegDst, ALUSrc, MemToReg, RegWrite, MemRead , MemWrite, ALUOp);

//Datapath
datapath DP (RegDst, pc_start, pc_next, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, ALUOp, clk, opcode, finalresult, rd1, sec_value, AdresaHyrese, WriteData, dataFromMem);


endmodule
