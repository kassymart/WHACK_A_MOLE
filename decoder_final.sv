`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2023 02:26:38 PM
// Design Name: 
// Module Name: decoder_final
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


module decoder_final(
    input [1:0] counter_out,
    output logic [3:0] anode
    );
        always @(counter_out)
            begin
            case(counter_out)
                0: anode = 4'b1110;
                1: anode = 4'b1101;
                2: anode = 4'b1011;
                3: anode = 4'b0111;
                default: anode = 4'b0111;
            endcase
            end
endmodule
