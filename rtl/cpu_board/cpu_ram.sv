/*#########################################################################
#File Name:     cpu_ram.sv
#Description:   Representation of CPU PCB RAM schematic diagram contained 
#               in Kangaroo Schematic Package Supplement Sheet 5B  
#				          
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

module cpu_ram(
	/*-------------------------------------------------------------- /
	/ --------------------- Inputs and Outputs --------------------- /
	/ --------------------------------------------------------------*/
	
	/* -> RAM */
	input MW_AL,
	input RAM_AL,
	input A0,
	input A1,
	input A2,
	input A3,
	input A4,
	input A5,
	input A6,
	input A7,
	input A8,
	input A9,
	inout D0,
	inout D1,
	inout D2,
	inout D3,
	inout D4,
	inout D5,
	inout D6,
	inout D7
);


	/*-------------------------------------------------------------- /
	/ --------------------- Module Instantiation ------------------- /
	/ --------------------------------------------------------------*/
	
	/* -> RAM	 */
	/*IC5 - 2114 */
	_2114 IC5(.WE(MW_AL), .CS(RAM_AL), .A0(A0), .A1(A1), .A2(A2), .A3(A3), .A4(A4), .A5(A5), .A6(A6), .A7(A7), .A8(A8), .A9(A9), .D0(D0), .D1(D1), .D2(D2), .D3(D3));

	/* IC6 - 2114 */
	_2114 IC6(.WE(MW_AL), .CS(RAM_AL), .A0(A0), .A1(A1), .A2(A2), .A3(A3), .A4(A4), .A5(A5), .A6(A6), .A7(A7), .A8(A8), .A9(A9), .D0(D4), .D1(D5), .D2(D6), .D3(D7));
	
endmodule
