`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/16/2018 08:02:04 PM
// Design Name: 
// Module Name: top
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



module top(
    input    [15:0] sw,  //operands a,b,s
    input           btnC, // middle button
    input           enable, // middle button  // CHANGE
    output   [15:0] led //results c,v
);
// wire enable, D;

reg [7:0] Q, Qbar;

wire [7:0] result;
wire co, ov;
//D Flip Flop
always @(posedge enable)
begin
    if (btnC) begin    // Check by replacing btnC with enable
        Q <= sw[7:0];
        Qbar <= ~sw[7:0];
    end
end


ALU alu(.a(Q[7:0]),
        .b(sw[7:0]),
        .s(sw[10:8]),
        .r(result[7:0]),
        .c(co),
        .v(ov)
        );

assign led[7:0] = result[7:0];
assign led[8] = co;
assign led[9] = ov;
assign led[10] = 0;
assign led[11] = 0;
assign led[12] = 0;
assign led[13] = 0;
assign led[14] = 0;
assign led[15] = 0;


endmodule
