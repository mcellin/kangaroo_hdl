/*#########################################################################
#File Name:     ls00.sv
#Description:   SN74LS00N - Quadruple 2-Input Positive-NAND Gates.
#               Boolean function xY = !xA . !xB or xY = !xA + !xB in 
#               positive logic, where x = gate number.
#
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

module ls00(_1A, _1B, _1Y, _2A, _2B, _2Y, _3A, _3B, _3Y, _4A, _4B, _4Y);

	input wire _1A, _1B, _2A, _2B, _3A, _3B, _4A, _4B; 
	output wire _1Y, _2Y, _3Y, _4Y;

	nand(_1Y, _1A, _1B);
	nand(_2Y, _2A, _2B);
	nand(_3Y, _3A, _3B);
	nand(_4Y, _4A, _4B);
	
endmodule
