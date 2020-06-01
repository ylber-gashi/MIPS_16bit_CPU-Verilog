`timescale 1ns / 1ps

module CPU_16bit_tb ();

reg clk;
wire [15:0] finalresult;
wire [15:0] rd1;
wire [15:0] sec_value;
wire [1:0] opcode;
wire ALUSrc;
wire MemWrite;
wire MemRead;

wire [15:0] AdresaHyrese;
wire [15:0] WriteData;
wire [15:0] dataFromMem;
 
reg [15:0] pc_start;
wire [15:0] pc_next;

initial
$monitor ("clk=%b, finalresult = %d, rd1 = %d, sec_value = %d, opcode=%b, ALUSrc=%b, MemRead=%b, MemWrite=%b, AdresaHyrese=%d, WriteData=%d, dataFromMem=%d",
 clk, finalresult, rd1, sec_value, opcode, ALUSrc, MemRead, MemWrite, AdresaHyrese, WriteData, dataFromMem);

initial
begin
    #0 clk=0;
    #0 clk=1; pc_start = 16'd9;
    #10 clk=0; 
    #10 clk=1;pc_start = pc_next;
    #10 clk=0;
    #10 clk=1;pc_start = pc_next;
    #10 clk=0;
    #10 clk=1;pc_start = pc_next;
    #10 clk=0;
    #10 clk=1;pc_start = pc_next;
    #10 clk=0;
    #10 clk=1;pc_start = pc_next;
    #10 clk=0;
    #10 $stop;
end

CPU_16bit CPU_tb(clk, pc_start, pc_next, finalresult, rd1, sec_value, opcode, ALUSrc, MemRead, MemWrite, AdresaHyrese, WriteData, dataFromMem);


endmodule