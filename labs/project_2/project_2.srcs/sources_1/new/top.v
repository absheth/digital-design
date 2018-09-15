`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2018 11:52:21 AM
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
        input a, b, c,
        input e,
        output d0, d1, d2, d3, d4, d5, d6, d7
    );
    
    wire d00, d11, d22, d33, d44, d55, d66, d77;
    decoder decoder_instance(
            .a(a),
            .b(b),
            .c(c),
            .d0(d00), 
            .d1(d11),
            .d2(d22),
            .d3(d33),
            .d4(d44),
            .d5(d55),
            .d6(d66),
            .d7(d77)
            );
    
    assign d0 = e&d00;
    assign d1 = e&d11;
    assign d2 = e&d22;
    assign d3 = e&d33;
    assign d4 = e&d44;
    assign d5 = e&d55;
    assign d6 = e&d66;
    assign d7 = e&d77;
     
endmodule
