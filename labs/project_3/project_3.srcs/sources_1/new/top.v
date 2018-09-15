`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2018 01:26:52 PM
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
    input           c_in,
    input   [7:0]   a,
    input   [7:0]   b,
    output  [7:0]   sum,
    output          c_out
);
    wire [3:0] lower_bit_sum;
    wire [3:0] upper_bit_sum;
    wire ripple_carry;
    wire carry_out;
    FourBitCLAdder lower_bits_addr( .c_in(c_in),
                                    .a(a[3:0]),
                                    .b(b[3:0]),
                                    .sum(lower_bit_sum[3:0]),
                                    .c_out(ripple_carry)
                                    );
    FourBitCLAdder upper_bits_addr( .c_in(ripple_carry),
                                    .a(a[7:4]),
                                    .b(b[7:4]),
                                    .sum(upper_bit_sum[3:0]),
                                    .c_out(carry_out)
                                    );
    assign sum[7:0] = {upper_bit_sum[3:0], lower_bit_sum[3:0]};
    //assign sum[8] = carry_out;
    assign c_out = carry_out;
endmodule
