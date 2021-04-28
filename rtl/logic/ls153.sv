/*#########################################################################
#File Name:     ls153.sv
#Description:   SN74LS153N - Dual 4-Line to 1-Line Data Selectors/Multiplexers.
#                            
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

module ls153(_A, _B, _1G, _1C0, _1C1, _1C2, _1C3, _1Y, _2G, _2C0, _2C1, _2C2, _2C3, _2Y);

	input wire _A, _B, _1G, _1C0, _1C1, _1C2, _1C3, _2G, _2C0, _2C1, _2C2, _2C3; 
	output wire _1Y, _2Y;

	wire _A_INV, _B_INV, _1G_INV, _2G_INV, _A_BUF, _B_BUF;

	not(_1G_INV, _1G);
	not(_2G_INV, _2G);
	not(_A_INV, _A);
	not(_B_INV, _B);
	not(_A_BUF, _A_INV);
	not(_B_BUF, _B_INV);

	and(_1C_AND0, _1G_INV, _B_INV, _A_INV, _1C0);
	and(_1C_AND1, _1G_INV, _B_INV, _A_BUF, _1C1);
	and(_1C_AND2, _1G_INV, _B_BUF, _A_INV, _1C2);
	and(_1C_AND3, _1G_INV, _B_BUF, _A_BUF, _1C3);
	
	and(_2C_AND0, _1G_INV, _B_INV, _A_INV, _2C0);
	and(_2C_AND1, _1G_INV, _B_INV, _A_BUF, _2C1);
	and(_2C_AND2, _1G_INV, _B_BUF, _A_INV, _2C2);
	and(_2C_AND3, _1G_INV, _B_BUF, _A_BUF, _2C3);

	or(_1Y, _1C_AND0, _1C_AND1, _1C_AND2, _1C_AND3);
	or(_2Y, _2C_AND0, _2C_AND1, _2C_AND2, _2C_AND3);
	
endmodule
