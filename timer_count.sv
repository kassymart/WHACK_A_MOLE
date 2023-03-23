`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2023 04:34:44 PM
// Design Name: 
// Module Name: count
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

module timer_count(
    input clk,
    input reset,
    output [7:0] count // changed from [4:0]
    );
    
    wire clk_out;
    timer_clock TIMECLOCKMOD(clk, clk_out); // call the other module timer
    
    logic [7:0] current_count = 20; // changed from [4:0]
    always @(posedge clk_out) 
        begin
            if(reset)
                current_count <= 20;            // for the 20 second timer
            // if zero
            else if (current_count == 0)        // if current_count has just started
                current_count <= current_count; // keep current_count as itself
            // if greater than 1
            else if(current_count >= 1)         // greater than or equal to 1
                current_count <= current_count - 1;    // ???
            // anything else
            else 
                current_count <= current_count;
            
        end
    
    // now assign count
    assign count = current_count;
    
endmodule
