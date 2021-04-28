/*#########################################################################
#File Name:     ls163.sv
#Description:   MB74LS163A - Synchronous 4-Bit Counters.
#                            
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         The dff primitive used is part of Intel's library.
#				Bitwise invert has been used to make the library dff match
#				the requirements defined on the data sheet. 
#
#Future work: 	Replace with suitable User Defined Primitive or Module,
#				to increase portability.
##########################################################################*/

module ls163(_CLK, _CLR, _LOAD, _ENP, _ENT, _RCO, _A, _B, _C, _D, _QA, _QB, _QC, _QD);

	input wire _CLK, _CLR, _LOAD, _ENP, _ENT, _A, _B, _C, _D;
	output wire _RCO;
	output reg _QA, _QB, _QC, _QD;

	not(_CLK_INV, _CLK);
	not(_CLR_INV, _CLR);
	not(_ENT_INV, _ENT);
	and(_AND1, _ENP, _ENT);

	nor(_NOR1, _LOAD, _CLR_INV);
	nor(_NOR2, _NOR1, _CLR_INV);

	nor(_RCO, _QD_INV, _QC_INV, _QB_INV, _QA_INV, _ENT_INV);

	/* DFF Output Inverts */
	not(_QA_INV, _QA);
	not(_QB_INV, _QB);
	not(_QC_INV, _QC);
	not(_QD_INV, _QD);

	/* QA */
	xnor(_XNOR1, _AND1, _QA_INV);
	and(_AND2, _A, _NOR1);
	and(_AND3, _XNOR1, _NOR2);
	or(_OR1, _AND2, _AND3);
	dff dff1(.d(_OR1), .clk(~_CLK_INV), .clrn(1'b1), .prn(1'b1), .q(_QA));

	/* QB */
	not(_NOT1, _QA_INV);
	and(_AND4, _NOT1, _AND1);
	xnor(_XNOR2, _AND4, _QB_INV);
	and(_AND5, _B, _NOR1);
	and(_AND6, _NOR2, _XNOR2);
	or(_OR2, _AND5, _AND6);
	dff dff2(.d(_OR2), .clk(~_CLK_INV), .clrn(1'b1), .prn(1'b1), .q(_QB));

	/* QC */
	nor(_NOR3, _QB_INV, _QA_INV);
	and(_AND7, _NOR3, _AND1);
	xnor(_XNOR3, _AND7, _QC_INV);
	and(_AND8, _C, _NOR1);
	and(_AND9, _NOR2, _XNOR3);
	or(_OR3, _AND8, _AND9);
	dff dff3(.d(_OR3), .clk(~_CLK_INV), .clrn(1'b1), .prn(1'b1), .q(_QC));

	/* QD */
	nor(_NOR4, _QC_INV, _QB_INV, _QA_INV);
	and(_AND10, _NOR4, _AND1);
	xnor(_XNOR4, _AND10, _QD_INV);
	and(_AND11, _NOR1, _D);
	and(_AND12, _NOR2, _XNOR4);
	or(_OR4, _AND11, _AND12);
	dff dff4(.d(_OR4), .clk(~_CLK_INV), .clrn(1'b1), .prn(1'b1), .q(_QD));
	
endmodule

