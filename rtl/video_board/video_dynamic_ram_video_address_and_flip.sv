/*#########################################################################
#File Name:     video_dynamic_ram_video_address_and_flip.sv
#Description:   Representation of Dynamic RAM Video Address and Flip
#				schematic diagram contained in Kangaroo Schematic Package
#				Supplement Sheet 9A.
#				 			          
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

module video_dynamic_ram_video_address_and_flip(
	/*-------------------------------------------------------------- /
	/ --------------------- Inputs and Outputs --------------------- /
	/ --------------------------------------------------------------*/
	
	/* -> Dynamic RAM Video Address and Flip */
	input wire SEL_I_II_AL_A,
	input wire SEL_I_II_AL_B,
	input wire TRGA_AL,
	input wire VPOS_AL,
	input wire AV14,

	input wire AV13,
	input wire AV12,
	input wire AV11,
	input wire AV10,
	input wire AV9,
	input wire AV8,
	input wire AV7,
	input wire AV6,
	input wire AV5,
	input wire AV4,
	input wire AV3,
	input wire AV2,
	input wire AV1,
	input wire AV0,

	input wire DB7,
	input wire DB6,
	input wire DB5,
	input wire DB4,
	input wire DB3,
	input wire DB2,
	input wire DB1,
	input wire DB0,

	output wire AVAX13,
	output wire AVAX12,
	output wire AVAX11,
	output wire AVAX10,
	output wire AVAX9,
	output wire AVAX8,
	output wire AVAX7,
	output wire AVAX6,
	input wire AVAX5, /* Driven by IC30 */
	input wire AVAX4, /* Driven by IC30 */
	output wire AVAX3,
	output wire AVAX2,
	output wire AVAX1,
	output wire AVAX0,

	output wire AVBX13,
	output wire AVBX12,
	output wire AVBX11,
	output wire AVBX10,
	output wire AVBX9,
	output wire AVBX8,
	output wire AVBX7,
	output wire AVBX6,
	output wire AVBX5,
	output wire AVBX4,
	output wire AVBX3,
	output wire AVBX2,
	output wire AVBX1,
	output wire AVBX0,
	

	/* -> External Shared Logic */
	/* IC17 - LS04 */
	input wire IC17_6_TO_IC29_11_AND_IC31_11,

	/* IC30 - LS86 */
	input wire IC30_11_TO_IC30_5_AND_IC30_10_AND_IC32_2_AND_IC32_5_AND_IC32_10_AND_IC32_13,

	/* IC90 - LS32 */
	input wire IC90_6_TO_IC31_4,

	/* IC118 - LS00 */
	input wire IC118_3_TO_IC31_5
);


	/*-------------------------------------------------------------- /
	/ --------------------- Nets and Registers --------------------- /
	/-------------------------------------------------------------- */

	/* -> Dynamic RAM Video Address and Flip */
	wire IC16_2_TO_IC29_15, IC16_7_TO_IC29_1, IC16_10_TO_IC29_10, IC16_15_TO_IC29_9, IC18_2_TO_IC31_15, IC18_7_TO_IC31_1, IC18_10_TO_IC31_10, IC18_9_TO_IC31_15, IC31_12_TO_IC29_5, IC31_13_TO_IC29_4, IC33_11_TO_IC33_2_AND_IC34_2_AND_IC34_13_AND_IC35_2_AND_IC35_13_AND_IC36_2_AND_IC36_13, IC33_8_TO_IC33_5_AND_IC34_5_AND_IC34_10_AND_IC35_5_AND_IC35_10_AND_IC36_5_AND_IC36_10;


	/*-------------------------------------------------------------- /
	/ --------------------- Module Instantiation ------------------- /
	/ --------------------------------------------------------------*/

	/* -> Dynamic RAM Video Address and Flip */
	/* IC16 - LS175 */
	ls175 IC16(._CLK(VPOS_AL), ._CLR(1'b1), ._1D(DB4), ._1Q(IC16_2_TO_IC29_15), ._1Q_INV(), ._2D(DB5), ._2Q(IC16_7_TO_IC29_1), ._2Q_INV(), ._3D(DB6), ._3Q(IC16_10_TO_IC29_10), ._3Q_INV(), ._4D(DB7), ._4Q(IC16_15_TO_IC29_9), ._4Q_INV());

	/* IC18 - LS175 */
	ls175 IC18(._CLK(VPOS_AL), ._CLR(1'b1), ._1D(DB0), ._1Q(IC18_2_TO_IC31_15), ._1Q_INV(), ._2D(DB1), ._2Q(IC18_7_TO_IC31_1), ._2Q_INV(), ._3D(DB2), ._3Q(IC18_10_TO_IC31_10), ._3Q_INV(), ._4D(DB3), ._4Q(IC18_9_TO_IC31_15), ._4Q_INV());

	/* IC29 - LS193 */
	ls193 IC29(._CLR(1'b0), ._LOAD(IC17_6_TO_IC29_11_AND_IC31_11), ._UP(IC31_12_TO_IC29_5), ._DOWN(IC31_13_TO_IC29_4), ._A(IC16_2_TO_IC29_15), ._B(IC16_7_TO_IC29_1), ._C(IC16_10_TO_IC29_10), ._D(IC16_15_TO_IC29_9), ._BO(), ._CO(), ._QA(AVAX10), ._QB(AVAX11), ._QC(AVAX12), ._QD(AVAX13));

	/* IC31 - LS193 */
	ls193 IC31(._CLR(1'b0), ._LOAD(IC17_6_TO_IC29_11_AND_IC31_11), ._UP(IC118_3_TO_IC31_5), ._DOWN(IC90_6_TO_IC31_4), ._A(IC18_2_TO_IC31_15), ._B(IC18_7_TO_IC31_1), ._C(IC18_10_TO_IC31_10), ._D(IC18_9_TO_IC31_15), ._BO(IC31_13_TO_IC29_4), ._CO(IC31_12_TO_IC29_5), ._QA(AVAX6), ._QB(AVAX7), ._QC(AVAX8), ._QD(AVAX9));

	/* IC32 - LS86 */
	ls86 IC32(._1A(AV2), ._1B(IC30_11_TO_IC30_5_AND_IC30_10_AND_IC32_2_AND_IC32_5_AND_IC32_10_AND_IC32_13), ._1Y(AVAX2), ._2A(AV0), ._2B(IC30_11_TO_IC30_5_AND_IC30_10_AND_IC32_2_AND_IC32_5_AND_IC32_10_AND_IC32_13), ._2Y(AVAX0), ._3A(AV1), ._3B(IC30_11_TO_IC30_5_AND_IC30_10_AND_IC32_2_AND_IC32_5_AND_IC32_10_AND_IC32_13), ._3Y(AVAX1), ._4A(AV3), ._4B(IC30_11_TO_IC30_5_AND_IC30_10_AND_IC32_2_AND_IC32_5_AND_IC32_10_AND_IC32_13), ._4Y(AVAX3));

	/* IC33 - LS86 */
	ls86 IC33(._1A(AV6), ._1B(IC33_11_TO_IC33_2_AND_IC34_2_AND_IC34_13_AND_IC35_2_AND_IC35_13_AND_IC36_2_AND_IC36_13), ._1Y(AVBX6), ._2A(AV13), ._2B(IC33_8_TO_IC33_5_AND_IC34_5_AND_IC34_10_AND_IC35_5_AND_IC35_10_AND_IC36_5_AND_IC36_10), ._2Y(AVBX13), ._3A(SEL_I_II_AL_B), ._3B(1'b1), ._3Y(IC33_8_TO_IC33_5_AND_IC34_5_AND_IC34_10_AND_IC35_5_AND_IC35_10_AND_IC36_5_AND_IC36_10), ._4A(SEL_I_II_AL_B), ._4B(1'b1), ._4Y(IC33_11_TO_IC33_2_AND_IC34_2_AND_IC34_13_AND_IC35_2_AND_IC35_13_AND_IC36_2_AND_IC36_13));

	/* IC34 - LS86 */
	ls86 IC34(._1A(AV4), ._1B(IC33_11_TO_IC33_2_AND_IC34_2_AND_IC34_13_AND_IC35_2_AND_IC35_13_AND_IC36_2_AND_IC36_13), ._1Y(AVBX4), ._2A(AV11), ._2B(IC33_8_TO_IC33_5_AND_IC34_5_AND_IC34_10_AND_IC35_5_AND_IC35_10_AND_IC36_5_AND_IC36_10), ._2Y(AVBX11), ._3A(AV12), ._3B(IC33_8_TO_IC33_5_AND_IC34_5_AND_IC34_10_AND_IC35_5_AND_IC35_10_AND_IC36_5_AND_IC36_10), ._3Y(AVBX12), ._4A(AV5), ._4B(IC33_11_TO_IC33_2_AND_IC34_2_AND_IC34_13_AND_IC35_2_AND_IC35_13_AND_IC36_2_AND_IC36_13), ._4Y(AVBX5));

	/* IC35 - LS86 */
	ls86 IC35(._1A(AV2), ._1B(IC33_11_TO_IC33_2_AND_IC34_2_AND_IC34_13_AND_IC35_2_AND_IC35_13_AND_IC36_2_AND_IC36_13), ._1Y(AVBX2), ._2A(AV9), ._2B(IC33_8_TO_IC33_5_AND_IC34_5_AND_IC34_10_AND_IC35_5_AND_IC35_10_AND_IC36_5_AND_IC36_10), ._2Y(AVBX9), ._3A(AV10), ._3B(IC33_8_TO_IC33_5_AND_IC34_5_AND_IC34_10_AND_IC35_5_AND_IC35_10_AND_IC36_5_AND_IC36_10), ._3Y(AVBX10), ._4A(AV3), ._4B(IC33_11_TO_IC33_2_AND_IC34_2_AND_IC34_13_AND_IC35_2_AND_IC35_13_AND_IC36_2_AND_IC36_13), ._4Y(AVBX3));

	/* IC36 - LS86 */
	ls86 IC36(._1A(AV0), ._1B(IC33_11_TO_IC33_2_AND_IC34_2_AND_IC34_13_AND_IC35_2_AND_IC35_13_AND_IC36_2_AND_IC36_13), ._1Y(AVBX0), ._2A(AV7), ._2B(IC33_8_TO_IC33_5_AND_IC34_5_AND_IC34_10_AND_IC35_5_AND_IC35_10_AND_IC36_5_AND_IC36_10), ._2Y(AVBX7), ._3A(AV8), ._3B(IC33_8_TO_IC33_5_AND_IC34_5_AND_IC34_10_AND_IC35_5_AND_IC35_10_AND_IC36_5_AND_IC36_10), ._3Y(AVBX8), ._4A(AV1), ._4B(IC33_11_TO_IC33_2_AND_IC34_2_AND_IC34_13_AND_IC35_2_AND_IC35_13_AND_IC36_2_AND_IC36_13), ._4Y(AVBX1));


	/* -> External Shared Logic
	// IC17 - LS04
	//ls04 IC17(._1A(IC7_11_TO_IC7_12_AND_IC17_1), ._1Y(IC17_2_TO_IC17_13), ._2A(IC6_9_TO_IC17_3), ._2Y(K2_AL), ._3A(AV14), ._3Y(IC17_6_TO_IC29_11_AND_IC31_11), ._4A(K2_AL), ._4Y(IC17_8_TO_IC42_2_AND_IC43_2_AND_IC44_2_AND_IC45_2_AND_IC46_2_AND_IC47_2_AND_IC48_2_AND_IC49_2), ._5A(IC7_7_TO_IC6_2_AND_IC7_4_AND_IC7_13_AND_IC17_11_AND_IC19_4_AND_IC30_1), ._5Y(K1_AL), ._6A(IC17_2_TO_IC17_13), ._6Y(SFT_AL));
	//
	// IC30 - LS86
	//ls86 IC30(._1A(IC7_7_TO_IC6_2_AND_IC7_4_AND_IC7_13_AND_IC17_11_AND_IC19_4_AND_IC30_1), ._1B(IC7_10_TO_IC5_12_AND_IC30_2), ._1Y(IC30_3_TO_IC7_5), ._2A(AV4), ._2B(IC30_11_TO_IC30_5_AND_IC30_10_AND_IC32_2_AND_IC32_5_AND_IC32_10_AND_IC32_13), ._2Y(AVAX4), ._3A(AV5), ._3B(IC30_11_TO_IC30_5_AND_IC30_10_AND_IC32_2_AND_IC32_5_AND_IC32_10_AND_IC32_13), ._3Y(AVAX5), ._4A(SEL_I_II_AL_A), ._4B(1'b1), ._4Y(IC30_11_TO_IC30_5_AND_IC30_10_AND_IC32_2_AND_IC32_5_AND_IC32_10_AND_IC32_13));
	//
	// IC90 - LS32
	//ls32 IC90(._1A(IC131_12_TO_IC90_1_AND_IC131_3), ._1B(CN1[37]), ._1Y(IC90_3_TO_IC91_13), ._2A(SEL_I_II_AL_A), ._2B(TRGA_AL), ._2Y(IC90_6_TO_IC31_4), ._3A(BSEL0), ._3B(BSEL2), ._3Y(IC90_8_TO_IC89_1_AND_IC91_5), ._4A(IC102_15_TO_IC90_12_AND_IC116_10), ._4B(IC28_9_TO_IC90_13), ._4Y(IC90_11_TO_IC118_12));
	//
	// IC118 - LS00
	//ls00 IC118(._1A(TRGA_AL), ._1B(SEL_I_II_AL_A), ._1Y(IC118_3_TO_IC31_5), ._2A(IC91_12_TO_IC118_4_AND_IC133_11), ._2B(IC132_5_TO_IC118_5_AND_IC133_10), ._2Y(IC118_6_TO_IC20_12), ._3A(VSYNC_AL), ._3B(TRGA_AL), ._3Y(IC118_8_TO_IC135_12_AND_IC135_13), ._4A(K2), ._4B(IC90_11_TO_IC118_12), ._4Y(LDL_AL));
	*/

endmodule
