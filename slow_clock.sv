`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2023 02:50:25 PM
// Design Name: 
// Module Name: slow_clock
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

module slow_clock(
    input clk_in,
    output logic clk_out
    );
    
    logic [20:0] period_count = 0;
    
    always @(posedge clk_in)
        if (period_count != 500000 - 1)
            begin
                period_count <= period_count + 1;
                clk_out <= 0;
                end
        else
            begin
                period_count <= 0;
                clk_out <= 1;
            end
                           
        
endmodule
