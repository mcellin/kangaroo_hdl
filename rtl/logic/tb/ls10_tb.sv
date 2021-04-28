/*#########################################################################
#File Name:     ls10_tb.sv
#Description:   SN74LS10N - Triple 3-Input Positive-NAND Gates test bench.
#               
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

`timescale 1ps / 1ps
module ls10_tb; 
/*-------------------------- Inputs and Outputs --------------------------*/
	reg    _1A, _1B, _1C, _2A, _2B, _2C, _3A, _3B, _3C;
 	wire   _1Y, _2Y, _3Y;

/*--------------------- Instantiate Device Under Test --------------------*/
	ls10 DUT( 
		._1A(_1A),
		._1B(_1B),
		._1C(_1C),
		._1Y(_1Y),
		._2A(_2A),
		._2B(_2B),
		._2C(_2C),
		._2Y(_2Y),
		._3A(_3A),
		._3B(_3B),
		._3C(_3C),
		._3Y(_3Y)
	);	

/*--------------------------------- Test ---------------------------------*/
	initial begin
		_1A = 1'b0; _1B= 1'b0; _1C = 1'b0; _2A= 1'b0; _2B = 1'b0; _2C= 1'b0; _3A = 1'b0; _3B= 1'b0; _3C= 1'b0;
		#0 $display("_1A = %b, _1B = %b, _1C = %b, _1Y = %b", _1A, _1B, _1C, _1Y);
		#0 $display("_2A = %b, _2B = %b, _2C = %b, _2Y = %b", _2A, _2B, _2C, _2Y);
		#0 $display("_3A = %b, _3B = %b, _3C = %b, _3Y = %b", _3A, _3B, _3C, _3Y);

		#10 _1A = 1'b0; _1B= 1'b0; _1C = 1'b1; _2A= 1'b0; _2B = 1'b0; _2C= 1'b1; _3A = 1'b0; _3B= 1'b0; _3C= 1'b1;
		#0 $display("_1A = %b, _1B = %b, _1C = %b, _1Y = %b", _1A, _1B, _1C, _1Y);
		#0 $display("_2A = %b, _2B = %b, _2C = %b, _2Y = %b", _2A, _2B, _2C, _2Y);
		#0 $display("_3A = %b, _3B = %b, _3C = %b, _3Y = %b", _3A, _3B, _3C, _3Y);

		#10 _1A = 1'b0; _1B= 1'b1; _1C = 1'b0; _2A= 1'b0; _2B = 1'b1; _2C= 1'b0; _3A = 1'b0; _3B= 1'b1; _3C= 1'b0;
		#0 $display("_1A = %b, _1B = %b, _1C = %b, _1Y = %b", _1A, _1B, _1C, _1Y);
		#0 $display("_2A = %b, _2B = %b, _2C = %b, _2Y = %b", _2A, _2B, _2C, _2Y);
		#0 $display("_3A = %b, _3B = %b, _3C = %b, _3Y = %b", _3A, _3B, _3C, _3Y);

		#10 _1A = 1'b0; _1B= 1'b1; _1C = 1'b1; _2A= 1'b0; _2B = 1'b1; _2C= 1'b1; _3A = 1'b0; _3B= 1'b1; _3C= 1'b1;
		#0 $display("_1A = %b, _1B = %b, _1C = %b, _1Y = %b", _1A, _1B, _1C, _1Y);
		#0 $display("_2A = %b, _2B = %b, _2C = %b, _2Y = %b", _2A, _2B, _2C, _2Y);
		#0 $display("_3A = %b, _3B = %b, _3C = %b, _3Y = %b", _3A, _3B, _3C, _3Y);
		
		#10 _1A = 1'b1; _1B= 1'b0; _1C = 1'b0; _2A= 1'b1; _2B = 1'b0; _2C= 1'b0; _3A = 1'b1; _3B= 1'b0; _3C= 1'b0;
		#0 $display("_1A = %b, _1B = %b, _1C = %b, _1Y = %b", _1A, _1B, _1C, _1Y);
		#0 $display("_2A = %b, _2B = %b, _2C = %b, _2Y = %b", _2A, _2B, _2C, _2Y);
		#0 $display("_3A = %b, _3B = %b, _3C = %b, _3Y = %b", _3A, _3B, _3C, _3Y);

		#10 _1A = 1'b1; _1B= 1'b0; _1C = 1'b1; _2A= 1'b1; _2B = 1'b0; _2C= 1'b1; _3A = 1'b1; _3B= 1'b0; _3C= 1'b1;
		#0 $display("_1A = %b, _1B = %b, _1C = %b, _1Y = %b", _1A, _1B, _1C, _1Y);
		#0 $display("_2A = %b, _2B = %b, _2C = %b, _2Y = %b", _2A, _2B, _2C, _2Y);
		#0 $display("_3A = %b, _3B = %b, _3C = %b, _3Y = %b", _3A, _3B, _3C, _3Y);

		#10 _1A = 1'b1; _1B= 1'b1; _1C = 1'b0; _2A= 1'b1; _2B = 1'b1; _2C= 1'b0; _3A = 1'b1; _3B= 1'b1; _3C= 1'b0;
		#0 $display("_1A = %b, _1B = %b, _1C = %b, _1Y = %b", _1A, _1B, _1C, _1Y);
		#0 $display("_2A = %b, _2B = %b, _2C = %b, _2Y = %b", _2A, _2B, _2C, _2Y);
		#0 $display("_3A = %b, _3B = %b, _3C = %b, _3Y = %b", _3A, _3B, _3C, _3Y);

		#10 _1A = 1'b1; _1B= 1'b1; _1C = 1'b1; _2A= 1'b1; _2B = 1'b1; _2C= 1'b1; _3A = 1'b1; _3B= 1'b1; _3C= 1'b1;
		#0 $display("_1A = %b, _1B = %b, _1C = %b, _1Y = %b", _1A, _1B, _1C, _1Y);
		#0 $display("_2A = %b, _2B = %b, _2C = %b, _2Y = %b", _2A, _2B, _2C, _2Y);
		#0 $display("_3A = %b, _3B = %b, _3C = %b, _3Y = %b", _3A, _3B, _3C, _3Y);

		#10 $stop;
	end
	
endmodule