/*#########################################################################
#File Name:     cpu_program_rom.sv
#Description:   Representation of CPU PCB Program ROM schematic diagram 
#               contained in Kangaroo Schematic Package Supplement Sheet 5B  
#				          
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

module cpu_program_rom(
	/*-------------------------------------------------------------- /
	/ --------------------- Inputs and Outputs --------------------- /
	/ --------------------------------------------------------------*/
	
	/* -> Program ROM */
	input MR_AL,
	input ROM0_AL,
	input ROM1_AL,
	input ROM2_AL,
	input ROM3_AL,
	input ROM4_AL,
	input ROM5_AL,
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
	input A10,
	input A11,
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

	/* -> Program ROM	*/
	/* IC7 - 2732		*/
	_2732 #(.INIT_FILE("./rom/tvg_75.0.mem")) IC7(.E(ROM0_AL), .G(MR_AL), .A0(A0), .A1(A1), .A2(A2), .A3(A3), .A4(A4), .A5(A5), .A6(A6), .A7(A7), .A8(A8), .A9(A9), .A10(A10), .A11(A11), .Q0(D0), .Q1(D1), .Q2(D2), .Q3(D3), .Q4(D4), .Q5(D5), .Q6(D6), .Q7(D7));

	/* IC8 - 2732 */
	_2732 #(.INIT_FILE("./rom/tvg_76.1.mem")) IC8(.E(ROM1_AL), .G(MR_AL), .A0(A0), .A1(A1), .A2(A2), .A3(A3), .A4(A4), .A5(A5), .A6(A6), .A7(A7), .A8(A8), .A9(A9), .A10(A10), .A11(A11), .Q0(D0), .Q1(D1), .Q2(D2), .Q3(D3), .Q4(D4), .Q5(D5), .Q6(D6), .Q7(D7));

	/* IC9 - 2732 */
	_2732 #(.INIT_FILE("./rom/tvg_77.2.mem")) IC9(.E(ROM2_AL), .G(MR_AL), .A0(A0), .A1(A1), .A2(A2), .A3(A3), .A4(A4), .A5(A5), .A6(A6), .A7(A7), .A8(A8), .A9(A9), .A10(A10), .A11(A11), .Q0(D0), .Q1(D1), .Q2(D2), .Q3(D3), .Q4(D4), .Q5(D5), .Q6(D6), .Q7(D7));

	/* IC10 - 2732 */
	_2732 #(.INIT_FILE("./rom/tvg_78.3.mem")) IC10(.E(ROM3_AL), .G(MR_AL), .A0(A0), .A1(A1), .A2(A2), .A3(A3), .A4(A4), .A5(A5), .A6(A6), .A7(A7), .A8(A8), .A9(A9), .A10(A10), .A11(A11), .Q0(D0), .Q1(D1), .Q2(D2), .Q3(D3), .Q4(D4), .Q5(D5), .Q6(D6), .Q7(D7));

	/* IC16 - 2732 */
	_2732 #(.INIT_FILE("./rom/tvg_79.4.mem")) IC16(.E(ROM4_AL), .G(MR_AL), .A0(A0), .A1(A1), .A2(A2), .A3(A3), .A4(A4), .A5(A5), .A6(A6), .A7(A7), .A8(A8), .A9(A9), .A10(A10), .A11(A11), .Q0(D0), .Q1(D1), .Q2(D2), .Q3(D3), .Q4(D4), .Q5(D5), .Q6(D6), .Q7(D7));

	/* IC17 - 2732 */
	_2732 #(.INIT_FILE("./rom/tvg_80.5.mem"))  IC17(.E(ROM5_AL), .G(MR_AL), .A0(A0), .A1(A1), .A2(A2), .A3(A3), .A4(A4), .A5(A5), .A6(A6), .A7(A7), .A8(A8), .A9(A9), .A10(A10), .A11(A11), .Q0(D0), .Q1(D1), .Q2(D2), .Q3(D3), .Q4(D4), .Q5(D5), .Q6(D6), .Q7(D7));
	
endmodule
