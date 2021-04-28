/*#########################################################################
#File Name:     video_clock_sync_chain_and_timing_signals.sv
#Description:   Representation of Clock, Sync Chain, and Timing Signals
#				schematic diagram contained in Kangaroo Schematic Package
#				Supplement Sheet 8B.
#				 			          
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         IC 8 - Pin 10,11,12,13 are not used as the clock generator 
#				has been replaced.
##########################################################################*/

module video_clock_sync_chain_and_timing_signals(
	/*-------------------------------------------------------------- /
	/ --------------------- Inputs and Outputs --------------------- /
	/ --------------------------------------------------------------*/
	
	/* -> Clock Sync Chain & Timing Signals */
	input wire CLOCK_10MHZ,
	input wire SFT_AL, 		/* Driven by IC17 */
	output wire KOS1,
	output wire KIS1_AL,
	input wire K1_AL, 		/* Driven by IC17 */
	input wire RAS, 		/* Driven by IC19 */
	output wire CAS,
	input wire XG, 			/* Driven by IC19 */
	input wire LD_SFT_AL, 	/* Driven by IC20 */
	output wire K2,
	input wire K2_AL, 		/* Driven by IC17 */
	output wire CPU_CLOCK,

	output wire VSYNC_AL,
	output wire AV6_TICK_AL,
	output wire TRGA_AL,
	output wire INT_AL,

	output wire AV14,
	output wire AV13,
	output wire AV12,
	output wire AV11,
	output wire AV10,
	output wire AV9,
	output wire AV8,
	output wire AV7,
	output wire AV6,
	output wire AV6_TICK,
	output wire AV5,
	output wire AV4,
	output wire AV3,
	output wire AV2,
	output wire AV1,
	output wire AV0,
	
	
	/* -> External Shared Logic */
	/* IC17 - LS04 */
	output wire IC7_11_TO_IC7_12_AND_IC17_1,
	output wire IC6_9_TO_IC17_3,
	output wire IC7_7_TO_IC6_2_AND_IC7_4_AND_IC7_13_AND_IC17_11_AND_IC19_4_AND_IC30_1,

	/* IC19 - LS00 */
	output wire IC6_5_TO_IC19_5_AND_IC19_10,
	output wire IC7_2_TO_IC6_11_AND_IC19_9,

	/* IC20 - LS08 */
	input wire IC20_3_TO_IC23_2_AND_IC23_12,
	input wire IC20_6_TO_IC11_1_AND_IC21_2_AND_IC21_12,
	output wire IC9_9_TO_IC20_9,
	output wire IC11_4_TO_IC20_10,	

	/* IC30 - LS86 */
	output wire IC7_10_TO_IC5_12_AND_IC30_2,
	input wire IC30_3_TO_IC7_5
);


	/*-------------------------------------------------------------- /
	/ --------------------- Nets and Registers --------------------- /
	/-------------------------------------------------------------- */

	/* -> Clock Sync Chain and Timing Signals */
	wire IC8_8_TO_IC5_11_AND_IC6_3, IC6_8_TO_IC6_12_AND_IC11_5, IC8_6_TO_IC7_9_AND_IC8_9, IC7_6_TO_IC9_11, IC7_14_TO_IC8_3, IC11_2_TO_IC9_1, IC9_6_TO_IC9_2, IC11_12_TO_IC9_3, IC22_6_TO_IC10_5, IC22_12_TO_IC10_9, IC22_8_TO_IC10_10;


	/*-------------------------------------------------------------- /
	/ --------------------- Module Instantiation ------------------- /
	/ --------------------------------------------------------------*/

	/* -> Clock Sync Chain and Timing Signals */
	/* IC5 - LS74 */
	ls74 IC5(._1CLR(1'b1), ._1D(1'b1), ._1CLK(1'b1), ._1PRE(1'b1), ._1Q(), ._1QINV(), ._2CLR(1'b1), ._2D(IC7_10_TO_IC5_12_AND_IC30_2), ._2CLK(IC8_8_TO_IC5_11_AND_IC6_3), ._2PRE(1'b1), ._2Q(KOS1), ._2QINV());

	/* IC6 - LS74 */
	ls74 IC6(._1CLR(1'b1), ._1D(IC7_7_TO_IC6_2_AND_IC7_4_AND_IC7_13_AND_IC17_11_AND_IC19_4_AND_IC30_1), ._1CLK(IC8_8_TO_IC5_11_AND_IC6_3), ._1PRE(1'b1), ._1Q(IC6_5_TO_IC19_5_AND_IC19_10), ._1QINV(KIS1_AL), ._2CLR(1'b1), ._2D(IC6_8_TO_IC6_12_AND_IC11_5), ._2CLK(IC7_2_TO_IC6_11_AND_IC19_9), ._2PRE(1'b1), ._2Q(IC6_9_TO_IC17_3), ._2QINV(IC6_8_TO_IC6_12_AND_IC11_5));

	/* IC7 - LS175 */
	ls175 IC7(._CLK(IC8_6_TO_IC7_9_AND_IC8_9), ._CLR(1'b1), ._1D(IC7_7_TO_IC6_2_AND_IC7_4_AND_IC7_13_AND_IC17_11_AND_IC19_4_AND_IC30_1), ._1Q(IC7_2_TO_IC6_11_AND_IC19_9), ._1Q_INV(CAS), ._2D(IC30_3_TO_IC7_5), ._2Q(IC7_7_TO_IC6_2_AND_IC7_4_AND_IC7_13_AND_IC17_11_AND_IC19_4_AND_IC30_1), ._2Q_INV(IC7_6_TO_IC9_11), ._3D(IC7_11_TO_IC7_12_AND_IC17_1), ._3Q(IC7_10_TO_IC5_12_AND_IC30_2), ._3Q_INV(IC7_11_TO_IC7_12_AND_IC17_1), ._4D(IC7_7_TO_IC6_2_AND_IC7_4_AND_IC7_13_AND_IC17_11_AND_IC19_4_AND_IC30_1), ._4Q(), ._4Q_INV(IC7_14_TO_IC8_3));

	/* IC8 - LS04 */
	/* Note: Pin 10,11,12,13 are not used as the clock generator has been replaced. */
	ls04 IC8(._1A(AV14), ._1Y(INT_AL), ._2A(IC7_14_TO_IC8_3), ._2Y(CPU_CLOCK), ._3A(CLOCK_10MHZ), ._3Y(IC8_6_TO_IC7_9_AND_IC8_9), ._4A(IC8_6_TO_IC7_9_AND_IC8_9), ._4Y(IC8_8_TO_IC5_11_AND_IC6_3), ._5A(), ._5Y(), ._6A(), ._6Y());

	/* IC9 - LS74 */
	ls74 IC9(._1CLR(IC11_2_TO_IC9_1), ._1D(IC9_6_TO_IC9_2), ._1CLK(IC11_12_TO_IC9_3), ._1PRE(1'b1), ._1Q(AV14), ._1QINV(IC9_6_TO_IC9_2), ._2CLR(1'b1), ._2D(K2), ._2CLK(IC7_6_TO_IC9_11), ._2PRE(1'b1), ._2Q(IC9_9_TO_IC20_9), ._2QINV());

	/* IC10 - LS32 */
	ls32 IC10(._1A(1'b1), ._1B(1'b1), ._1Y(), ._2A(AV3), ._2B(IC22_6_TO_IC10_5), ._2Y(TRGA_AL), ._3A(IC22_12_TO_IC10_9), ._3B(IC22_8_TO_IC10_10), ._3Y(VSYNC_AL), ._4A(1'b1), ._4B(1'b1), ._4Y());

	/* IC11 - LS04 */
	ls04 IC11(._1A(IC20_6_TO_IC11_1_AND_IC21_2_AND_IC21_12), ._1Y(IC11_2_TO_IC9_1), ._2A(RAS), ._2Y(IC11_4_TO_IC20_10), ._3A(IC6_8_TO_IC6_12_AND_IC11_5), ._3Y(K2), ._4A(AV6_TICK), ._4Y(AV6_TICK_AL), ._5A(AV2), ._5Y(), ._6A(AV13), ._6Y(IC11_12_TO_IC9_3));

	/* IC21 - LS393 */
	ls393 IC21(._1A(TRGA_AL), ._1CLR(IC20_6_TO_IC11_1_AND_IC21_2_AND_IC21_12), ._1QA(AV6), ._1QB(AV7), ._1QC(AV8), ._1QD(AV9), ._2A(AV9), ._2CLR(IC20_6_TO_IC11_1_AND_IC21_2_AND_IC21_12), ._2QA(AV10), ._2QB(AV11), ._2QC(AV12), ._2QD(AV13));

	/* IC22 - LS10 */
	ls10 IC22(._1A(AV8), ._1B(AV9), ._1C(AV10), ._1Y(IC22_12_TO_IC10_9), ._2A(AV6_TICK), ._2B(AV1), ._2C(AV2), ._2Y(IC22_6_TO_IC10_5), ._3A(AV11), ._3B(AV12), ._3C(AV13), ._3Y(IC22_8_TO_IC10_10));

	/* IC23 - LS393 */
	ls393 IC23(._1A(K2), ._1CLR(IC20_3_TO_IC23_2_AND_IC23_12), ._1QA(AV0), ._1QB(AV1), ._1QC(AV2), ._1QD(), ._2A(AV2), ._2CLR(IC20_3_TO_IC23_2_AND_IC23_12), ._2QA(AV3), ._2QB(AV4), ._2QC(AV5), ._2QD(AV6_TICK));


	/* -> External Shared Logic
	// IC17 - LS04
	// ls04 IC17(._1A(IC7_11_TO_IC7_12_AND_IC17_1), ._1Y(IC17_2_TO_IC17_13), ._2A(IC6_9_TO_IC17_3), ._2Y(K2_AL), ._3A(AV14), ._3Y(IC17_6_TO_IC29_11_AND_IC31_11), ._4A(K2_AL), ._4Y(IC17_8_TO_IC42_2_AND_IC43_2_AND_IC44_2_AND_IC45_2_AND_IC46_2_AND_IC47_2_AND_IC48_2_AND_IC49_2), ._5A(IC7_7_TO_IC6_2_AND_IC7_4_AND_IC7_13_AND_IC17_11_AND_IC19_4_AND_IC30_1), ._5Y(K1_AL), ._6A(IC17_2_TO_IC17_13), ._6Y(SFT_AL));
	//
	// IC19 - LS00
	// ls00 IC19(._1A(LDL_AL), ._1B(LDL_AL), ._1Y(IC19_3_TO_IC1_7_AND_IC2_7), ._2A(IC7_7_TO_IC6_2_AND_IC7_4_AND_IC7_13_AND_IC17_11_AND_IC19_4_AND_IC30_1), ._2B(IC6_5_TO_IC19_5_AND_IC19_10), ._2Y(RAS), ._3A(IC6_5_TO_IC19_5_AND_IC19_10), ._3B(IC7_2_TO_IC6_11_AND_IC19_9), ._3Y(XG), ._4A(IC28_5_TO_IC19_13_AND_IC27_1_AND_IC27_13), ._4B(IC28_8_TO_IC19_12_AND_IC27_2_AND_IC27_10_AND_IC27_12), ._4Y(EXCT_AL));
	//
	// IC20 - LS08
	// ls08 IC20(._1A(AV6_TICK), ._1B(AV4), ._1Y(IC20_3_TO_IC23_2_AND_IC23_12), ._2A(AV8), ._2B(AV14), ._2Y(IC20_6_TO_IC11_1_AND_IC21_2_AND_IC21_12), ._3A(IC9_9_TO_IC20_9), ._3B(IC11_4_TO_IC20_10), ._3Y(LD_SFT_AL), ._4A(IC118_6_TO_IC20_12), ._4B(IC133_6_TO_IC20_13), ._4Y(CN1[41]));
	//
	// IC30 - LS86
	// ls86 IC30(._1A(IC7_7_TO_IC6_2_AND_IC7_4_AND_IC7_13_AND_IC17_11_AND_IC19_4_AND_IC30_1), ._1B(IC7_10_TO_IC5_12_AND_IC30_2), ._1Y(IC30_3_TO_IC7_5), ._2A(AV4), ._2B(IC30_11_TO_IC30_5_AND_IC30_10_AND_IC32_2_AND_IC32_5_AND_IC32_10_AND_IC32_13), ._2Y(AVAX4), ._3A(AV5), ._3B(IC30_11_TO_IC30_5_AND_IC30_10_AND_IC32_2_AND_IC32_5_AND_IC32_10_AND_IC32_13), ._3Y(AVAX5), ._4A(SEL_I_II_AL_A), ._4B(1'b1), ._4Y(IC30_11_TO_IC30_5_AND_IC30_10_AND_IC32_2_AND_IC32_5_AND_IC32_10_AND_IC32_13));
	*/

endmodule
