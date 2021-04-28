/*#########################################################################
#File Name:     ls367.sv
#Description:   M74LS367AP - High-Speed CMOS Logic Hex Buffer/Line Driver,
#    			Three-State Non-Inverting.                        
#
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

module ls367(_1G, _1A1, _1Y1, _1A2, _1Y2, _1A3, _1Y3, _1A4, _1Y4, _2G, _2A1, _2Y1, _2A2, _2Y2);
	
	input wire _1G, _1A1, _1A2, _1A3, _1A4, _2G, _2A1, _2A2;
	output wire _1Y1, _1Y2, _1Y3, _1Y4, _2Y1, _2Y2;

	wire _1G_INV, _2G_INV;

	not(_1G_INV, _1G);
	bufif1(_1Y1, _1A1, _1G_INV);
	bufif1(_1Y2, _1A2, _1G_INV);
	bufif1(_1Y3, _1A3, _1G_INV);
	bufif1(_1Y4, _1A4, _1G_INV);

	not(_2G_INV, _2G);
	bufif1(_2Y1, _2A1, _2G_INV);
	bufif1(_2Y2, _2A2, _2G_INV);
	
endmodule
