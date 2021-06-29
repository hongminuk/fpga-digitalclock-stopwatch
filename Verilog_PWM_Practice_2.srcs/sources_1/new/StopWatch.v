`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/04 23:31:45
// Design Name: 
// Module Name: StopWatch
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


module StopWatch(
    input RESET,
    input CLK,
    
    input SW1_Start,
    input SW2_Stop,
    input SW3_Reset,
    
    //output clk_1s,
    output [4:0] o_cnt_1,
    output [4:0] o_cnt_2,
    output [4:0] o_cnt_3,
    output [4:0] o_cnt_4
);

reg[1:0] State_Reg;
reg Stop_bit;
        //continue == 0
        //stop == 1
parameter Idle = 2'b00;
parameter Start = 2'b01;
parameter Stop = 2'b10;
parameter Reset = 2'b11;

reg [30:0] cnt;
reg CLK_1s;

reg[4:0] cnt_1;
reg cnt_1_c;

reg[4:0] cnt_2;
reg cnt_2_c;

reg[4:0] cnt_3;
reg cnt_3_c;

reg[4:0] cnt_4;
reg cnt_4_c;

reg Reset_bit;

assign o_cnt_1 = cnt_1;
assign o_cnt_2 = cnt_2;
assign o_cnt_3 = cnt_3;
assign o_cnt_4 = cnt_4;

always @(posedge CLK or negedge RESET)
begin
    if(!RESET) State_Reg <= Idle;
    else
        case (State_Reg)
        Idle: //0
            //Start button => Start
            if(!SW1_Start)  State_Reg <= Start;
        Start: //1
            //stop button => stop
            //reset button => reset
            if(!SW2_Stop)  State_Reg <= Stop;
            else if(!SW3_Reset) State_Reg <= Reset;
        Stop: //2
            //reset button => reset
            if(!SW3_Reset) State_Reg <= Reset;
        Reset: //3
            //Idle
            State_Reg <= Idle;
        default:
            State_Reg <= Idle;
        endcase
end

//Verilog, 303page ~ 
//////////////////////SW Check Status//////////////////////
//Defult == IDEL Status
//1 SW1_Start == 0 => Start Status
//2 SW2_Stop == 0 => STOP Status
//3 SW3_Reset == 0 => Reset Status
always @(posedge CLK or negedge RESET)
begin
    if(!RESET) begin//initial ..
        Stop_bit <= 1;
        Reset_bit <= 1;
    end
    else
        if( State_Reg == 3 ) begin  //o_cnt_x value initial
            //cnt_1 <= 0;
            //cnt_2 <= 0;
            //cnt_3 <= 0;
            //cnt_4 <= 0;
            Reset_bit <= 0;
        end
        else if( State_Reg == 2 )
            Stop_bit <= 1;
            //stop_cnt() 
        else if( State_Reg == 1 )
            //continue_cnt()
            Stop_bit <= 0;
end


///////////////////////0.1 Counter///////
always @(posedge CLK or negedge RESET)
begin
	if(RESET==1'b0) 
		cnt <= 0;
    else begin 
		//if ( cnt == 500000 ) begin          //500000											
		if( cnt == 10 ) begin                  //for simulation
			cnt <= 0;
		end else begin
			cnt <= cnt + 1;
		end
	end
end

always @(posedge CLK)
begin
	//if( cnt < 249999 ) begin               //249999
	if( cnt < 5 ) begin                      //for simulation
		CLK_1s <= 1;
	end else begin
		CLK_1s <= 0;
	end
end

/////////////////////////////////////////

//State_Reg

/////////////////////////////o_cnt counter
always @(posedge CLK_1s or negedge RESET)
begin
    if( RESET == 1'b0) begin    //Same with if(!RESET) 
        cnt_1 <= 0;
        cnt_1_c <= 0;
    end 
    else if( State_Reg == Start) begin      //Not used Stop_Bit yet, ( Check Point )
		if ( cnt_1 == 9 ) begin
			cnt_1 <= 0;
			cnt_1_c <= 1;
		end else begin
			cnt_1 <= cnt_1 + 1;
			cnt_1_c <= 0;
		end
	end
end

/////////////////////////////////////////

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










