`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2018 02:06:22 PM
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
    reg c_in;
    reg [7:0]a;
    reg [7:0]b;
    wire [7:0]sum;
    wire c_out;
    reg [8:0] temp;
    
    top eight_bit_adder( .c_in(c_in),
                         .a(a[7:0]),
                         .b(b[7:0]),
                         .sum(sum[7:0]),
                         .c_out(c_out)
                         );
    initial begin
    //$monitor("%d, %d",sum,c_out);
        for (int kk=0; kk<2; kk=kk+1)
        begin
            for (int ii=0; ii<256; ii=ii+1)
            begin
                for (int jj=0; jj<256; jj=jj+1)
                begin
                    a = ii;
                    b = jj;
                    c_in = kk;
                    
                    #1;
                    
                    assert (sum == (a + b + c_in)) else $fatal(1, "SUM FAILED a: %d, b: %d, c_in: %d, sum: %d, c_out: %d",  a, b, c_in, sum, c_out);
                    temp = a+b+c_in;
                     
                     
                    if (temp > 255) begin
                        assert (c_out == 1) else $fatal(1, "SUM FAILED a: %d, b: %d, c_in: %d, sum: %d, c_out: %d",  a, b, c_in, sum, c_out); 
                    end
                                        
                    if (temp < 256) begin
                        assert (c_out == 0) else $fatal(1, "SUM FAILED a: %d, b: %d, c_in: %d, sum: %d, c_out: %d",  a, b, c_in, sum, c_out); 
                    end
                    // assert ((temp) < 256 && c_out == 0) else $fatal(1, "SUM FAILED a: %d, b: %d, c_in: %d, sum: %d, c_out: %d",  a, b, c_in, sum, c_out);
                    //assert ((temp) > 255 && c_out == 1) else begin
                    //    $display("Failed a: %d, b: %d, c_in: %d, sum: %d, c_out: %d, x: %d",  a, b, c_in, sum, c_out, (a+b+c_in));  
                    //    $fatal(1, "SUM FAILED a: %d, b: %d, c_in: %d, sum: %d, c_out: %d",  a, b, c_in, sum, c_out);
                    //end
                end
            end
        end
                                 
    $display("@@@Passed");
    $finish;
    end
    
    
endmodule
