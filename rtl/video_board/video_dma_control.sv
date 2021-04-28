/*#########################################################################
#File Name:     video_picture_rom.sv
#Description:   Representation of DMA Control schematic diagram contained
#				in Kangaroo Schematic Package Supplement Sheet 9A.
#				 			          
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         EXCT_AL = EXCT with Line Over
#				EXCT_RB = (EXCT)
#				EXCT_SB = [EXCT]
#				EXCT = EXCT
##########################################################################*/

module video_dma_control(
	/*-------------------------------------------------------------- /
	/ --------------------- Inputs and Outputs --------------------- /
	/ --------------------------------------------------------------*/
	
	/* -> DMA Control */
	input wire XYL_AL,
	input wire XYH_AL,
	input wire KIS1_AL,
	input wire K1_AL,
	input wire K2,

	input wire DB7,
	input wire DB6,
	input wire DB5,
	input wire DB4,
	input wire DB3,
	input wire DB2,
	input wire DB1,
	input wire DB0,

	input wire LDL_AL, 	/* Driven by IC118 */
	output wire EXCT,
	input wire EXCT_AL, /* Driven by IC19 */
	output wire EXCT_RB,
	output wire EXCT_SB,
	

	/* -> External Shared Logic */
	/* IC19 - LS00 */
	output wire IC28_5_TO_IC19_13_AND_IC27_1_AND_IC27_13,
	output wire IC28_8_TO_IC19_12_AND_IC27_2_AND_IC27_10_AND_IC27_12,

	/* IC41 - LS74 */
	output wire IC27_8_TO_IC41_10,
	input wire IC41_9_TO_IC28_1,

	/* IC90 - LS32 */
	output wire IC102_15_TO_IC90_12_AND_IC116_10,
	output wire IC28_9_TO_IC90_13
);


	/*-------------------------------------------------------------- /
	/ --------------------- Nets and Registers --------------------- /
	/-------------------------------------------------------------- */

	/* -> DMA Control */
	wire IC27_6_TO_IC28_11, IC116_15_TO_IC27_9, IC87_3_TO_IC88_3, IC87_6_TO_IC88_4, IC87_11_TO_IC88_5, IC87_14_TO_IC88_6, IC88_15_TO_IC102_10, IC90_11_TO_IC118_12, IC101_3_TO_IC102_3, IC101_6_TO_IC102_4, IC101_10_TO_IC102_5, IC101_14_TO_IC102_6, IC115_2_TO_IC116_3, IC115_4_TO_IC116_5, IC115_10_TO_IC116_6, IC115_12_TO_IC116_4;


	/*-------------------------------------------------------------- /
	/ --------------------- Module Instantiation ------------------- /
	/ --------------------------------------------------------------*/

	/* -> DMA Control */
	/* IC27 - LS08 */
	ls08 IC27(._1A(IC28_5_TO_IC19_13_AND_IC27_1_AND_IC27_13), ._1B(IC28_8_TO_IC19_12_AND_IC27_2_AND_IC27_10_AND_IC27_12), ._1Y(EXCT_SB), ._2A(KIS1_AL), ._2B(K2), ._2Y(IC27_6_TO_IC28_11), ._3A(IC116_15_TO_IC27_9), ._3B(IC28_8_TO_IC19_12_AND_IC27_2_AND_IC27_10_AND_IC27_12), ._3Y(IC27_8_TO_IC41_10), ._4A(IC28_8_TO_IC19_12_AND_IC27_2_AND_IC27_10_AND_IC27_12), ._4B(IC28_5_TO_IC19_13_AND_IC27_1_AND_IC27_13), ._4Y(EXCT_RB));

	/* IC28 - LS74 */
	ls74 IC28(._1CLR(IC41_9_TO_IC28_1), ._1D(1'b0), ._1CLK(1'b0), ._1PRE(XYH_AL), ._1Q(IC28_5_TO_IC19_13_AND_IC27_1_AND_IC27_13), ._1QINV(), ._2CLR(1'b1), ._2D(1'b0), ._2CLK(IC27_6_TO_IC28_11), ._2PRE(XYH_AL), ._2Q(IC28_9_TO_IC90_13), ._2QINV(IC28_8_TO_IC19_12_AND_IC27_2_AND_IC27_10_AND_IC27_12));

	/* IC87 - LS175 */
	ls175 IC87(._CLK(XYL_AL), ._CLR(1'b1), ._1D(DB0), ._1Q(), ._1Q_INV(IC87_3_TO_IC88_3), ._2D(DB1), ._2Q(), ._2Q_INV(IC87_6_TO_IC88_4), ._3D(DB2), ._3Q(), ._3Q_INV(IC87_11_TO_IC88_5), ._4D(DB3), ._4Q(), ._4Q_INV(IC87_14_TO_IC88_6));

	/* IC88 - LS163 */
	ls163 IC88(._CLK(K1_AL), ._CLR(1'b1), ._LOAD(LDL_AL), ._ENP(K2), ._ENT(EXCT_RB), ._RCO(IC88_15_TO_IC102_10), ._A(IC87_3_TO_IC88_3), ._B(IC87_6_TO_IC88_4), ._C(IC87_11_TO_IC88_5), ._D(IC87_14_TO_IC88_6), ._QA(), ._QB(), ._QC(), ._QD());

	/* IC101 - LS175 */
	ls175 IC101(._CLK(XYL_AL), ._CLR(1'b1), ._1D(DB4), ._1Q(), ._1Q_INV(IC101_3_TO_IC102_3), ._2D(DB5), ._2Q(), ._2Q_INV(IC101_6_TO_IC102_4), ._3D(DB6), ._3Q(), ._3Q_INV(IC101_10_TO_IC102_5), ._4D(DB7), ._4Q(), ._4Q_INV(IC101_14_TO_IC102_6));

	/* IC102 - LS163 */
	ls163 IC102(._CLK(K1_AL), ._CLR(1'b1), ._LOAD(LDL_AL), ._ENP(K2), ._ENT(IC88_15_TO_IC102_10), ._RCO(IC102_15_TO_IC90_12_AND_IC116_10), ._A(IC101_3_TO_IC102_3), ._B(IC101_6_TO_IC102_4), ._C(IC101_10_TO_IC102_5), ._D(IC101_14_TO_IC102_6), ._QA(), ._QB(), ._QC(), ._QD());

	/* IC115 - LS04 */
	ls04 IC115(._1A(DB0), ._1Y(IC115_2_TO_IC116_3), ._2A(DB2), ._2Y(IC115_4_TO_IC116_5), ._3A(1'b1), ._3Y(), ._4A(1'b1), ._4Y(), ._5A(DB3), ._5Y(IC115_10_TO_IC116_6), ._6A(DB1), ._6Y(IC115_12_TO_IC116_4));

	/* IC116 - LS163 */
	ls163 IC116(._CLK(K1_AL), ._CLR(1'b1), ._LOAD(XYH_AL), ._ENP(K2), ._ENT(IC102_15_TO_IC90_12_AND_IC116_10), ._RCO(IC116_15_TO_IC27_9), ._A(IC115_2_TO_IC116_3), ._B(IC115_12_TO_IC116_4), ._C(IC115_4_TO_IC116_5), ._D(IC115_10_TO_IC116_6), ._QA(), ._QB(), ._QC(), ._QD());


	/* -> External Shared Logic
	// IC19 - LS00
	// ls00 IC19(._1A(LDL_AL), ._1B(LDL_AL), ._1Y(IC19_3_TO_IC1_7_AND_IC2_7), ._2A(IC7_7_TO_IC6_2_AND_IC7_4_AND_IC7_13_AND_IC17_11_AND_IC19_4_AND_IC30_1), ._2B(IC6_5_TO_IC19_5_AND_IC19_10), ._2Y(RAS), ._3A(IC6_5_TO_IC19_5_AND_IC19_10), ._3B(IC7_2_TO_IC6_11_AND_IC19_9), ._3Y(XG), ._4A(IC28_5_TO_IC19_13_AND_IC27_1_AND_IC27_13), ._4B(IC28_8_TO_IC19_12_AND_IC27_2_AND_IC27_10_AND_IC27_12), ._4Y(EXCT_AL));
	//
	// IC40 - LS367
	// Note: EXCT is on Pin 13
	// ls367 IC40(._1G(IC89_3_TO_IC39_1_AND_IC40_1), ._1A1(DPB2), ._1Y1(CN1[15]), ._1A2(DPB1), ._1Y2(CN1[14]), ._1A3(DPB0), ._1Y3(CN1[13]), ._1A4(DPB3), ._1Y4(CN1[16]), ._2G(1'b0), ._2A1(1'b0), ._2Y1(), ._2A2(EXCT_SB), ._2Y2(EXCT));
	//
	// IC41 - LS74
	// ls74 IC41(._1CLR(1'b1), ._1D(CN1[17]), ._1CLK(CN1[3]), ._1PRE(1'b1), ._1Q(IC41_5_TO_IC12_10), ._1QINV(), ._2CLR(1'b1), ._2D(1'b0), ._2CLK(K2), ._2PRE(IC27_8_TO_IC41_10), ._2Q(IC41_9_TO_IC28_1), ._2QINV());
	//
	// IC90 - LS32
	// ls32 IC90(._1A(IC131_12_TO_IC90_1_AND_IC131_3), ._1B(CN1[37]), ._1Y(IC90_3_TO_IC91_13), ._2A(SEL_I_II_AL_A), ._2B(TRGA_AL), ._2Y(IC90_6_TO_IC31_4), ._3A(BSEL0), ._3B(BSEL2), ._3Y(IC90_8_TO_IC89_1_AND_IC91_5), ._4A(IC102_15_TO_IC90_12_AND_IC116_10), ._4B(IC28_9_TO_IC90_13), ._4Y(IC90_11_TO_IC118_12));
	//
	// IC118 - LS00
	// ls00 IC118(._1A(TRGA_AL), ._1B(SEL_I_II_AL_A), ._1Y(IC118_3_TO_IC31_5), ._2A(IC91_12_TO_IC118_4_AND_IC133_11), ._2B(IC132_5_TO_IC118_5_AND_IC133_10), ._2Y(IC118_6_TO_IC20_12), ._3A(VSYNC_AL), ._3B(TRGA_AL), ._3Y(IC118_8_TO_IC135_12_AND_IC135_13), ._4A(K2), ._4B(IC90_11_TO_IC118_12), ._4Y(LDL_AL));
	*/

endmodule
