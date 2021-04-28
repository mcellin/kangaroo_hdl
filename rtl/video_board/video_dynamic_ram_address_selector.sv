/*#########################################################################
#File Name:     video_dynamic_ram_address_selector.sv
#Description:   Representation of Dynamic RAM Address Selector schematic 
#				diagram contained in Kangaroo Schematic Package Supplement 
#				Sheet 10B.
#				 			          
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/
	
module video_dynamic_ram_address_selector(
	/*-------------------------------------------------------------- /
	/ --------------------- Inputs and Outputs --------------------- /
	/ --------------------------------------------------------------*/
	
	/* -> Dynamic RAM Address Selector */
	input wire XG,
	input wire K2_AL,

	input wire AVAX13,
	input wire AVAX12,
	input wire AVAX11,
	input wire AVAX10,
	input wire AVAX9,
	input wire AVAX8,
	input wire AVAX7,
	input wire AVAX6,
	input wire AVAX5,
	input wire AVAX4,
	input wire AVAX3,
	input wire AVAX2,
	input wire AVAX1,
	input wire AVAX0,

	input wire AVBX13,
	input wire AVBX12,
	input wire AVBX11,
	input wire AVBX10,
	input wire AVBX9,
	input wire AVBX8,
	input wire AVBX7,
	input wire AVBX6,
	input wire AVBX5,
	input wire AVBX4,
	input wire AVBX3,
	input wire AVBX2,
	input wire AVBX1,
	input wire AVBX0,

	input wire ABX13,
	input wire ABX12,
	input wire ABX11,
	input wire ABX10,
	input wire ABX9,
	input wire ABX8,
	input wire ABX7,
	input wire ABX6,
	input wire ABX5,
	input wire ABX4,
	input wire ABX3,
	input wire ABX2,
	input wire ABX1,
	input wire ABX0,

	output wire XXA6,
	output wire XXA5,
	output wire XXA4,
	output wire XXA3,
	output wire XXA2,
	output wire XXA1,
	output wire XXA0,
	
	output wire XXB6,
	output wire XXB5,
	output wire XXB4,
	output wire XXB3,
	output wire XXB2,
	output wire XXB1,
	output wire XXB0,

	output wire WE,
	

	/* -> External Shared Logic */
	/* IC17 - LS04 */
	input wire IC17_8_TO_IC42_2_AND_IC43_2_AND_IC44_2_AND_IC45_2_AND_IC46_2_AND_IC47_2_AND_IC48_2_AND_IC49_2 
);


	/*-------------------------------------------------------------- /
	/ --------------------- Module Instantiation ------------------- /
	/ --------------------------------------------------------------*/

	/* -> Dynamic RAM Address Selector */
	/* IC42 - LS153 */
	ls153 IC42(._A(XG), ._B(IC17_8_TO_IC42_2_AND_IC43_2_AND_IC44_2_AND_IC45_2_AND_IC46_2_AND_IC47_2_AND_IC48_2_AND_IC49_2), ._1G(1'b0), ._1C0(ABX0), ._1C1(ABX7), ._1C2(AVAX6), ._1C3(AVAX13), ._1Y(XXA6), ._2G(1'b0), ._2C0(1'b0), ._2C1(1'b1), ._2C2(1'b0), ._2C3(1'b0), ._2Y(WE));

	/* IC43 - LS153 */
	ls153 IC43(._A(XG), ._B(IC17_8_TO_IC42_2_AND_IC43_2_AND_IC44_2_AND_IC45_2_AND_IC46_2_AND_IC47_2_AND_IC48_2_AND_IC49_2), ._1G(1'b0), ._1C0(ABX12), ._1C1(ABX5), ._1C2(AVAX4), ._1C3(AVAX11), ._1Y(XXA4), ._2G(1'b0), ._2C0(ABX13), ._2C1(ABX6), ._2C2(AVAX5), ._2C3(AVAX12), ._2Y(XXA5));

	/* IC44 - LS153 */
	ls153 IC44(._A(XG), ._B(IC17_8_TO_IC42_2_AND_IC43_2_AND_IC44_2_AND_IC45_2_AND_IC46_2_AND_IC47_2_AND_IC48_2_AND_IC49_2), ._1G(1'b0), ._1C0(ABX10), ._1C1(ABX3), ._1C2(AVAX2), ._1C3(AVAX9), ._1Y(XXA2), ._2G(1'b0), ._2C0(ABX11), ._2C1(ABX4), ._2C2(AVAX3), ._2C3(AVAX10), ._2Y(XXA3));

	/* IC45 - LS153 */
	ls153 IC45(._A(XG), ._B(IC17_8_TO_IC42_2_AND_IC43_2_AND_IC44_2_AND_IC45_2_AND_IC46_2_AND_IC47_2_AND_IC48_2_AND_IC49_2), ._1G(1'b0), ._1C0(ABX8), ._1C1(ABX1), ._1C2(AVAX0), ._1C3(AVAX7), ._1Y(XXA0), ._2G(1'b0), ._2C0(ABX9), ._2C1(ABX2), ._2C2(AVAX1), ._2C3(AVAX8), ._2Y(XXA1));

	/* IC46 - LS153 */
	ls153 IC46(._A(XG), ._B(IC17_8_TO_IC42_2_AND_IC43_2_AND_IC44_2_AND_IC45_2_AND_IC46_2_AND_IC47_2_AND_IC48_2_AND_IC49_2), ._1G(1'b0), ._1C0(ABX0), ._1C1(ABX7), ._1C2(AVBX6), ._1C3(AVBX13), ._1Y(XXB6), ._2G(1'b0), ._2C0(1'b0), ._2C1(1'b1), ._2C2(1'b0), ._2C3(1'b0), ._2Y());

	/* IC47 - LS153 */
	ls153 IC47(._A(XG), ._B(IC17_8_TO_IC42_2_AND_IC43_2_AND_IC44_2_AND_IC45_2_AND_IC46_2_AND_IC47_2_AND_IC48_2_AND_IC49_2), ._1G(1'b0), ._1C0(ABX12), ._1C1(ABX5), ._1C2(AVBX4), ._1C3(AVBX11), ._1Y(XXB4), ._2G(1'b0), ._2C0(ABX13), ._2C1(ABX6), ._2C2(AVBX5), ._2C3(AVBX12), ._2Y(XXB5));

	/* IC48 - LS153 */
	ls153 IC48(._A(XG), ._B(IC17_8_TO_IC42_2_AND_IC43_2_AND_IC44_2_AND_IC45_2_AND_IC46_2_AND_IC47_2_AND_IC48_2_AND_IC49_2), ._1G(1'b0), ._1C0(ABX10), ._1C1(ABX3), ._1C2(AVBX2), ._1C3(AVBX9), ._1Y(XXB2), ._2G(1'b0), ._2C0(ABX11), ._2C1(ABX4), ._2C2(AVBX3), ._2C3(AVBX10), ._2Y(XXB3));

	/* IC49 - LS153 */
	ls153 IC49(._A(XG), ._B(IC17_8_TO_IC42_2_AND_IC43_2_AND_IC44_2_AND_IC45_2_AND_IC46_2_AND_IC47_2_AND_IC48_2_AND_IC49_2), ._1G(1'b0), ._1C0(ABX8), ._1C1(ABX1), ._1C2(AVBX0), ._1C3(AVBX7), ._1Y(XXB0), ._2G(1'b0), ._2C0(ABX9), ._2C1(ABX2), ._2C2(AVBX1), ._2C3(AVBX8), ._2Y(XXB1));


	/* -> External Shared Logic 
	// IC17 - LS04
	// ls04 IC17(._1A(IC7_11_TO_IC7_12_AND_IC17_1), ._1Y(IC17_2_TO_IC17_13), ._2A(IC6_9_TO_IC17_3), ._2Y(K2_AL), ._3A(AV14), ._3Y(IC17_6_TO_IC29_11_AND_IC31_11), ._4A(K2_AL), ._4Y(IC17_8_TO_IC42_2_AND_IC43_2_AND_IC44_2_AND_IC45_2_AND_IC46_2_AND_IC47_2_AND_IC48_2_AND_IC49_2), ._5A(IC7_7_TO_IC6_2_AND_IC7_4_AND_IC7_13_AND_IC17_11_AND_IC19_4_AND_IC30_1), ._5Y(K1_AL), ._6A(IC17_2_TO_IC17_13), ._6Y(SFT_AL));
	*/
	
endmodule
