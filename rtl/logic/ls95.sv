/*#########################################################################
#File Name:     ls95.sv
#Description:   SN74LS95BN - 4_Bit Parallel Access Shift Registers.
#                          
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         The srff primitive used is part of Intel's library.
#
#Future work: 	Replace with suitable User Defined Primitive or Module,
#				to increase portability.
##########################################################################*/

module ls95(_QA, _QB, _QC, _QD, _CLK1, _CLK2, _MODE, _SER, _A, _B, _C, _D);

	input wire _CLK1, _CLK2, _MODE, _SER, _A, _B, _C, _D;
	output reg _QA, _QB, _QC, _QD;

	wire _MODE_INV, _MODE_BUF, _AND1, _AND2, _AND3, _AND4, _AND5, _AND6, _AND7,
	_AND8, _AND9, _AND10, _NOR1, _NOR2, _NOR3, _NOR4, _NOR1_INV, _NOR2_INV, _NOR3_INV, _NOR4_INV, _OR;
	
	not(_MODE_INV, _MODE);
	not(_MODE_BUF, _MODE_INV);
	
	and(_AND1, _SER, _MODE_INV);
	and(_AND2, _MODE_BUF, _A);
	and(_AND3, _QA, _MODE_INV);
	and(_AND4, _MODE_BUF, _B);
	and(_AND5, _QB, _MODE_INV);
	and(_AND6, _MODE_BUF, _C);
	and(_AND7, _QC, _MODE_INV);
	and(_AND8, _MODE_BUF, _D);

	nor(_NOR1, _AND1, _AND2);
	nor(_NOR2, _AND3, _AND4);
	nor(_NOR3, _AND5, _AND6);
	nor(_NOR4, _AND7, _AND8);

	not(_NOR1_INV, _NOR1);
	not(_NOR2_INV, _NOR2);
	not(_NOR3_INV, _NOR3);
	not(_NOR4_INV, _NOR4);
	
	and(_AND9, _CLK1, _MODE_INV);
	and(_AND10, _CLK2, _MODE);
	
	or(_OR, _AND9, _AND10);
	not(_OR_INV, _OR);

	srff srff1(.clk(_OR_INV), .s(_NOR1_INV), .r(_NOR1), .clrn(1'b1), .prn(1'b1), .q(_QA));
	srff srff2(.clk(_OR_INV), .s(_NOR2_INV), .r(_NOR2), .clrn(1'b1), .prn(1'b1), .q(_QB));
	srff srff3(.clk(_OR_INV), .s(_NOR3_INV), .r(_NOR3), .clrn(1'b1), .prn(1'b1), .q(_QC));
	srff srff4(.clk(_OR_INV), .s(_NOR4_INV), .r(_NOR4), .clrn(1'b1), .prn(1'b1), .q(_QD));
	
endmodule
