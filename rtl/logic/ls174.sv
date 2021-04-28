/*#########################################################################
#File Name:     ls174.sv
#Description:   SN74LS174N - Hex D-Type Flip-Flops with Clear.
#                            
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         The dff primitive used is part of Intel's library.
#				Bitwise invert has been used to make the library dff match
#				the requirements defined on the data sheet. 
#
#Future work: 	Replace with suitable User Defined Primitive or Module,
#				to increase portability.
##########################################################################*/

module ls174(_CLK, _CLR, _1D, _1Q, _2D, _2Q, _3D, _3Q, _4D, _4Q, _5D, _5Q, _6D, _6Q);

	input wire _CLK, _CLR, _1D, _2D, _3D, _4D, _5D, _6D;
	output reg _1Q, _2Q, _3Q, _4Q, _5Q, _6Q;

	wire _CLK_INV, _CLR_BUF;

	not(_CLK_INV, _CLK);
	buf(_CLR_BUF, _CLR);

	dff dff1 (.d(_1D), .clk(~_CLK_INV), .clrn(_CLR_BUF), .prn(1'b1), .q(_1Q));
	dff dff2 (.d(_2D), .clk(~_CLK_INV), .clrn(_CLR_BUF), .prn(1'b1), .q(_2Q));
	dff dff3 (.d(_3D), .clk(~_CLK_INV), .clrn(_CLR_BUF), .prn(1'b1), .q(_3Q));
	dff dff4 (.d(_4D), .clk(~_CLK_INV), .clrn(_CLR_BUF), .prn(1'b1), .q(_4Q));
	dff dff5 (.d(_5D), .clk(~_CLK_INV), .clrn(_CLR_BUF), .prn(1'b1), .q(_5Q));
	dff dff6 (.d(_6D), .clk(~_CLK_INV), .clrn(_CLR_BUF), .prn(1'b1), .q(_6Q));
	
endmodule
