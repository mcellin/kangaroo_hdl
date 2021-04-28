/*#########################################################################
#File Name:     video_dynamic_ram_address_from_cpu_and_for_dma.sv
#Description:   Representation of Dynamic RAM Address from CPU and for DMA 
#				diagram contained in Kangaroo Schematic Package Supplement 
#				Sheet 10A.
#				 			          
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

module video_dynamic_ram_address_from_cpu_and_for_dma(
	/*-------------------------------------------------------------- /
	/ --------------------- Inputs and Outputs --------------------- /
	/ --------------------------------------------------------------*/
	
	/* -> Dynamic RAM Address from CPU and for DMA */
	input wire WRH_AL,
	input wire LDL_AL,
	input wire WRL_AL,

	input wire AB13,
	input wire AB12,
	input wire AB11,
	input wire AB10,
	input wire AB9,
	input wire AB8,
	input wire AB7,
	input wire AB6,
	input wire AB5,
	input wire AB4,
	input wire AB3,
	input wire AB2,
	input wire AB1,
	input wire AB0,

	input wire DB7,
	input wire DB6,
	input wire DB5,
	input wire DB4,
	input wire DB3,
	input wire DB2,
	input wire DB1,
	input wire DB0,
	
	input wire K2,
	input wire EXCT_SB,
	input wire K1_AL,

	output wire ABX11,
	output wire ABX10,
	output wire ABX9,
	output wire ABX8,
	output wire ABX7,
	output wire ABX6,
	output wire ABX5,
	output wire ABX4,
	output wire ABX3,
	output wire ABX2,
	output wire ABX1,
	output wire ABX0,


	/* -> External Shared Logic */
	/* IC12 - LS157 */
	output wire IC1_14_TO_IC12_3,
	output wire IC1_13_TO_IC12_6,

	/* IC19 - LS00 */
	input wire IC19_3_TO_IC1_7_AND_IC2_7
);


	/*-------------------------------------------------------------- /
	/ --------------------- Nets and Registers --------------------- /
	/-------------------------------------------------------------- */

	/* -> Dynamic RAM Address from CPU and for DMA */
	wire IC2_15_TO_IC1_10, IC2_14_TO_IC13_3, IC2_13_TO_IC13_6, IC2_12_TO_IC13_10, IC2_11_TO_IC13_13, IC3_2_TO_IC14_3, IC3_7_TO_IC14_4, IC3_10_TO_IC14_5, IC3_15_TO_IC14_6, IC4_2_TO_IC15_3, IC4_7_TO_IC15_4, IC4_10_TO_IC15_5, IC4_15_TO_IC15_6, IC15_15_TO_IC14_10, IC14_14_TO_IC25_3, IC14_13_TO_IC25_6, IC14_12_TO_IC25_10, IC14_11_TO_IC25_13, IC15_14_TO_IC26_3, IC15_13_TO_IC26_6, IC15_12_TO_IC26_10, IC15_11_TO_IC26_13;


	/*-------------------------------------------------------------- /
	/ --------------------- Module Instantiation ------------------- /
	/ --------------------------------------------------------------*/

	/* -> Dynamic RAM Address from CPU and for DMA */
	/* IC1 - LS163 */
	ls163 IC1(._CLK(K1_AL), ._CLR(1'b1), ._LOAD(WRH_AL), ._ENP(IC19_3_TO_IC1_7_AND_IC2_7), ._ENT(IC2_15_TO_IC1_10), ._RCO(), ._A(DB4), ._B(DB5), ._C(DB6), ._D(DB7), ._QA(IC1_14_TO_IC12_3), ._QB(IC1_13_TO_IC12_6), ._QC(), ._QD());

	/* IC2 - LS163 */
	ls163 IC2(._CLK(K1_AL), ._CLR(1'b1), ._LOAD(WRH_AL), ._ENP(IC19_3_TO_IC1_7_AND_IC2_7), ._ENT(EXCT_SB), ._RCO(IC2_15_TO_IC1_10), ._A(DB0), ._B(DB1), ._C(DB2), ._D(DB3), ._QA(IC2_14_TO_IC13_3), ._QB(IC2_13_TO_IC13_6), ._QC(IC2_12_TO_IC13_10), ._QD(IC2_11_TO_IC13_13));

	/* IC3 - LS175 */
	ls175 IC3(._CLK(WRL_AL), ._CLR(1'b1), ._1D(DB4), ._1Q(IC3_2_TO_IC14_3), ._1Q_INV(), ._2D(DB5), ._2Q(IC3_7_TO_IC14_4), ._2Q_INV(), ._3D(DB6), ._3Q(IC3_10_TO_IC14_5), ._3Q_INV(), ._4D(DB7), ._4Q(IC3_15_TO_IC14_6), ._4Q_INV());

	/* IC4 - LS175 */
	ls175 IC4(._CLK(WRL_AL), ._CLR(1'b1), ._1D(DB0), ._1Q(IC4_2_TO_IC15_3), ._1Q_INV(), ._2D(DB1), ._2Q(IC4_7_TO_IC15_4), ._2Q_INV(), ._3D(DB2), ._3Q(IC4_10_TO_IC15_5), ._3Q_INV(), ._4D(DB3), ._4Q(IC4_15_TO_IC15_6), ._4Q_INV());

	/* IC13 - LS157 */
	ls157 IC13(._AB(EXCT_SB), ._G(1'b0), ._1A(AB8), ._1B(IC2_14_TO_IC13_3), ._1Y(ABX8), ._2A(AB9), ._2B(IC2_13_TO_IC13_6), ._2Y(ABX9), ._3A(AB10), ._3B(IC2_12_TO_IC13_10), ._3Y(ABX10), ._4A(AB11), ._4B(IC2_11_TO_IC13_13), ._4Y(ABX11));

	/* IC14 - LS163 */
	ls163 IC14(._CLK(K1_AL), ._CLR(1'b1), ._LOAD(LDL_AL), ._ENP(K2), ._ENT(IC15_15_TO_IC14_10), ._RCO(), ._A(IC3_2_TO_IC14_3), ._B(IC3_7_TO_IC14_4), ._C(IC3_10_TO_IC14_5), ._D(IC3_15_TO_IC14_6), ._QA(IC14_14_TO_IC25_3), ._QB(IC14_13_TO_IC25_6), ._QC(IC14_12_TO_IC25_10), ._QD(IC14_11_TO_IC25_13));

	/* IC15 - LS163 */
	ls163 IC15(._CLK(K1_AL), ._CLR(1'b1), ._LOAD(LDL_AL), ._ENP(K2), ._ENT(EXCT_SB), ._RCO(IC15_15_TO_IC14_10), ._A(IC4_2_TO_IC15_3), ._B(IC4_7_TO_IC15_4), ._C(IC4_10_TO_IC15_5), ._D(IC4_15_TO_IC15_6), ._QA(IC15_14_TO_IC26_3), ._QB(IC15_13_TO_IC26_6), ._QC(IC15_12_TO_IC26_10), ._QD(IC15_11_TO_IC26_13));

	/* IC25 - LS157 */
	ls157 IC25(._AB(EXCT_SB), ._G(1'b0), ._1A(AB4), ._1B(IC14_14_TO_IC25_3), ._1Y(ABX4), ._2A(AB5), ._2B(IC14_13_TO_IC25_6), ._2Y(ABX5), ._3A(AB6), ._3B(IC14_12_TO_IC25_10), ._3Y(ABX6), ._4A(AB7), ._4B(IC14_11_TO_IC25_13), ._4Y(ABX7));

	/* IC26 - LS157 */
	ls157 IC26(._AB(EXCT_SB), ._G(1'b0), ._1A(AB0), ._1B(IC15_14_TO_IC26_3), ._1Y(ABX0), ._2A(AB1), ._2B(IC15_13_TO_IC26_6), ._2Y(ABX1), ._3A(AB2), ._3B(IC15_12_TO_IC26_10), ._3Y(ABX2), ._4A(AB3), ._4B(IC15_11_TO_IC26_13), ._4Y(ABX3));


	/* -> External Shared Logic */
	/* IC12 - LS157
	// ls157 IC12(._AB(EXCT_SB), ._G(1'b0), ._1A(CN1[33]), ._1B(IC1_14_TO_IC12_3), ._1Y(ABX12), ._2A(CN1[34]), ._2B(IC1_13_TO_IC12_6), ._2Y(ABX13), ._3A(CN1[33]), ._3B(IC41_5_TO_IC12_10), ._3Y(ABP12), ._4A(), ._4B(), ._4Y());
	//
	// IC19 - LS00
	// ls00 IC19(._1A(LDL_AL), ._1B(LDL_AL), ._1Y(IC19_3_TO_IC1_7_AND_IC2_7), ._2A(IC7_7_TO_IC6_2_AND_IC7_4_AND_IC7_13_AND_IC17_11_AND_IC19_4_AND_IC30_1), ._2B(IC6_5_TO_IC19_5_AND_IC19_10), ._2Y(RAS), ._3A(IC6_5_TO_IC19_5_AND_IC19_10), ._3B(IC7_2_TO_IC6_11_AND_IC19_9), ._3Y(XG), ._4A(IC28_5_TO_IC19_13_AND_IC27_1_AND_IC27_13), ._4B(IC28_8_TO_IC19_12_AND_IC27_2_AND_IC27_10_AND_IC27_12), ._4Y(EXCT_AL));
	*/
	
endmodule
