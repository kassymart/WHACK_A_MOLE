`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2023 02:38:35 PM
// Design Name: 
// Module Name: timer_clock
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

module timer_clock(
    input clk_in,
    output logic clk_out
    );
    
    logic [27:0] period_count = 0;
    
    always @(posedge clk_in)
    if (period_count != 100000000 - 1)
        begin
            period_count <= (period_count + 1);
            clk_out <= 0;
        end
    else
        begin 
            period_count <= 0;
            clk_out <= 1;
        end
    
endmodule


