/*#########################################################################
#File Name:     ls10.sv
#Description:   SN74LS10N - Triple 3-Input Positive-NAND Gates.
#               Boolean function xY = !(xA . xB . xC) or xY = !xA + !xB + !xC
#               in positive logic, where x = gate number.
#
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

module ls10(_1A, _1B, _1C, _1Y, _2A, _2B, _2C, _2Y, _3A, _3B, _3C, _3Y);

	input wire _1A, _1B, _1C, _2A, _2B, _2C, _3A, _3B, _3C;
 	output wire _1Y, _2Y, _3Y;

	nand(_1Y, _1A, _1B, _1C);
	nand(_2Y, _2A, _2B, _2C);
	nand(_3Y, _3A, _3B, _3C);
	
endmodule
