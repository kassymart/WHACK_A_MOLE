`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2023 02:18:12 PM
// Design Name: 
// Module Name: bcd_seven_seg
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

// USED SOFIA'S FROM 133

module bcd_seven_seg(
    input [3:0] BCD,
    output logic [6:0] seg
    );
    
    always_comb
        begin
        case(BCD)
            0: seg=7'b0000001;
            1: seg=7'b1001111;
            2: seg=7'b0010010;
            3: seg=7'b0000110;
            4: seg=7'b1001100;
            5: seg=7'b0100100;
            6: seg=7'b0100000;
            7: seg=7'b0001111;
            // changing values below
            8: seg = 7'b0000000;           
//            9: seg = 7'b0010000;        //issue with 9 display 
            9: seg = 7'b0001100;  
            10: seg = 7'b0001000;
        11: seg=7'b1100000;
        12: seg=7'b0110001;
        13: seg=7'b1000010;
        14: seg=7'b0110000;
        15: seg=7'b0111000;
        default: seg=7'b1111111;  
            endcase 
        end     
endmodule
