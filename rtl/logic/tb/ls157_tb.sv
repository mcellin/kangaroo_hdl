/*#########################################################################
#File Name:     ls157_tb.sv
#Description:   SN74LS157N - Quadruple 2-Line to 1-Line Data Selectors/
#               Multiplexers test bench.            
#
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

`timescale 1ps / 1ps
module ls157_tb; 
/*-------------------------- Inputs and Outputs --------------------------*/
	reg    _AB, _G, _1A, _1B, _2A, _2B, _3A, _3B, _4A, _4B;
 	wire   _1Y, _2Y, _3Y, _4Y;
	
/*--------------------- Instantiate Device Under Test --------------------*/
	ls157 DUT( 
		._AB(_AB),
		._G(_G),
		._1A(_1A),
		._1B(_1B),
		._1Y(_1Y),		
		._2A(_2A),
		._2B(_2B),
		._2Y(_2Y),
		._3A(_3A),
		._3B(_3B),
		._3Y(_3Y),		
		._4A(_4A),
		._4B(_4B),
		._4Y(_4Y)
	);

/*--------------------------------- Test ---------------------------------*/
	initial begin
		// Enable output and test 2-1 multiplexing
		_AB = 1'b0; _G = 1'b0; {_4A, _3A, _2A, _1A} = 4'b1110; {_4B, _3B, _2B, _1B} = 4'b0001;
		#0 $display("_AB = %b, _G = %b",_AB, _G);
		#0 $display("_1A = %b, _2A = %b, _3A = %b, _4A = %b", _1A, _2A, _3A, _4A);
		#0 $display("_1B = %b, _2B = %b, _3B = %b, _4B = %b", _1B, _2B, _3B, _4B);
		#0 $display("_1Y = %b, _2Y = %b, _3Y = %b, _4Y = %b", _1Y, _2Y, _3Y, _4Y);

		#10 _AB = 1'b1;
		#0 $display("_AB = %b, _G = %b",_AB, _G);
		#0 $display("_1A = %b, _2A = %b, _3A = %b, _4A = %b", _1A, _2A, _3A, _4A);
		#0 $display("_1B = %b, _2B = %b, _3B = %b, _4B = %b", _1B, _2B, _3B, _4B);
		#0 $display("_1Y = %b, _2Y = %b, _3Y = %b, _4Y = %b", _1Y, _2Y, _3Y, _4Y);

		#10 _AB = 1'b0; {_4A, _3A, _2A, _1A} = 4'b1101; {_4B, _3B, _2B, _1B} = 4'b0010;
		#0 $display("_AB = %b, _G = %b",_AB, _G);
		#0 $display("_1A = %b, _2A = %b, _3A = %b, _4A = %b", _1A, _2A, _3A, _4A);
		#0 $display("_1B = %b, _2B = %b, _3B = %b, _4B = %b", _1B, _2B, _3B, _4B);
		#0 $display("_1Y = %b, _2Y = %b, _3Y = %b, _4Y = %b", _1Y, _2Y, _3Y, _4Y);

		#10 _AB = 1'b1;
		#0 $display("_AB = %b, _G = %b",_AB, _G);
		#0 $display("_1A = %b, _2A = %b, _3A = %b, _4A = %b", _1A, _2A, _3A, _4A);
		#0 $display("_1B = %b, _2B = %b, _3B = %b, _4B = %b", _1B, _2B, _3B, _4B);
		#0 $display("_1Y = %b, _2Y = %b, _3Y = %b, _4Y = %b", _1Y, _2Y, _3Y, _4Y);

		#10 _AB = 1'b0; {_4A, _3A, _2A, _1A} = 4'b1011; {_4B, _3B, _2B, _1B} = 4'b0100;
		#0 $display("_AB = %b, _G = %b",_AB, _G);
		#0 $display("_1A = %b, _2A = %b, _3A = %b, _4A = %b", _1A, _2A, _3A, _4A);
		#0 $display("_1B = %b, _2B = %b, _3B = %b, _4B = %b", _1B, _2B, _3B, _4B);
		#0 $display("_1Y = %b, _2Y = %b, _3Y = %b, _4Y = %b", _1Y, _2Y, _3Y, _4Y);

		#10 _AB = 1'b1;
		#0 $display("_AB = %b, _G = %b",_AB, _G);
		#0 $display("_1A = %b, _2A = %b, _3A = %b, _4A = %b", _1A, _2A, _3A, _4A);
		#0 $display("_1B = %b, _2B = %b, _3B = %b, _4B = %b", _1B, _2B, _3B, _4B);
		#0 $display("_1Y = %b, _2Y = %b, _3Y = %b, _4Y = %b", _1Y, _2Y, _3Y, _4Y);

		#10 _AB = 1'b0; {_4A, _3A, _2A, _1A} = 4'b0111; {_4B, _3B, _2B, _1B} = 4'b1000;
		#0 $display("_AB = %b, _G = %b",_AB, _G);
		#0 $display("_1A = %b, _2A = %b, _3A = %b, _4A = %b", _1A, _2A, _3A, _4A);
		#0 $display("_1B = %b, _2B = %b, _3B = %b, _4B = %b", _1B, _2B, _3B, _4B);
		#0 $display("_1Y = %b, _2Y = %b, _3Y = %b, _4Y = %b", _1Y, _2Y, _3Y, _4Y);

		#10 _AB = 1'b1;
		#0 $display("_AB = %b, _G = %b",_AB, _G);
		#0 $display("_1A = %b, _2A = %b, _3A = %b, _4A = %b", _1A, _2A, _3A, _4A);
		#0 $display("_1B = %b, _2B = %b, _3B = %b, _4B = %b", _1B, _2B, _3B, _4B);
		#0 $display("_1Y = %b, _2Y = %b, _3Y = %b, _4Y = %b", _1Y, _2Y, _3Y, _4Y);

		// Disable output and check all outputs are low
		#10 _AB = 1'b0; _G = 1'b1; {_4A, _3A, _2A, _1A} = 4'b1110; {_4B, _3B, _2B, _1B} = 4'b0001;
		#0 $display("_AB = %b, _G = %b",_AB, _G);
		#0 $display("_1A = %b, _2A = %b, _3A = %b, _4A = %b", _1A, _2A, _3A, _4A);
		#0 $display("_1B = %b, _2B = %b, _3B = %b, _4B = %b", _1B, _2B, _3B, _4B);
		#0 $display("_1Y = %b, _2Y = %b, _3Y = %b, _4Y = %b", _1Y, _2Y, _3Y, _4Y);

		#10 _AB = 1'b1;
		#0 $display("_AB = %b, _G = %b",_AB, _G);
		#0 $display("_1A = %b, _2A = %b, _3A = %b, _4A = %b", _1A, _2A, _3A, _4A);
		#0 $display("_1B = %b, _2B = %b, _3B = %b, _4B = %b", _1B, _2B, _3B, _4B);
		#0 $display("_1Y = %b, _2Y = %b, _3Y = %b, _4Y = %b", _1Y, _2Y, _3Y, _4Y);

		#10 _AB = 1'b0; {_4A, _3A, _2A, _1A} = 4'b1101; {_4B, _3B, _2B, _1B} = 4'b0010;
		#0 $display("_AB = %b, _G = %b",_AB, _G);
		#0 $display("_1A = %b, _2A = %b, _3A = %b, _4A = %b", _1A, _2A, _3A, _4A);
		#0 $display("_1B = %b, _2B = %b, _3B = %b, _4B = %b", _1B, _2B, _3B, _4B);
		#0 $display("_1Y = %b, _2Y = %b, _3Y = %b, _4Y = %b", _1Y, _2Y, _3Y, _4Y);

		#10 _AB = 1'b1;
		#0 $display("_AB = %b, _G = %b",_AB, _G);
		#0 $display("_1A = %b, _2A = %b, _3A = %b, _4A = %b", _1A, _2A, _3A, _4A);
		#0 $display("_1B = %b, _2B = %b, _3B = %b, _4B = %b", _1B, _2B, _3B, _4B);
		#0 $display("_1Y = %b, _2Y = %b, _3Y = %b, _4Y = %b", _1Y, _2Y, _3Y, _4Y);

		#10 _AB = 1'b0; {_4A, _3A, _2A, _1A} = 4'b1011; {_4B, _3B, _2B, _1B} = 4'b0100;
		#0 $display("_AB = %b, _G = %b",_AB, _G);
		#0 $display("_1A = %b, _2A = %b, _3A = %b, _4A = %b", _1A, _2A, _3A, _4A);
		#0 $display("_1B = %b, _2B = %b, _3B = %b, _4B = %b", _1B, _2B, _3B, _4B);
		#0 $display("_1Y = %b, _2Y = %b, _3Y = %b, _4Y = %b", _1Y, _2Y, _3Y, _4Y);

		#10 _AB = 1'b1;
		#0 $display("_AB = %b, _G = %b",_AB, _G);
		#0 $display("_1A = %b, _2A = %b, _3A = %b, _4A = %b", _1A, _2A, _3A, _4A);
		#0 $display("_1B = %b, _2B = %b, _3B = %b, _4B = %b", _1B, _2B, _3B, _4B);
		#0 $display("_1Y = %b, _2Y = %b, _3Y = %b, _4Y = %b", _1Y, _2Y, _3Y, _4Y);

		#10 _AB = 1'b0; {_4A, _3A, _2A, _1A} = 4'b0111; {_4B, _3B, _2B, _1B} = 4'b1000;
		#0 $display("_AB = %b, _G = %b",_AB, _G);
		#0 $display("_1A = %b, _2A = %b, _3A = %b, _4A = %b", _1A, _2A, _3A, _4A);
		#0 $display("_1B = %b, _2B = %b, _3B = %b, _4B = %b", _1B, _2B, _3B, _4B);
		#0 $display("_1Y = %b, _2Y = %b, _3Y = %b, _4Y = %b", _1Y, _2Y, _3Y, _4Y);

		#10 _AB = 1'b1;
		#0 $display("_AB = %b, _G = %b",_AB, _G);
		#0 $display("_1A = %b, _2A = %b, _3A = %b, _4A = %b", _1A, _2A, _3A, _4A);
		#0 $display("_1B = %b, _2B = %b, _3B = %b, _4B = %b", _1B, _2B, _3B, _4B);
		#0 $display("_1Y = %b, _2Y = %b, _3Y = %b, _4Y = %b", _1Y, _2Y, _3Y, _4Y);

		#10 $stop;
	end
	
endmodule