/*#########################################################################
#File Name:     ls163_tb.sv
#Description:   SN74LS163A - Synchronous 4-Bit Counters
#    			                      
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

`timescale 1ps / 1ps
module ls163_tb;
/*-------------------------- Inputs and Outputs --------------------------*/	
	reg _CLK, _CLR, _LOAD, _ENP, _ENT, _A, _B, _C, _D;
	wire _RCO, _QA, _QB, _QC, _QD;

/*--------------------- Instantiate Device Under Test --------------------*/
	ls163 DUT( 
		._CLK(_CLK),
		._CLR(_CLR),
		._LOAD(_LOAD),
		._ENP(_ENP),
		._ENT(_ENT),
		._RCO(_RCO),
		._A(_A),
		._B(_B),
		._C(_C),
		._D(_D),
		._QA(_QA),
		._QB(_QB),
		._QC(_QC),
		._QD(_QD)
	);

/*--------------------------------- Clock --------------------------------*/
	always begin
		#5 _CLK = ~_CLK;
	end

/*--------------------------------- Test ---------------------------------*/
	initial begin
		/* Clear registers */
		_CLK = 1'b1; _CLR = 1'b1; _LOAD = 1'b1; _ENP = 1'b0; _ENT = 1'b0; {_D,_C,_B,_A} = 4'b1111;
		#10 _CLR = 1'b0;
		#10 _CLR = 1'b1;
		#10;
		
		/* Load values into registers  */
		#10 _LOAD = 1'b0; {_D,_C,_B,_A} = 4'b0001;
		#10 _LOAD = 1'b1; 
		
		#10 _LOAD = 1'b0; {_D,_C,_B,_A} = 4'b1110;
		#10 _LOAD = 1'b1;

		#10 _LOAD = 1'b0; {_D,_C,_B,_A} = 4'b0010;
		#10 _LOAD = 1'b1; 
		
		#10 _LOAD = 1'b0; {_D,_C,_B,_A} = 4'b1101;
		#10 _LOAD = 1'b1;

		#10 _LOAD = 1'b0; {_D,_C,_B,_A} = 4'b0100;
		#10 _LOAD = 1'b1; 
		
		#10 _LOAD = 1'b0; {_D,_C,_B,_A} = 4'b1011;
		#10 _LOAD = 1'b1;

		#10 _LOAD = 1'b0; {_D,_C,_B,_A} = 4'b1000;
		#10 _LOAD = 1'b1; 
		
		#10 _LOAD = 1'b0; {_D,_C,_B,_A} = 4'b0111;
		#10 _LOAD = 1'b1;

		#10 _LOAD = 1'b0; {_D,_C,_B,_A} = 4'b1111;
		#10 _LOAD = 1'b1;
		#10;

		/* Clear registers */
		#10 _CLR = 1'b0;
		#10 _CLR = 1'b1;
		#10;

		/* Check counting*/
		_ENP = 1'b1; _ENT = 1'b1;
		#200 _ENP = 1'b0; _ENT = 1'b0;;

		/* Clear registers */
		#10 _CLR = 1'b0;
		#10 _CLR = 1'b1;
		#10;

		/* Check inhibit*/
		_ENP = 1'b0; _ENT = 1'b0;
		#200;

		_ENP = 1'b0; _ENT = 1'b1;
		#200;

		_ENP = 1'b1; _ENT = 1'b0;
		#200;

		#10 $stop;
	end
	
endmodule