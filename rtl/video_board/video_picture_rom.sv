/*#########################################################################
#File Name:     video_picture_rom.sv
#Description:   Representation of Picture ROM schematic diagram contained
#				in Kangaroo Schematic Package Supplement Sheet 9B.
#				 			          
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

module video_picture_rom(
	/*-------------------------------------------------------------- /
	/ --------------------- Inputs and Outputs --------------------- /
	/ --------------------------------------------------------------*/
	
	/* -> Picture ROM */
	input wire BSEL0,
	input wire BSEL2,
	input wire MR_AL,
	input wire CSC000_AL,
	input wire EXCT_RB,

	input wire ABP12,
	input wire ABP11,
	input wire ABP10,
	input wire ABP9,
	input wire ABP8,
	input wire ABP7,
	input wire ABP6,
	input wire ABP5,
	input wire ABP4,
	input wire ABP3,
	input wire ABP2,
	input wire ABP1,
	input wire ABP0,

	output wire DPZ3,
	output wire DPZ2,
	output wire DPZ1,
	output wire DPZ0,
	output wire DPR3,
	output wire DPR2,
	output wire DPR1,
	output wire DPR0,
	output wire DPG3,
	output wire DPG2,
	output wire DPG1,
	output wire DPG0,
	output wire DPB3,
	output wire DPB2,
	output wire DPB1,
	output wire DPB0,

	output wire DB7,
	output wire DB6,
	output wire DB5,
	output wire DB4,
	output wire DB3,
	output wire DB2,
	output wire DB1,
	output wire DB0,


	/* -> External Shared Logic */
	output wire IC89_3_TO_IC39_1_AND_IC40_1,
	output wire IC90_8_TO_IC89_1_AND_IC91_5,
	input wire IC91_2_TO_IC53_18_AND_IC53_20_AND_IC77_18_AND_IC77_20,
	input wire IC91_6_TO_IC89_12
);


	/*-------------------------------------------------------------- /
	/ --------------------- Nets and Registers --------------------- /
	/-------------------------------------------------------------- */

	/* -> Picture ROM */
	wire IC89_11_AND_IC38_15_AND_IC39_15, IC89_8_TO_IC89_2_AND_IC89_13, IC89_6_TO_IC89_9; 


	/*-------------------------------------------------------------- /
	/ --------------------- Module Instantiation ------------------- /
	/ --------------------------------------------------------------*/

	/* -> Picture ROM */
	/* IC38 - LS367 */
	ls367 IC38(._1G(IC89_11_AND_IC38_15_AND_IC39_15), ._1A1(DPZ0), ._1Y1(DB4), ._1A2(DPR3), ._1Y2(DB3), ._1A3(DPR2), ._1Y3(DB2), ._1A4(DPZ1), ._1Y4(DB5), ._2G(IC89_11_AND_IC38_15_AND_IC39_15), ._2A1(DPZ2), ._2Y1(DB6), ._2A2(DPZ3), ._2Y2(DB7));

	/* IC39 - LS367 */
	ls367 IC39(._1G(IC89_3_TO_IC39_1_AND_IC40_1), ._1A1(DPG2), ._1Y1(DB6), ._1A2(DPG1), ._1Y2(DB5), ._1A3(DPG0), ._1Y3(DB4), ._1A4(DPG3), ._1Y4(DB7), ._2G(IC89_11_AND_IC38_15_AND_IC39_15), ._2A1(DPR0), ._2Y1(DB0), ._2A2(DPR1), ._2Y2(DB1));

	/* IC52 - 2732 */
	_2732 #(.INIT_FILE("./rom/tvg_84.v1.mem")) IC52(.E(ABP12), .G(ABP12), .A0(ABP0), .A1(ABP1), .A2(ABP2), .A3(ABP3), .A4(ABP4), .A5(ABP5), .A6(ABP6), .A7(ABP7), .A8(ABP8), .A9(ABP9), .A10(ABP10), .A11(ABP11), .Q0(DPB0), .Q1(DPB1), .Q2(DPB2), .Q3(DPB3), .Q4(DPG0), .Q5(DPG1), .Q6(DPG2), .Q7(DPG3));
	
	/* IC53 - 2732 */
	_2732 #(.INIT_FILE("./rom/tvg_86.v3.mem")) IC53(.E(IC91_2_TO_IC53_18_AND_IC53_20_AND_IC77_18_AND_IC77_20), .G(IC91_2_TO_IC53_18_AND_IC53_20_AND_IC77_18_AND_IC77_20), .A0(ABP0), .A1(ABP1), .A2(ABP2), .A3(ABP3), .A4(ABP4), .A5(ABP5), .A6(ABP6), .A7(ABP7), .A8(ABP8), .A9(ABP9), .A10(ABP10), .A11(ABP11), .Q0(DPB0), .Q1(DPB1), .Q2(DPB2), .Q3(DPB3), .Q4(DPG0), .Q5(DPG1), .Q6(DPG2), .Q7(DPG3));

	/* IC76 - 2732 */
	_2732 #(.INIT_FILE("./rom/tvg_83.v0.mem")) IC76(.E(ABP12), .G(ABP12), .A0(ABP0), .A1(ABP1), .A2(ABP2), .A3(ABP3), .A4(ABP4), .A5(ABP5), .A6(ABP6), .A7(ABP7), .A8(ABP8), .A9(ABP9), .A10(ABP10), .A11(ABP11), .Q0(DPR0), .Q1(DPR1), .Q2(DPR2), .Q3(DPR3), .Q4(DPZ0), .Q5(DPZ1), .Q6(DPZ2), .Q7(DPZ3));
	
	/* IC77 - 2732 */
	_2732 #(.INIT_FILE("./rom/tvg_85.v2.mem")) IC77(.E(IC91_2_TO_IC53_18_AND_IC53_20_AND_IC77_18_AND_IC77_20), .G(IC91_2_TO_IC53_18_AND_IC53_20_AND_IC77_18_AND_IC77_20), .A0(ABP0), .A1(ABP1), .A2(ABP2), .A3(ABP3), .A4(ABP4), .A5(ABP5), .A6(ABP6), .A7(ABP7), .A8(ABP8), .A9(ABP9), .A10(ABP10), .A11(ABP11), .Q0(DPR0), .Q1(DPR1), .Q2(DPR2), .Q3(DPR3), .Q4(DPZ0), .Q5(DPZ1), .Q6(DPZ2), .Q7(DPZ3));

	// IC89 - LS32 */
	ls32 IC89(._1A(IC90_8_TO_IC89_1_AND_IC91_5), ._1B(IC89_8_TO_IC89_2_AND_IC89_13), ._1Y(IC89_3_TO_IC39_1_AND_IC40_1), ._2A(CSC000_AL), ._2B(MR_AL), ._2Y(IC89_6_TO_IC89_9), ._3A(IC89_6_TO_IC89_9), ._3B(EXCT_RB), ._3Y(IC89_8_TO_IC89_2_AND_IC89_13), ._4A(IC91_6_TO_IC89_12), ._4B(IC89_8_TO_IC89_2_AND_IC89_13), ._4Y(IC89_11_AND_IC38_15_AND_IC39_15));


	/* -> External Shared Logic
	// IC40 - LS367
	// ls367 IC40(._1G(IC89_3_TO_IC39_1_AND_IC40_1), ._1A1(DPB2), ._1Y1(CN1[15]), ._1A2(DPB1), ._1Y2(CN1[14]), ._1A3(DPB0), ._1Y3(CN1[13]), ._1A4(DPB3), ._1Y4(CN1[16]), ._2G(1'b0), ._2A1(1'b0), ._2Y1(), ._2A2(EXCT_SB), ._2Y2(EXCT));
	//
	// IC90 - LS32
	// ls32 IC90(._1A(IC131_12_TO_IC90_1_AND_IC131_3), ._1B(CN1[37]), ._1Y(IC90_3_TO_IC91_13), ._2A(SEL_I_II_AL_A), ._2B(TRGA_AL), ._2Y(IC90_6_TO_IC31_4), ._3A(BSEL0), ._3B(BSEL2), ._3Y(IC90_8_TO_IC89_1_AND_IC91_5), ._4A(IC102_15_TO_IC90_12_AND_IC116_10), ._4B(IC28_9_TO_IC90_13), ._4Y(IC90_11_TO_IC118_12));
	//
	// IC91 - LS04
	// ls04 IC91(._1A(ABP12), ._1Y(IC91_2_TO_IC53_18_AND_IC53_20_AND_IC77_18_AND_IC77_20), ._2A(1'b1), ._2Y(), ._3A(IC90_8_TO_IC89_1_AND_IC91_5), ._3Y(IC91_6_TO_IC89_12), ._4A(IC104_6_TO_IC91_9), ._4Y(IC91_8_TO_IC104_12), ._5A(IC104_8_TO_IC91_11), ._5Y(IC91_10_TO_IC104_1), ._6A(IC90_3_TO_IC91_13), ._6Y(IC91_12_TO_IC118_4_AND_IC133_11));
	*/
	
endmodule
