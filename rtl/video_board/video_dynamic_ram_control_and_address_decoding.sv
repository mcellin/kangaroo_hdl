/*#########################################################################
#File Name:     video_dynamic_ram_control_and_address_decoding.sv
#Description:   Representation of Dynamic RAM Control and Address Decoding
#				schematic diagram contained in Kangaroo Schematic Package
#				Supplement Sheet 8B.
#				 			          
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

module video_dynamic_ram_control_and_address_decoding(
	/*-------------------------------------------------------------- /
	/ --------------------- Inputs and Outputs --------------------- /
	/ --------------------------------------------------------------*/
	
	/* -> Dynamic RAM Control and Address */
	input wire BSEL,
	input wire RAS,
	input wire CAS,
	input wire WE,
	input wire K2_AL,
	input wire EXCT,
	input wire EXCT_AL,
	input wire MREQ_AL,
	input wire CS2_AL,
	input wire MW_AL,

	input wire AB15,
	input wire AB14,
	input wire AB13,

	input wire DB3,
	input wire DB2,
	input wire DB1,
	input wire DB0,

	output wire ARAS1_AL,
	output wire ACAS1_AL,
	output wire AWE1_AL,
	output wire ARAS0_AL,
	output wire ACAS0_AL,
	output wire AWE0_AL,
	output wire BRAS1_AL,
	output wire BCAS1_AL,
	output wire BWE1_AL,
	output wire BRAS0_AL,
	output wire BCAS0_AL,
	output wire BWE0_AL,

	output wire BSEL0,
	output wire BSEL2,
	output wire CSC000_AL,
	input wire WAIT_AL, /* Driven by IC20 */


	/* -> External Shared Logic */
	/* IC20 - LS08 */
	output wire IC133_6_TO_IC20_13,

	/* IC90 - LS32 */
	output wire IC131_12_TO_IC90_1_AND_IC131_3,

	/* IC91 - LS04 */
	output wire IC104_6_TO_IC91_9,
	input wire IC91_8_TO_IC104_12,
	output wire IC104_8_TO_IC91_11,
	input wire IC91_10_TO_IC104_1,
	input wire IC91_12_TO_IC118_4_AND_IC133_11,

	/* IC117 - LS04 */
	input wire IC117_2_TO_IC131_1,
	input wire IC117_3_TO_IC133_4,
	input wire IC117_6_TO_IC133_9,
	input wire IC117_8_TO_IC131_11,

	/* IC118 - LS00 */
	output wire IC132_5_TO_IC118_5_AND_IC133_10
);


	/*-------------------------------------------------------------- /
	/ --------------------- Nets and Registers --------------------- /
	/-------------------------------------------------------------- */

	/* -> Dynamic RAM Control and Address */
	wire IC118_6_TO_IC20_12, IC90_3_TO_IC91_13, IC103_7_TO_IC104_4_AND_IC106_9, IC103_15_TO_IC104_10_AND_IC134_9, IC104_3_TO_IC119_5_AND_IC133_2, IC104_11_TO_IC119_10_AND_IC119_13, IC119_12_TO_IC105_2_AND_IC105_5_AND_IC105_13, IC132_6_TO_IC105_10_AND_IC106_10_AND_IC120_10_AND_IC134_10, IC105_8_TO_IC119_1, IC119_8_TO_IC106_2_AND_IC106_5_AND_IC106_13, IC106_8_TO_IC119_9, IC120_8_TO_IC119_3, IC119_6_TO_IC120_2_AND_IC120_5_AND_IC120_13, IC131_6_TO_IC133_5, IC133_8_TO_IC132_2, IC134_8_TO_IC133_13, IC133_12_TO_IC134_2_AND_IC134_5_AND_IC134_13;


	/*-------------------------------------------------------------- /
	/ --------------------- Module Instantiation ------------------- /
	/ --------------------------------------------------------------*/

	/* -> Dynamic RAM Control and Address*/
	/* IC103 - LS175 */
	ls175 IC103(._CLK(BSEL), ._CLR(1'b1), ._1D(DB0), ._1Q(BSEL0), ._1Q_INV(), ._2D(DB1), ._2Q(IC103_7_TO_IC104_4_AND_IC106_9), ._2Q_INV(), ._3D(DB2), ._3Q(BSEL2), ._3Q_INV(), ._4D(DB3), ._4Q(IC103_15_TO_IC104_10_AND_IC134_9), ._4Q_INV());

	/* IC104 - LS32 */
	ls32 IC104(._1A(IC91_10_TO_IC104_1), ._1B(EXCT_AL), ._1Y(IC104_3_TO_IC119_5_AND_IC133_2), ._2A(IC103_7_TO_IC104_4_AND_IC106_9), ._2B(BSEL0), ._2Y(IC104_6_TO_IC91_9), ._3A(BSEL2), ._3B(IC103_15_TO_IC104_10_AND_IC134_9), ._3Y(IC104_8_TO_IC91_11), ._4A(IC91_8_TO_IC104_12), ._4B(EXCT_AL), ._4Y(IC104_11_TO_IC119_10_AND_IC119_13));

	/* IC105 - LS00 */
	ls00 IC105(._1A(WE), ._1B(IC119_12_TO_IC105_2_AND_IC105_5_AND_IC105_13), ._1Y(AWE0_AL), ._2A(RAS), ._2B(IC119_12_TO_IC105_2_AND_IC105_5_AND_IC105_13), ._2Y(ARAS0_AL), ._3A(IC132_6_TO_IC105_10_AND_IC106_10_AND_IC120_10_AND_IC134_10), ._3B(BSEL0), ._3Y(IC105_8_TO_IC119_1), ._4A(IC119_12_TO_IC105_2_AND_IC105_5_AND_IC105_13), ._4B(CAS), ._4Y(ACAS0_AL));

	/* IC106 - LS00 */
	ls00 IC106(._1A(WE), ._1B(IC119_8_TO_IC106_2_AND_IC106_5_AND_IC106_13), ._1Y(AWE1_AL), ._2A(RAS), ._2B(IC119_8_TO_IC106_2_AND_IC106_5_AND_IC106_13), ._2Y(ARAS1_AL), ._3A(IC132_6_TO_IC105_10_AND_IC106_10_AND_IC120_10_AND_IC134_10), ._3B(IC103_7_TO_IC104_4_AND_IC106_9), ._3Y(IC106_8_TO_IC119_9), ._4A(IC119_8_TO_IC106_2_AND_IC106_5_AND_IC106_13), ._4B(CAS), ._4Y(ACAS1_AL));

	/* IC119 - LS10 */
	ls10 IC119(._1A(IC105_8_TO_IC119_1), ._1B(K2_AL), ._1C(IC104_11_TO_IC119_10_AND_IC119_13), ._1Y(IC119_12_TO_IC105_2_AND_IC105_5_AND_IC105_13), ._2A(IC120_8_TO_IC119_3), ._2B(K2_AL), ._2C(IC104_3_TO_IC119_5_AND_IC133_2), ._2Y(IC119_6_TO_IC120_2_AND_IC120_5_AND_IC120_13), ._3A(IC106_8_TO_IC119_9), ._3B(IC104_11_TO_IC119_10_AND_IC119_13), ._3C(K2_AL), ._3Y(IC119_8_TO_IC106_2_AND_IC106_5_AND_IC106_13));

	/* IC120 - LS00 */
	ls00 IC120(._1A(WE), ._1B(IC119_6_TO_IC120_2_AND_IC120_5_AND_IC120_13), ._1Y(BWE0_AL), ._2A(RAS), ._2B(IC119_6_TO_IC120_2_AND_IC120_5_AND_IC120_13), ._2Y(BRAS0_AL), ._3A(IC132_6_TO_IC105_10_AND_IC106_10_AND_IC120_10_AND_IC134_10), ._3B(BSEL2), ._3Y(IC120_8_TO_IC119_3), ._4A(IC119_6_TO_IC120_2_AND_IC120_5_AND_IC120_13), ._4B(CAS), ._4Y(BCAS0_AL));

	/* IC131 - LS10 */
	ls10 IC131(._1A(IC117_2_TO_IC131_1), ._1B(AB15), ._1C(1'b1), ._1Y(IC131_12_TO_IC90_1_AND_IC131_3), ._2A(IC131_12_TO_IC90_1_AND_IC131_3), ._2B(CS2_AL), ._2C(CSC000_AL), ._2Y(IC131_6_TO_IC133_5), ._3A(AB15), ._3B(AB14), ._3C(IC117_8_TO_IC131_11), ._3Y(CSC000_AL));

	/* IC132 - LS74 */
	ls74 IC132(._1CLR(1'b1), ._1D(IC133_8_TO_IC132_2), ._1CLK(K2_AL), ._1PRE(1'b1), ._1Q(IC132_5_TO_IC118_5_AND_IC133_10), ._1QINV(IC132_6_TO_IC105_10_AND_IC106_10_AND_IC120_10_AND_IC134_10), ._2CLR(1'b1), ._2D(1'b1), ._2CLK(1'b1), ._2PRE(1'b1), ._2Q(), ._2QINV());

	/* IC133 - LS10 */
	ls10 IC133(._1A(K2_AL), ._1B(IC104_3_TO_IC119_5_AND_IC133_2), ._1C(IC134_8_TO_IC133_13), ._1Y(IC133_12_TO_IC134_2_AND_IC134_5_AND_IC134_13), ._2A(EXCT), ._2B(IC117_3_TO_IC133_4), ._2C(IC131_6_TO_IC133_5), ._2Y(IC133_6_TO_IC20_13), ._3A(IC117_6_TO_IC133_9), ._3B(IC132_5_TO_IC118_5_AND_IC133_10), ._3C(IC91_12_TO_IC118_4_AND_IC133_11), ._3Y(IC133_8_TO_IC132_2));

	/* IC134 - LS00 */
	ls00 IC134(._1A(WE), ._1B(IC133_12_TO_IC134_2_AND_IC134_5_AND_IC134_13), ._1Y(BWE1_AL), ._2A(RAS), ._2B(IC133_12_TO_IC134_2_AND_IC134_5_AND_IC134_13), ._2Y(BRAS1_AL), ._3A(IC132_6_TO_IC105_10_AND_IC106_10_AND_IC120_10_AND_IC134_10), ._3B(IC103_15_TO_IC104_10_AND_IC134_9), ._3Y(IC134_8_TO_IC133_13), ._4A(IC133_12_TO_IC134_2_AND_IC134_5_AND_IC134_13), ._4B(CAS), ._4Y(BCAS1_AL));


	/* -> External Shared Logic
	// IC20 - LS08
	// ls08 IC20(._1A(AV6_TICK), ._1B(AV4), ._1Y(IC20_3_TO_IC23_2_AND_IC23_12), ._2A(AV8), ._2B(AV14), ._2Y(IC20_6_TO_IC11_1_AND_IC21_2_AND_IC21_12), ._3A(IC9_9_TO_IC20_9), ._3B(IC11_4_TO_IC20_10), ._3Y(LD_SFT_AL), ._4A(IC118_6_TO_IC20_12), ._4B(IC133_6_TO_IC20_13), ._4Y(CN1[41]));
	//
	// IC90 - LS32
	// ls32 IC90(._1A(IC131_12_TO_IC90_1_AND_IC131_3), ._1B(CN1[37]), ._1Y(IC90_3_TO_IC91_13), ._2A(SEL_I_II_AL_A), ._2B(TRGA_AL), ._2Y(IC90_6_TO_IC31_4), ._3A(BSEL0), ._3B(BSEL2), ._3Y(IC90_8_TO_IC89_1_AND_IC91_5), ._4A(IC102_15_TO_IC90_12_AND_IC116_10), ._4B(IC28_9_TO_IC90_13), ._4Y(IC90_11_TO_IC118_12));
	//
	// IC91 - LS04
	// ls04 IC91(._1A(ABP12), ._1Y(IC91_2_TO_IC53_18_AND_IC53_20_AND_IC77_18_AND_IC77_20), ._2A(1'b1), ._2Y(), ._3A(IC90_8_TO_IC89_1_AND_IC91_5), ._3Y(IC91_6_TO_IC89_12), ._4A(IC104_6_TO_IC91_9), ._4Y(IC91_8_TO_IC104_12), ._5A(IC104_8_TO_IC91_11), ._5Y(IC91_10_TO_IC104_1), ._6A(IC90_3_TO_IC91_13), ._6Y(IC91_12_TO_IC118_4_AND_IC133_11));
	//
	// IC117 - LS04
	// ls04 IC117(._1A(CN1[35]), ._1Y(IC117_2_TO_IC131_1), ._2A(CN1[37]), ._2Y(IC117_3_TO_IC133_4), ._3A(CN1[39]), ._3Y(IC117_6_TO_IC133_9), ._4A(CN1[34]), ._4Y(IC117_8_TO_IC131_11), ._5A(SEL_I_II_AL_A), ._5Y(IC117_10_TO_IC107_1_AND_IC108_1_AND_IC109_1_AND_IC110_1), ._6A(SEL_I_II_AL_B), ._6Y(IC117_12_TO_IC111_1_AND_IC112_1_AND_IC113_1_AND_IC114_1));
	//
	// IC118 - LS00
	// ls00 IC118(._1A(TRGA_AL), ._1B(SEL_I_II_AL_A), ._1Y(IC118_3_TO_IC31_5), ._2A(IC91_12_TO_IC118_4_AND_IC133_11), ._2B(IC132_5_TO_IC118_5_AND_IC133_10), ._2Y(IC118_6_TO_IC20_12), ._3A(VSYNC_AL), ._3B(TRGA_AL), ._3Y(IC118_8_TO_IC135_12_AND_IC135_13), ._4A(K2), ._4B(IC90_11_TO_IC118_12), ._4Y(LDL_AL));
	*/
	
endmodule
