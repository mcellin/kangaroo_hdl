/*#########################################################################
#File Name:     ls95_tb.sv
#Description:   SN74LS95BN - 4_Bit Parallel Access Shift Registers test bench.
#                          
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

`timescale 1ps / 1ps
module ls95_tb;
/*-------------------------- Inputs and Outputs --------------------------*/
	reg _CLK1, _CLK2, _MODE, _SER, _A, _B, _C, _D;
	wire _QA, _QB, _QC, _QD;

	reg left_shift;
	wire ina, inb, inc;

	assign ina = (left_shift == 1) ? _QB : _A;
	assign inb = (left_shift == 1) ? _QC : _B;
	assign inc = (left_shift == 1) ? _QD : _C;

/*--------------------- Instantiate Device Under Test --------------------*/
	ls95 DUT( 
		._CLK1(_CLK1),
		._CLK2(_CLK2),
		._SER(_SER),
		._MODE(_MODE),
		._A(ina),		
		._B(inb),
		._C(inc),
		._D(_D),
		._QA(_QA),
		._QB(_QB),
		._QC(_QC),
		._QD(_QD)
	);		
/*--------------------------------- Clock --------------------------------*/
	always begin
		#5 _CLK1 = ~_CLK1; _CLK2 = ~_CLK2;
	end

/*--------------------------------- Test ---------------------------------*/
	initial begin
		/* Parallel Load */
		/* At time 0 out should be QAQBQCQD, at time 5 output should be abcd */
		_MODE = 1'b1; _CLK1 = 1'b1; _CLK2 = 1'b1; _SER = 1'b0; {_D,_C,_B,_A} = 4'b0001; left_shift = 1'b0;
		#10 {_D,_C,_B,_A} = 4'b0010;
		#10 {_D,_C,_B,_A} = 4'b0100;
		#10 {_D,_C,_B,_A} = 4'b1000;
		#10 {_D,_C,_B,_A} = 4'b0000;
		
		#10 _SER = 1'b1; {_D,_C,_B,_A} = 4'b0001;
		#10 {_D,_C,_B,_A} = 4'b0010;
		#10 {_D,_C,_B,_A} = 4'b0100;
		#10 {_D,_C,_B,_A} = 4'b1000;
		#10 {_D,_C,_B,_A} = 4'b0000;

		/* Shift Right */
		#10 _MODE = 1'b0; _SER = 1'b0;
		#10 _SER = 1'b1;
		#10 _SER = 1'b1;
		#10 _SER = 1'b1;
		#10 _SER = 1'b1;
		#10 _SER = 1'b0;
		#10 _SER = 1'b0;
		#10 _SER = 1'b0;
		#10 _SER = 1'b0;

		/* Shift Left is performed by connecting _QD to _C, _QC to _B, _QB to _A and performing a parallel load. */
		#10 _MODE = 1'b1; left_shift = 1'b1; _D = 1'b1;
		#10 _D = 1'b1;
		#10 _D = 1'b1;
		#10 _D = 1'b1;
		#10 _D = 1'b0;
		#10 _D = 1'b0;
		#10 _D = 1'b0;
		#10 _D = 1'b0;

		#10 $stop;
	end	
	
endmodule