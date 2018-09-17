`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/16/2018 02:21:32 PM
// Design Name: 
// Module Name: alu
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


module ALU(
    input   [7:0] a, //operand
    input   [7:0] b, //operand
    input   [2:0] s, //operation Select
    output  [7:0] r, //the Result value
    output        c, //for unsigned Carry
    output        v  //for signed oVerflow
);

wire a9 = {1'h0, a};
wire b9 = {1'h0, b};
reg [8:0] r9;
reg ov;
reg co;
always @(*)
begin
    case (s)
    
        3'b000: begin 
            //Addition
            r9 = a + b;
            co = r9[8];
            ov = ~a[7]&~b[7]&r9[7] | a[7]&b[7]&~r9[7];
        end
        3'b001: begin
            // Subtraction
            r9 = a - b;
            co = r9[8];
            ov = ~a[7]&b[7]&r9[7] | a[7]&~b[7]&~r9[7];
        end
        3'b010: begin
            //Transfer
            r9 = a;
            co = r9[8];
        end
        3'b011: begin
            // Test
            r9 = (a == 0);
            co = r9[8];
        end
        3'b100: begin
            // Bitwise AND
            r9 = a&b;
            co = r9[8];
        end
        3'b101: begin
            // Bitwise OR
            r9 = a|b;
            co = r9[8];
        end
        3'b110: begin
            // Bitwise XOR
            r9 = a^b;
            co = r9[8];
        end
        3'b111: begin
            // Bitwise NOT
            r9 = ~a;
        end
    endcase
end

assign r[7:0] = r9[7:0];
assign c = co;
assign v = ov;
endmodule
