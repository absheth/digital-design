`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2018 11:47:16 AM
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
reg [15:0] sw;
reg btnC;
// reg enable;
wire signed [15:0] led;
reg [7:0] Q, Qbar;
reg [7:0] a, b;
reg [2:0] sel;

top top_testbench(.sw(sw[15:0]),
    .btnC(btnC),
    .led(led[15:0])
);

initial begin
    
end
initial begin
    /*a = 4;
    b = 7;
    sel = 0;
    sw[7:0] = a;
    #1;
    // sw[10:8] = 3;
    btnC = 1;
    #5;
    sw[7:0] = b;
    #1;
    sw[10:8] = sel;
    #1;
    btnC = 0;
    #5;
    assert (led[7:0] == (a+b)) else $fatal(1, "a: %d, b: %d, sel: %d,  led: %d", a, b, sel, led[7:0]);*/
    
    // a=  0, b=  1, s=001: r=255, v=0 c=x
    a = 0;
    b = 2;
    sel = 1;
    sw[7:0] = a;
    #1;
    btnC = 1;
    #5;
    sw[7:0] = b;
    #1;
    sw[10:8] = sel;
    #1;
    btnC = 0;
    #5;
    $display("a: %d, b: %d, sel: %d,  led: %d, co: %d, ov: %d, A-B: %d", a, b, sel, led[7:0], led[8], led[9], a-b);
    assert (led[7:0] == (a-b)) else $fatal(1, "a: %d, b: %d, sel: %d,  led: %d", a, b, sel, led[7:0]);

    /*a = 7;
    b = 4;
    sel = 2;
    sw[7:0] = a;
    #1;
    btnC = 1;
    #5;
    sw[7:0] = b;
    #1;
    sw[10:8] = sel;
    #1;
    btnC = 0;
    #5;
    assert (led[7:0] == a) else $fatal(1, "a: %d, b: %d, sel: %d,  led: %d", a, b, sel, led[7:0]);


    a = 0;
    b = 4;
    sel = 3;
    sw[7:0] = a;
    #1;
    btnC = 1;
    #5;
    sw[7:0] = b;
    #1;
    sw[10:8] = sel;
    #1;
    btnC = 0;
    #5;
    assert (led[7:0] == 1) else $fatal(1, "a: %d, b: %d, sel: %d,  led: %d", a, b, sel, led[7:0]);


    a = 4;
    b = 7;
    sel = 4;
    sw[7:0] = a;
    #1;
    btnC = 1;
    #5;
    sw[7:0] = b;
    #1;
    sw[10:8] = sel;
    #1;
    btnC = 0;
    #5;
    assert (led[7:0] == (a&b)) else $fatal(1, "a: %d, b: %d, sel: %d,  led: %d", a, b, sel, led[7:0]);

    a = 4;
    b = 7;
    sel = 5;
    sw[7:0] = a;
    #1;
    btnC = 1;
    #5;
    sw[7:0] = b;
    #1;
    sw[10:8] = sel;
    #1;
    btnC = 0;
    #5;
    assert (led[7:0] == (a|b)) else $fatal(1, "a: %d, b: %d, sel: %d,  led: %d", a, b, sel, led[7:0]);


    a = 4;
    b = 7;
    sel = 6;
    sw[7:0] = a;
    #1;
    btnC = 1;
    #5;
    sw[7:0] = b;
    #1;
    sw[10:8] = sel;
    #1;
    btnC = 0;
    #5;
    assert (led[7:0] == (a^b)) else $fatal(1, "a: %d, b: %d, sel: %d,  led: %d", a, b, sel, led[7:0]);
    
    a = 4;
    b = 7;
    sel = 7;
    sw[7:0] = a;
    #1;
    btnC = 1;
    #5;
    sw[7:0] = b;
    #1;
    sw[10:8] = sel;
    #1;
    btnC = 0;
    #5;
    assert (led[7:0] == (~a)) else $fatal(1, "a: %d, b: %d, sel: %d,  led: %d, ~a: %d", a, b, sel, led[7:0], ~a);
*/
$display("@@@Passed");
$finish;
end




endmodule
