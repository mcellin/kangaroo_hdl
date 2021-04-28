/*#########################################################################
#File Name:     ls74.sv
#Description:   SN74LS74AN - Dual D-Type Positive Edge Triggered Flip Flops
#               with Preset and Clear
#
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         The dff primitive used is part of Intel's library.
#
#Future work: 	Replace with suitable User Defined Primitive or Module,
#				to increase portability.
##########################################################################*/

module ls74(_1CLR, _1D, _1CLK, _1PRE, _1Q, _1QINV, _2CLR, _2D, _2CLK, _2PRE, _2Q, _2QINV);

	input wire _1CLR, _1D, _1CLK, _1PRE, _2CLR, _2D, _2CLK, _2PRE;
	output reg _1Q, _2Q;
	output wire _1QINV, _2QINV;
	
	/* DFF Output Inverts */
	not(_1QINV, _1Q);
	not(_2QINV, _2Q);

	dff dff1 (.d(_1D), .clk(_1CLK), .clrn(_1CLR), .prn(_1PRE), .q(_1Q));
	dff dff2 (.d(_2D), .clk(_2CLK), .clrn(_2CLR), .prn(_2PRE), .q(_2Q));
	
endmodule
