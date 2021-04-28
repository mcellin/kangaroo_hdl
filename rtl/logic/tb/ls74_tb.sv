/*#########################################################################
#File Name:     ls74_tb.sv
#Description:   SN74LS74AN - Dual D-Type Flip-Flops with Preset and Clear.
#                            
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

`timescale 1ps / 1ps
module ls74_tb; 
/*-------------------------- Inputs and Outputs --------------------------*/
	reg    _1CLR, _1D, _1CLK, _1PRE, _2CLR, _2D, _2CLK, _2PRE;
 	wire   _1Q, _1QINV, _2Q, _2QINV;
		
/*--------------------- Instantiate Device Under Test --------------------*/
	ls74 DUT( 
		._1CLR(_1CLR),
		._1CLK(_1CLK),
		._1PRE(_1PRE),
		._1D(_1D),
		._1Q(_1Q),
		._1QINV(_1QINV),
		._2CLR(_2CLR),
		._2CLK(_2CLK),
		._2PRE(_2PRE),
		._2D(_2D),
		._2Q(_2Q),
		._2QINV(_2QINV)
	);

/*--------------------------------- Clock --------------------------------*/
	always begin
		#5 _1CLK = ~_1CLK; _2CLK = ~_2CLK;
	end

/*--------------------------------- Test ---------------------------------*/
	initial begin
		/* Check Clear */
		#0 _1CLR = 1'b1; _1D = 1'bx; _1CLK = 1'b1; _1PRE = 1'b0; _2CLR = 1'b1; _2D = 1'bx; _2CLK = 1'b1; _2PRE = 1'b0;
		#0 $display("_1CLR = %b, _1D = %b, _1CLK = %b, _1PRE = %b", _1CLR, _1D, _1CLK, _1PRE);
		#0 $display("_2CLR = %b, _2D = %b, _2CLK = %b, _2PRE = %b", _2CLR, _2D, _2CLK, _2PRE);
		#0 $display("_1Q = %b, _1QINV = %b, _2Q = %b, _2QINV  = %b", _1Q, _1QINV, _2Q, _2QINV);

		/* Check Preload */
		#20 _1CLR = 1'b0; _2CLR = 1'b0; _1PRE = 1'b1; _2PRE = 1'b1; 
		#0 $display("_1CLR = %b, _1D = %b, _1CLK = %b, _1PRE = %b", _1CLR, _1D, _1CLK, _1PRE);
		#0 $display("_2CLR = %b, _2D = %b, _2CLK = %b, _2PRE = %b", _2CLR, _2D, _2CLK, _2PRE);
		#0 $display("_1Q = %b, _1QINV = %b, _2Q = %b, _2QINV  = %b", _1Q, _1QINV, _2Q, _2QINV);

		/* Check D Input */
		#20 _1CLR = 1'b1; _1PRE = 1'b1; _1D = 1'b0; _2CLR = 1'b1; _2PRE = 1'b1; _2D = 1'b0; 
		#0 $display("_1CLR = %b, _1D = %b, _1CLK = %b, _1PRE = %b", _1CLR, _1D, _1CLK, _1PRE);
		#0 $display("_2CLR = %b, _2D = %b, _2CLK = %b, _2PRE = %b", _2CLR, _2D, _2CLK, _2PRE);
		#0 $display("_1Q = %b, _1QINV = %b, _2Q = %b, _2QINV  = %b", _1Q, _1QINV, _2Q, _2QINV);
	
		#10 _1D = 1'b1; _2D = 1'b1; 
		#0 $display("_1CLR = %b, _1D = %b, _1CLK = %b, _1PRE = %b", _1CLR, _1D, _1CLK, _1PRE);
		#0 $display("_2CLR = %b, _2D = %b, _2CLK = %b, _2PRE = %b", _2CLR, _2D, _2CLK, _2PRE);
		#0 $display("_1Q = %b, _1QINV = %b, _2Q = %b, _2QINV  = %b", _1Q, _1QINV, _2Q, _2QINV);

		#10 _1D = 1'b0; _2D = 1'b0; 
		#0 $display("_1CLR = %b, _1D = %b, _1CLK = %b, _1PRE = %b", _1CLR, _1D, _1CLK, _1PRE);
		#0 $display("_2CLR = %b, _2D = %b, _2CLK = %b, _2PRE = %b", _2CLR, _2D, _2CLK, _2PRE);
		#0 $display("_1Q = %b, _1QINV = %b, _2Q = %b, _2QINV  = %b", _1Q, _1QINV, _2Q, _2QINV);

		#10 _1D = 1'b1; _2D = 1'b1; 
		#0 $display("_1CLR = %b, _1D = %b, _1CLK = %b, _1PRE = %b", _1CLR, _1D, _1CLK, _1PRE);
		#0 $display("_2CLR = %b, _2D = %b, _2CLK = %b, _2PRE = %b", _2CLR, _2D, _2CLK, _2PRE);
		#0 $display("_1Q = %b, _1QINV = %b, _2Q = %b, _2QINV  = %b", _1Q, _1QINV, _2Q, _2QINV);

		#10 $stop;
	end
	
endmodule
