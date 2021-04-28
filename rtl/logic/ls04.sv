/*#########################################################################
#File Name:     ls04.sv
#Description:   SN74LS04N - HEX Inverter, 6 NOT gates.
#               Boolean function xY = !xA, where x = gate number.
#               
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

module ls04(_1A, _1Y, _2A, _2Y, _3A, _3Y, _4A, _4Y, _5A, _5Y, _6A, _6Y);

	input wire _1A, _2A, _3A, _4A, _5A, _6A;
	output wire _1Y, _2Y, _3Y, _4Y, _5Y, _6Y;

	not(_1Y, _1A);
	not(_2Y, _2A);
	not(_3Y, _3A);
	not(_4Y, _4A);
	not(_5Y, _5A);
	not(_6Y, _6A);
	
endmodule
