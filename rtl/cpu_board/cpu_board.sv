/*#########################################################################
#File Name:     cpu_board.sv
#Description:   Representation connecting all CPU PCB schematic components. 
#				Kangaroo Schematic Package Supplement Sheets 5A, 5B, 6A, 6B,
#				and 7A.            
#
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         Custom Microprocessor is not implemented as firmware for 
#				MB8841 does not currently exist.
##########################################################################*/

module cpu_board(
	/*-------------------------------------------------------------- /
	/ --------------------- Inputs and Outputs --------------------- /
	/ --------------------------------------------------------------*/
	
	/* -> CPU Board */
	inout [50:1] CN1,
	inout [44:1] CN2,
	
	input wire RESET_GEN,
	input wire NMI_AL,
	input wire SERVICE_SW,
	input wire [8:1] DIP_SW
);


	/*-------------------------------------------------------------- /
	/ --------------------- Nets and Registers --------------------- /
	/-------------------------------------------------------------- */

	/* -> CPU Board	*/
	/* Address Bus	*/
	wire A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15;

	/* Data Bus */
	wire D0, D1, D2, D3, D4, D5, D6, D7;
	wire DB0, DB1, DB2, DB3, DB4, DB5, DB6, DB7;
	
	/* Glue Signals */
	wire INS_AL, CLR_AL;
	wire GS_AL, MW_AL, MR_AL, RAM_AL, ROM0_AL, ROM1_AL, ROM2_AL, ROM3_AL, ROM4_AL, ROM5_AL;
	wire OUT0_AL, OUT1_AL, OUT2_AL, OUT3_AL, IN0_AL, IN1_AL, IN2_AL, IN3_AL, IN4_AL;

	wire SELF_TEST;
	wire IC35_10_TO_IC35_5_AND_IC12_11, IC35_6_TO_IC15_26, IC37_11_TO_IC15_17, IC37_13_TO_IC15_16;
	wire IC52_2_TO_IC39_12, IC52_7_TO_IC39_14, IC46_5_TO_IC46_6;
	
	
	/*-------------------------------------------------------------- /
	/ --------------------- Module Instantiation ------------------- /
	/ --------------------------------------------------------------*/

	/* -> CPU Game Microprocessor and Address Decoder */
	cpu_game_microprocessor_and_address_decoder cpu_game_microprocessor_and_address_decoder(
		.FPGA_RESET(RESET_GEN),
		.CPU_CLOCK(CN1[47]),
		.NMI_AL(NMI_AL),
		.INT_AL(CN1[42]),
		.WAIT_AL(CN1[41]),
		.RESET_AL(CN1[40]), /* Not found on video board? */
		.MR_AL(CN1[38]),
		.MW_AL(CN1[39]),
		.A0(A0),
		.A1(A1),
		.A2(A2),
		.A3(A3),
		.A4(A4),
		.A5(A5),
		.A6(A6),
		.A7(A7),
		.A8(A8),
		.A9(A9),
		.A10(A10),
		.A11(A11),
		.AB0(CN1[21]),
		.AB1(CN1[22]),
		.AB2(CN1[23]),
		.AB3(CN1[24]),
		.AB4(CN1[25]),
		.AB5(CN1[26]),
		.AB6(CN1[27]),
		.AB7(CN1[28]),
		.AB8(CN1[29]),
		.AB9(CN1[30]),
		.AB10(CN1[31]),
		.AB11(CN1[32]),
		.AB12(CN1[33]),
		.AB13(CN1[34]),
		.AB14(CN1[35]),
		.AB15(CN1[36]),
		.IC3_11_TO_IC21_5_AND_IC21_10(CN1[37]), /* MREQ_AL */
		.D0(D0),
		.D1(D1),
		.D2(D2),
		.D3(D3),
		.D4(D4),
		.D5(D5),
		.D6(D6),
		.D7(D7),
		.DB0(CN1[13]),
		.DB1(CN1[14]),
		.DB2(CN1[15]),
		.DB3(CN1[16]),
		.DB4(CN1[17]),
		.DB5(CN1[18]),
		.DB6(CN1[19]),
		.DB7(CN1[20]),
		.GS_AL(GS_AL),
		.CS2_AL(CN1[1]),
		.RAM_AL(RAM_AL),
		.ROM0_AL(ROM0_AL),
		.ROM1_AL(ROM1_AL),
		.ROM2_AL(ROM2_AL),
		.ROM3_AL(ROM3_AL),
		.ROM4_AL(ROM4_AL),
		.ROM5_AL(ROM5_AL),
		.OUT0_AL(OUT0_AL),
		.OUT1_AL(OUT1_AL),
		.OUT2_AL(OUT2_AL),
		.OUT3_AL(OUT3_AL),
		.IN0_AL(IN0_AL),
		.IN1_AL(IN1_AL),
		.IN2_AL(IN2_AL),
		.IN3_AL(IN3_AL),
		.IN4_AL(IN4_AL),
		.HFEN(CN1[12]),
		.I_II_EN_PRI(CN1[11]),
		.BSEL(CN1[10]),
		.HPOS_AL(CN1[9]), /* Not found on video board? */
		.VPOS_AL(CN1[8]),
		.XYH_AL(CN1[7]),
		.XYL_AL(CN1[6]),
		.WRH_AL(CN1[5]),
		.WRL_AL(CN1[4]),
		.RDH_AL(CN1[3]),
		.RDL_AL(CN1[2]),
		
		/* -> External Shared Logic */
		/* IC35 - LS04 - Shared with Custom Microprocessor */
		.IC35_10_TO_IC35_5_AND_IC12_11(IC35_10_TO_IC35_5_AND_IC12_11), 
		.IC35_6_TO_IC15_26(IC35_6_TO_IC15_26),

		/* IC37 - LS367 - Shared with Custom Microprocessor */
		.IC37_11_TO_IC15_17(IC37_11_TO_IC15_17), 
		.IC37_13_TO_IC15_16(IC37_13_TO_IC15_16)
	);

	/* -> CPU RAM */
	cpu_ram cpu_ram(
		.MW_AL(CN1[39]),
		.RAM_AL(RAM_AL),
		.A0(A0),
		.A1(A1),
		.A2(A2),
		.A3(A3),
		.A4(A4),
		.A5(A5),
		.A6(A6),
		.A7(A7),
		.A8(A8),
		.A9(A9),
		.D0(D0),
		.D1(D1),
		.D2(D2),
		.D3(D3),
		.D4(D4),
		.D5(D5),
		.D6(D6),
		.D7(D7)
	);

	/* -> CPU Program ROM */
	cpu_program_rom cpu_program_rom(
		.MR_AL(CN1[38]),
		.ROM0_AL(ROM0_AL),
		.ROM1_AL(ROM1_AL),
		.ROM2_AL(ROM2_AL),
		.ROM3_AL(ROM3_AL),
		.ROM4_AL(ROM4_AL),
		.ROM5_AL(ROM5_AL),
		.A0(A0),
		.A1(A1),
		.A2(A2),
		.A3(A3),
		.A4(A4),
		.A5(A5),
		.A6(A6),
		.A7(A7),
		.A8(A8),
		.A9(A9),
		.A10(A10),
		.A11(A11),
		.D0(D0),
		.D1(D1),
		.D2(D2),
		.D3(D3),
		.D4(D4),
		.D5(D5),
		.D6(D6),
		.D7(D7)
	);

	/* -> CPU Inputs and Outputs */
	cpu_inputs_and_outputs cpu_inputs_and_outputs(
		.INVERT_VIDEO(CN2[26]),
		.COCKTAIL(CN2[3]),
		.HOPPING_AL_OR_MUSIC(CN2[25]),
		.RIGHT_COIN_INPUT(CN2[2]),
		.LEFT_COIN_INPUT(CN2[24]),
		._2_PLAYER_START(CN2[1]),
		._1_PLAYER_START(CN2[23]),
		.SERVICE_SW(SERVICE_SW),
		.SELF_TEST(CN2[30]),
		.CN2_7(CN2[7]),
		.CN2_H(CN2[29]),
		.PLAYER_1_PUNCH(CN2[6]),
		.PLAYER_1_DOWN(CN2[28]),
		.PLAYER_1_UP(CN2[5]),
		.PLAYER_1_LEFT(CN2[27]),
		.PLAYER_1_RIGHT(CN2[4]),
		.CN2_N(CN2[34]),
		.CN2_11(CN2[11]),
		.CN2_M(CN2[33]),
		.PLAYER_2_PUNCH(CN2[10]),
		.PLAYER_2_DOWN(CN2[32]),
		.PLAYER_2_UP(CN2[9]),
		.PLAYER_2_LEFT(CN2[31]),
		.PLAYER_2_RIGHT(CN2[8]),
		.DIP_SW_1(DIP_SW[1]),
		.DIP_SW_2(DIP_SW[2]),
		.DIP_SW_3(DIP_SW[3]),
		.DIP_SW_4(DIP_SW[4]),
		.DIP_SW_5(DIP_SW[5]),
		.DIP_SW_6(DIP_SW[6]),
		.DIP_SW_7(DIP_SW[7]),
		.DIP_SW_8(DIP_SW[8]),
		.IN0_AL(IN0_AL),
		.IN1_AL(IN1_AL),
		.IN2_AL(IN2_AL),
		.IN3_AL(IN3_AL),
		.IN4_AL(IN4_AL),
		.RESET_AL(CN1[40]),
		.OUT1_AL(OUT1_AL),
		.OUT2_AL(OUT2_AL),
		.CN2_OUT1(CN2[12]),
		.CN2_OUT2(CN2[35]),
		.CN2_OUT3(CN2[13]),
		.CN2_OUT4(CN2[36]),
		.COIN_CNTR_1(CN2[14]),
		.COIN_CNTR_2(CN2[37]),
		.CLR_AL(CLR_AL),
		.DB0(CN1[13]),
		.DB1(CN1[14]),
		.DB2(CN1[15]),
		.DB3(CN1[16]),
		.DB4(CN1[17]),
		.DB5(CN1[18]),
		.DB6(CN1[19]),
		.DB7(CN1[20])
	);

	/* -> CPU Sound Microprocessor and Address Decoder */
	cpu_sound_microprocessor_and_address_decoder cpu_sound_microprocessor_and_address_decoder(
		.INT_AL(CN1[42]),
		.CPU_CLOCK(CN1[47]),
		.RESET_AL(CN1[40]),
		.CLR_AL(CLR_AL),
		.OUT0_AL(OUT0_AL),
		.DB0(CN1[13]),
		.DB1(CN1[14]),
		.DB2(CN1[15]),
		.DB3(CN1[16]),
		.DB4(CN1[17]),
		.DB5(CN1[18]),
		.DB6(CN1[19]),
		.DB7(CN1[20]),
		.CN2_SOUND_OUT(CN2[15]),
		.CN2_SOUND_RTN(CN2[16])
	);

	/* -> Custom Microcomputer */
	cpu_custom_microcomputer_dummy cpu_custom_microcomputer_dummy(
		.CPU_CLOCK(CN1[47]),
		.RESET_AL(CN1[40]),
		.IN3_AL(IN3_AL),
		.CLR_AL(CLR_AL),
		.NMI_AL(),
		.DB0(CN1[13]),
		.DB1(CN1[14]),
		.DB2(CN1[15]),
		.DB3(CN1[16])
	);

	/* -> Internal Shared Logic */
	/* IC35 - LS04 - Shared between Game Microprocessor & Address Decoder / Custom Microprocessor */
	ls04 IC35(._1A(), ._1Y(), ._2A(), ._2Y(), ._3A(IC35_10_TO_IC35_5_AND_IC12_11), ._3Y(IC35_6_TO_IC15_26), ._4A(1'b0), ._4Y(), ._5A(RESET_GEN), ._5Y(IC35_10_TO_IC35_5_AND_IC12_11), ._6A(), ._6Y());

	/* IC37 - LS367 - Shared between Game Microprocessor & Address Decoder / Custom Microprocessor */
	ls367 IC37(._1G(), ._1A1(), ._1Y1(), ._1A2(), ._1Y2(), ._1A3(), ._1Y3(), ._1A4(), ._1Y4(), ._2G(1'b0), ._2A1(NMI_AL), ._2Y1(IC37_11_TO_IC15_17), ._2A2(CN1[42]), ._2Y2(IC37_13_TO_IC15_16));

	/* IC39 - LS367 - Shared between Inputs & Outputs / Custom Microprocessor */
	ls367 IC39(._1G(), ._1A1(), ._1Y1(), ._1A2(), ._1Y2(), ._1A3(), ._1Y3(), ._1A4(), ._1Y4(), ._2G(1'b0), ._2A1(IC52_2_TO_IC39_12), ._2Y1(CN2[37]), ._2A2(IC52_7_TO_IC39_14), ._2Y2(CN2[14]));

	/* IC46 - LS368 - Shared between Inputs & Outputs / Custom Microprocessor */
	ls368 IC46(._1G(1'b0), ._1A1(), ._1Y1(), ._1A2(CN1[40]), ._1Y2(IC46_5_TO_IC46_6), ._1A3(IC46_5_TO_IC46_6), ._1Y3(CLR_AL), ._1A4(), ._1Y4(), ._2G(IN1_AL), ._2A1(CN2[7]), ._2Y1(CN1[19]), ._2A2(CN2[30]), ._2Y2(CN1[20]));
	
endmodule