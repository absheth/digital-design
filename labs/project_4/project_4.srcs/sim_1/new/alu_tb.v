`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/16/2018 05:43:52 PM
// Design Name: 
// Module Name: alu_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu_tb;

reg [7:0] a;
reg [7:0] b;
reg [2:0] s;
wire [7:0] r;
wire c;
wire v;

ALU alu (.a(a),
         .b(b),
         .s(s),
         .r(r),
         .c(c),
         .v(v)
         );
initial begin
    a = 53;
    b = 91;
    s = 0;
    
    #1
    
    $display("a: %d, b: %d, s: %d, r: %d, c: %d, v: %d",  a, b, s, r, c, v);
    
end

endmodule
