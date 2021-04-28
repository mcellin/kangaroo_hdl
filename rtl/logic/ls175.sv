/*#########################################################################
#File Name:     ls175.sv
#Description:   SN74LS175N - Quad D-Type Flip-Flops with Clear.
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

module ls175(_CLK, _CLR, _1D, _1Q, _1Q_INV, _2D, _2Q, _2Q_INV, _3D, _3Q, _3Q_INV, _4D, _4Q, _4Q_INV);

	input wire _CLK, _CLR, _1D, _2D, _3D, _4D;
	output wire _1Q_INV, _2Q_INV, _3Q_INV, _4Q_INV;
	output reg _1Q, _2Q, _3Q, _4Q;
	
	wire _CLK_INV, _CLR_BUF;

	not(_CLK_INV, _CLK);
	buf(_CLR_BUF, _CLR);

	not(_1Q_INV, _1Q);
	not(_2Q_INV, _2Q);
	not(_3Q_INV, _3Q);
	not(_4Q_INV, _4Q);

	dff dff1 (.d(_1D), .clk(~_CLK_INV), .clrn(_CLR_BUF), .prn(1'b1), .q(_1Q));
	dff dff2 (.d(_2D), .clk(~_CLK_INV), .clrn(_CLR_BUF), .prn(1'b1), .q(_2Q));
	dff dff3 (.d(_3D), .clk(~_CLK_INV), .clrn(_CLR_BUF), .prn(1'b1), .q(_3Q));
	dff dff4 (.d(_4D), .clk(~_CLK_INV), .clrn(_CLR_BUF), .prn(1'b1), .q(_4Q));
	
endmodule
