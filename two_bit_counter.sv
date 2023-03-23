`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2023 02:15:41 PM
// Design Name: 
// Module Name: two_bit_counter
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

// LOOKS GOOD!

module two_bit_counter(
    input clk,
    output [1:0] value
    );
    
    logic [1:0] temp = 0;
    always @(posedge clk)
        begin
            temp = temp + 1;
        end
     assign value = temp;
endmodule
