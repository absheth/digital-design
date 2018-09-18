`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2018 11:45:40 AM
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
    // input           enable, // middle button  // CHANGE
    output   [15:0] led //results c,v
);
// wire enable, D;

reg [7:0] Q;
// reg [7:0] Qbar;

wire [7:0] result;
wire signed co, ov;

//D FLIP FLOP
always @(posedge btnC)
begin
    if (btnC) begin    // Check by replacing btnC with enable
        // temp <= btnC;
        Q[7:0] <= sw[7:0];
        // Qbar <= ~sw;
        // sw[7:0] <= 0;
    end 
end

alu alu_sub_module(.a(Q[7:0]),
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
