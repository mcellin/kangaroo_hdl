/*#########################################################################
#File Name:     ls86.sv
#Description:   SN74LS86 - Quadruple 2-Input Exclusive-OR Gates.
#               Boolean function xY = xA XOR xB or xY = x!A . xB + xA . x!B,
#				where x = gate number.             
#
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

module ls86(_1A, _1B, _1Y, _2A, _2B, _2Y, _3A, _3B, _3Y, _4A, _4B, _4Y);

	input wire _1A, _1B, _2A, _2B, _3A, _3B, _4A, _4B;
	output wire _1Y, _2Y, _3Y, _4Y;

	xor(_1Y, _1A, _1B);
	xor(_2Y, _2A, _2B);
	xor(_3Y, _3A, _3B);
	xor(_4Y, _4A, _4B);
	
endmodule
