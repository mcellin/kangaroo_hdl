/*#########################################################################
#File Name:     ls245.sv
#Description:   SN74LS245 - Octal Bus Transceivers With 3-State Outputs. 
#    			                     
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

module ls245(_DIR, _OE, _A1, _A2, _A3, _A4, _A5, _A6, _A7, _A8, _B1, _B2, _B3, _B4, _B5, _B6, _B7, _B8);
	
	input wire _DIR, _OE;
	inout wire _A1, _A2, _A3, _A4, _A5, _A6, _A7, _A8, _B1, _B2, _B3, _B4, _B5, _B6, _B7, _B8;

	wire _DIR_INV, _OE_INV, _A_ENABLE, _B_ENABLE;

	not(_DIR_INV, _DIR);
	not(_OE_INV, _OE);

	and(_A_ENABLE, _DIR, _OE_INV);
	and(_B_ENABLE, _DIR_INV, _OE_INV);

	bufif1(_B1, _A1, _A_ENABLE);
	bufif1(_B2, _A2, _A_ENABLE);
	bufif1(_B3, _A3, _A_ENABLE);
	bufif1(_B4, _A4, _A_ENABLE);
	bufif1(_B5, _A5, _A_ENABLE);
	bufif1(_B6, _A6, _A_ENABLE);
	bufif1(_B7, _A7, _A_ENABLE);
	bufif1(_B8, _A8, _A_ENABLE);

	bufif1(_A1, _B1, _B_ENABLE);
	bufif1(_A2, _B2, _B_ENABLE);
	bufif1(_A3, _B3, _B_ENABLE);
	bufif1(_A4, _B4, _B_ENABLE);
	bufif1(_A5, _B5, _B_ENABLE);
	bufif1(_A6, _B6, _B_ENABLE);
	bufif1(_A7, _B7, _B_ENABLE);
	bufif1(_A8, _B8, _B_ENABLE);
	
endmodule
