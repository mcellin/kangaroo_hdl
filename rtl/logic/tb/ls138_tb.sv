/*#########################################################################
#File Name:     ls138_tb.sv
#Description:   SN74LS138 - 3-Line to 8-Line Decoders/Multiplexers test bench.
#                            
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

`timescale 1ps / 1ps
module ls138_tb; 
/*-------------------------- Inputs and Outputs --------------------------*/
	reg    _A, _B, _C, _G1, _G2A, _G2B;
 	wire   _Y0, _Y1, _Y2, _Y3, _Y4, _Y5, _Y6, _Y7;
	
/*--------------------- Instantiate Device Under Test --------------------*/
	ls138 DUT(
		._A(_A),
		._B(_B),
		._C(_C),
		._G1(_G1),
		._G2A(_G2A),
		._G2B(_G2B),
		._Y0(_Y0),
		._Y1(_Y1),		
		._Y2(_Y2),
		._Y3(_Y3),
		._Y4(_Y4),
		._Y5(_Y5),
		._Y6(_Y6),
		._Y7(_Y7)
	);

/*--------------------------------- Test ---------------------------------*/
	initial begin
		// Enable output and test 3-to-8 demultiplexing
		_C = 1'b0; _B= 1'b0; _A = 1'b0; _G1= 1'b1; _G2A = 1'b0; _G2B = 1'b0;
		#0 $display("_1A = %b, _1B = %b, _1C = %b, _G1 = %b, _G2A = %b, _G2B = %b", _A, _B, _C, _G1, _G2A, _G2B);
		#0 $display("_Y0 = %b, _Y1 = %b, _Y2 = %b, _Y3 = %b, _Y4 = %b, _Y5 = %b, _Y6 = %b, _Y7 = %b", _Y0, _Y1, _Y2, _Y3, _Y4, _Y5, _Y6, _Y7);

		#10 _C = 1'b0; _B= 1'b0; _A = 1'b1;
		#0 $display("_1A = %b, _1B = %b, _1C = %b, _G1 = %b, _G2A = %b, _G2B = %b", _A, _B, _C, _G1, _G2A, _G2B);
		#0 $display("_Y0 = %b, _Y1 = %b, _Y2 = %b, _Y3 = %b, _Y4 = %b, _Y5 = %b, _Y6 = %b, _Y7 = %b", _Y0, _Y1, _Y2, _Y3, _Y4, _Y5, _Y6, _Y7);

		#10 _C = 1'b0; _B= 1'b1; _A = 1'b0;
		#0 $display("_1A = %b, _1B = %b, _1C = %b, _G1 = %b, _G2A = %b, _G2B = %b", _A, _B, _C, _G1, _G2A, _G2B);
		#0 $display("_Y0 = %b, _Y1 = %b, _Y2 = %b, _Y3 = %b, _Y4 = %b, _Y5 = %b, _Y6 = %b, _Y7 = %b", _Y0, _Y1, _Y2, _Y3, _Y4, _Y5, _Y6, _Y7);

		#10 _C = 1'b0; _B= 1'b1; _A = 1'b1;
		#0 $display("_1A = %b, _1B = %b, _1C = %b, _G1 = %b, _G2A = %b, _G2B = %b", _A, _B, _C, _G1, _G2A, _G2B);
		#0 $display("_Y0 = %b, _Y1 = %b, _Y2 = %b, _Y3 = %b, _Y4 = %b, _Y5 = %b, _Y6 = %b, _Y7 = %b", _Y0, _Y1, _Y2, _Y3, _Y4, _Y5, _Y6, _Y7);

		#10 _C = 1'b1; _B= 1'b0; _A = 1'b0;
		#0 $display("_1A = %b, _1B = %b, _1C = %b, _G1 = %b, _G2A = %b, _G2B = %b", _A, _B, _C, _G1, _G2A, _G2B);
		#0 $display("_Y0 = %b, _Y1 = %b, _Y2 = %b, _Y3 = %b, _Y4 = %b, _Y5 = %b, _Y6 = %b, _Y7 = %b", _Y0, _Y1, _Y2, _Y3, _Y4, _Y5, _Y6, _Y7);

		#10 _C = 1'b1; _B= 1'b0; _A = 1'b1;
		#0 $display("_1A = %b, _1B = %b, _1C = %b, _G1 = %b, _G2A = %b, _G2B = %b", _A, _B, _C, _G1, _G2A, _G2B);
		#0 $display("_Y0 = %b, _Y1 = %b, _Y2 = %b, _Y3 = %b, _Y4 = %b, _Y5 = %b, _Y6 = %b, _Y7 = %b", _Y0, _Y1, _Y2, _Y3, _Y4, _Y5, _Y6, _Y7);

		#10 _C = 1'b1; _B= 1'b1; _A = 1'b0;
		#0 $display("_1A = %b, _1B = %b, _1C = %b, _G1 = %b, _G2A = %b, _G2B = %b", _A, _B, _C, _G1, _G2A, _G2B);
		#0 $display("_Y0 = %b, _Y1 = %b, _Y2 = %b, _Y3 = %b, _Y4 = %b, _Y5 = %b, _Y6 = %b, _Y7 = %b", _Y0, _Y1, _Y2, _Y3, _Y4, _Y5, _Y6, _Y7);

		#10 _C = 1'b1; _B= 1'b1; _A = 1'b1;
		#0 $display("_1A = %b, _1B = %b, _1C = %b, _G1 = %b, _G2A = %b, _G2B = %b", _A, _B, _C, _G1, _G2A, _G2B);
		#0 $display("_Y0 = %b, _Y1 = %b, _Y2 = %b, _Y3 = %b, _Y4 = %b, _Y5 = %b, _Y6 = %b, _Y7 = %b", _Y0, _Y1, _Y2, _Y3, _Y4, _Y5, _Y6, _Y7);

		// Disable output and check all outputs are high
		#10 _A = 1'b0; _B= 1'b0; _C = 1'b0; _G1= 1'b0; _G2A = 1'b0; _G2B = 1'b0;
		#0 $display("_1A = %b, _1B = %b, _1C = %b, _G1 = %b, _G2A = %b, _G2B = %b", _A, _B, _C, _G1, _G2A, _G2B);
		#0 $display("_Y0 = %b, _Y1 = %b, _Y2 = %b, _Y3 = %b, _Y4 = %b, _Y5 = %b, _Y6 = %b, _Y7 = %b", _Y0, _Y1, _Y2, _Y3, _Y4, _Y5, _Y6, _Y7);
		
		#10 _G1= 1'b0; _G2A = 1'b0; _G2B = 1'b1;
		#0 $display("_1A = %b, _1B = %b, _1C = %b, _G1 = %b, _G2A = %b, _G2B = %b", _A, _B, _C, _G1, _G2A, _G2B);
		#0 $display("_Y0 = %b, _Y1 = %b, _Y2 = %b, _Y3 = %b, _Y4 = %b, _Y5 = %b, _Y6 = %b, _Y7 = %b", _Y0, _Y1, _Y2, _Y3, _Y4, _Y5, _Y6, _Y7);

		#10 _G1= 1'b0; _G2A = 1'b1; _G2B = 1'b0;
		#0 $display("_1A = %b, _1B = %b, _1C = %b, _G1 = %b, _G2A = %b, _G2B = %b", _A, _B, _C, _G1, _G2A, _G2B);
		#0 $display("_Y0 = %b, _Y1 = %b, _Y2 = %b, _Y3 = %b, _Y4 = %b, _Y5 = %b, _Y6 = %b, _Y7 = %b", _Y0, _Y1, _Y2, _Y3, _Y4, _Y5, _Y6, _Y7);

		#10 _G1= 1'b0; _G2A = 1'b1; _G2B = 1'b1;
		#0 $display("_1A = %b, _1B = %b, _1C = %b, _G1 = %b, _G2A = %b, _G2B = %b", _A, _B, _C, _G1, _G2A, _G2B);
		#0 $display("_Y0 = %b, _Y1 = %b, _Y2 = %b, _Y3 = %b, _Y4 = %b, _Y5 = %b, _Y6 = %b, _Y7 = %b", _Y0, _Y1, _Y2, _Y3, _Y4, _Y5, _Y6, _Y7);

		// _G1= 1'b1; _G2A = 1'b0; _G2B = 1'b1; Skipped as this enables output

		#10 _G1= 1'b1; _G2A = 1'b1; _G2B = 1'b0;
		#0 $display("_1A = %b, _1B = %b, _1C = %b, _G1 = %b, _G2A = %b, _G2B = %b", _A, _B, _C, _G1, _G2A, _G2B);
		#0 $display("_Y0 = %b, _Y1 = %b, _Y2 = %b, _Y3 = %b, _Y4 = %b, _Y5 = %b, _Y6 = %b, _Y7 = %b", _Y0, _Y1, _Y2, _Y3, _Y4, _Y5, _Y6, _Y7);

		#10 _G1= 1'b1; _G2A = 1'b1; _G2B = 1'b1;
		#0 $display("_1A = %b, _1B = %b, _1C = %b, _G1 = %b, _G2A = %b, _G2B = %b", _A, _B, _C, _G1, _G2A, _G2B);
		#0 $display("_Y0 = %b, _Y1 = %b, _Y2 = %b, _Y3 = %b, _Y4 = %b, _Y5 = %b, _Y6 = %b, _Y7 = %b", _Y0, _Y1, _Y2, _Y3, _Y4, _Y5, _Y6, _Y7);

		#10 $stop;
	end
	
endmodule