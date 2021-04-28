/*#########################################################################
#File Name:     ls32.sv
#Description:   SN74LS32N - Quadruple 2-Input Positive OR Gates.
#               Boolean function xY = xA + xB or xY = !(x!A . x!B),
#				where x = gate number.             
#
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

module ls32(_1A, _1B, _1Y, _2A, _2B, _2Y, _3A, _3B, _3Y, _4A, _4B, _4Y);

	input wire _1A, _1B, _2A, _2B, _3A, _3B, _4A, _4B;
	output wire _1Y, _2Y, _3Y, _4Y;

	or(_1Y, _1A, _1B);
	or(_2Y, _2A, _2B);
	or(_3Y, _3A, _3B);
	or(_4Y, _4A, _4B);
	
endmodule
