/*#########################################################################
#File Name:     ls139_tb.sv
#Description:   SN74LS138 - Dual 2-Line to 4-Line Decoders/Multiplexers test
#               bench.         
#
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

`timescale 1ps / 1ps
module ls139_tb; 
/*-------------------------- Inputs and Outputs --------------------------*/
	reg    _1G, _1A, _1B, _2G, _2A, _2B;
 	wire   _1Y0, _1Y1, _1Y2, _1Y3, _2Y0, _2Y1, _2Y2, _2Y3;
	
/*--------------------- Instantiate Device Under Test --------------------*/
	ls139 DUT( 
		._1G(_1G),
		._1A(_1A),
		._1B(_1B),
		._1Y0(_1Y0),
		._1Y1(_1Y1),		
		._1Y2(_1Y2),
		._1Y3(_1Y3),
		._2G(_2G),
		._2A(_2A),
		._2B(_2B),
		._2Y0(_2Y0),
		._2Y1(_2Y1),		
		._2Y2(_2Y2),
		._2Y3(_2Y3)
	);
		
/*--------------------------------- Test ---------------------------------*/
	initial begin
		// Enable output and test 2-to-4 demultiplexing
		_1G = 1'b0; _1B = 1'b0; _1A = 1'b0; _2G = 1'b0; _2B = 1'b0; _2A = 1'b0;
		#0 $display("_1G = %b, _1B = %b, _1A = %b, _2G = %b, _2B = %b, _2A = %b", _1G, _1B, _1A, _2G, _2B, _2A);
		#0 $display("_1Y0 = %b, _1Y1 = %b, _1Y2 = %b, _1Y3 = %b", _1Y0, _1Y1, _1Y2, _1Y3);
		#0 $display("_2Y0 = %b, _2Y1 = %b, _2Y2 = %b, _2Y3 = %b", _2Y0, _2Y1, _2Y2, _2Y3);

		#10 _1B = 1'b0; _1A = 1'b1; _2B = 1'b0; _2A = 1'b1;
		#0 $display("_1G = %b, _1B = %b, _1A = %b, _2G = %b, _2B = %b, _2A = %b", _1G, _1B, _1A, _2G, _2B, _2A);
		#0 $display("_1Y0 = %b, _1Y1 = %b, _1Y2 = %b, _1Y3 = %b", _1Y0, _1Y1, _1Y2, _1Y3);
		#0 $display("_2Y0 = %b, _2Y1 = %b, _2Y2 = %b, _2Y3 = %b", _2Y0, _2Y1, _2Y2, _2Y3);

		#10 _1B = 1'b1; _1A = 1'b0; _2B = 1'b1; _2A = 1'b0;
		#0 $display("_1G = %b, _1B = %b, _1A = %b, _2G = %b, _2B = %b, _2A = %b", _1G, _1B, _1A, _2G, _2B, _2A);
		#0 $display("_1Y0 = %b, _1Y1 = %b, _1Y2 = %b, _1Y3 = %b", _1Y0, _1Y1, _1Y2, _1Y3);
		#0 $display("_2Y0 = %b, _2Y1 = %b, _2Y2 = %b, _2Y3 = %b", _2Y0, _2Y1, _2Y2, _2Y3);

		#10 _1B = 1'b1; _1A = 1'b1; _2B = 1'b1; _2A = 1'b1;
		#0 $display("_1G = %b, _1B = %b, _1A = %b, _2G = %b, _2B = %b, _2A = %b", _1G, _1B, _1A, _2G, _2B, _2A);
		#0 $display("_1Y0 = %b, _1Y1 = %b, _1Y2 = %b, _1Y3 = %b", _1Y0, _1Y1, _1Y2, _1Y3);
		#0 $display("_2Y0 = %b, _2Y1 = %b, _2Y2 = %b, _2Y3 = %b", _2Y0, _2Y1, _2Y2, _2Y3);

		// Disable output and check all outputs are high
		#10 _1G= 1'b1; _2G = 1'b1;
		#0 $display("_1G = %b, _1B = %b, _1A = %b, _2G = %b, _2B = %b, _2A = %b", _1G, _1B, _1A, _2G, _2B, _2A);
		#0 $display("_1Y0 = %b, _1Y1 = %b, _1Y2 = %b, _1Y3 = %b", _1Y0, _1Y1, _1Y2, _1Y3);
		#0 $display("_2Y0 = %b, _2Y1 = %b, _2Y2 = %b, _2Y3 = %b", _2Y0, _2Y1, _2Y2, _2Y3);

		#10 $stop;
	end
	
endmodule