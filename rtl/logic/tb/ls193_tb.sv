/*#########################################################################
#File Name:     ls193_tb.sv
#Description:   SN74LS193N - Synchronous 4-Bit Counters test bench.
#    			                      
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

`timescale 1ps / 1ps
module ls193_tb();
/*-------------------------- Inputs and Outputs --------------------------*/
	reg _CLR, _LOAD, _UP, _DOWN, _A, _B, _C, _D;
	wire _BO, _CO, _QA, _QB, _QC, _QD;

/*--------------------- Instantiate Device Under Test --------------------*/
	ls193 DUT(
		._CLR(_CLR),
		._UP(_UP),
		._DOWN(_DOWN),
		._LOAD(_LOAD),
		._A(_A),
		._B(_B),
		._C(_C),
		._D(_D),
		._CO(_CO),
		._BO(_BO),
		._QA(_QA),
		._QB(_QB),
		._QC(_QC),
		._QD(_QD)
	);

/*--------------------------------- Test ---------------------------------*/
	initial begin
		/* Clear registers */
		#10 _CLR = 1'b0; _LOAD = 1'b1; _UP = 1'b1; _DOWN = 1'b1; _A = 1'b0; _B = 1'b0; _C = 1'b0; _D = 1'b0;
		#10 _CLR = 1'b1;
		#10 _CLR = 1'b0;
		#100;
		#0 $display("_CLR = %b, _LOAD = %b, _UP = %b, _DOWN = %b, _A = %b, _B = %b, _C = %b, _D = %b", _CLR, _LOAD, _UP, _DOWN, _A, _B, _C, _D);
		#0 $display("_BO = %b, _CO = %b, _QA = %b, _QB = %b, _QC = %b, _QD = %b", _BO, _CO, _QA, _QB, _QC, _QD);

		/* Load values into registers  */
		#10 _LOAD = 1'b1; _A = 1'b0; _B = 1'b1; _C = 1'b1; _D = 1'b1;
		#10 _LOAD = 1'b0; 
		#0 $display("_CLR = %b, _LOAD = %b, _UP = %b, _DOWN = %b, _A = %b, _B = %b, _C = %b, _D = %b", _CLR, _LOAD, _UP, _DOWN, _A, _B, _C, _D);
		#0 $display("_BO = %b, _CO = %b, _QA = %b, _QB = %b, _QC = %b, _QD = %b", _BO, _CO, _QA, _QB, _QC, _QD);
		
		#10 _LOAD = 1'b1; _A = 1'b1; _B = 1'b0; _C = 1'b1; _D = 1'b1;
		#10 _LOAD = 1'b0;
		#0 $display("_CLR = %b, _LOAD = %b, _UP = %b, _DOWN = %b, _A = %b, _B = %b, _C = %b, _D = %b", _CLR, _LOAD, _UP, _DOWN, _A, _B, _C, _D);
		#0 $display("_BO = %b, _CO = %b, _QA = %b, _QB = %b, _QC = %b, _QD = %b", _BO, _CO, _QA, _QB, _QC, _QD);

		#10 _LOAD = 1'b1; _A = 1'b1; _B = 1'b1; _C = 1'b0; _D = 1'b1;
		#10 _LOAD = 1'b0;
		#0 $display("_CLR = %b, _LOAD = %b, _UP = %b, _DOWN = %b, _A = %b, _B = %b, _C = %b, _D = %b", _CLR, _LOAD, _UP, _DOWN, _A, _B, _C, _D);
		#0 $display("_BO = %b, _CO = %b, _QA = %b, _QB = %b, _QC = %b, _QD = %b", _BO, _CO, _QA, _QB, _QC, _QD);
		
		#10 _LOAD = 1'b1; _A = 1'b1; _B = 1'b1; _C = 1'b1; _D = 1'b0;
		#10 _LOAD = 1'b0;
		#0 $display("_CLR = %b, _LOAD = %b, _UP = %b, _DOWN = %b, _A = %b, _B = %b, _C = %b, _D = %b", _CLR, _LOAD, _UP, _DOWN, _A, _B, _C, _D);
		#0 $display("_BO = %b, _CO = %b, _QA = %b, _QB = %b, _QC = %b, _QD = %b", _BO, _CO, _QA, _QB, _QC, _QD);

		#10 _LOAD = 1'b1; _A = 1'b1; _B = 1'b1; _C = 1'b1; _D = 1'b1;
		#10 _LOAD = 1'b0;
		#0 $display("_CLR = %b, _LOAD = %b, _UP = %b, _DOWN = %b, _A = %b, _B = %b, _C = %b, _D = %b", _CLR, _LOAD, _UP, _DOWN, _A, _B, _C, _D);
		#0 $display("_BO = %b, _CO = %b, _QA = %b, _QB = %b, _QC = %b, _QD = %b", _BO, _CO, _QA, _QB, _QC, _QD);

		/* Clear registers */
		#10 _LOAD = 1'b1; 
		#10 _CLR = 1'b1;
		#10 _CLR = 1'b0;
		#0 $display("_CLR = %b, _LOAD = %b, _UP = %b, _DOWN = %b, _A = %b, _B = %b, _C = %b, _D = %b", _CLR, _LOAD, _UP, _DOWN, _A, _B, _C, _D);
		#0 $display("_BO = %b, _CO = %b, _QA = %b, _QB = %b, _QC = %b, _QD = %b", _BO, _CO, _QA, _QB, _QC, _QD);

		/* Check counting upwards & overflow */
		#10 _UP = 1'b0; // 1
		#10 _UP = 1'b1; 
		#10 _UP = 1'b0; // 2
		#10 _UP = 1'b1;
		#10 _UP = 1'b0; // 3
		#10 _UP = 1'b1;
		#10 _UP = 1'b0; // 4
		#10 _UP = 1'b1;
		#10 _UP = 1'b0; // 5
		#10 _UP = 1'b1;
		#10 _UP = 1'b0; // 6
		#10 _UP = 1'b1;
		#10 _UP = 1'b0; // 7
		#10 _UP = 1'b1;
		#10 _UP = 1'b0; // 8
		#10 _UP = 1'b1;
		#10 _UP = 1'b0; // 9
		#10 _UP = 1'b1;
		#10 _UP = 1'b0; // 10
		#10 _UP = 1'b1;
		#10 _UP = 1'b0; // 11
		#10 _UP = 1'b1;
		#10 _UP = 1'b0; // 12
		#10 _UP = 1'b1;
		#10 _UP = 1'b0; // 13
		#10 _UP = 1'b1;
		#10 _UP = 1'b0; // 14
		#10 _UP = 1'b1;
		#10 _UP = 1'b0; // 15		
		#10 _UP = 1'b1;
		#10 _UP = 1'b0; // 0
		#10 _UP = 1'b1;
		#10 _UP = 1'b0; // 1
		#10 _UP = 1'b1;
		#10 _UP = 1'b0; // 2
		#10 _UP = 1'b1;
		#10 _UP = 1'b0; // 3
		#10 _UP = 1'b1;
		#10;

		/* Clear registers */
		#10 _CLR = 1'b1;
		#10 _CLR = 1'b0;
		#0 $display("_CLR = %b, _LOAD = %b, _UP = %b, _DOWN = %b, _A = %b, _B = %b, _C = %b, _D = %b", _CLR, _LOAD, _UP, _DOWN, _A, _B, _C, _D);
		#0 $display("_BO = %b, _CO = %b, _QA = %b, _QB = %b, _QC = %b, _QD = %b", _BO, _CO, _QA, _QB, _QC, _QD);

		/* Check counting upwards & overflow */
		#10 _DOWN = 1'b0; // 15
		#10 _DOWN = 1'b1;
		#10 _DOWN = 1'b0; // 14
		#10 _DOWN = 1'b1;
		#10 _DOWN = 1'b0; // 13
		#10 _DOWN = 1'b1;
		#10 _DOWN = 1'b0; // 12
		#10 _DOWN = 1'b1;
		#10 _DOWN = 1'b0; // 11
		#10 _DOWN = 1'b1;
		#10 _DOWN = 1'b0; // 10
		#10 _DOWN = 1'b1;
		#10 _DOWN = 1'b0; // 9
		#10 _DOWN = 1'b1;
		#10 _DOWN = 1'b0; // 8
		#10 _DOWN = 1'b1;
		#10 _DOWN = 1'b0; // 7
		#10 _DOWN = 1'b1;
		#10 _DOWN = 1'b0; // 6
		#10 _DOWN = 1'b1;
		#10 _DOWN = 1'b0; // 5
		#10 _DOWN = 1'b1;
		#10 _DOWN = 1'b0; // 4
		#10 _DOWN = 1'b1;
		#10 _DOWN = 1'b0; // 3
		#10 _DOWN = 1'b1;
		#10 _DOWN = 1'b0; // 2
		#10 _DOWN = 1'b1;
		#10 _DOWN = 1'b0; // 1	
		#10 _DOWN = 1'b1;
		#10 _DOWN = 1'b0; // 0
		#10 _DOWN = 1'b1;
		#10 _DOWN = 1'b0; // 15
		#10 _DOWN = 1'b1;
		#10 _DOWN = 1'b0; // 14
		#10 _DOWN = 1'b1; 
		#10 _DOWN = 1'b0; // 13
		#10 _DOWN = 1'b1; 
		#10;

		/* Clear registers */
		#10 _CLR = 1'b1;
		#10 _CLR = 1'b0;
		#0 $display("_CLR = %b, _LOAD = %b, _UP = %b, _DOWN = %b, _A = %b, _B = %b, _C = %b, _D = %b", _CLR, _LOAD, _UP, _DOWN, _A, _B, _C, _D);
		#0 $display("_BO = %b, _CO = %b, _QA = %b, _QB = %b, _QC = %b, _QD = %b", _BO, _CO, _QA, _QB, _QC, _QD);

		#10 $stop;
	end
	
endmodule