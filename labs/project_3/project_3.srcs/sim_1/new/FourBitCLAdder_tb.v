`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2018 01:42:35 PM
// Design Name: 
// Module Name: FourBitCLAdder_tb
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


module FourBitCLAdder_tb;
    
    reg c_in;
    reg [3:0] a;
    reg [3:0] b;
    wire [3:0] sum;
    reg [4:0] temp;
    wire c_out;
    // wire dummy_sum;
    FourBitCLAdder adder( .c_in(c_in),
                         .a(a[3:0]),
                         .b(b[3:0]),
                         .sum(sum[3:0]),
                         .c_out(c_out)
                         );
                         
    
    //always @(*) begin
    
    initial begin
        for (int kk=0; kk<2; kk=kk+1)
        begin
            for (int ii=0; ii<16; ii=ii+1)
            begin
                for (int jj=0; jj<16; jj=jj+1)
                begin
                    a = ii;
                    b = jj;
                    c_in = kk;
                    #1;
                    // dummy_sum = (a+b+c_in);
                    $display("Failed a: %d, b: %d, c_in: %d, sum: %d, c_out: %d",  a, b, c_in, sum, c_out);
                    assert (sum == (a+b+c_in)) else $fatal(1, "SUM FAILED a: %d, b: %d, c_in: %d, sum: %d, c_out: %d",  a, b, c_in, sum, c_out);
                    temp = a+b+c_in;
                    if (temp > 15) begin
                        assert (c_out == 1) else $fatal(1, "SUM FAILED a: %d, b: %d, c_in: %d, sum: %d, c_out: %d",  a, b, c_in, sum, c_out); 
                    end
                    
                    if (temp < 15) begin
                        assert (c_out == 0) else $fatal(1, "SUM FAILED a: %d, b: %d, c_in: %d, sum: %d, c_out: %d",  a, b, c_in, sum, c_out); 
                    end
                    //assert ((a+b+c_in) < 16 && c_out == 0) else $fatal(1, "SUM FAILED a: %d, b: %d, c_in: %d, sum: %d, c_out: %d",  a, b, c_in, sum, c_out);
                    // #1;
                end
            end
        end
    $display("@@@Passed");
    $finish;
    end
    
endmodule
