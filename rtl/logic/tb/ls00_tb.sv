/*#########################################################################
#File Name:     ls00_tb.sv
#Description:   SN74LS00N - Quadruple 2-Input Positive-NAND Gates test bench.
#               
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

`timescale 1ps / 1ps
module ls00_tb;
/*-------------------------- Inputs and Outputs --------------------------*/
	reg    _1A, _1B, _2A, _2B, _3A, _3B, _4A, _4B; 
	wire   _1Y, _2Y, _3Y, _4Y; 

/*--------------------- Instantiate Device Under Test --------------------*/
	ls00 DUT( 
		._1A(_1A),
		._1B(_1B),
		._1Y(_1Y),
		._2A(_2A),
		._2B(_2B),
		._2Y(_2Y),
		._3A(_3A),
		._3B(_3B),
		._3Y(_3Y),
		._4A(_4A),
		._4B(_4B),
		._4Y(_4Y)
	);	

/*--------------------------------- Test ---------------------------------*/
	initial begin
		_1A = 1'b0; _1B = 1'b0; _2A = 1'b0; _2B = 1'b0; _3A = 1'b0; _3B = 1'b0; _4A = 1'b0; _4B = 1'b0;
		#0 $display("_1A = %b, _1B = %b, _1Y = %b", _1A, _1B, _1Y);
		#0 $display("_2A = %b, _2B = %b, _1Y = %b", _2A, _2B, _2Y);
		#0 $display("_3A = %b, _3B = %b, _1Y = %b", _3A, _3B, _3Y);
		#0 $display("_4A = %b, _4B = %b, _1Y = %b", _4A, _4B, _4Y);

		#10 _1A = 1'b0; _1B = 1'b1; _2A = 1'b0; _2B = 1'b1; _3A = 1'b0; _3B = 1'b1; _4A = 1'b0; _4B = 1'b1;
		#0 $display("_1A = %b, _1B = %b, _1Y = %b", _1A, _1B, _1Y);
		#0 $display("_2A = %b, _2B = %b, _1Y = %b", _2A, _2B, _2Y);
		#0 $display("_3A = %b, _3B = %b, _1Y = %b", _3A, _3B, _3Y);
		#0 $display("_4A = %b, _4B = %b, _1Y = %b", _4A, _4B, _4Y);

		#10 _1A = 1'b1; _1B = 1'b0; _2A = 1'b1; _2B = 1'b0; _3A = 1'b1; _3B = 1'b0; _4A = 1'b1; _4B = 1'b0;
		#0 $display("_1A = %b, _1B = %b, _1Y = %b", _1A, _1B, _1Y);
		#0 $display("_2A = %b, _2B = %b, _1Y = %b", _2A, _2B, _2Y);
		#0 $display("_3A = %b, _3B = %b, _1Y = %b", _3A, _3B, _3Y);
		#0 $display("_4A = %b, _4B = %b, _1Y = %b", _4A, _4B, _4Y);

		#10 _1A = 1'b1; _1B = 1'b1; _2A = 1'b1; _2B = 1'b1; _3A = 1'b1; _3B = 1'b1; _4A = 1'b1; _4B = 1'b1;
		#0 $display("_1A = %b, _1B = %b, _1Y = %b", _1A, _1B, _1Y);
		#0 $display("_2A = %b, _2B = %b, _1Y = %b", _2A, _2B, _2Y);
		#0 $display("_3A = %b, _3B = %b, _1Y = %b", _3A, _3B, _3Y);
		#0 $display("_4A = %b, _4B = %b, _1Y = %b", _4A, _4B, _4Y);

		#10 $stop;
	end
	
endmodule
