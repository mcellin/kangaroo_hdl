/*#########################################################################
#File Name:     video_motion_object.sv
#Description:   Representation of Motion Object (Dynamic RAM B) schematic 
#               diagram contained in Kangaroo Schematic Package Supplement 
#				Sheet 11B.
#				 			          
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

module video_motion_object(
	/*-------------------------------------------------------------- /
	/ --------------------- Inputs and Outputs --------------------- /
	/ --------------------------------------------------------------*/
	
	/* -> Motion Object */
	input wire SEL_I_II_AL_B,
	input wire AV6_TICK_AL,
	input wire ENB,
	input wire SFT_AL,

	input wire BCAS0_AL,
	input wire BCAS1_AL,
	input wire BRAS0_AL,
	input wire BRAS1_AL,
	input wire BWE0_AL,
	input wire BWE1_AL,

	input wire XXB6,
	input wire XXB5,
	input wire XXB4,
	input wire XXB3,
	input wire XXB2,
	input wire XXB1,
	input wire XXB0,

	input wire DXR3,
	input wire DXR2,
	input wire DXR1,
	input wire DXR0,
	input wire DXG3,
	input wire DXG2,
	input wire DXG1,
	input wire DXG0,
	input wire DXB3,
	input wire DXB2,
	input wire DXB1,
	input wire DXB0,
	input wire DXZ3,
	input wire DXZ2,
	input wire DXZ1,
	input wire DXZ0,

	input wire KOS1,
	input wire BRHF_AL,
	input wire BGHF_AL,
	input wire BBHF_AL,
	input wire AY_AL,
	input wire PRIB_AL,

	output wire BVR,
	output wire BVG,
	output wire BVB,
	output wire BY_AL,
	output wire LD_SFT_AL,


	/* -> External Shared Logic */
	/* IC117 - LS04 */
	input wire IC117_12_TO_IC111_1_AND_IC112_1_AND_IC113_1_AND_IC114_1,

	/* IC139 - LS00 */
    input wire IC139_6_TO_IC111_15_AND_IC112_15_AND_IC113_15_AND_IC114_15,
	input wire IC139_3_TO_IC141_2_AND_IC141_3_AND_IC141_11
);


	/*-------------------------------------------------------------- /
	/ --------------------- Nets and Registers --------------------- /
	/-------------------------------------------------------------- */

	/* -> Motion Object */
	wire BB, BR, BG, BZ;

	
	/*-------------------------------------------------------------- /
	/ --------------------- Module Instantiation ------------------- /
	/ --------------------------------------------------------------*/

	/* -> Motion Object */
	/* IC59 - 4116 */
	_4116 IC59(.RAS(BRAS1_AL), .CAS(BCAS1_AL), .WE(BWE1_AL), .A0(XXB0), .A1(XXB1), .A2(XXB2), .A3(XXB3), .A4(XXB4), .A5(XXB5), .A6(XXB6), .D(DXB3), .Q(IC59_14_TO_IC114_3_AND_IC114_14));

	/* IC60 - 4116 */
	_4116 IC60(.RAS(BRAS1_AL), .CAS(BCAS1_AL), .WE(BWE1_AL), .A0(XXB0), .A1(XXB1), .A2(XXB2), .A3(XXB3), .A4(XXB4), .A5(XXB5), .A6(XXB6), .D(DXB2), .Q(IC60_14_TO_IC114_6_AND_IC114_11));

	/* IC61 - 4116 */
	_4116 IC61(.RAS(BRAS1_AL), .CAS(BCAS1_AL), .WE(BWE1_AL), .A0(XXB0), .A1(XXB1), .A2(XXB2), .A3(XXB3), .A4(XXB4), .A5(XXB5), .A6(XXB6), .D(DXB1), .Q(IC61_14_TO_IC114_5_AND_IC114_10));

	/* IC62 - 4116 */
	_4116 IC62(.RAS(BRAS1_AL), .CAS(BCAS1_AL), .WE(BWE1_AL), .A0(XXB0), .A1(XXB1), .A2(XXB2), .A3(XXB3), .A4(XXB4), .A5(XXB5), .A6(XXB6), .D(DXB0), .Q(IC62_14_TO_IC114_2_AND_IC114_13));

	/* IC70 - 4116 */
	_4116 IC70(.RAS(BRAS1_AL), .CAS(BCAS1_AL), .WE(BWE1_AL), .A0(XXB0), .A1(XXB1), .A2(XXB2), .A3(XXB3), .A4(XXB4), .A5(XXB5), .A6(XXB6), .D(DXG3), .Q(IC70_14_TO_IC113_3_AND_IC113_14));

	/* IC71 - 4116 */
	_4116 IC71(.RAS(BRAS1_AL), .CAS(BCAS1_AL), .WE(BWE1_AL), .A0(XXB0), .A1(XXB1), .A2(XXB2), .A3(XXB3), .A4(XXB4), .A5(XXB5), .A6(XXB6), .D(DXG2), .Q(IC71_14_TO_IC113_6_AND_IC113_11));

	/* IC72 - 4116 */
	_4116 IC72(.RAS(BRAS1_AL), .CAS(BCAS1_AL), .WE(BWE1_AL), .A0(XXB0), .A1(XXB1), .A2(XXB2), .A3(XXB3), .A4(XXB4), .A5(XXB5), .A6(XXB6), .D(DXG1), .Q(IC72_14_TO_IC113_5_AND_IC113_10));

	/* IC73 - 4116 */
	_4116 IC73(.RAS(BRAS1_AL), .CAS(BCAS1_AL), .WE(BWE1_AL), .A0(XXB0), .A1(XXB1), .A2(XXB2), .A3(XXB3), .A4(XXB4), .A5(XXB5), .A6(XXB6), .D(DXG0), .Q(IC73_14_TO_IC113_2_AND_IC113_13));

	/* IC83 - 4116 */
	_4116 IC83(.RAS(BRAS0_AL), .CAS(BCAS0_AL), .WE(BWE0_AL), .A0(XXB0), .A1(XXB1), .A2(XXB2), .A3(XXB3), .A4(XXB4), .A5(XXB5), .A6(XXB6), .D(DXR3), .Q(IC83_14_TO_IC112_3_AND_IC112_14));

	/* IC84 - 4116 */
	_4116 IC84(.RAS(BRAS0_AL), .CAS(BCAS0_AL), .WE(BWE0_AL), .A0(XXB0), .A1(XXB1), .A2(XXB2), .A3(XXB3), .A4(XXB4), .A5(XXB5), .A6(XXB6), .D(DXR2), .Q(IC84_14_TO_IC112_6_AND_IC112_11));

	/* IC85 - 4116 */
	_4116 IC85(.RAS(BRAS0_AL), .CAS(BCAS0_AL), .WE(BWE0_AL), .A0(XXB0), .A1(XXB1), .A2(XXB2), .A3(XXB3), .A4(XXB4), .A5(XXB5), .A6(XXB6), .D(DXR1), .Q(IC85_14_TO_IC112_5_AND_IC112_10));

	/* IC86 - 4116 */
	_4116 IC86(.RAS(BRAS0_AL), .CAS(BCAS0_AL), .WE(BWE0_AL), .A0(XXB0), .A1(XXB1), .A2(XXB2), .A3(XXB3), .A4(XXB4), .A5(XXB5), .A6(XXB6), .D(DXR0), .Q(IC86_14_TO_IC112_2_AND_IC112_13));

	/* IC97 - 4116 */
	_4116 IC97(.RAS(BRAS0_AL), .CAS(BCAS0_AL), .WE(BWE0_AL), .A0(XXB0), .A1(XXB1), .A2(XXB2), .A3(XXB3), .A4(XXB4), .A5(XXB5), .A6(XXB6), .D(DXZ3), .Q(IC97_14_TO_IC111_3_AND_IC111_14));

	/* IC98 - 4116 */
	_4116 IC98(.RAS(BRAS0_AL), .CAS(BCAS0_AL), .WE(BWE0_AL), .A0(XXB0), .A1(XXB1), .A2(XXB2), .A3(XXB3), .A4(XXB4), .A5(XXB5), .A6(XXB6), .D(DXZ2), .Q(IC98_14_TO_IC111_6_AND_IC111_11));

	/* IC99 - 4116 */
	_4116 IC99(.RAS(BRAS0_AL), .CAS(BCAS0_AL), .WE(BWE0_AL), .A0(XXB0), .A1(XXB1), .A2(XXB2), .A3(XXB3), .A4(XXB4), .A5(XXB5), .A6(XXB6), .D(DXZ1), .Q(IC99_14_TO_IC111_5_AND_IC111_10));

	/* IC100 - 4116 */
	_4116 IC100(.RAS(BRAS0_AL), .CAS(BCAS0_AL), .WE(BWE0_AL), .A0(XXB0), .A1(XXB1), .A2(XXB2), .A3(XXB3), .A4(XXB4), .A5(XXB5), .A6(XXB6), .D(DXZ0), .Q(IC100_14_TO_IC111_2_AND_IC111_13));

	/* IC111 - LS157 */
	ls157 IC111(._AB(IC117_12_TO_IC111_1_AND_IC112_1_AND_IC113_1_AND_IC114_1), ._G(IC139_6_TO_IC111_15_AND_IC112_15_AND_IC113_15_AND_IC114_15), ._1A(IC100_14_TO_IC111_2_AND_IC111_13), ._1B(IC97_14_TO_IC111_3_AND_IC111_14), ._1Y(IC111_4_TO_IC125_5), ._2A(IC99_14_TO_IC111_5_AND_IC111_10), ._2B(IC98_14_TO_IC111_6_AND_IC111_11), ._2Y(IC111_7_TO_IC125_4), ._3A(IC98_14_TO_IC111_6_AND_IC111_11), ._3B(IC99_14_TO_IC111_5_AND_IC111_10), ._3Y(IC111_9_TO_IC125_3), ._4A(IC97_14_TO_IC111_3_AND_IC111_14), ._4B(IC100_14_TO_IC111_2_AND_IC111_13), ._4Y(IC111_12_TO_IC125_2));

	/* IC112 - LS157 */
	ls157 IC112(._AB(IC117_12_TO_IC111_1_AND_IC112_1_AND_IC113_1_AND_IC114_1), ._G(IC139_6_TO_IC111_15_AND_IC112_15_AND_IC113_15_AND_IC114_15), ._1A(IC86_14_TO_IC112_2_AND_IC112_13), ._1B(IC83_14_TO_IC112_3_AND_IC112_14), ._1Y(IC112_4_TO_IC126_5), ._2A(IC85_14_TO_IC112_5_AND_IC112_10), ._2B(IC84_14_TO_IC112_6_AND_IC112_11), ._2Y(IC112_7_TO_IC126_4), ._3A(IC84_14_TO_IC112_6_AND_IC112_11), ._3B(IC85_14_TO_IC112_5_AND_IC112_10), ._3Y(IC112_9_TO_IC126_3), ._4A(IC83_14_TO_IC112_3_AND_IC112_14), ._4B(IC86_14_TO_IC112_2_AND_IC112_13), ._4Y(IC112_12_TO_IC126_2));

	/* IC113 - LS157 */
	ls157 IC113(._AB(IC117_12_TO_IC111_1_AND_IC112_1_AND_IC113_1_AND_IC114_1), ._G(IC139_6_TO_IC111_15_AND_IC112_15_AND_IC113_15_AND_IC114_15), ._1A(IC73_14_TO_IC113_2_AND_IC113_13), ._1B(IC70_14_TO_IC113_3_AND_IC113_14), ._1Y(IC113_4_TO_IC127_5), ._2A(IC72_14_TO_IC113_5_AND_IC113_10), ._2B(IC71_14_TO_IC113_6_AND_IC113_11), ._2Y(IC113_7_TO_IC127_4), ._3A(IC71_14_TO_IC113_6_AND_IC113_11), ._3B(IC72_14_TO_IC113_5_AND_IC113_10), ._3Y(IC113_9_TO_IC127_3), ._4A(IC70_14_TO_IC113_3_AND_IC113_14), ._4B(IC73_14_TO_IC113_2_AND_IC113_13), ._4Y(IC113_12_TO_IC127_2));

	/* IC114 - LS157 */
	ls157 IC114(._AB(IC117_12_TO_IC111_1_AND_IC112_1_AND_IC113_1_AND_IC114_1), ._G(IC139_6_TO_IC111_15_AND_IC112_15_AND_IC113_15_AND_IC114_15), ._1A(IC62_14_TO_IC114_2_AND_IC114_13), ._1B(IC59_14_TO_IC114_3_AND_IC114_14), ._1Y(IC114_4_TO_IC128_5), ._2A(IC61_14_TO_IC114_5_AND_IC114_10), ._2B(IC60_14_TO_IC114_6_AND_IC114_11), ._2Y(IC114_7_TO_IC128_4), ._3A(IC60_14_TO_IC114_6_AND_IC114_11), ._3B(IC61_14_TO_IC114_5_AND_IC114_10), ._3Y(IC114_9_TO_IC128_3), ._4A(IC59_14_TO_IC114_3_AND_IC114_14), ._4B(IC62_14_TO_IC114_2_AND_IC114_13), ._4Y(IC114_12_TO_IC128_2));

	/* IC125 - LS95 */
	ls95 IC125(._CLK1(SFT_AL), ._CLK2(SFT_AL), ._SER(), ._MODE(LD_SFT_AL), ._A(IC111_12_TO_IC125_2), ._B(IC111_9_TO_IC125_3), ._C(IC111_7_TO_IC125_4), ._D(IC111_4_TO_IC125_5), ._QA(), ._QB(), ._QC(), ._QD(BZ));

	/* IC126 - LS95 */
	ls95 IC126(._CLK1(SFT_AL), ._CLK2(SFT_AL), ._SER(), ._MODE(LD_SFT_AL), ._A(IC112_12_TO_IC126_2), ._B(IC112_9_TO_IC126_3), ._C(IC112_7_TO_IC126_4), ._D(IC112_4_TO_IC126_5), ._QA(), ._QB(), ._QC(), ._QD(BR));

	/* IC127 - LS95 */
	ls95 IC127(._CLK1(SFT_AL), ._CLK2(SFT_AL), ._SER(), ._MODE(LD_SFT_AL), ._A(IC113_12_TO_IC127_2), ._B(IC113_9_TO_IC127_3), ._C(IC113_7_TO_IC127_4), ._D(IC113_4_TO_IC127_5), ._QA(), ._QB(), ._QC(), ._QD(BG));

	/* IC128 - LS95 */
	ls95 IC128(._CLK1(SFT_AL), ._CLK2(SFT_AL), ._SER(), ._MODE(LD_SFT_AL), ._A(IC114_12_TO_IC128_2), ._B(IC114_9_TO_IC128_3), ._C(IC114_7_TO_IC128_4), ._D(IC114_4_TO_IC128_5), ._QA(), ._QB(), ._QC(), ._QD(BB));

	/* IC140 - LS32 */
	ls32 IC140(._1A(BBHF_AL), ._1B(IC142_8_TO_IC140_2_AND_IC140_5_AND_IC140_10), ._1Y(IC140_3_TO_IC141_13), ._2A(BRHF_AL), ._2B(IC142_8_TO_IC140_2_AND_IC140_5_AND_IC140_10), ._2Y(IC140_6_TO_IC141_5), ._3A(BGHF_AL), ._3B(IC142_8_TO_IC140_2_AND_IC140_5_AND_IC140_10), ._3Y(IC140_8_TO_IC141_9), ._4A(1'b1), ._4B(1'b1), ._4Y());

	/* IC141 - LS10 */
	ls10 IC141(._1A(BB), ._1B(IC139_3_TO_IC141_2_AND_IC141_3_AND_IC141_11), ._1C(IC140_3_TO_IC141_13), ._1Y(BVB), ._2A(IC139_3_TO_IC141_2_AND_IC141_3_AND_IC141_11), ._2B(BR), ._2C(IC140_6_TO_IC141_5), ._2Y(BVR), ._3A(IC140_8_TO_IC141_9), ._3B(BG), ._3C(IC139_3_TO_IC141_2_AND_IC141_3_AND_IC141_11), ._3Y(BVG));

	/* IC142 - LS32 */
	ls32 IC142(._1A(BB), ._1B(BG), ._1Y(IC142_3_TO_IC142_4), ._2A(IC142_3_TO_IC142_4), ._2B(IC142_11_TO_IC142_5), ._2Y(BY_AL), ._3A(KOS1), ._3B(BZ), ._3Y(IC142_8_TO_IC140_2_AND_IC140_5_AND_IC140_10), ._4A(BR), ._4B(BZ), ._4Y(IC142_11_TO_IC142_5));


	/* -> External Shared Logic
	// IC117 - LS04
	// ls04 IC117(._1A(CN1[35]), ._1Y(IC117_2_TO_IC131_1), ._2A(CN1[37]), ._2Y(IC117_3_TO_IC133_4), ._3A(CN1[39]), ._3Y(IC117_6_TO_IC133_9), ._4A(CN1[34]), ._4Y(IC117_8_TO_IC131_11), ._5A(SEL_I_II_AL_A), ._5Y(IC117_10_TO_IC107_1_AND_IC108_1_AND_IC109_1_AND_IC110_1), ._6A(SEL_I_II_AL_B), ._6Y(IC117_12_TO_IC111_1_AND_IC112_1_AND_IC113_1_AND_IC114_1));
	//
	// IC139 - LS00
	// ls00 IC139(._1A(PRIB_AL), ._1B(AY_AL), ._1Y(IC139_3_TO_IC141_2_AND_IC141_3_AND_IC141_11), ._2A(ENB), ._2B(AV6_TICK_AL), ._2Y(IC139_6_TO_IC111_15_AND_IC112_15_AND_IC113_15_AND_IC114_15), ._3A(ENA), ._3B(AV6_TICK_AL), ._3Y(IC139_8_TO_IC107_15_AND_IC108_15_AND_IC109_15_AND_IC110_15), ._4A(BY_AL), ._4B(PRIA_AL), ._4Y(IC139_11_TO_IC137_2_AND_IC137_3_AND_IC137_11));
	*/
	
endmodule
