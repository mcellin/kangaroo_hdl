/*#########################################################################
#File Name:     ls193.sv
#Description:   SN74LS193N - Synchronous 4-Bit Counters
#    			                      
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         The tff primitive used is part of Intel's library. 
#				Bitwise invert has been used to make the library tff match
#				the requirements defined on the data sheet. 
#
#Future work: 	Replace with suitable User Defined Primitive or Module,
#				to increase portability.
##########################################################################*/

module ls193(_CLR, _LOAD, _UP, _DOWN, _A, _B, _C, _D, _BO, _CO, _QA, _QB, _QC, _QD);

	input wire _CLR, _LOAD, _UP, _DOWN, _A, _B, _C, _D;
	output reg _BO, _CO, _QA, _QB, _QC, _QD;

	not(_UP_INV, _UP);
	not(_DOWN_INV, _DOWN);
	not(_CLR_INV, _CLR);
	not(_LOAD_INV, _LOAD);

	nand(_BO, _DOWN_INV, _QA_INV, _QB_INV, _QC_INV, _QD_INV);
	nand(_CO, _QA, _QB, _QC, _QD, _UP_INV);

	/* TFF Output Inverts */
	not(_QA_INV, _QA);
	not(_QB_INV, _QB);
	not(_QC_INV, _QC);
	not(_QD_INV, _QD);

	/* QA */
	nand(_NAND1, _A, _LOAD_INV, _CLR_INV);
	or(_OR1, _DOWN_INV, _UP_INV);
	nand(_NAND2, _NAND1, _LOAD_INV);
	nand(_NEGATIVEOR1, _CLR_INV, _NAND2); /* Negative-OR is the same as a NAND */
	tff tff1(.t(1'b1), .clk(~_OR1), .clrn(~_NEGATIVEOR1), .prn(_NAND1), .q(_QA));

	/* QB */
	nand(_NAND3, _B, _LOAD_INV, _CLR_INV);
	and(_AND1, _DOWN_INV, _QA_INV);
	and(_AND2, _QA, _UP_INV);
	or(_OR2, _AND1, _AND2);
	nand(_NAND4, _NAND3, _LOAD_INV);
	nand(_NEGATIVEOR2, _CLR_INV, _NAND4); /* Negative-OR is the same as a NAND */
	tff tff2(.t(1'b1), .clk(~_OR2), .clrn(~_NEGATIVEOR2), .prn(_NAND3), .q(_QB));

	/* QC */
	nand(_NAND5, _C, _LOAD_INV, _CLR_INV);
	and(_AND3, _DOWN_INV, _QA_INV, _QB_INV);
	and(_AND4, _QA, _QB, _UP_INV);
	or(_OR3, _AND3, _AND4);
	nand(_NAND6, _NAND5, _LOAD_INV);
	nand(_NEGATIVEOR3, _CLR_INV, _NAND6); /* Negative-OR is the same as a NAND */
	tff tff3(.t(1'b1), .clk(~_OR3), .clrn(~_NEGATIVEOR3), .prn(_NAND5), .q(_QC));

	/* QD */
	nand(_NAND7, _D, _LOAD_INV, _CLR_INV);
	and(_AND5, _DOWN_INV, _QA_INV, _QB_INV, _QC_INV);
	and(_AND6, _QA, _QB, _QC, _UP_INV);
	or(_OR4, _AND5, _AND6);
	nand(_NAND8, _NAND7, _LOAD_INV);
	nand(_NEGATIVEOR4, _CLR_INV, _NAND8); /* Negative-OR is the same as a NAND */
	tff tff4(.t(1'b1), .clk(~_OR4), .clrn(~_NEGATIVEOR4), .prn(_NAND7), .q(_QD));
	
endmodule
