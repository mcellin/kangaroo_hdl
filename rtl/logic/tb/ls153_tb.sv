/*#########################################################################
#File Name:     ls153_tb.sv
#Description:   SN74LS153N - Dual 4-Line to 1-Line Data Selectors/Multiplexers
#               test bench.             
#
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

`timescale 1ps / 1ps
module ls153_tb; 
/*-------------------------- Inputs and Outputs --------------------------*/
	reg    _A, _B, _1G, _1C0, _1C1, _1C2, _1C3, _2G, _2C0, _2C1, _2C2, _2C3; 
 	wire   _1Y, _2Y;
	
/*--------------------- Instantiate Device Under Test --------------------*/
	ls153 DUT( 
		._A(_A),
		._B(_B),
		._1G(_1G),
		._1C0(_1C0),
		._1C1(_1C1),		
		._1C2(_1C2),
		._1C3(_1C3),
		._1Y(_1Y),
		._2G(_2G),
		._2C0(_2C0),
		._2C1(_2C1),		
		._2C2(_2C2),
		._2C3(_2C3),
		._2Y(_2Y)
	);

/*--------------------------------- Test ---------------------------------*/
	initial begin
		// Enable output and test 4-1 multiplexing
		_B = 1'b0; _A = 1'b0; _1G = 1'b0; {_1C3,_1C2,_1C1,_1C0} = 4'b1110; _2G = 1'b0; {_2C3,_2C2,_2C1,_2C0} = 4'b1110;
		#0 $display("_B = %b, _A = %b, _1G = %b, _2G = %b",_B, _A, _1G, _2G);
		#0 $display("_1C0 = %b, _1C1 = %b, _1C2 = %b, _1C3 = %b", _1C0, _1C1, _1C2, _1C3);
		#0 $display("_2C0 = %b, _2C1 = %b, _2C2 = %b, _2C3 = %b", _2C0, _2C1, _2C2, _2C3);
		#0 $display("_1Y = %b, _2Y = %b", _1Y, _2Y);

		#10 _B = 1'b0; _A = 1'b0; {_1C3,_1C2,_1C1,_1C0} = 4'b0001; {_2C3,_2C2,_2C1,_2C0} = 4'b0001;
		#0 $display("_B = %b, _A = %b, _1G = %b, _2G = %b",_B, _A, _1G, _2G);
		#0 $display("_1C0 = %b, _1C1 = %b, _1C2 = %b, _1C3 = %b", _1C0, _1C1, _1C2, _1C3);
		#0 $display("_2C0 = %b, _2C1 = %b, _2C2 = %b, _2C3 = %b", _2C0, _2C1, _2C2, _2C3);
		#0 $display("_1Y = %b, _2Y = %b", _1Y, _2Y);

		#10 _B = 1'b0; _A = 1'b1; {_1C3,_1C2,_1C1,_1C0} = 4'b1101; {_2C3,_2C2,_2C1,_2C0} = 4'b1101;
		#0 $display("_B = %b, _A = %b, _1G = %b, _2G = %b",_B, _A, _1G, _2G);
		#0 $display("_1C0 = %b, _1C1 = %b, _1C2 = %b, _1C3 = %b", _1C0, _1C1, _1C2, _1C3);
		#0 $display("_2C0 = %b, _2C1 = %b, _2C2 = %b, _2C3 = %b", _2C0, _2C1, _2C2, _2C3);
		#0 $display("_1Y = %b, _2Y = %b", _1Y, _2Y);

		#10 _B = 1'b0; _A = 1'b1; {_1C3,_1C2,_1C1,_1C0} = 4'b0010; {_2C3,_2C2,_2C1,_2C0} = 4'b0010;
		#0 $display("_B = %b, _A = %b, _1G = %b, _2G = %b",_B, _A, _1G, _2G);
		#0 $display("_1C0 = %b, _1C1 = %b, _1C2 = %b, _1C3 = %b", _1C0, _1C1, _1C2, _1C3);
		#0 $display("_2C0 = %b, _2C1 = %b, _2C2 = %b, _2C3 = %b", _2C0, _2C1, _2C2, _2C3);
		#0 $display("_1Y = %b, _2Y = %b", _1Y, _2Y);

		#10 _B = 1'b1; _A = 1'b0; {_1C3,_1C2,_1C1,_1C0} = 4'b1011; {_2C3,_2C2,_2C1,_2C0} = 4'b1011;
		#0 $display("_B = %b, _A = %b, _1G = %b, _2G = %b",_B, _A, _1G, _2G);
		#0 $display("_1C0 = %b, _1C1 = %b, _1C2 = %b, _1C3 = %b", _1C0, _1C1, _1C2, _1C3);
		#0 $display("_2C0 = %b, _2C1 = %b, _2C2 = %b, _2C3 = %b", _2C0, _2C1, _2C2, _2C3);
		#0 $display("_1Y = %b, _2Y = %b", _1Y, _2Y);

		#10 _B = 1'b1; _A = 1'b0; {_1C3,_1C2,_1C1,_1C0} = 4'b0100; {_2C3,_2C2,_2C1,_2C0} = 4'b0100;
		#0 $display("_B = %b, _A = %b, _1G = %b, _2G = %b",_B, _A, _1G, _2G);
		#0 $display("_1C0 = %b, _1C1 = %b, _1C2 = %b, _1C3 = %b", _1C0, _1C1, _1C2, _1C3);
		#0 $display("_2C0 = %b, _2C1 = %b, _2C2 = %b, _2C3 = %b", _2C0, _2C1, _2C2, _2C3);
		#0 $display("_1Y = %b, _2Y = %b", _1Y, _2Y);

		#10 _B = 1'b1; _A = 1'b1; {_1C3,_1C2,_1C1,_1C0} = 4'b0111; {_2C3,_2C2,_2C1,_2C0} = 4'b0111;
		#0 $display("_B = %b, _A = %b, _1G = %b, _2G = %b",_B, _A, _1G, _2G);
		#0 $display("_1C0 = %b, _1C1 = %b, _1C2 = %b, _1C3 = %b", _1C0, _1C1, _1C2, _1C3);
		#0 $display("_2C0 = %b, _2C1 = %b, _2C2 = %b, _2C3 = %b", _2C0, _2C1, _2C2, _2C3);
		#0 $display("_1Y = %b, _2Y = %b", _1Y, _2Y);

		#10 _B = 1'b1; _A = 1'b1; {_1C3,_1C2,_1C1,_1C0} = 4'b1000; {_2C3,_2C2,_2C1,_2C0} = 4'b1000;
		#0 $display("_B = %b, _A = %b, _1G = %b, _2G = %b",_B, _A, _1G, _2G);
		#0 $display("_1C0 = %b, _1C1 = %b, _1C2 = %b, _1C3 = %b", _1C0, _1C1, _1C2, _1C3);
		#0 $display("_2C0 = %b, _2C1 = %b, _2C2 = %b, _2C3 = %b", _2C0, _2C1, _2C2, _2C3);
		#0 $display("_1Y = %b, _2Y = %b", _1Y, _2Y);

		// Disable output and check all outputs are low
		#10 _1G= 1'b1; _2G = 1'b1;
		#0 $display("_B = %b, _A = %b, _1G = %b, _2G = %b",_B, _A, _1G, _2G);
		#0 $display("_1C0 = %b, _1C1 = %b, _1C2 = %b, _1C3 = %b", _1C0, _1C1, _1C2, _1C3);
		#0 $display("_2C0 = %b, _2C1 = %b, _2C2 = %b, _2C3 = %b", _2C0, _2C1, _2C2, _2C3);
		#0 $display("_1Y = %b, _2Y = %b", _1Y, _2Y);

		#10 $stop;
	end
	
endmodule