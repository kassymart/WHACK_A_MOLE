`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2023 02:30:25 PM
// Design Name: 
// Module Name: mux_final
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


module mux_final(
    input [3:0] input1, input2, input3, input4,
    input [1:0] sel,
    output logic [3:0] result
    );
    
    always_comb
    begin
        case(sel)
            2'b00: result = input1;
            2'b01: result = input2;
            2'b10: result = input3;
            2'b11: result = input4;
            default: result = input1;
        endcase
    end
endmodule
