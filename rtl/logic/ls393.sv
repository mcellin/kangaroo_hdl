/*#########################################################################
#File Name:     ls393.sv
#Description:   SN74LS393N - Dual 4-Bit Decade and Binary Counters
#    			                      
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         The tff primitive used is part of Intel's library.   
#
#Future work: 	Replace with suitable User Defined Primitive or Module,
#				to increase portability.
##########################################################################*/   

module ls393(_1CLR, _1A, _1QA, _1QB, _1QC, _1QD, _2CLR, _2A, _2QA, _2QB, _2QC, _2QD);

	input wire _1A, _1CLR, _2A, _2CLR;
	output reg _1QA, _1QB, _1QC, _1QD, _2QA, _2QB, _2QC, _2QD;

	wire _1CLR_INV, _1A_INV, _1QA_INV, _1QB_INV, _1QC_INV;
	wire _2CLR_INV, _2A_INV, _2QA_INV, _2QB_INV, _2QC_INV;
	
	not(_1CLR_INV, _1CLR);
	not(_2CLR_INV, _2CLR);

	not(_1A_INV, _1A);
	not(_1QA_INV, _1QA);
	not(_1QB_INV, _1QB);
	not(_1QC_INV, _1QC);

	not(_2A_INV, _2A);
	not(_2QA_INV, _2QA);
	not(_2QB_INV, _2QB);
	not(_2QC_INV, _2QC);

	/* Clock occurs on HIGH to LOW transition of _1A */
	tff tff1(.t(1'b1), .clk(_1A_INV), .clrn(_1CLR_INV), .prn(1'b1), .q(_1QA));
	tff tff2(.t(1'b1), .clk(_1QA_INV), .clrn(_1CLR_INV), .prn(1'b1), .q(_1QB));
	tff tff3(.t(1'b1), .clk(_1QB_INV), .clrn(_1CLR_INV), .prn(1'b1), .q(_1QC));
	tff tff4(.t(1'b1), .clk(_1QC_INV), .clrn(_1CLR_INV), .prn(1'b1), .q(_1QD));

	/* Clock occurs on HIGH to LOW transition of _2A */
	tff tff5(.t(1'b1), .clk(_2A_INV), .clrn(_2CLR_INV), .prn(1'b1), .q(_2QA));
	tff tff6(.t(1'b1), .clk(_2QA_INV), .clrn(_2CLR_INV), .prn(1'b1), .q(_2QB));
	tff tff7(.t(1'b1), .clk(_2QB_INV), .clrn(_2CLR_INV), .prn(1'b1), .q(_2QC));
	tff tff8(.t(1'b1), .clk(_2QC_INV), .clrn(_2CLR_INV), .prn(1'b1), .q(_2QD));	

endmodule
