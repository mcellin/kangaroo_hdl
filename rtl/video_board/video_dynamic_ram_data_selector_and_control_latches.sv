/*#########################################################################
#File Name:     video_dynamic_ram_data_selector_and_control_latches.sv
#Description:   Representation of Dynamic RAM Data Selector and Dynamic
#				RAM Control Latches schematic diagrams contained in Kangaroo 
#               Schematic Package Supplement Sheet 10B.
#				 			          
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

module video_dynamic_ram_data_selector_and_control_latches(
	/*-------------------------------------------------------------- /
	/ --------------------- Inputs and Outputs --------------------- /
	/ --------------------------------------------------------------*/
	
	/* -> Dynamic RAM Data Selector */
	input wire HFEN,
	input wire I_II_EN_PRI,
	input wire EXCT,

	input wire DB7,
	input wire DB6,
	input wire DB5,
	input wire DB4,
	input wire DB3,
	input wire DB2,
	input wire DB1,
	input wire DB0,

	input wire DPR3,
	input wire DPR2,
	input wire DPR1,
	input wire DPR0,
	input wire DPG3,
	input wire DPG2,
	input wire DPG1,
	input wire DPG0,
	input wire DPB3,
	input wire DPB2,
	input wire DPB1,
	input wire DPB0,
	input wire DPZ3,
	input wire DPZ2,
	input wire DPZ1,
	input wire DPZ0,

	output wire DXR3,
	output wire DXR2,
	output wire DXR1,
	output wire DXR0,
	output wire DXG3,
	output wire DXG2,
	output wire DXG1,
	output wire DXG0,
	output wire DXB3,
	output wire DXB2,
	output wire DXB1,
	output wire DXB0,
	output wire DXZ3,
	output wire DXZ2,
	output wire DXZ1,
	output wire DXZ0,

	output wire ARHF_AL,
	output wire AGHF_AL,
	output wire ABHF_AL,
	output wire BRHF_AL,
	output wire BGHF_AL,
	output wire BBHF_AL,
	
	output wire SEL_I_II_AL_A,
	output wire SEL_I_II_AL_B,
	output wire ENA,
	output wire ENB,
	output wire PRIA_AL,
	output wire PRIB_AL
);


	/*-------------------------------------------------------------- /
	/ --------------------- Module Instantiation ------------------- /
	/ --------------------------------------------------------------*/

	/* -> Dynamic RAM Data Selector & Control Latches*/
	/* IC54 - LS157 */
	ls157 IC54(._AB(EXCT), ._G(1'b0), ._1A(DB0), ._1B(DPB0), ._1Y(DXB0), ._2A(DB1), ._2B(DPB1), ._2Y(DXB1), ._3A(DB2), ._3B(DPB2), ._3Y(DXB2), ._4A(DB3), ._4B(DPB3), ._4Y(DXB3));

	/* IC65 - LS157 */
	ls157 IC65(._AB(EXCT), ._G(1'b0), ._1A(DB4), ._1B(DPG0), ._1Y(DXG0), ._2A(DB5), ._2B(DPG1), ._2Y(DXG1), ._3A(DB6), ._3B(DPG2), ._3Y(DXG2), ._4A(DB7), ._4B(DPG3), ._4Y(DXG3));

	/* IC78 - LS157 */
	ls157 IC78(._AB(EXCT), ._G(1'b0), ._1A(DB0), ._1B(DPR0), ._1Y(DXR0), ._2A(DB1), ._2B(DPR1), ._2Y(DXR1), ._3A(DB2), ._3B(DPR2), ._3Y(DXR2), ._4A(DB3), ._4B(DPR3), ._4Y(DXR3));

	/* IC92 - LS157 */
	ls157 IC92(._AB(EXCT), ._G(1'b0), ._1A(DB4), ._1B(DPZ0), ._1Y(DXZ0), ._2A(DB5), ._2B(DPZ1), ._2Y(DXZ1), ._3A(DB6), ._3B(DPZ2), ._3Y(DXZ2), ._4A(DB7), ._4B(DPZ3), ._4Y(DXZ3));

	/* IC129 - LS174 */
	ls174 IC129(._CLK(I_II_EN_PRI), ._CLR(1'b1), ._1D(DB0), ._1Q(PRIB_AL), ._2D(DB1), ._2Q(PRIA_AL), ._3D(DB2), ._3Q(ENB), ._4D(DB3), ._4Q(ENA), ._5D(DB4), ._5Q(SEL_I_II_AL_B), ._6D(DB5), ._6Q(SEL_I_II_AL_A));

	/* IC130 - LS174 */
	ls174 IC130(._CLK(HFEN), ._CLR(1'b1), ._1D(DB0), ._1Q(BBHF_AL), ._2D(DB1), ._2Q(BGHF_AL), ._3D(DB2), ._3Q(BRHF_AL), ._4D(DB3), ._4Q(ABHF_AL), ._5D(DB4), ._5Q(AGHF_AL), ._6D(DB5), ._6Q(ARHF_AL));
	
endmodule
