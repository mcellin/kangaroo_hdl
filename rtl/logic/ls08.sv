/*#########################################################################
#File Name:     ls08.sv
#Description:   DM74LS08 - Quadruple 2-Input AND Gates.
#               Boolean function xY = xA . xB, where x = gate number.             
#
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

module ls08(_1A, _1B, _1Y, _2A, _2B, _2Y, _3A, _3B, _3Y, _4A, _4B, _4Y);

	input wire _1A, _1B, _2A, _2B, _3A, _3B, _4A, _4B;
	output wire _1Y, _2Y, _3Y, _4Y;

	and(_1Y, _1A, _1B);
	and(_2Y, _2A, _2B);
	and(_3Y, _3A, _3B);
	and(_4Y, _4A, _4B);
	
endmodule
