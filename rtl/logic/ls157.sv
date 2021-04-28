/*#########################################################################
#File Name:     ls157.sv
#Description:   SN74LS157N - Quadruple 2-Line to 1-Line Data Selectors/
#               Multiplexers.            
#
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

module ls157(_AB, _G, _1A, _1B, _1Y, _2A, _2B, _2Y, _3A, _3B, _3Y, _4A, _4B, _4Y);

	input wire _AB, _G, _1A, _1B, _2A, _2B, _3A, _3B, _4A, _4B;
	output wire _1Y, _2Y, _3Y, _4Y;

	wire _AB_INV, _AB_BUF, _G_INV, _1Y_AND1, _1Y_AND2, _2Y_AND1, _2Y_AND2, _3Y_AND1, _3Y_AND2, _4Y_AND1, _4Y_AND2;

	not(_AB_INV, _AB);
	not(_G_INV, _G);
	not(_AB_BUF, _AB_INV);

	and(_1Y_AND1, _G_INV, _1A, _AB_INV);
	and(_1Y_AND2, _G_INV, _1B, _AB_BUF);
	and(_2Y_AND1, _G_INV, _2A, _AB_INV);
	and(_2Y_AND2, _G_INV, _2B, _AB_BUF);
	and(_3Y_AND1, _G_INV, _3A, _AB_INV);
	and(_3Y_AND2, _G_INV, _3B, _AB_BUF);
	and(_4Y_AND1, _G_INV, _4A, _AB_INV);
	and(_4Y_AND2, _G_INV, _4B, _AB_BUF);

	or(_1Y, _1Y_AND1, _1Y_AND2);
	or(_2Y, _2Y_AND1, _2Y_AND2);
	or(_3Y, _3Y_AND1, _3Y_AND2);
	or(_4Y, _4Y_AND1, _4Y_AND2);
	
endmodule
