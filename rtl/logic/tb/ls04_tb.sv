/*#########################################################################
#File Name:     ls04_tb.sv
#Description:   SN74LS04N - HEX Inverter, 6 NOT gates test bench.
#                            
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

`timescale 1ps / 1ps
module ls04_tb; 
/*-------------------------- Inputs and Outputs --------------------------*/
	reg    _1A, _2A, _3A, _4A, _5A, _6A;
 	wire   _1Y, _2Y, _3Y, _4Y, _5Y, _6Y;
		
/*--------------------- Instantiate Device Under Test --------------------*/
	ls04 DUT( 
		._1A(_1A),
		._1Y(_1Y),
		._2A(_2A),
		._2Y(_2Y),
		._3A(_3A),
		._3Y(_3Y),
		._4A(_4A),
		._4Y(_4Y),
		._5A(_5A),
		._5Y(_5Y),
		._6A(_6A),
		._6Y(_6Y)
	);	

/*--------------------------------- Test ---------------------------------*/
	initial begin
		_1A = 1'b0; _2A = 1'b0; _3A = 1'b0; _4A = 1'b0; _5A = 1'b0; _6A = 1'b0;
		#0 $display("_1A = %b, _1Y = %b", _1A, _1Y);
		#0 $display("_2A = %b, _2Y = %b", _2A, _2Y);
		#0 $display("_3A = %b, _3Y = %b", _3A, _3Y);
		#0 $display("_4A = %b, _4Y = %b", _4A, _4Y);
		#0 $display("_5A = %b, _5Y = %b", _5A, _5Y);
		#0 $display("_6A = %b, _6Y = %b", _6A, _6Y);

		#10 _1A = 1'b1; _2A = 1'b1; _3A = 1'b1; _4A = 1'b1; _5A = 1'b1; _6A = 1'b1;
		#0 $display("_1A = %b, _1Y = %b", _1A, _1Y);
		#0 $display("_2A = %b, _2Y = %b", _2A, _2Y);
		#0 $display("_3A = %b, _3Y = %b", _3A, _3Y);
		#0 $display("_4A = %b, _4Y = %b", _4A, _4Y);
		#0 $display("_5A = %b, _5Y = %b", _5A, _5Y);
		#0 $display("_6A = %b, _6Y = %b", _6A, _6Y);

		#10 $stop;
	end
	
endmodule