`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/15 20:33:17
// Design Name: 
// Module Name: PWM
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

module PWM(
	input CLK,		//In
	input RESET,

	inout[4:0] Clock_o_cnt_1,
	inout[4:0] Clock_o_cnt_2,
	inout[4:0] Clock_o_cnt_3,
	inout[4:0] Clock_o_cnt_4,
	
	output[4:0] o_cnt_1,
	output[4:0] o_cnt_2,
	output[4:0] o_cnt_3,
	output[4:0] o_cnt_4
);


reg[30:0] cnt; //2^26, 64000000 > 50M // Real

reg[4:0] cnt_1; //2^4, 16
reg cnt_1_c;	//Carry of cnt_1

reg[4:0] cnt_2;
reg cnt_2_c;	//Carry of cnt_2

reg[4:0] cnt_3;
reg cnt_3_c;	//Carry of cnt_3

reg[4:0] cnt_4;
reg cnt_4_c;	//Carry of cnt_3

reg CLK_1s;

assign o_cnt_1 = cnt_1;
assign o_cnt_2 = cnt_2;
assign o_cnt_3 = cnt_3;
assign o_cnt_4 = cnt_4;

//1s Counter.
always @(posedge CLK or negedge RESET)
begin
	if(RESET==1'b0) begin
		cnt <= 0;
	end else begin 
		//if ( cnt == 50000000 ) begin											
		if( cnt == 100 ) begin     //for simulation
			cnt <= 0;
		end else begin
			cnt <= cnt + 1;
		end
	end
end
	
	
//assign CLK_1s = (cnt < 24999999 ) ? 1 : 0;		
always @(posedge CLK)
begin
	//if( cnt < 24999999 ) begin 
	if( cnt < 50 ) begin           //for simulation
		CLK_1s <= 1;
	end else begin
		CLK_1s <= 0;
	end
end

/////////////////////////////////////////////////////s-1
always @(posedge CLK_1s or negedge RESET)
begin
    if( RESET == 1'b0) begin
        cnt_1 <= 0;
        cnt_1_c <= 0;
    end else begin
			if ( cnt_1 == 9 ) begin
				cnt_1 <= 0;
				cnt_1_c <= 1;
			end else begin
				cnt_1 <= cnt_1 + 1;
				cnt_1_c <= 0;
			end
	 end
end
////////////////////////////////////////////////////////

/////////////////////////////////////////////////////s-2
always @(posedge cnt_1_c or negedge RESET)
begin
    if( RESET == 1'b0) begin
        cnt_2 <= 0;
        cnt_2_c <= 0;
    end else if ( cnt_2 == 5 ) begin
        cnt_2 <= 0;
        cnt_2_c <= 1;
    end else begin
        cnt_2 <= cnt_2 + 1;
        cnt_2_c <= 0;
    end
end
/////////////////////////////////////////////////////////

/////////////////////////////////////////////////////s-3
always @(posedge cnt_2_c or negedge RESET)
begin
    if( RESET == 1'b0) begin
        cnt_3 <= 0;
        cnt_3_c <= 0;
    end else if ( cnt_3 == 9 ) begin
        cnt_3 <= 0;
        cnt_3_c <= 1;
    end else begin
        cnt_3 <= cnt_3 + 1;
        cnt_3_c <= 0;
    end
end
////////////////////////////////////////////////////////

/////////////////////////////////////////////////////s-4
always @(posedge cnt_3_c or negedge RESET)
begin
    if( RESET == 1'b0) begin
        cnt_4 <= 0;
        cnt_4_c <= 0;
    end else if ( cnt_4 == 5 ) begin
        cnt_4 <= 0;
        cnt_4_c <= 1;
    end else begin
        cnt_4 <= cnt_4 + 1;
        cnt_4_c <= 0;
    end
end
////////////////////////////////////////////////////////

endmodule
