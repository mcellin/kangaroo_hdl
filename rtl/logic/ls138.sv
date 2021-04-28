/*#########################################################################
#File Name:     ls138.sv
#Description:   MB74LS138 - 3-Line to 8-Line Decoders/Multiplexers.
#                            
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

module ls138(_A, _B, _C, _G1, _G2A, _G2B, _Y0, _Y1, _Y2, _Y3, _Y4, _Y5, _Y6, _Y7);

	input wire _A, _B, _C, _G1, _G2A, _G2B;
	output wire _Y0, _Y1, _Y2, _Y3, _Y4, _Y5, _Y6, _Y7;

	wire _G1_INV, _ENABLE, _A_INV, _B_INV, _C_INV, _A_BUF, _B_BUF, _C_BUF;

	not(_G1_INV, _G1);
	nor(_ENABLE, _G1_INV, _G2A, _G2B);

	not(_A_INV, _A);
	not(_B_INV, _B);
	not(_C_INV, _C);
	not(_A_BUF, _A_INV);
	not(_B_BUF, _B_INV);
	not(_C_BUF, _C_INV);

	nand(_Y0, _ENABLE, _C_INV, _B_INV, _A_INV);
	nand(_Y1, _ENABLE, _C_INV, _B_INV, _A_BUF);
	nand(_Y2, _ENABLE, _C_INV, _B_BUF, _A_INV);
	nand(_Y3, _ENABLE, _C_INV, _B_BUF, _A_BUF);
	nand(_Y4, _ENABLE, _C_BUF, _B_INV, _A_INV);
	nand(_Y5, _ENABLE, _C_BUF, _B_INV, _A_BUF);
	nand(_Y6, _ENABLE, _C_BUF, _B_BUF, _A_INV);
	nand(_Y7, _ENABLE, _C_BUF, _B_BUF, _A_BUF);
	
endmodule
