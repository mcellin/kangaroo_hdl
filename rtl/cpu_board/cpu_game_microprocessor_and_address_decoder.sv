/*#########################################################################
#File Name:     cpu_game_microprocessor_and_address_decoder.sv
#Description:   Representation of Game Microprocessor and Address Decoder
#               schematic diagrams contained in Kangaroo Schematic Package
#				Supplement Sheet 5A            
#
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

module cpu_game_microprocessor_and_address_decoder(
	/*-------------------------------------------------------------- /
	/ --------------------- Inputs and Outputs --------------------- /
	/ --------------------------------------------------------------*/
	
	/* -> Game Microprocessor */
	input wire FPGA_RESET,
	input wire CPU_CLOCK,
	input wire NMI_AL,
	input wire INT_AL,
	input wire WAIT_AL,
	output wire RESET_AL,
	output wire MR_AL,
	output wire MW_AL,
	output wire A0,
	output wire A1,
	output wire A2,
	output wire A3,
	output wire A4,
	output wire A5,
	output wire A6,
	output wire A7,
	output wire A8,
	output wire A9,
	output wire A10,
	output wire A11,
	output wire AB0,
	output wire AB1,
	output wire AB2,
	output wire AB3,
	output wire AB4,
	output wire AB5,
	output wire AB6,
	output wire AB7,
	output wire AB8,
	output wire AB9,
	output wire AB10,
	output wire AB11,
	output wire AB12,
	output wire AB13,
	output wire AB14,
	output wire AB15,

	/* CN1_37 */
	output wire IC3_11_TO_IC21_5_AND_IC21_10,

	inout wire D0,
	inout wire D1,
	inout wire D2,
	inout wire D3,
	inout wire D4,
	inout wire D5,
	inout wire D6,
	inout wire D7,
	inout wire DB0,
	inout wire DB1,
	inout wire DB2,
	inout wire DB3,
	inout wire DB4,
	inout wire DB5,
	inout wire DB6,
	inout wire DB7,

	/* -> Address Decoder */
	output wire GS_AL,
	output wire CS2_AL,
	output wire RAM_AL,
	output wire ROM0_AL,
	output wire ROM1_AL,
	output wire ROM2_AL,
	output wire ROM3_AL,
	output wire ROM4_AL,
	output wire ROM5_AL,
	output wire OUT0_AL,
	output wire OUT1_AL,
	output wire OUT2_AL,
	output wire OUT3_AL,
	output wire IN0_AL,
	output wire IN1_AL,
	output wire IN2_AL,
	output wire IN3_AL,
	output wire IN4_AL,
	output wire HFEN,
	output wire I_II_EN_PRI,
	output wire BSEL,
	output wire HPOS_AL,
	output wire VPOS_AL,
	output wire XYH_AL,
	output wire XYL_AL,
	output wire WRH_AL,
	output wire WRL_AL,
	output wire RDH_AL,
	output wire RDL_AL,
	

	/* -> External Shared Logic */
	/* IC35 - LS04 - Shared with Custom Microprocessor */
	input wire IC35_10_TO_IC35_5_AND_IC12_11, 
	input wire IC35_6_TO_IC15_26, 

	/* IC37 - LS367 - Shared with Custom Microprocessor */
	input wire IC37_11_TO_IC15_17, 
	input wire IC37_13_TO_IC15_16
);


	/*-------------------------------------------------------------- /
	/ --------------------- Nets and Registers --------------------- /
	/-------------------------------------------------------------- */

	/* -> Game Microprocessor */
	wire CS0_AL, CS1_AL, CS3_AL, A12, A13, A14, A15, MREQA_AL;
	wire IC3_13_TO_IC15_6;
	wire IC11_3_TO_IC1_1, IC11_6_TO_IC11_9, IC11_8_TO_IC1_15, IC11_11_TO_IC11_10;
	wire IC12_2_TO_IC20_1, IC12_4_TO_IC11_4, IC12_6_TO_IC22_6, IC12_8_TO_IC21_13, IC12_12_TO_IC13_2;
	wire IC13_3_TO_IC11_1, IC13_6_TO_IC11_2, IC13_11_TO_IC12_9;
	wire IC15_21_TO_IC21_9, IC15_22_TO_IC21_4;


	/*-------------------------------------------------------------- /
	/ --------------------- Module Instantiation ------------------- /
	/ --------------------------------------------------------------*/

	/* -> Game Microprocessor */
	/* IC1 - LS139 */
	ls139 IC1(._1G(IC11_3_TO_IC1_1), ._1A(AB10), ._1B(AB11), ._1Y0(CS0_AL), ._1Y1(CS1_AL), ._1Y2(CS2_AL), ._1Y3(CS3_AL), ._2G(IC11_8_TO_IC1_15), ._2A(AB0), ._2B(AB1), ._2Y0(BSEL), ._2Y1(I_II_EN_PRI), ._2Y2(HFEN), ._2Y3());

	/* IC2 - LS42 */
	ls42 IC2(._0(ROM0_AL), ._1(ROM1_AL), ._2(ROM2_AL), ._3(ROM3_AL), ._4(ROM4_AL), ._5(ROM5_AL), ._6(), ._7(), ._8(), ._9(), ._A(AB12), ._B(AB13), ._C(AB14), ._D(AB15));

	/* IC3 - LS367 */
	ls367 IC3(._1G(1'b0), ._1A1(A14), ._1Y1(AB14), ._1A2(A13), ._1Y2(AB13), ._1A3(A12), ._1Y3(AB12), ._1A4(A15), ._1Y4(AB15), ._2G(1'b0), ._2A1(MREQA_AL), ._2Y1(IC3_11_TO_IC21_5_AND_IC21_10), ._2A2(CPU_CLOCK), ._2Y2(IC3_13_TO_IC15_6));

	/* IC4 - LS367 */
	ls367 IC4(._1G(1'b0), ._1A1(A6), ._1Y1(AB6), ._1A2(A7), ._1Y2(AB7), ._1A3(A8), ._1Y3(AB8), ._1A4(A9), ._1Y4(AB9), ._2G(1'b0), ._2A1(A10), ._2Y1(AB10), ._2A2(A11), ._2Y2(AB11));

	/* IC11 - LS32 */
	ls32 IC11(._1A(IC13_3_TO_IC11_1), ._1B(IC13_6_TO_IC11_2), ._1Y(IC11_3_TO_IC1_1), ._2A(IC12_4_TO_IC11_4), ._2B(AB2), ._2Y(IC11_6_TO_IC11_9), ._3A(IC11_6_TO_IC11_9), ._3B(IC11_11_TO_IC11_10), ._3Y(IC11_8_TO_IC1_15), ._4A(MW_AL), ._4B(CS2_AL), ._4Y(IC11_11_TO_IC11_10));

	/* IC12 - LS04 */
	ls04 IC12(._1A(CS3_AL), ._1Y(IC12_2_TO_IC20_1), ._2A(AB3), ._2Y(IC12_4_TO_IC11_4), ._3A(AB3), ._3Y(IC12_6_TO_IC22_6), ._4A(IC13_11_TO_IC12_9), ._4Y(IC12_8_TO_IC21_13), ._5A(IC35_10_TO_IC35_5_AND_IC12_11), ._5Y(RESET_AL), ._6A(AB12), ._6Y(IC12_12_TO_IC13_2));

	/* IC13 - LS00 */
	ls00 IC13(._1A(AB13), ._1B(IC12_12_TO_IC13_2), ._1Y(IC13_3_TO_IC11_1), ._2A(AB14), ._2B(AB15), ._2Y(IC13_6_TO_IC11_2), ._3A(AB15), ._3B(CS0_AL), ._3Y(GS_AL), ._4A(MW_AL), ._4B(MR_AL), ._4Y(IC13_11_TO_IC12_9));

	/* IC14 - LS367 */
	ls367 IC14(._1G(1'b0), ._1A1(A2), ._1Y1(AB2), ._1A2(A1), ._1Y2(AB1), ._1A3(A0), ._1Y3(AB0), ._1A4(A4), ._1Y4(AB4), ._2G(1'b0), ._2A1(A3), ._2Y1(AB3), ._2A2(A5), ._2Y2(AB5));

	/* IC15 - Z80 */
	z80_top_direct_n IC34(.nM1(), .nMREQ(MREQA_AL), .nIORQ(), .nRD(IC15_21_TO_IC21_9), .nWR(IC15_22_TO_IC21_4), .nRFSH(), .nHALT(), .nBUSACK(), .nWAIT(WAIT_AL), .nINT(IC37_13_TO_IC15_16), .nNMI(IC37_11_TO_IC15_17), .nRESET(IC35_6_TO_IC15_26), .nBUSRQ(1'b1), .CLK(IC3_13_TO_IC15_6), .A({A15,A14,A13,A12,A11,A10,A9,A8,A7,A6,A5,A4,A3,A2,A1,A0}), .D({D7,D6,D5,D4,D3,D2,D1,D0}));

	/* IC20 - LS155 */
	ls155 IC20(._A(AB8), ._B(AB9), ._1C(IC12_2_TO_IC20_1), ._1G(MR_AL), ._1Y0(IN0_AL), ._1Y1(IN1_AL), ._1Y2(IN2_AL), ._1Y3(IN3_AL), ._2C(CS3_AL), ._2G(MW_AL), ._2Y0(OUT0_AL), ._2Y1(OUT1_AL), ._2Y2(OUT2_AL), ._2Y3(OUT3_AL));

	/* IC21 - LS32 */
	ls32 IC21(._1A(MR_AL), ._1B(CS1_AL), ._1Y(IN4_AL), ._2A(IC15_22_TO_IC21_4), ._2B(IC3_11_TO_IC21_5_AND_IC21_10), ._2Y(MW_AL), ._3A(IC15_21_TO_IC21_9), ._3B(IC3_11_TO_IC21_5_AND_IC21_10), ._3Y(MR_AL), ._4A(CS0_AL), ._4B(IC12_8_TO_IC21_13), ._4Y(RAM_AL));

	/* IC22 - LS138 */
	ls138 IC22(._A(AB0), ._B(AB1), ._C(AB2), ._G1(IC12_6_TO_IC22_6), ._G2A(MW_AL), ._G2B(CS2_AL), ._Y0(RDL_AL), ._Y1(RDH_AL), ._Y2(WRL_AL), ._Y3(WRH_AL), ._Y4(XYL_AL), ._Y5(XYH_AL), ._Y6(VPOS_AL), ._Y7(HPOS_AL));

	/* IC23 - LS245 */
	ls245 IC23(._DIR(MR_AL), ._OE(GS_AL), ._A1(D0), ._A2(D1), ._A3(D2), ._A4(D3), ._A5(D4), ._A6(D5), ._A7(D6), ._A8(D7), ._B1(DB0), ._B2(DB1), ._B3(DB2), ._B4(DB3), ._B5(DB4), ._B6(DB5), ._B7(DB6), ._B8(DB7));


	/* -> External Shared Logic
	// IC35 - LS04 - Shared with Custom Microprocessor
	// ls04 IC35(._1A(), ._1Y(), ._2A(), ._2Y(), ._3A(IC35_10_TO_IC35_5_AND_IC12_11), ._3Y(IC35_6_TO_IC15_26), ._4A(1'b0), ._4Y(), ._5A(RESET_GEN), ._5Y(IC35_10_TO_IC35_5_AND_IC12_11), ._6A(), ._6Y());
	//
	// IC37 - LS367 - Shared with Custom Microprocessor
	// ls367 IC37(._1G(), ._1A1(), ._1Y1(), ._1A2(), ._1Y2(), ._1A3(), ._1Y3(), ._1A4(), ._1Y4(), ._2G(1'b0), ._2A1(NMI_AL), ._2Y1(IC37_11_TO_IC15_17), ._2A2(CN1[42]), ._2Y2(IC37_13_TO_IC15_16));
	*/
	
endmodule
