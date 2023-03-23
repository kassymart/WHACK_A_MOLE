`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2023 05:24:05 PM
// Design Name: 
// Module Name: whack_a_mole
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


module whack_a_mole(
    input CLK,
    input [15:0] SWITCHES,
    input reset,
    output logic [15:0] LEDS,
    output logic [5:0] score_count
    );
    
    // shows the actual score on the SSEGs
       localparam 
        S000000 = 0,            // constants
        S000001 = 1, 
        S000010 = 2, 
        S000011 = 3,
        S000100 = 4,
        S000101 = 5,
        S000110 = 6,
        S000111 = 7,
        S001000 = 8,
        S001001 = 9,
        S001010 = 10,
        S001011 = 11,
        S001100 = 12,
        S001101 = 13,
        S001110 = 14,
        S001111 = 15,
        S010000 = 16,
        S010001 = 17,
        S010010 = 18,
        S010011 = 19,
        S010100 = 20,
        S010101 = 21,
        S010110 = 22,
        S010111 = 23,
        S011000 = 24,
        S011001 = 25,
        S011010 = 26,
        S011011 = 27,
        S011100 = 28,
        S011101 = 29,
        S011110 = 30,
        S011111 = 31,
        S100000 = 32 ;

 logic [5:0] current_state = 0; // Current score count state declared as register
 logic [5:0] next_state = 0; // Next score count state declared as register

//Reset/Restart the game
 always @(posedge CLK) 
    begin
        if (reset) 
            current_state <= S000000;
        else 
            current_state <= next_state;
    end
   
 
// Next state combinational logic

 always @(current_state, SWITCHES[15:0])
    begin
    // initial conditions declared
    next_state = 0;
    LEDS[15:0] = 0;
    score_count = 6'b000000;
    
    case(current_state)
    S000000: 
    begin 
        next_state = S000000; // was next state
        score_count = 6'b000000;       // score count = zero
        LEDS[15:0] = 0;                // leds = zero
        LEDS[1] = 1;                   // represents mole
        if (SWITCHES[1])            // if the user flips sw[1]
            next_state = S000001;  // then score count goes to 1, and next state is S0000001
        else
            next_state = S000000;
    end
    
    S000001: 
    begin                           // the score count is 1
        score_count = 6'b000001;
        LEDS[15:0] = 0;
        LEDS[11] = 1;              // led 11 is on
        if (SWITCHES[11])           // if sw11 is flipped, a mole is whacked
            next_state = S000010;  // score count goes up by 1
        else
            next_state = S000001;
    end
    
    S000010: 
    begin
        score_count = 6'b000010;       // score count is now 2
        LEDS[15:0] = 0;
        LEDS[2] = 1;               // led 2 in on
        if (SWITCHES[2])
            next_state = S000011; // goes to next state
        else
            next_state = S000010;
    end
     
    S000011: 
    begin 
        score_count = 6'b000011;
        LEDS[15:0] = 0;
        LEDS[12] = 1;
        if (SWITCHES[12])
           next_state = S000100; 
        else
            next_state = S000011;
    end
    
    S000100: 
    begin
        score_count = 6'b000100;
        LEDS[15:0] = 0;
        LEDS[7] = 1;
        if (SWITCHES[7])
            next_state = S000101; 
        else
            next_state = S000100;
    end
    
    S000101: 
    begin
        score_count = 6'b000101;
        LEDS[15:0] = 0;
        LEDS[6] = 1;
        if (SWITCHES[6])
            next_state = S000110; 
        else
            next_state = S000101;
    end
    
    //ALL GOOD THROUGH HERE
    
    S000110: 
    begin
        score_count = 6'b000110;
        LEDS[15:0] = 0;
        LEDS[9] = 1;
        if (SWITCHES[9])
            next_state = S000111; 
        else
            next_state = S000110;
    end
    
    S000111: 
    begin
        score_count = 6'b000111;
        LEDS[15:0] = 0;
        LEDS[14] = 1;
        if (SWITCHES[14])
            next_state = S001000; 
        else
            next_state = S000111;
    end
    
    S001000: 
    begin
    //
        score_count = 6'b001000;
        LEDS[15:0] = 0;
        LEDS[15] = 1;
        if (SWITCHES[15])
            next_state = S001001;
        else
            next_state = S001000;
    end
    
    S001001: 
    begin
    //8 - this one works?
        score_count = 6'b001001;
        LEDS[15:0] = 0;
        LEDS[8] = 1;
        if (SWITCHES[8])
            next_state = S001010;
        else
            next_state = S001001;
    end
    
    S001010: 
    begin
    // this one works?
        score_count = 6'b001010;
        LEDS[15:0] = 0;
        LEDS[5] = 1;
        if (SWITCHES[5])
            next_state = S001011;
        else
            next_state = S001010;
    end
    
    S001011: 
    begin
        score_count = 6'b001011;
        LEDS[15:0] = 0;
        LEDS[13] = 1;
        if (SWITCHES[13])
            next_state = S001100;
        else
            next_state = S001011;
    end
    
    S001100: 
    begin
        score_count = 6'b001100;
        LEDS[15:0] = 0;
        LEDS[4] = 1;
        if (SWITCHES[4])
            next_state = S001101;
        else
            next_state = S001100;
    end
    
    S001101: 
    begin
        score_count = 6'b001101;
        LEDS[15:0] = 0;
        LEDS[10] = 1;
        if (SWITCHES[10])
            next_state = S001110; 
        else
            next_state = S001101;
    end
    
    S001110: 
    begin
        score_count = 6'b001110;
        LEDS[15:0] = 0;
        LEDS[0] = 1;
        if (SWITCHES[0])
            next_state = S001111; 
        else
            next_state = S001110;
    end
    
    S001111: begin
        score_count = 6'b001111;
        LEDS[15:0] = 0;
        LEDS[3] = 1;
        if (SWITCHES[3])
            next_state = S010000; 
        else
            next_state = S001111;
    end
        
    S010000: begin
    //16 
        score_count = 6'b010000;
        LEDS[15:0] = 0;
        LEDS[10] = 1;
        if (SWITCHES[10] == 0)
            next_state = S010001;
        else
            next_state = S010000;
    end
    
    S010001: begin
    //17
        score_count = 6'b010001;
        LEDS[15:0] = 0;
        LEDS[7] = 1;
        if (SWITCHES[7] ==  0)
            next_state = S010010; 
        else
            next_state = S010001;
    end
    
    S010010: begin
    //18
        score_count = 6'b010010;
        LEDS[15:0] = 0;
        LEDS[11] = 1;
        if (SWITCHES[11] ==  0)
            next_state = S010011; 
        else
            next_state = S010010;
    end
    
    S010011: begin
    //19
        score_count = 6'b010011;
        LEDS[15:0] = 0;
        LEDS[15] = 1;
        if (SWITCHES[15] ==  0)
            next_state = S010100; 
        else
            next_state = S010011;
    end
    
    S010100: begin
    //20
        score_count = 6'b010100;
        LEDS[15:0] = 0;
        LEDS[0] = 1;
        if (SWITCHES[0] ==  0)
            next_state = S010101; 
        else
            next_state = S010100;
    end
    
    S010101: begin
    //21
        score_count = 6'b010101;
        LEDS[15:0] = 0;
        LEDS[9] = 1;
        if (SWITCHES[9] ==  0)
            next_state = S010110; 
        else
            next_state = S010101;
    end
    
    S010110: begin
    //22
        score_count = 6'b010110;
        LEDS[15:0] = 0;
        LEDS[13] = 1;
        if (SWITCHES[13] ==  0)
            next_state = S010111; 
        else
            next_state = S010110;
    end
    
    S010111: begin
    //23
        score_count = 6'b010111;
        LEDS[15:0] = 0;
        LEDS[14] = 1;
        if (SWITCHES[14] ==  0)
            next_state = S011000; 
        else
            next_state = S010111;
    end
    
    S011000: begin
    //24
        score_count = 6'b011000;
        LEDS[15:0] = 0;
        LEDS[2] = 1;
        if (SWITCHES[2] ==  0)
            next_state = S011001; //go on to next state
        else
            next_state = S011000;
    end
    
    S011001: begin
    //25
        score_count = 6'b011001;
        LEDS[15:0] = 0;
        LEDS[4] = 1;
        if (SWITCHES[4] ==  0)
            next_state = S011010; 
        else
            next_state = S011001;
    end
    
    S011010: begin
    //26
        score_count = 6'b011010;
        LEDS[15:0] = 0;
        LEDS[8] = 1;
        if (SWITCHES[8] ==  0)
            next_state = S011011; 
        else
            next_state = S011010;
    end
    
    S011011: begin
    //27
        score_count = 6'b011011;
        LEDS[15:0] = 0;
        LEDS[1] = 1;
        if (SWITCHES[1] ==  0)
            next_state = S011100;
        else
            next_state = S011011;
    end
    
    S011100: begin
    //28
        score_count = 6'b011100;
        LEDS[15:0] = 0;
        LEDS[5] = 1;
        if (SWITCHES[5] ==  0)
            next_state = S011101; //go on to next state
        else
            next_state = S011100;
    end
    
    S011101: begin
    //29
        score_count = 6'b011101;
        LEDS[15:0] = 0;
        LEDS[6] = 1;
        if (SWITCHES[6] ==  0)
            next_state = S011110; 
        else
            next_state = S011101;
    end
    
    S011110: begin
        score_count = 6'b011110;
        LEDS[15:0] = 0;
        LEDS[12] = 1;
        if (SWITCHES[12] ==  0)
            next_state = S011111; //go on to next state
        else
            next_state = S011110;
    end
    
    S011111: begin
    // 31 is not working
        score_count = 6'b011111;
        LEDS[15:0] = 0;
        LEDS[3] = 1;
        if (SWITCHES[3] == 0)
            next_state = S100000; 
        else
            next_state = S011111;           //score count should remain 31
    end
    S100000: begin
        next_state = S100000;
        score_count = 6'b100000;
        LEDS[15:0] = 0;
    end
    
    default: next_state = S000000;
    
    endcase
end
 
endmodule
