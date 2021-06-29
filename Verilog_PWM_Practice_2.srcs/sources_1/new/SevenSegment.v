`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/17 12:48:58
// Design Name: 
// Module Name: SevenSegment
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


module SevenSegment(in, seven);

input [4:0] in;
output [7:1] seven;

reg [7:1] seven;

always @(in)
begin
	case (in)
		5'b00000 : seven = 7'b1000000 ;
		5'b00001 : seven = 7'b1111001 ;
		5'b00010 : seven = 7'b0100100 ;
		5'b00011 : seven = 7'b0110000 ;
		5'b00100 : seven = 7'b0011001 ;
		5'b00101 : seven = 7'b0010010 ;
		5'b00110 : seven = 7'b0000010 ;
		5'b00111 : seven = 7'b1111000 ;
		5'b01000 : seven = 7'b0000000 ;
		5'b01001 : seven = 7'b0010000 ;
		default  : seven = 7'b1111111 ;
	endcase
end



endmodule

