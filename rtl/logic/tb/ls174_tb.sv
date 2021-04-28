/*#########################################################################
#File Name:     ls174_tb.sv
#Description:   SN74LS174 - Hex/Quadruple D-Type Flip-Flops with Clear.
#                            
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

`timescale 1ps / 1ps
module ls174_tb; 
/*-------------------------- Inputs and Outputs --------------------------*/
	reg    _CLK, _CLR, _1D, _2D, _3D, _4D, _5D, _6D;	
 	wire   _1Q, _2Q, _3Q, _4Q, _5Q, _6Q;

/*--------------------- Instantiate Device Under Test --------------------*/
	ls174 DUT( 
		._CLK(_CLK),
		._CLR(_CLR),
		._1D(_1D),
		._1Q(_1Q),
		._2D(_2D),
		._2Q(_2Q),
		._3D(_3D),
		._3Q(_3Q),		
		._4D(_4D),
		._4Q(_4Q),
		._5D(_5D),
		._5Q(_5Q),
		._6D(_6D),
		._6Q(_6Q)
	);

/*--------------------------------- Clock --------------------------------*/
	always begin
		#5 _CLK = ~_CLK;
	end

/*--------------------------------- Test ---------------------------------*/
	initial begin
		/* Initialise DUT */
		_CLR = 1'b0; _CLK = 1'b1; {_6D,_5D,_4D,_3D,_2D,_1D} = 6'b111111;
		#5 _CLR = 1'b1;
		#5;

		/* Check Inputs */
		#10 {_6D,_5D,_4D,_3D,_2D,_1D} = 6'b000001;
		#10 {_6D,_5D,_4D,_3D,_2D,_1D} = 6'b000010;
		#10 {_6D,_5D,_4D,_3D,_2D,_1D} = 6'b000100;
		#10 {_6D,_5D,_4D,_3D,_2D,_1D} = 6'b001000;
		#10 {_6D,_5D,_4D,_3D,_2D,_1D} = 6'b010000;
		#10 {_6D,_5D,_4D,_3D,_2D,_1D} = 6'b100000;

		#10 {_6D,_5D,_4D,_3D,_2D,_1D} = 6'b111110;
		#10 {_6D,_5D,_4D,_3D,_2D,_1D} = 6'b111101;
		#10 {_6D,_5D,_4D,_3D,_2D,_1D} = 6'b111011;
		#10 {_6D,_5D,_4D,_3D,_2D,_1D} = 6'b110111;
		#10 {_6D,_5D,_4D,_3D,_2D,_1D} = 6'b101111;
		#10 {_6D,_5D,_4D,_3D,_2D,_1D} = 6'b011111;
		
		/* Check Clear */
		#10 {_6D,_5D,_4D,_3D,_2D,_1D} = 6'b111111;
		#10 _CLR = 1'b0;
		#5 _CLR = 1'b1;
		#5;
		
		#10 $stop;
	end
	
endmodule