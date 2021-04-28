/*#########################################################################
#File Name:     video_picture_rom_address_selector.sv
#Description:   Representation of Picture ROM Address Selector schematic 
#				diagram contained in Kangaroo Schematic Package Supplement 
#				Sheet 9B.
#				 			          
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

module video_picture_rom_address_selector(
	/*-------------------------------------------------------------- /
	/ --------------------- Inputs and Outputs --------------------- /
	/ --------------------------------------------------------------*/
	
	/* -> Picture ROM Address Selector */
	input wire EXCT_RB,
	input wire EXCT_SB,
	input wire RDH_AL,
	input wire RDL_AL,
	input wire K1_AL,
	input wire K2,

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
	
	input wire ABP12, /* Driven by IC12 */
	output wire ABP11,
	output wire ABP10,
	output wire ABP9,
	output wire ABP8,
	output wire ABP7,
	output wire ABP6,
	output wire ABP5,
	output wire ABP4,
	output wire ABP3,
	output wire ABP2,
	output wire ABP1,
	output wire ABP0
);


	/*-------------------------------------------------------------- /
	/ --------------------- Nets and Registers --------------------- /
	/-------------------------------------------------------------- */

	/* -> Picture ROM Address Selector */
	wire IC41_5_TO_IC12_10, IC50_15_TO_IC63_10, IC50_14_TO_IC51_3, IC50_13_TO_IC51_6, IC50_12_TO_IC51_10, IC50_11_TO_IC51_13, IC63_15_TO_IC74_10, IC63_14_TO_IC64_3, IC63_13_TO_IC64_6, IC63_12_TO_IC64_10, IC63_11_TO_IC64_13, IC74_14_TO_IC75_3, IC74_13_TO_IC75_6, IC74_12_TO_IC75_10, IC74_11_TO_IC75_13;


	/*-------------------------------------------------------------- /
	/ --------------------- Module Instantiation ------------------- /
	/ --------------------------------------------------------------*/

	/* -> Picture ROM Address Selector */
	/* IC50 - LS163 */
	ls163 IC50(._CLK(K1_AL), ._CLR(1'b1), ._LOAD(RDL_AL), ._ENP(K2), ._ENT(EXCT_RB), ._RCO(IC50_15_TO_IC63_10), ._A(DB0), ._B(DB1), ._C(DB2), ._D(DB3), ._QA(IC50_14_TO_IC51_3), ._QB(IC50_13_TO_IC51_6), ._QC(IC50_12_TO_IC51_10), ._QD(IC50_11_TO_IC51_13));

	/* IC51 - LS157 */
	ls157 IC51(._AB(EXCT_RB), ._G(1'b0), ._1A(AB0), ._1B(IC50_14_TO_IC51_3), ._1Y(ABP0), ._2A(AB1), ._2B(IC50_13_TO_IC51_6), ._2Y(ABP1), ._3A(AB2), ._3B(IC50_12_TO_IC51_10), ._3Y(ABP2), ._4A(AB3), ._4B(IC50_11_TO_IC51_13), ._4Y(ABP3));

	/* IC63 - LS163 */
	ls163 IC63(._CLK(K1_AL), ._CLR(1'b1), ._LOAD(RDL_AL), ._ENP(K2), ._ENT(IC50_15_TO_IC63_10), ._RCO(IC63_15_TO_IC74_10), ._A(DB4), ._B(DB5), ._C(DB6), ._D(DB7), ._QA(IC63_14_TO_IC64_3), ._QB(IC63_13_TO_IC64_6), ._QC(IC63_12_TO_IC64_10), ._QD(IC63_11_TO_IC64_13));

	/* IC64 - LS157 */
	ls157 IC64(._AB(EXCT_RB), ._G(1'b0), ._1A(AB4), ._1B(IC63_14_TO_IC64_3), ._1Y(ABP4), ._2A(AB5), ._2B(IC63_13_TO_IC64_6), ._2Y(ABP5), ._3A(AB6), ._3B(IC63_12_TO_IC64_10), ._3Y(ABP6), ._4A(AB7), ._4B(IC63_11_TO_IC64_13), ._4Y(ABP7));

	/* IC74 - LS163 */
	ls163 IC74(._CLK(K1_AL), ._CLR(1'b1), ._LOAD(RDH_AL), ._ENP(K2), ._ENT(IC63_15_TO_IC74_10), ._RCO(), ._A(DB0), ._B(DB1), ._C(DB2), ._D(DB3), ._QA(IC74_14_TO_IC75_3), ._QB(IC74_13_TO_IC75_6), ._QC(IC74_12_TO_IC75_10), ._QD(IC74_11_TO_IC75_13));

	/* IC75 - LS157 */
	ls157 IC75(._AB(EXCT_RB), ._G(1'b0), ._1A(AB8), ._1B(IC74_14_TO_IC75_3), ._1Y(ABP8), ._2A(AB9), ._2B(IC74_13_TO_IC75_6), ._2Y(ABP9), ._3A(AB10), ._3B(IC74_12_TO_IC75_10), ._3Y(ABP10), ._4A(AB11), ._4B(IC74_11_TO_IC75_13), ._4Y(ABP11));


	/* -> External Shared Logic
	// IC12 - LS157
	// ls157 IC12(._AB(EXCT_SB), ._G(1'b0), ._1A(CN1[33]), ._1B(IC1_14_TO_IC12_3), ._1Y(ABX12), ._2A(CN1[34]), ._2B(IC1_13_TO_IC12_6), ._2Y(ABX13), ._3A(CN1[33]), ._3B(IC41_5_TO_IC12_10), ._3Y(ABP12), ._4A(), ._4B(), ._4Y());	//
	//
	// IC41 - LS74
	// ls74 IC41(._1CLR(1'b1), ._1D(CN1[17]), ._1CLK(CN1[3]), ._1PRE(1'b1), ._1Q(IC41_5_TO_IC12_10), ._1QINV(), ._2CLR(1'b1), ._2D(1'b0), ._2CLK(K2), ._2PRE(IC27_8_TO_IC41_10), ._2Q(IC41_9_TO_IC28_1), ._2QINV());
	*/

endmodule
