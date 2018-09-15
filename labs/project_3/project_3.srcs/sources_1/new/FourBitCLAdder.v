`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2018 12:21:43 PM
// Design Name: 
// Module Name: FourBitCLAdder
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


module FourBitCLAdder(
    input               c_in,
    input   [3:0]       a,
    input   [3:0]       b,
    output  [3:0]       sum,
    output              c_out

);

    wire [3:0] gen;
    wire [3:0] prop;
    wire [3:0] carry;
    
    assign gen[3:0]= {(a[3]&b[3]), (a[2]&b[2]), (a[1]&b[1]), (a[0]&b[0])};
    assign prop[3:0]= {(a[3]^b[3]), (a[2]^b[2]), (a[1]^b[1]), (a[0]^b[0])};
    
    assign carry[3:0]={((gen[3])|(gen[2]&prop[3])|(gen[1]&prop[2]&prop[3])|(gen[0]&prop[1]&prop[2]&prop[3])|(c_in&prop[0]&prop[1]&prop[2]&prop[3])),
                       ((gen[2])|(gen[1]&prop[2])|(gen[0]&prop[1]&prop[2])|(c_in&prop[0]&prop[1]&prop[2])),
                       ((gen[1])|(gen[0]&prop[1])|(c_in&prop[0]&prop[1])),
                       ((gen[0])|(prop[0]&c_in))
                       };
    assign sum[3:0]={(a[3]^b[3]^carry[2]),
                     (a[2]^b[2]^carry[1]),
                     (a[1]^b[1]^carry[0]),
                     (a[0]^b[0]^c_in)};
    //assign sum[4] = carry[3];
    assign c_out = carry[3];
endmodule
