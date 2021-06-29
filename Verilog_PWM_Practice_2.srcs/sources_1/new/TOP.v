`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/15 20:33:17
// Design Name: 
// Module Name: TOP
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


module TOP(
    input TOP_RESET,
    input TOP_CLK,
    
    input SW1_Start,
    input SW2_Stop,
    input SW3_Reset,

	input SW4_DigitalClock,
	input SW5_StopWatch,
    
    inout [4:0] o_cnt_1,
    inout [4:0] o_cnt_2,
    inout [4:0] o_cnt_3,
    inout [4:0] o_cnt_4,

	inout [4:0] Clock_o_cnt_1,
	inout [4:0] Clock_o_cnt_2,
	inout [4:0] Clock_o_cnt_3,
	inout [4:0] Clock_o_cnt_4,
	
	inout [4:0] StopWatch_o_cnt_1,
	inout [4:0] StopWatch_o_cnt_2,
	inout [4:0] StopWatch_o_cnt_3,
	inout [4:0] StopWatch_o_cnt_4,	

    
    
    output[7:1] Seven_1,
    output[7:1] Seven_2,
    output[7:1] Seven_3,
    output[7:1] Seven_4
);

MUX_ ins_MUX(
	.CLK(TOP_CLK),
	.RESET(TOP_RESET),
	
	.SW4_DigitalClock(SW4_DigitalClock),
	.SW5_StopWatch(SW5_StopWatch),
	
	.Clock_o_cnt_1(Clock_o_cnt_1),
	.Clock_o_cnt_2(Clock_o_cnt_2),
	.Clock_o_cnt_3(Clock_o_cnt_3),
	.Clock_o_cnt_4(Clock_o_cnt_4),
	
	.StopWatch_o_cnt_1(StopWatch_o_cnt_1),
	.StopWatch_o_cnt_2(StopWatch_o_cnt_2),
	.StopWatch_o_cnt_3(StopWatch_o_cnt_3),
	.StopWatch_o_cnt_4(StopWatch_o_cnt_4),
	
	.o_cnt_1(o_cnt_1),
	.o_cnt_2(o_cnt_2),
	.o_cnt_3(o_cnt_3),
	.o_cnt_4(o_cnt_4)
);


PWM u0(
    .RESET(TOP_RESET), 
    .CLK(TOP_CLK),
     
    .o_cnt_1(Clock_o_cnt_1),
    .o_cnt_2(Clock_o_cnt_2), 
    .o_cnt_3(Clock_o_cnt_3),
    .o_cnt_4(Clock_o_cnt_4)    
);


StopWatch u1(
    .RESET(TOP_RESET), 
    .CLK(TOP_CLK),
    
    .SW1_Start(SW1_Start),
    .SW2_Stop(SW2_Stop),
    .SW3_Reset(SW3_Reset),     
    
    .o_cnt_1(StopWatch_o_cnt_1),
    .o_cnt_2(StopWatch_o_cnt_2), 
    .o_cnt_3(StopWatch_o_cnt_3),
    .o_cnt_4(StopWatch_o_cnt_4)    
);


SevenSegment ins_SevenSegment(
	.in(o_cnt_1),
	.seven(Seven_1)
);

SevenSegment ins2_SevenSegment(
	.in(o_cnt_2),
	.seven(Seven_2)
);

SevenSegment ins3_SevenSegment(
	.in(o_cnt_3),
	.seven(Seven_3)
);

SevenSegment ins4_SevenSegment(
	.in(o_cnt_4),
	.seven(Seven_4)
);

    
endmodule



