/*#########################################################################
#File Name:     _2732_tb.sv
#Description:   Test bench for Behavioural representation of 32 Kbit UV EPROM.
#                            
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

`timescale 1ps/1ps
module _2732_tb;
/*-------------------------- Inputs and Outputs --------------------------*/
	reg E;
	reg G;
	reg [11:0] address;
	wire [7:0] data;

/*--------- Initialisation File and Instantiate Device Under Test --------*/
	_2732 #(.INIT_FILE("P:/Jonathon/Code/modelsim/rom/tvg_75.0.mem")) tm (.E(E), .G(G), .A0(address[0]), .A1(address[1]), .A2(address[2]), .A3(address[3]), .A4(address[4]), .A5(address[5]), .A6(address[6]), .A7(address[7]), .A8(address[8]), .A9(address[9]), .A10(address[10]), .A11(address[11]), .Q0(data[0]), .Q1(data[1]), .Q2(data[2]), .Q3(data[3]), .Q4(data[4]), .Q5(data[5]), .Q6(data[6]), .Q7(data[7]));

/*--------------------------------- Tasks --------------------------------*/
	task read;
		input [9:0] addr;

		#10 address = addr;
		#10 G = 0; E = 0;
		#10 $display("READ: address = %h, data = %b", addr, data);
		#10 G = 1; E = 1;
	endtask

/*--------------------------------- Test ---------------------------------*/
	initial begin
		E = 1; G = 1;

		#10 read(12'h000);
		#10 read(12'h001);
		#10 read(12'h002);
		#10 read(12'h003);
		#10 read(12'h004);
		#10 read(12'h005);
		#10 read(12'h006);
		#10 read(12'h007);
		#10 read(12'h008);
		#10 read(12'h009);
		
		#100 $stop;
	end

endmodule
