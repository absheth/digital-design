`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2018 12:08:47 PM
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

module testbench;
        reg a, b, c;
        reg e;
        wire d0,d1,d2,d3,d4,d5,d6,d7;
        top demux0 (
            .a(a),
            .b(b),
            .c(c),
            .e(e),
            .d0(d0),
            .d1(d1),
            .d2(d2),
            .d3(d3),
            .d4(d4),
            .d5(d5),
            .d6(d6),
            .d7(d7)
        );
        initial
        begin
            //your testcode here!
            
            #10  // 100 nanosecond delay
            a = 0;
            b = 0;
            c = 0;
            e = 0;
            #10  // 100 nanosecond delay
            assert( d0 == 0) else $fatal(1, "d0 = 0 ==> failed");
            
            
            a = 0;
            b = 0;
            c = 0;
            e = 1;
            #10  // 100 nanosecond delay
            assert( d0 == 1) else $fatal(1, "d0 = 1 ==> failed");
            
            
            a = 0;
            b = 0;
            c = 1;
            e = 0;
            #10  // 100 nanosecond delay
            assert( d1 == 0) else $fatal(1, "d1 = 0 ==> failed");
                        
            
            a = 0;
            b = 0;
            c = 1;
            e = 1;
            #10  // 100 nanosecond delay
            assert( d1 == 1) else $fatal(1, "d1 = 1 ==> failed");            
           
            
            a = 0;
            b = 1;
            c = 0;
            e = 0;
            #10  // 100 nanosecond delay
            assert( d2 == 0) else $fatal(1, "d2 = 0 ==> failed");
                                    
            
            a = 0;
            b = 1;
            c = 0;
            e = 1;
            #10  // 100 nanosecond delay
            assert( d2 == 1) else $fatal(1, "d2 = 1 ==> failed");
            
            
            a = 0;
            b = 1;
            c = 1;
            e = 0;
            #10  // 100 nanosecond delay
            assert( d3 == 0) else $fatal(1, "d3 = 0 ==> failed");
                                                
            
            a = 0;
            b = 1;
            c = 1;
            e = 1;
            #10  // 100 nanosecond delay
            assert( d3 == 1) else $fatal(1, "d3 = 1 ==> failed");
            
            
            a = 1;
            b = 0;
            c = 0;
            e = 0;
            #10  // 100 nanosecond delay
            assert( d4 == 0) else $fatal(1, "d4 = 0 ==> failed");
                        
            
            a = 1;
            b = 0;
            c = 0;
            e = 1;
            #10  // 100 nanosecond delay
            assert( d4 == 1) else $fatal(1, "d4 = 1 ==> failed");
                        
            
            a = 1;
            b = 0;
            c = 1;
            e = 0;
            #10  // 100 nanosecond delay
            assert( d5 == 0) else $fatal(1, "d5 = 0 ==> failed");
                                    
            
            a = 1;
            b = 0;
            c = 1;
            e = 1;
            #10  // 100 nanosecond delay
            assert( d5 == 1) else $fatal(1, "d5 = 1 ==> failed");
            
            
            a = 1;
            b = 1;
            c = 0;
            e = 0;
            #10  // 100 nanosecond delay
            assert( d6 == 0) else $fatal(1, "d6 = 0 ==> failed");
                                                
            
            a = 1;
            b = 1;
            c = 0;
            e = 1;
            #10  // 100 nanosecond delay
            assert( d6 == 1) else $fatal(1, "d6 = 1 ==> failed");
            
            
            a = 1;
            b = 1;
            c = 1;
            e = 0;
            #10  // 100 nanosecond delay
            assert( d7 == 0) else $fatal(1, "d7 = 0 ==> failed");
                                                            
            
            a = 1;
            b = 1;
            c = 1;
            e = 1;
            #10  // 100 nanosecond delay
            assert( d7 == 1) else $fatal(1, "d7 = 1 ==> failed");
                        
            
            #10  // 100 nanosecond delay
            
            // assert( led == 0) else $fatal(1, "led==0 Failed");

            $display("@@@Passed");

            $finish;

 

        end

endmodule