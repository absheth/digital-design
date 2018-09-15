`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/25/2018 12:07:57 PM
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


module top_tb();
        reg a, b;
        wire myand, myor, mynot;

        top top0 (
            .a(a),
            .b(b),
            .myAND(myand),
            .myOR(myor),
            .myNOT(mynot)
         );



        initial

        begin

            #100 // a 100 nanosecond delay

            a = 0;
            b = 0;
            
            #100 // a 100 nanosecond delay
            
            assert (myand == 0) else $fatal(1, "myAND Failed");
            assert (myor == 0) else $fatal(1, "myOR Failed");
            assert (mynot == 1) else $fatal(1, "myNOT Failed");

            a = 0;
            b = 1;

            #100 // a 100 nanosecond delay

            assert (myand == 0) else $fatal(1, "myAND Failed");
            assert (myor == 1) else $fatal(1, "myOR Failed");
            assert (mynot == 0) else $fatal(1, "myNOT Failed");

            a = 1;
            b = 0;
            
            #100 // a 100 nanosecond delay
            
            assert (myand == 0) else $fatal(1, "myAND Failed");
            assert (myor == 1) else $fatal(1, "myOR Failed");
            assert (mynot == 1) else $fatal(1, "myNOT Failed");
            
            #100 // a 100 nanosecond delay
            a = 1;
            b = 1;
            
            #100 // a 100 nanosecond delay
            
            assert (myand == 1) else $fatal(1, "myAND Failed");
            assert (myor == 1) else $fatal(1, "myOR Failed");
            assert (mynot == 0) else $fatal(1, "myNOT Failed");
            
            #100 // a 100 nanosecond delay
            $display("@@@Passed");
            
            $finish;
            
            
            
       end  
endmodule
