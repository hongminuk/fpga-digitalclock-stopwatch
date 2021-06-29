`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/15 20:46:48
// Design Name: 
// Module Name: TB_PWM
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


module TB_PWM( );
    
reg TB_CLK;
reg TB_RESET;
reg SW1;
reg SW2;
reg SW3;
reg SW4;

wire o_cnt_1,o_cnt_2, o_cnt_3, o_cnt_4;
wire Seven_1, Seven_2, Seven_3, Seven_4;
    
initial
begin
    TB_CLK = 0;
    TB_RESET = 0;
    #(10);
    TB_RESET = 1;
    SW1 = 0;
    SW2 = 1;
    SW3 = 1;
    
    SW4 = 1;

    #(100);

end
    
    
always
begin
    #10 TB_CLK <= ~TB_CLK;
end

TOP PWMPWM( TB_RESET, TB_CLK, SW1, SW2, SW3, SW4, SW5, Clock_o_cnt_1, Clock_o_cnt_2, Clock_o_cnt_3, 
Clock_o_cnt_4, Stop_o_cnt_1, Stop_o_cnt_2, Stop_o_cnt_3, Stop_o_cnt_4, o_cnt_1, o_cnt_2, o_cnt_3, o_cnt_4, Seven_1, Seven_2, Seven_3, Seven_4 ); 

      
endmodule
