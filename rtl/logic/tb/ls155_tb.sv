/*#########################################################################
#File Name:     ls155_tb.sv
#Description:   SN74LS155 - Dual 2-Line to 4-Line Decoders/Multiplexers test
#               bench.           
#
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

`timescale 1ps / 1ps
module ls155_tb; 
/*-------------------------- Inputs and Outputs --------------------------*/
	reg    _A, _B, _1C, _1G, _2C, _2G;
 	wire   _1Y0, _1Y1, _1Y2, _1Y3, _2Y0, _2Y1, _2Y2, _2Y3;
	
/*--------------------- Instantiate Device Under Test --------------------*/
	ls155 DUT( 
		._A(_A),
		._B(_B),
		._1C(_1C),
		._1G(_1G),
		._2C(_2C),
		._2G(_2G),
		._1Y0(_1Y0),
		._1Y1(_1Y1),		
		._1Y2(_1Y2),
		._1Y3(_1Y3),
		._2Y0(_2Y0),
		._2Y1(_2Y1),		
		._2Y2(_2Y2),
		._2Y3(_2Y3)
	);

/*--------------------------------- Test ---------------------------------*/
	initial begin
		/* Enable output and test 2-to-4 demultiplexing */
		_B = 1'b0; _A = 1'b0; _1C = 1'b0; _1G = 1'b0; _2C = 1'b0; _2G = 1'b0;
		#0 $display("_B = %b, _A = %b, _1C = %b, _1G = %b, _2C = %b, _2G = %b", _B, _A, _1C, _1G, _2C, _2G);
		#0 $display("_1Y0 = %b, _1Y1 = %b, _1Y2 = %b, _1Y3 = %b", _1Y0, _1Y1, _1Y2, _1Y3);
		#0 $display("_2Y0 = %b, _2Y1 = %b, _2Y2 = %b, _2Y3 = %b", _2Y0, _2Y1, _2Y2, _2Y3);

		#10 _B = 1'b0; _A = 1'b0; _1C = 1'b1; _2C = 1'b1;
		#0 $display("_B = %b, _A = %b, _1C = %b, _1G = %b, _2C = %b, _2G = %b", _B, _A, _1C, _1G, _2C, _2G);
		#0 $display("_1Y0 = %b, _1Y1 = %b, _1Y2 = %b, _1Y3 = %b", _1Y0, _1Y1, _1Y2, _1Y3);
		#0 $display("_2Y0 = %b, _2Y1 = %b, _2Y2 = %b, _2Y3 = %b", _2Y0, _2Y1, _2Y2, _2Y3);

		#10 _B = 1'b0; _A = 1'b1; _1C = 1'b0; _2C = 1'b0;
		#0 $display("_B = %b, _A = %b, _1C = %b, _1G = %b, _2C = %b, _2G = %b", _B, _A, _1C, _1G, _2C, _2G);
		#0 $display("_1Y0 = %b, _1Y1 = %b, _1Y2 = %b, _1Y3 = %b", _1Y0, _1Y1, _1Y2, _1Y3);
		#0 $display("_2Y0 = %b, _2Y1 = %b, _2Y2 = %b, _2Y3 = %b", _2Y0, _2Y1, _2Y2, _2Y3);

		#10 _B = 1'b0; _A = 1'b1; _1C = 1'b1; _2C = 1'b1;
		#0 $display("_B = %b, _A = %b, _1C = %b, _1G = %b, _2C = %b, _2G = %b", _B, _A, _1C, _1G, _2C, _2G);
		#0 $display("_1Y0 = %b, _1Y1 = %b, _1Y2 = %b, _1Y3 = %b", _1Y0, _1Y1, _1Y2, _1Y3);
		#0 $display("_2Y0 = %b, _2Y1 = %b, _2Y2 = %b, _2Y3 = %b", _2Y0, _2Y1, _2Y2, _2Y3);

		#10 _B = 1'b1; _A = 1'b0; _1C = 1'b0; _2C = 1'b0;
		#0 $display("_B = %b, _A = %b, _1C = %b, _1G = %b, _2C = %b, _2G = %b", _B, _A, _1C, _1G, _2C, _2G);
		#0 $display("_1Y0 = %b, _1Y1 = %b, _1Y2 = %b, _1Y3 = %b", _1Y0, _1Y1, _1Y2, _1Y3);
		#0 $display("_2Y0 = %b, _2Y1 = %b, _2Y2 = %b, _2Y3 = %b", _2Y0, _2Y1, _2Y2, _2Y3);

		#10 _B = 1'b1; _A = 1'b0; _1C = 1'b1; _2C = 1'b1;
		#0 $display("_B = %b, _A = %b, _1C = %b, _1G = %b, _2C = %b, _2G = %b", _B, _A, _1C, _1G, _2C, _2G);
		#0 $display("_1Y0 = %b, _1Y1 = %b, _1Y2 = %b, _1Y3 = %b", _1Y0, _1Y1, _1Y2, _1Y3);
		#0 $display("_2Y0 = %b, _2Y1 = %b, _2Y2 = %b, _2Y3 = %b", _2Y0, _2Y1, _2Y2, _2Y3);

		#10 _B = 1'b1; _A = 1'b1; _1C = 1'b0; _2C = 1'b0;
		#0 $display("_B = %b, _A = %b, _1C = %b, _1G = %b, _2C = %b, _2G = %b", _B, _A, _1C, _1G, _2C, _2G);
		#0 $display("_1Y0 = %b, _1Y1 = %b, _1Y2 = %b, _1Y3 = %b", _1Y0, _1Y1, _1Y2, _1Y3);
		#0 $display("_2Y0 = %b, _2Y1 = %b, _2Y2 = %b, _2Y3 = %b", _2Y0, _2Y1, _2Y2, _2Y3);

		#10 _B = 1'b1; _A = 1'b1; _1C = 1'b1; _2C = 1'b1;
		#0 $display("_B = %b, _A = %b, _1C = %b, _1G = %b, _2C = %b, _2G = %b", _B, _A, _1C, _1G, _2C, _2G);
		#0 $display("_1Y0 = %b, _1Y1 = %b, _1Y2 = %b, _1Y3 = %b", _1Y0, _1Y1, _1Y2, _1Y3);
		#0 $display("_2Y0 = %b, _2Y1 = %b, _2Y2 = %b, _2Y3 = %b", _2Y0, _2Y1, _2Y2, _2Y3);

		/* Disable output and check all outputs are high */
		#10 _1C = 1'b1; _1G = 1'b1; _2C = 1'b0; _2G = 1'b1;
		#0 $display("_B = %b, _A = %b, _1C = %b, _1G = %b, _2C = %b, _2G = %b", _B, _A, _1C, _1G, _2C, _2G);
		#0 $display("_1Y0 = %b, _1Y1 = %b, _1Y2 = %b, _1Y3 = %b", _1Y0, _1Y1, _1Y2, _1Y3);
		#0 $display("_2Y0 = %b, _2Y1 = %b, _2Y2 = %b, _2Y3 = %b", _2Y0, _2Y1, _2Y2, _2Y3);

		#10 $stop;
	end
	
endmodule