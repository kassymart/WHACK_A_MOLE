`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2023 02:12:14 PM
// Design Name: 
// Module Name: binary_to_bcd
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


module binary_to_bcd
    (
    input [7:0] timer_input,
    input [7:0] score_input,
    output logic [3:0] ones_time,
    output logic [3:0] tens_time,
    output logic [3:0] ones_score,
    output logic [3:0] tens_score
    );

    wire [3:0] a1, a2, a3, a4, a5, a6, a7;
    wire [3:0] b1, b2, b3, b4, b5, b6, b7;
    wire [3:0] c1, c2, c3, c4, c5, c6, c7;
    wire [3:0] d1, d2, d3, d4, d5, d6, d7;
    
    // assign timer stuff
    assign b1 = {1'b0, timer_input[7:5]}; // need to fix
    assign b2 = {a1[2:0], timer_input[4]};
    assign b3 = {a2[2:0], timer_input[3]};
    assign b4 = {a3[2:0], timer_input[2]};
    assign b5 = {a4[2:0], timer_input[1]};
    assign b6 = {1'b0, a1[3], a2[3], a3[3]};
    assign b7 = {a6[2:0], a4[3]};

    // call shift_add3 module
    shift_add3 shift1 (b1, a1);
    shift_add3 shift2 (b2, a2);
    shift_add3 shift3 (b3, a3);
    shift_add3 shift4 (b4, a4);
    shift_add3 shift5 (b5, a5);
    shift_add3 shift6 (b6, a6);
    shift_add3 shift7 (b7, a7);
    
    // assign times
    assign ones_time = {a5[2:0], timer_input[0]};
    assign tens_time = {a7[2:0], a5[3]};
    
    // assign d=score stuff
    assign d1 = {1'b0, score_input[7:5]};
    assign d2 = {c1[2:0], score_input[4]};
    assign d3 = {c2[2:0], score_input[3]};
    assign d4 = {c3[2:0], score_input[2]};
    assign d5 = {c4[2:0], score_input[1]};
    assign d6 = {1'b0, c1[3], c2[3], c3[3]};
    assign d7 = {c6[2:0], c4[3]};
    
    // call shift_add3 module
    shift_add3 shift_d1 (d1, c1);
    shift_add3 shift_d2 (d2, c2);
    shift_add3 shift_d3 (d3, c3);
    shift_add3 shift_d4 (d4, c4);
    shift_add3 shift_d5 (d5, c5);
    shift_add3 shift_d6 (d6, c6);
    shift_add3 shift_d7 (d7, c7);
    
    // assign scores
    assign ones_score = {c5[2:0], score_input[0]};
    assign tens_score = {c7[2:0], c5[3]};
    
endmodule
