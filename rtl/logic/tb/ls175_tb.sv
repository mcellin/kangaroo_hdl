/*#########################################################################
#File Name:     ls175_tb.sv
#Description:   SN74LS175 - Hex/Quadruple D-Type Flip-Flops with Clear.
#                            
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

`timescale 1ps / 1ps
module ls175_tb; 
/*-------------------------- Inputs and Outputs --------------------------*/
	reg    _CLK, _CLR, _1D, _2D, _3D, _4D;
 	wire   _1Q, _2Q, _3Q, _4Q, _1Q_INV, _2Q_INV, _3Q_INV, _4Q_INV;

/*--------------------- Instantiate Device Under Test --------------------*/
	ls175 DUT  ( 
		._CLK(_CLK),
		._CLR(_CLR),
		._1D(_1D),
		._1Q(_1Q),
		._1Q_INV(_1Q_INV),
		._2D(_2D),
		._2Q(_2Q),
		._2Q_INV(_2Q_INV),
		._3D(_3D),
		._3Q(_3Q),
		._3Q_INV(_3Q_INV),		
		._4D(_4D),
		._4Q(_4Q),
		._4Q_INV(_4Q_INV)
	);

/*--------------------------------- Clock --------------------------------*/
	always begin
		#5 _CLK = ~_CLK;
	end

/*--------------------------------- Test ---------------------------------*/
	initial begin
		/* Initialise DUT */
		_CLR = 1'b0; _CLK = 1'b1; {_4D,_3D,_2D,_1D} = 4'b1111;
		#5 _CLR = 1'b1;
		#5;

		/* Check Inputs */
		#10 {_4D,_3D,_2D,_1D} = 4'b0001;
		#10 {_4D,_3D,_2D,_1D} = 4'b0010;
		#10 {_4D,_3D,_2D,_1D} = 4'b0100;
		#10 {_4D,_3D,_2D,_1D} = 4'b1000;

		#10 {_4D,_3D,_2D,_1D} = 4'b1110;
		#10 {_4D,_3D,_2D,_1D} = 4'b1101;
		#10 {_4D,_3D,_2D,_1D} = 4'b1011;
		#10 {_4D,_3D,_2D,_1D} = 4'b0111;
		
		/* Check Clear */
		#10 {_4D,_3D,_2D,_1D} = 4'b1111;
		#10 _CLR = 1'b0;
		#5 _CLR = 1'b1;
		#5;
		
		#10 $stop;
	end
endmodule