`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2023 04:54:28 PM
// Design Name: 
// Module Name: shift_add3
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


module shift_add3(
    input [3:0] in,
    output logic [3:0] out // changed from input
    );
    
    always @(in)
    case(in)
            4'b0000: out <= 4'b0000;    // 0
            4'b0001: out <= 4'b0001;    // 1
            4'b0010: out <= 4'b0010;    // 2
            4'b0011: out <= 4'b0011;    // 3
            4'b0100: out <= 4'b0100;    // 4
            // shifting begins
            4'b0101: out <= 4'b1000;    // 5
            4'b0110: out <= 4'b1001;    // 6
            4'b0111: out <= 4'b1010;    // 7
            4'b1000: out <= 4'b1011;    // 8
            4'b1001: out <= 4'b1100;    // 9
            default: out <= 4'b0000;
    endcase
    
    
endmodule
