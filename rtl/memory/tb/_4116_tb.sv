/*#########################################################################
#File Name:     _4116_tb.sv
#Description:   Test bench for Behavioural representation of 16384x1 Dynamic
#               RAM.            
#
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

`timescale 1ps/1ps
module _4116_tb;
/*-------------------------- Inputs and Outputs --------------------------*/
	reg WE;
	reg RAS;
	reg CAS;
	reg [6:0] address;
	reg data_in;
	wire data_out;
	
/*--------- Initialisation File and Instantiate Device Under Test --------*/
	_4116 #(.INIT_FILE("P:/Jonathon/Code/Arcade-Kangaroo-MiSTer/roms/bin/4116.mem")) tm(.WE(WE), .RAS(RAS), .CAS(CAS), .A0(address[0]), .A1(address[1]), .A2(address[2]), .A3(address[3]), .A4(address[4]), .A5(address[5]), .A6(address[6]), .D(data_in), .Q(data_out));

/*--------------------------------- Tasks --------------------------------*/
	task early_write;
		input [13:0] addr;
		input value;

		#10 RAS = 0; address = addr[13:7];
		#10 WE = 0; 
		#10 CAS = 0; address = addr[6:0]; data_in = value; 
		#10 $display("EARLY WRITE: value = %b, Q = %b", data_in, data_out);
		
		/* Test multiple write rejection */
		#10 data_in = ~value;
		#10 $display("EARLY WRITE REJECTION: value = %b, Q = %b", data_in, data_out);
		#10 RAS = 1; CAS = 1; WE = 1;
	endtask

	task read;
		input [13:0] addr;

		#10 RAS = 0; address = addr[13:7];
		#10 WE = 1; CAS = 0; address = addr[6:0]; 
		#10 $display("READ: address = %h, Q = %b", addr, data_out);
		#10 RAS = 1; CAS = 1; WE = 1;
	endtask

	task write;
		input [13:0] addr;
		input value;

		#10 RAS = 0; address = addr[13:7];
		#10 CAS = 0; address = addr[6:0]; data_in = value; 
		#10 WE = 0; 
		#10 $display("WRITE: value = %b, Q = %b", data_in, data_out);
		
		/* Test multiple write rejection */
		#10 data_in = ~value;
		#10 $display("WRITE REJECTION: value = %b, Q = %b", data_in, data_out);
		#10 RAS = 1; CAS = 1; WE = 1;
	endtask

	task page_mode_write_cycle;
		input [13:0] addr;
		input [3:0] value;

		#10 RAS = 0; address = addr[13:7];
		#10 WE = 0;  
		#10 CAS = 0; address = addr[6:0]; data_in = value[0]; 
		#10 $display("EARLY WRITE: value = %b, Q = %b", data_in, data_out);
		#10 CAS = 1; WE = 1;
		#10 WE = 0;  
		#10 CAS = 0; address = addr[6:0] + 6'b000001;  data_in = value[1]; 
		#10 $display("EARLY WRITE: value = %b, Q = %b", data_in, data_out);
		#10 CAS = 1; WE = 1;
		#10 WE = 0; 
		#10 CAS = 0; address = addr[6:0] + 6'b000010;  data_in = value[2]; 
		#10 $display("EARLY WRITE: value = %b, Q = %b", data_in, data_out);
		#10 CAS = 1; WE = 1;
		#10 WE = 0;  
		#10 CAS = 0; address = addr[6:0] + 6'b000011; data_in = value[3]; 
		#10 $display("EARLY WRITE: value = %b, Q = %b", data_in, data_out);
		#10 RAS = 1; CAS = 1; WE = 1;
	endtask

	task page_mode_read_cycle;
		input [13:0] addr;

		#10 RAS = 0; address = addr[13:7];
		#10 WE = 1; CAS = 0; address = addr[6:0]; 
		#10 $display("READ: address = %h, Q = %b", addr,data_out);
		#10 CAS = 1; WE = 1;
		#10 WE = 1; CAS = 0; address = addr[6:0] + 6'b000001; 
		#10 $display("READ: address = %h, Q = %b", addr,data_out);
		#10 CAS = 1; WE = 1;
		#10 WE = 1; CAS = 0; address = addr[6:0] + 6'b000010;  
		#10 $display("READ: address = %h, Q = %b", addr,data_out);
		#10 CAS = 1; WE = 1;
		#10 WE = 1; CAS = 0; address = addr[6:0] + 6'b000011;  
		#10 $display("READ: address = %h, Q = %b", addr,data_out);
		#10 CAS = 1; WE = 1;
		#10 RAS = 1; CAS = 1; WE = 1;
	endtask

/*--------------------------------- Test ---------------------------------*/
	initial begin
		WE = 1; RAS = 1; CAS = 1;

		#10 early_write(14'h0000, 1'b1);
		#10 early_write(14'h0001, 1'b0);

		#10 read(14'h0000);
		#10 read(14'h0001);
		
		#10 write(14'h0000, 1'b0);
		#10 write(14'h0001, 1'b1);
		
		#10 read(14'h0000);
		#10 read(14'h0001);

		#10 page_mode_write_cycle (14'h0002, 4'b1010);
		#10 page_mode_read_cycle(14'h0002);

		#100 $stop;
	end

endmodule
