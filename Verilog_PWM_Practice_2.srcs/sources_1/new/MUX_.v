`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/10 00:40:18
// Design Name: 
// Module Name: MUX_
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

module MUX_(
    input RESET,
    input CLK,
		
	input SW4_DigitalClock,
	input SW5_StopWatch,
    
  	inout[4:0] Clock_o_cnt_1,
	inout[4:0] Clock_o_cnt_2,
	inout[4:0] Clock_o_cnt_3,
	inout[4:0] Clock_o_cnt_4,
	
	inout[4:0] StopWatch_o_cnt_1,
	inout[4:0] StopWatch_o_cnt_2,
	inout[4:0] StopWatch_o_cnt_3,
	inout[4:0] StopWatch_o_cnt_4,	
	 
	output [4:0] o_cnt_1,
    output [4:0] o_cnt_2,
    output [4:0] o_cnt_3,
    output [4:0] o_cnt_4
);

assign o_cnt_1 = (!SW4_DigitalClock) ? Clock_o_cnt_1 : StopWatch_o_cnt_1;
assign o_cnt_2 = (!SW4_DigitalClock) ? Clock_o_cnt_2 : StopWatch_o_cnt_2;
assign o_cnt_3 = (!SW4_DigitalClock) ? Clock_o_cnt_3 : StopWatch_o_cnt_3;
assign o_cnt_4 = (!SW4_DigitalClock) ? Clock_o_cnt_4 : StopWatch_o_cnt_4;


endmodule
