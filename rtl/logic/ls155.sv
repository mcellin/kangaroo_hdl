/*#########################################################################
#File Name:     ls155.sv
#Description:   SN74LS155 - Dual 2-Line to 4-Line Decoders/Multiplexers.
#                            
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

module ls155(_A, _B, _1C, _1G, _1Y0, _1Y1, _1Y2, _1Y3, _2C, _2G, _2Y0, _2Y1, _2Y2, _2Y3);

	input wire _A, _B, _1C, _1G, _2C, _2G;
	output wire _1Y0, _1Y1, _1Y2, _1Y3, _2Y0, _2Y1, _2Y2, _2Y3;

	wire _A_INV, _B_INV, _1C_INV, _A_BUF, _B_BUF, _1_ENABLE, _2_ENABLE;

	not(_A_INV, _A);
	not(_B_INV, _B);
	not(_1C_INV, _1C);
	not(_A_BUF, _A_INV);
	not(_B_BUF, _B_INV);

	nor(_1_ENABLE, _1C_INV, _1G);
	nor(_2_ENABLE, _2C, _2G);

	nand(_1Y0, _1_ENABLE, _B_INV, _A_INV);
	nand(_1Y1, _1_ENABLE, _B_INV, _A_BUF);
	nand(_1Y2, _1_ENABLE, _B_BUF, _A_INV);
	nand(_1Y3, _1_ENABLE, _B_BUF, _A_BUF);
                                 
	nand(_2Y0, _2_ENABLE, _B_INV, _A_INV);
	nand(_2Y1, _2_ENABLE, _B_INV, _A_BUF);
	nand(_2Y2, _2_ENABLE, _B_BUF, _A_INV);
	nand(_2Y3, _2_ENABLE, _B_BUF, _A_BUF);
	
endmodule
