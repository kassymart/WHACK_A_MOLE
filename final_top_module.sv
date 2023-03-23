`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2023 05:54:47 PM
// Design Name: 
// Module Name: final_top_module
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


module final_top_module(
    input CLK,
    input [15:0] SWITCHES,
    input BTNC,
    output [15:0] LEDS,
    output [3:0] ANODES,
    output [6:0] CATHODES
    );
    
    wire clk_out;
    wire timer_out;
    wire [3:0] mux_out;
    wire [1:0] counter_out;
    wire [3:0] ones_time;           // for the mux
    wire [3:0] tens_time;           // for the mux
    wire [3:0] score_ones;          // for the mux
    wire [3:0] score_tens;          // for the mux
    wire [5:0] score;               // score count previous
    wire [7:0] timer_count;         // changed from [4:0]???
    
    binary_to_bcd BINARYTOBCD(timer_count, score, ones_time, tens_time, score_ones, score_tens);
    
    mux_final MUX(score_ones, score_tens, ones_time, tens_time, counter_out, mux_out);
    
    slow_clock SLOWCLK(CLK, clk_out);
    
    two_bit_counter TWOBITCOUNTER(clk_out, counter_out);
    
    decoder_final DECODER_FINAL(counter_out, ANODES);
    
    bcd_seven_seg BCDTO7SEG(mux_out, CATHODES);
    
    timer_clock TIMERCLK(CLK, timer_out);
    
    timer_count TIMERCOUNT(CLK, BTNC, timer_count);
    
    whack_a_mole WHACK(CLK, SWITCHES, BTNC, LEDS, score);
    
endmodule
