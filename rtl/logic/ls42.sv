/*#########################################################################
#File Name:     ls42.sv
#Description:   SN74LS42 - 4-Line BCD to 10-Line Decimal Decoder.
#                            
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

module ls42(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _A, _B, _C, _D);

	input wire _A, _B, _C, _D; 
	output wire _0, _1, _2, _3, _4, _5, _6, _7, _8, _9;

	wire _A_INV, _B_INV, _C_INV, _D_INV;
	wire _A_BUF, _B_BUF, _C_BUF, _D_BUF;

	not(_A_INV, _A);
	not(_B_INV, _B);
	not(_C_INV, _C);
	not(_D_INV, _D);

	not(_A_BUF, _A_INV);
	not(_B_BUF, _B_INV);
	not(_C_BUF, _C_INV);
	not(_D_BUF, _D_INV);

	nand(_0, _D_INV, _C_INV, _B_INV, _A_INV);
	nand(_1, _D_INV, _C_INV, _B_INV, _A_BUF);
	nand(_2, _D_INV, _C_INV, _B_BUF, _A_INV);
	nand(_3, _D_INV, _C_INV, _B_BUF, _A_BUF);
	nand(_4, _D_INV, _C_BUF, _B_INV, _A_INV);
	nand(_5, _D_INV, _C_BUF, _B_INV, _A_BUF);
	nand(_6, _D_INV, _C_BUF, _B_BUF, _A_INV);
	nand(_7, _D_INV, _C_BUF, _B_BUF, _A_BUF);
	nand(_8, _D_BUF, _C_INV, _B_INV, _A_INV);
	nand(_9, _D_BUF, _C_INV, _B_INV, _A_BUF);
	
endmodule
