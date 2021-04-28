/*#########################################################################
#File Name:     _2114_tb.sv
#Description:   Test bench for Behavioural representation of 1024 x 4 
#               Static RAM.             
#
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

`timescale 1ps/1ps
module _2114_tb;
/*-------------------------- Inputs and Outputs --------------------------*/
	reg WE;
	reg CS;
	reg [9:0] address;
	reg [3:0] data_in;
	wire [3:0] data;

/*-------------------------- Bidirectional Port --------------------------*/
	/* 	Not Selected (Driven): CS high, WE don't care
	// 	Read (Driver): CS low, WE high
	// 	Write (Driven): CS low, WE low
	*/
	assign data = (!CS && !WE) ? data_in : 4'bzzzz; 

/*--------- Initialisation File and Instantiate Device Under Test --------*/
	_2114 #(.INIT_FILE("P:/Jonathon/Code/Arcade-Kangaroo-MiSTer/roms/bin/2114.mem")) tm (.WE(WE), .CS(CS), .A0(address[0]), .A1(address[1]), .A2(address[2]), .A3(address[3]), .A4(address[4]), .A5(address[5]), .A6(address[6]), .A7(address[7]), .A8(address[8]), .A9(address[9]), .D0(data[0]), .D1(data[1]), .D2(data[2]), .D3(data[3]));

/*--------------------------------- Tasks --------------------------------*/	
	task read; /* Read when CS low, WE high */
		input [9:0] addr;

		#10 address = addr;
		#10 CS = 0; WE = 1; /* Read RAM */
		#10 $display("READ: address = %h, data = %b", addr, data);
		#10 CS = 1; WE = 1; /* Deselect RAM */
	endtask
	
	task write; /* Write when CS low, WE low */
		input [9:0] addr;
		input [3:0] value;

		#10 address = addr; data_in = value; 
		#10 WE = 0; CS = 0; /* Write RAM */
		#10 $display("WRITE: address = %b, input value = %b, output data = %b", address, value, data);
		#10 WE = 1; CS = 1; /* Deselect RAM */
	endtask

/*--------------------------------- Test ---------------------------------*/
	initial begin
		/* Reset state, RAM not selected */
		WE = 1; CS = 1; data_in = 4'b0000;

		/* Check if initialized to zero */
		#10 read(10'h000);
		#10 read(10'h001);
		#10 read(10'h002);
		#10 read(10'h003);
		#10 read(10'h004);
		#10 read(10'h005);
		#10 read(10'h006);
		#10 read(10'h007);

		/* Write data to RAM */
		#10 write(10'h000, 4'hD);
		#10 write(10'h001, 4'hE);
		#10 write(10'h002, 4'hA);
		#10 write(10'h003, 4'hD);
		#10 write(10'h004, 4'hB);
		#10 write(10'h005, 4'hE);
		#10 write(10'h006, 4'hE);
		#10 write(10'h007, 4'hF);

		/* Read back data to see if write was successful */
		#10 read(10'h000);
		#10 read(10'h001);
		#10 read(10'h002);
		#10 read(10'h003);
		#10 read(10'h004);
		#10 read(10'h005);
		#10 read(10'h006);
		#10 read(10'h007);

		/* Check high-impedance */
		#10 CS = 1; WE = 0;
		#10 CS = 1; WE = 1;
	
		/* Stop Simulation */
		#10 $stop;
	end

endmodule