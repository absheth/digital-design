`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2018 11:44:01 AM
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


module alu(
    input   [7:0] a, //operand
    input   [7:0] b, //operand
    input   [2:0] s, //operation Select
    output  [7:0] r, //the Result value
    output        c, //for unsigned Carry
    output   v  //for signed oVerflow
);

wire [9:0] a9 = {1'h0, a};
wire [9:0] b9 = {1'h0, b};
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
            r9 = a9 - b9;
            //if (a < b) begin 
            //    co = 1;
            //end
            co = r9[8];
            
            //if (b9>a9) begin
            //    co = 1;
            //end
            ov = ~a[7]&b[7]&r9[7] | a[7]&~b[7]&~r9[7];
        end
        3'b010: begin
            //Transfer
            r9 = a;
            co = 0;
        end
        3'b011: begin
            // Test
            r9 = (a == 0);
            co = 0;
        end
        3'b100: begin
            // Bitwise AND
            r9 = a&b;
            co = 0;
        end
        3'b101: begin
            // Bitwise OR
            r9 = a|b;
            co = 0;
        end
        3'b110: begin
            // Bitwise XOR
            r9 = a^b;
            co = 0;
        end
        3'b111: begin
            // Bitwise NOT
            r9 = ~a9;
            co = 0;
        end
    endcase
end

assign r[7:0] = r9[7:0];
assign c = co;
assign v = ov;
endmodule
