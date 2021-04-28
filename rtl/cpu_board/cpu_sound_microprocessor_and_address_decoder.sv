/*#########################################################################
#File Name:     cpu_sound_microprocessor_and_address_decoder.sv
#Description:   Representation of Sound Microprocessor and Address Decoder 
#               schematic diagrams contained in Kangaroo Schematic Package 
#				Supplement Sheet 6B  
#				          
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

module cpu_sound_microprocessor_and_address_decoder(
	/*-------------------------------------------------------------- /
	/ --------------------- Inputs and Outputs --------------------- /
	/ --------------------------------------------------------------*/
	
	/* -> Sound Microprocessor */
	input wire CPU_CLOCK,
	input wire INT_AL,
	input wire RESET_AL,
	input wire CLR_AL,
	input wire OUT0_AL,
	input wire DB0,
	input wire DB1,
	input wire DB2,
	input wire DB3,
	input wire DB4,
	input wire DB5,
	input wire DB6,
	input wire DB7,

	output wire CN2_SOUND_OUT,
	output wire CN2_SOUND_RTN
);


	/*-------------------------------------------------------------- /
	/ --------------------- Nets and Registers --------------------- /
	/-------------------------------------------------------------- */

	/* -> Sound Microprocessor */
	wire SOUND_ROM1_AL; /* This is called ROM1_AL in the schematic, renamed to avoid confusion with ROM1_AL driven by CPU address decoder. */
	wire SMR_AL, SMW_AL, RAMS_AL,  SRESET_AL, CLOCK_125M, BDIR, BC1, SA_AL, SD_AL, DIN_AL, DINS_AL, DAC_AL, DACS_AL;
	wire SA0, SA1, SA2, SA3, SA4, SA5, SA6, SA7, SA8, SA9, SA10, SA11, SA12, SA13, SA14, SA15;
	wire SD0, SD1, SD2, SD3, SD4, SD5, SD6, SD7; 
	wire IC30_6_TO_IC34_16, IC30_8_TO_IC30_12, IC30_9_TO_IC55_6;
	wire IC31_5_TO_IC49_9;
	wire IC34_19_TO_IC41_4_AND_IC41_10, IC34_20_TO_IC40_9, IC34_21_TO_IC41_5_AND_IC49_1, IC34_22_TO_IC41_9_AND_IC49_4_AND_IC49_13, IC34_27_TO_IC40_10;
	wire IC40_3_TO_IC30_3, IC40_8_TO_IC30_1, IC40_11_TO_IC30_11;
	wire IC47_2_TO_IC54_4, IC47_7_TO_IC54_12, IC47_10_TO_IC54_6, IC47_15_TO_IC54_14;
	wire IC48_8_TO_IC48_12_AND_IC48_13, IC48_11_TO_IC49_10;
	wire IC49_3_TO_IC48_2, IC49_6_TO_IC48_5, IC49_11_TO_IC48_1_AND_IC48_4;
	wire IC53_2_IC55_14, IC53_7_TO_IC55_12, IC53_10_TO_IC54_10, IC53_15_TO_IC54_2;
	wire IC55_3_TO_IC34_26, IC55_9_TO_IC34_6;
	

	/*-------------------------------------------------------------- /
	/ --------------------- Module Instantiation ------------------- /
	/ --------------------------------------------------------------*/

	/* -> Sound Microprocessor	*/
	/* IC24 - 2732				*/
	_2732 #(.INIT_FILE("P:/Jonathon/Code/modelsim/rom/tvg_81.8.mem"))  IC24(.E(SOUND_ROM1_AL), .G(SMR_AL), .A0(SA0), .A1(SA1), .A2(SA2), .A3(SA3), .A4(SA4), .A5(SA5), .A6(SA6), .A7(SA7), .A8(SA8), .A9(SA9), .A10(SA10), .A11(SA11), .Q0(SD0), .Q1(SD1), .Q2(SD2), .Q3(SD3), .Q4(SD4), .Q5(SD5), .Q6(SD6), .Q7(SD7));

	/* IC30 - LS74 */
	ls74 IC30(._1CLR(IC40_8_TO_IC30_1), ._1D(1'b1), ._1CLK(IC40_3_TO_IC30_3), ._1PRE(1'b1), ._1Q(), ._1QINV(IC30_6_TO_IC34_16), ._2CLR(1'b1), ._2D(IC30_8_TO_IC30_12), ._2CLK(IC40_11_TO_IC30_11), ._2PRE(1'b1), ._2Q(IC30_9_TO_IC55_6), ._2QINV(IC30_8_TO_IC30_12));

	/* IC32 - 2114 */
	_2114 IC32(.WE(SMW_AL), .CS(RAMS_AL), .A0(SA0), .A1(SA1), .A2(SA2), .A3(SA3), .A4(SA4), .A5(SA5), .A6(SA6), .A7(SA7), .A8(SA8), .A9(SA9), .D0(SD0), .D1(SD1), .D2(SD2), .D3(SD3));

	/* IC33 - 2114 */
	_2114 IC33(.WE(SMW_AL), .CS(RAMS_AL), .A0(SA0), .A1(SA1), .A2(SA2), .A3(SA3), .A4(SA4), .A5(SA5), .A6(SA6), .A7(SA7), .A8(SA8), .A9(SA9), .D0(SD4), .D1(SD5), .D2(SD6), .D3(SD7));

	/* IC34 - Z80 */
	z80_top_direct_n IC34(.nM1(IC34_27_TO_IC40_10), .nMREQ(IC34_19_TO_IC41_4_AND_IC41_10), .nIORQ(IC34_20_TO_IC40_9), .nRD(IC34_21_TO_IC41_5_AND_IC49_1), .nWR(IC34_22_TO_IC41_9_AND_IC49_4_AND_IC49_13), .nRFSH(), .nHALT(), .nBUSACK(), .nWAIT(1'b1), .nINT(IC30_6_TO_IC34_16), .nNMI(1'b1), .nRESET(IC55_3_TO_IC34_26), .nBUSRQ(1'b1), .CLK(IC55_9_TO_IC34_6), .A({SA15,SA14,SA13,SA12,SA11,SA10,SA9,SA8,SA7,SA6,SA5,SA4,SA3,SA2,SA1,SA0}), .D({SD7,SD6,SD5,SD4,SD3,SD2,SD1,SD0}));	

	/* IC40 - LS32 */
	ls32 IC40(._1A(INT_AL), ._1B(INT_AL), ._1Y(IC40_3_TO_IC30_3), ._2A(1'b0), ._2B(1'b0), ._2Y(), ._3A(IC34_20_TO_IC40_9), ._3B(IC34_27_TO_IC40_10), ._3Y(IC40_8_TO_IC30_1), ._4A(CPU_CLOCK), ._4B(CPU_CLOCK), ._4Y(IC40_11_TO_IC30_11));

	/* IC41 - LS32 */
	ls32 IC41(._1A(DIN_AL), ._1B(SMR_AL), ._1Y(DINS_AL), ._2A(IC34_19_TO_IC41_4_AND_IC41_10), ._2B(IC34_21_TO_IC41_5_AND_IC49_1), ._2Y(SMR_AL), ._3A(IC34_22_TO_IC41_9_AND_IC49_4_AND_IC49_13), ._3B(IC34_19_TO_IC41_4_AND_IC41_10), ._3Y(SMW_AL), ._4A(SMW_AL), ._4B(DAC_AL), ._4Y(DACS_AL));

	/* IC47 - LS175 */
	ls175 IC47(._CLK(OUT0_AL), ._CLR(CLR_AL), ._1D(DB4), ._1Q(IC47_2_TO_IC54_4), ._1Q_INV(), ._2D(DB5), ._2Q(IC47_7_TO_IC54_12), ._2Q_INV(), ._3D(DB6), ._3Q(IC47_10_TO_IC54_6), ._3Q_INV(), ._4D(DB7), ._4Q(IC47_15_TO_IC54_14), ._4Q_INV());

	/* IC50 - AY-3-8910 */
	ay_model IC50(.clk(CLOCK_125M), ._rst(SRESET_AL), .da({SD7,SD6,SD5,SD4,SD3,SD2,SD1,SD0}), .bdir(BDIR), .bc2(1'b1), .bc1(BC1), .a8(1'b1), ._a9(1'b0), .ioa(), .iob(), .test1(), .test2(1'b0), .ch_a(), .ch_b(), .ch_c());
	
	/* IC53 - LS175 */
	ls175 IC53(._CLK(OUT0_AL), ._CLR(CLR_AL), ._1D(DB0), ._1Q(IC53_2_IC55_14), ._1Q_INV(), ._2D(DB1), ._2Q(IC53_7_TO_IC55_12), ._2Q_INV(), ._3D(DB2), ._3Q(IC53_10_TO_IC54_10), ._3Q_INV(), ._4D(DB3), ._4Q(IC53_15_TO_IC54_2), ._4Q_INV());

	/* IC54 - LS367 */
	ls367 IC54(._1G(DINS_AL), ._1A1(IC53_15_TO_IC54_2), ._1Y1(SD3), ._1A2(IC47_2_TO_IC54_4), ._1Y2(SD4), ._1A3(IC47_10_TO_IC54_6), ._1Y3(SD6), ._1A4(IC53_10_TO_IC54_10), ._1Y4(SD2), ._2G(DINS_AL), ._2A1(IC47_7_TO_IC54_12), ._2Y1(SD5), ._2A2(IC47_15_TO_IC54_14), ._2Y2(SD7));

	/* IC55 - LS367 */
	ls367 IC55(._1G(1'b0), ._1A1(RESET_AL), ._1Y1(IC55_3_TO_IC34_26), ._1A2(RESET_AL), ._1Y2(SRESET_AL), ._1A3(IC30_9_TO_IC55_6), ._1Y3(CLOCK_125M), ._1A4(CPU_CLOCK), ._1Y4(IC55_9_TO_IC34_6), ._2G(DINS_AL), ._2A1(IC53_7_TO_IC55_12), ._2Y1(SD1), ._2A2(IC53_2_IC55_14), ._2Y2(SD0));


	/* -> Address Decoder */
	/* IC31 - LS42 */
	ls42 IC31(._0(SOUND_ROM1_AL), ._1(), ._2(), ._3(), ._4(IC31_5_TO_IC49_9), ._5(DAC_AL), ._6(DIN_AL), ._7(SA_AL), ._8(SD_AL), ._9(), ._A(SA12), ._B(SA13), ._C(SA14), ._D(SA15));


	/* -> Internal Shared Logic */
	/* IC48 - LS00 */
	ls00 IC48(._1A(IC49_11_TO_IC48_1_AND_IC48_4), ._1B(IC49_3_TO_IC48_2), ._1Y(BC1), ._2A(IC49_11_TO_IC48_1_AND_IC48_4), ._2B(IC49_6_TO_IC48_5), ._2Y(BDIR), ._3A(SMW_AL), ._3B(SMR_AL), ._3Y(IC48_8_TO_IC48_12_AND_IC48_13), ._4A(IC48_8_TO_IC48_12_AND_IC48_13), ._4B(IC48_8_TO_IC48_12_AND_IC48_13), ._4Y(IC48_11_TO_IC49_10));

	/* IC49 - LS32 */
	ls32 IC49(._1A(IC34_21_TO_IC41_5_AND_IC49_1), ._1B(SA_AL), ._1Y(IC49_3_TO_IC48_2), ._2A(IC34_22_TO_IC41_9_AND_IC49_4_AND_IC49_13), ._2B(SA_AL), ._2Y(IC49_6_TO_IC48_5), ._3A(IC31_5_TO_IC49_9), ._3B(IC48_11_TO_IC49_10), ._3Y(RAMS_AL), ._4A(SD_AL), ._4B(IC34_22_TO_IC41_9_AND_IC49_4_AND_IC49_13), ._4Y(IC49_11_TO_IC48_1_AND_IC48_4));

endmodule
