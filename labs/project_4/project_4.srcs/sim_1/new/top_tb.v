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
reg [7:0] Q, Qbar;

top top_testbench(  .sw(sw[15:0]),
    .btnC(btnC),
    .enable(enable),
    .led(led[15:0])
);

always
    #5 enable = !enable;

initial begin

    if(enable) begin


    end


end


always
    #7 Q[7:0] = sw[7:0];

endmodule
