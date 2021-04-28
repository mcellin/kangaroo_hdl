/*#########################################################################
#File Name:     ls139.sv
#Description:   MB74LS139 - Dual 2-Line to 4-Line Decoders/Multiplexers.
#                            
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

module ls139(_1G, _1A, _1B, _1Y0, _1Y1, _1Y2, _1Y3, _2G, _2A, _2B, _2Y0, _2Y1, _2Y2, _2Y3);

	input wire _1G, _1A, _1B, _2G, _2A, _2B;
	output wire _1Y0, _1Y1, _1Y2, _1Y3, _2Y0, _2Y1, _2Y2, _2Y3;

	wire _1G_INV, _1A_INV, _1B_INV, _2G_INV, _2A_INV, _2B_INV, _1A_BUF, _1B_BUF, _2A_BUF, _2B_BUF; 

	not(_1G_INV, _1G);
	not(_1A_INV, _1A);
	not(_1B_INV, _1B);
	not(_1A_BUF, _1A_INV);
	not(_1B_BUF, _1B_INV);
	
	nand(_1Y0, _1G_INV, _1B_INV, _1A_INV);
	nand(_1Y1, _1G_INV, _1B_INV, _1A_BUF);
	nand(_1Y2, _1G_INV, _1B_BUF, _1A_INV);
	nand(_1Y3, _1G_INV, _1B_BUF, _1A_BUF);

	not(_2G_INV, _2G);
	not(_2A_INV, _2A);
	not(_2B_INV, _2B);
	not(_2A_BUF, _2A_INV);
	not(_2B_BUF, _2B_INV);
	
	nand(_2Y0, _2G_INV, _2B_INV, _2A_INV);
	nand(_2Y1, _2G_INV, _2B_INV, _2A_BUF);
	nand(_2Y2, _2G_INV, _2B_BUF, _2A_INV);
	nand(_2Y3, _2G_INV, _2B_BUF, _2A_BUF);
	
endmodule
