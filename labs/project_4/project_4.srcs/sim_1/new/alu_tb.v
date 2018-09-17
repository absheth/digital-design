`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/16/2018 05:43:52 PM
// Design Name: 
// Module Name: alu_tb
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


module alu_tb;

reg signed [7:0] a;
reg signed [7:0] b;
reg [2:0] s;
wire [7:0] r;
wire c;
wire v;
reg [8:0] temp;

ALU alu (.a(a),
         .b(b),
         .s(s),
         .r(r),
         .c(c),
         .v(v)
         );
initial begin
    //a = 254;
    //b = 200;
    /* // Add
    a = 53;
    b = 211;
    s = 0;
    */
    
    // a = 53; b = -45; s = 0; 
    // a = 53; b = 45; s = 1;
    // a = 100; b = 99; s = 2;
    // a = 7; b = 8; s = 3;
    // a = 7; b = 8; s = 4;
    // a = 7; b = 8; s = 5;
    // a = 8; b = 8; s = 6;
    // a = 7; b = 8; s = 7;
    for (int sel=0; sel<8; sel=sel+1) begin
        for (int i=0; i<=255; i=i+1) begin
            for (int j=0; j<=255; j=j+1) begin
                a = i;
                b = j;
                s = sel;
                #1;
                
                // $display("a: %d, b: %d, s: %d, r: %d, c: %d, v: %d",  a, b, s, r, c, v);
                
                if(s == 0) begin 
                    assert (r == (a+b)) else $fatal(1, "SUM FAILED ==> s: %d, a: %d, b: %d, r: %d, c: %d, v: %d", s, a, b, r, c, v);
                    temp = a+b;
                    if (temp > 255) begin
                        assert (c == 1) else $fatal(1, "SUM COUT > 255 FAILED ==> s: %d, a: %d, b: %d, r: %d, c: %d, v: %d", s, a, b, r, c, v);
                    end
                                            
                    if (temp < 256) begin
                        assert (c == 0) else $fatal(1, "SUM COUT < 255  FAILED ==> s: %d, a: %d, b: %d, r: %d, c: %d, v: %d", s, a, b, r, c, v);
                    end
                    if (~a[7]&~b[7]&r[7] | a[7]&b[7]&~r[7]) begin
                        assert (v == 1) else $fatal(1, "SUM OVERFLOW FAILED ==> s: %d, a: %d, b: %d, r: %d, c: %d, v: %d", s, a, b, r, c, v);
                    end
                end
                if(s == 1) begin
                    assert (r == (a-b)) else $fatal(1, "SUBTRACT FAILED ==> s: %d, a: %d, b: %d, r: %d, c: %d, v: %d", s, a, b, r, c, v);
                    temp = a-b;
                    if (temp < 0) begin
                        assert (c == 1) else $fatal(1, "SUBTRACT COUT < 0 FAILED ==> s: %d, a: %d, b: %d, r: %d, c: %d, v: %d", s, a, b, r, c, v);
                    end
                                            
                    if (temp >= 0) begin
                        assert (c == 0) else $fatal(1, "SUBTRACT COUT > 0 FAILED ==> a: %d, b: %d, s: %d, r: %d, c: %d, v: %d",  a, b, s, r, c, v);
                    end
                    if (~a[7]&b[7]&r[7] | a[7]&~b[7]&~r[7]) begin
                        assert (v == 1) else $fatal(1, "SUBTRACT OVERFLOW FAILED ==> a: %d, b: %d, s: %d, r: %d, c: %d, v: %d",  a, b, s, r, c, v);
                    end
                
                end
                if(!(s == 0 || s == 1)) begin
                    assert (c == 0) else $fatal(1, "COUT == 0 FOR ALL EXCEPT SEL 0 and 1 FAILED ==> s: %d, r: %d, c: %d, v: %d", s, r, c, v);
                end
                
                if(s == 2) begin
                    assert (r == a) else $fatal(1, "r==a FAILED ==> s: %d, a: %d, r: %d", s, a, r);
                end
                if(s == 3) begin
                    if (a==0) begin
                        assert (r == 1) else $fatal(1, "a==0 test FAILED ==> s: %d, a: %d, r: %d", s, a, r);
                    end
                end
                if(s == 4) begin
                    temp = a&b;
                    assert (r == temp) else $fatal(1, "BITWISE AND FAILED ==> a: %d, b: %d, s: %d, r: %d, c: %d, v: %d",  a, b, s, r, c, v);
                end
                if(s == 5) begin
                    temp = a|b;
                    assert (r == temp) else $fatal(1, "BITWISE OR FAILED ==> a: %d, b: %d, s: %d, r: %d, c: %d, v: %d",  a, b, s, r, c, v);
                end
                if(s == 6) begin
                    temp = a^b;
                    assert (r == temp) else $fatal(1, "BITWISE XOR FAILED ==> a: %d, b: %d, s: %d, r: %d, c: %d, v: %d",  a, b, s, r, c, v);
                end
                if(s == 7) begin
                    temp = ~a;
                    assert (r == temp) else $fatal(1, "BITWISE NOT FAILED ==> a: %d, b: %d, s: %d, r: %d, c: %d, v: %d",  a, b, s, r, c, v);
                end

            end
        end
    end
    #1
    
    $display("a: %d, b: %d, s: %d, r: %d, c: %d, v: %d",  a, b, s, r, c, v);
    
end

endmodule
