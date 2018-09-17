`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/16/2018 09:41:28 PM
// Design Name: 
// Module Name: top_tb
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


module top_tb;
reg [15:0] sw;
reg btnC;
reg enable;
wire [15:0] led;

top top_testbench(  .sw(sw[15:0]),
                    .btnC(btnC),
                    .enable(enable),
                    .led(led[15:0])
                    );

initial begin
    enable = 0;
    
    
    
end

always
    #10
    enable = !enable;
    
endmodule
