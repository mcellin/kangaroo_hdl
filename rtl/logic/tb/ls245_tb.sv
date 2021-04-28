/*#########################################################################
#File Name:     ls245_tb.sv
#Description:   SN74LS245 - Octal Bus Transceivers With 3-State Outputs test
#    			bench.                      
#
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

`timescale 1ps / 1ps
module ls245_tb; 
/*-------------------------- Inputs and Outputs --------------------------*/
	reg _INA, _INB;
	reg    _DIR, _OE;
 	wire   _A1, _A2, _A3, _A4, _A5, _A6, _A7, _A8, _B1, _B2, _B3, _B4, _B5, _B6, _B7, _B8;

/*-------------------------- Bidirectional Port --------------------------*/	
	assign _A1 = _OE == 0 ? (_DIR == 1 ? _INA : 1'bz) : 1'bz;
	assign _A2 = _OE == 0 ? (_DIR == 1 ? _INA : 1'bz) : 1'bz;
	assign _A3 = _OE == 0 ? (_DIR == 1 ? _INA : 1'bz) : 1'bz;
	assign _A4 = _OE == 0 ? (_DIR == 1 ? _INA : 1'bz) : 1'bz;
	assign _A5 = _OE == 0 ? (_DIR == 1 ? _INA : 1'bz) : 1'bz;
	assign _A6 = _OE == 0 ? (_DIR == 1 ? _INA : 1'bz) : 1'bz;
	assign _A7 = _OE == 0 ? (_DIR == 1 ? _INA : 1'bz) : 1'bz;
	assign _A8 = _OE == 0 ? (_DIR == 1 ? _INA : 1'bz) : 1'bz;

	assign _B1 = _OE == 0 ? (_DIR == 0 ? _INB : 1'bz) : 1'bz;
	assign _B2 = _OE == 0 ? (_DIR == 0 ? _INB : 1'bz) : 1'bz;
	assign _B3 = _OE == 0 ? (_DIR == 0 ? _INB : 1'bz) : 1'bz;
	assign _B4 = _OE == 0 ? (_DIR == 0 ? _INB : 1'bz) : 1'bz;
	assign _B5 = _OE == 0 ? (_DIR == 0 ? _INB : 1'bz) : 1'bz;
	assign _B6 = _OE == 0 ? (_DIR == 0 ? _INB : 1'bz) : 1'bz;
	assign _B7 = _OE == 0 ? (_DIR == 0 ? _INB : 1'bz) : 1'bz;
	assign _B8 = _OE == 0 ? (_DIR == 0 ? _INB : 1'bz) : 1'bz;

/*--------------------- Instantiate Device Under Test --------------------*/
	ls245  
	DUT  ( 
		._DIR(_DIR),
		._OE(_OE),
		._A1(_A1),
		._B1(_B1),
		._A2(_A2),
		._B2(_B2),
		._A3(_A3),
		._B3(_B3),
		._A4(_A4),
		._B4(_B4),
		._A5(_A5),
		._B5(_B5),
		._A6(_A6),
		._B6(_B6),
		._A7(_A7),
		._B7(_B7),
		._A8(_A8),
		._B8(_B8));


/*--------------------------------- Test ---------------------------------*/
	initial begin
		/*Input A to Output B test. Output Enabled.*/	
		_OE = 1'b0; _DIR = 1'b1; _INA = 1'b0; _INB = 1'b0;
		#0 $display("_OE = %b, _DIR = %b, _INA = %b, _INB = %b, _A1 = %b, _B1 = %b", _OE, _DIR, _INA, _INB, _A1, _B1);
		#10 _INA = 1'b1;
		#0 $display("_OE = %b, _DIR = %b, _INA = %b, _INB = %b, _A1 = %b, _B1 = %b", _OE, _DIR, _INA, _INB, _A1, _B1);
		
		/*Input A to Output B test. Output Enabled.*/	
		#10 _OE = 1'b0; _DIR = 1'b0; _INA = 1'b0; _INB = 1'b0; 
		#0 $display("_OE = %b, _DIR = %b, _INA = %b, _INB = %b, _A1 = %b, _B1 = %b", _OE, _DIR, _INA, _INB, _A1, _B1);
		#10 _INB = 1'b1;
		#0 $display("_OE = %b, _DIR = %b, _INA = %b, _INB = %b, _A1 = %b, _B1 = %b", _OE, _DIR, _INA, _INB, _A1, _B1);
		
		/*Input B to Output A test. Output Disabled.*/	
		#10 _OE = 1'b1; _DIR = 1'b1; _INA = 1'b0; _INB = 1'b0;
		#0 $display("_OE = %b, _DIR = %b, _INA = %b, _INB = %b, _A1 = %b, _B1 = %b", _OE, _DIR, _INA, _INB, _A1, _B1);
		#10 _INA = 1'b1;
		#0 $display("_OE = %b, _DIR = %b, _INA = %b, _INB = %b, _A1 = %b, _B1 = %b", _OE, _DIR, _INA, _INB, _A1, _B1);
		
		/*Input B to Output A test. Output Disabled.*/	
		#10 _OE = 1'b1; _DIR = 1'b0; _INA = 1'b0; _INB = 1'b0; 
		#0 $display("_OE = %b, _DIR = %b, _INA = %b, _INB = %b, _A1 = %b, _B1 = %b", _OE, _DIR, _INA, _INB, _A1, _B1);
		#10 _INB = 1'b1;
		#0 $display("_OE = %b, _DIR = %b, _INA = %b, _INB = %b, _A1 = %b, _B1 = %b", _OE, _DIR, _INA, _INB, _A1, _B1);

		#10 $stop;
	end
	
endmodule