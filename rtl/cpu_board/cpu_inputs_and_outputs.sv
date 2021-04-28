/*#########################################################################
#File Name:     cpu_inputs_and_outputs.sv
#Description:   Representation of Inputs and Outputs schematic diagrams 
#               contained in Kangaroo Schematic Package Supplement Sheet 6A  
#				          
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

module cpu_inputs_and_outputs(
	/*-------------------------------------------------------------- /
	/ --------------------- Inputs and Outputs --------------------- /
	/ --------------------------------------------------------------*/
	
	/* -> CPU Inputs */
	input wire INVERT_VIDEO,
	input wire COCKTAIL,
	input wire HOPPING_AL_OR_MUSIC,
	input wire RIGHT_COIN_INPUT,
	input wire LEFT_COIN_INPUT,
	input wire _2_PLAYER_START,
	input wire _1_PLAYER_START,
	input wire SERVICE_SW,
	input wire SELF_TEST,
	input wire CN2_7,
	input wire CN2_H,
	input wire PLAYER_1_PUNCH,
	input wire PLAYER_1_DOWN,
	input wire PLAYER_1_UP,
	input wire PLAYER_1_LEFT,
	input wire PLAYER_1_RIGHT,
	input wire CN2_N,
	input wire CN2_11,
	input wire CN2_M,
	input wire PLAYER_2_PUNCH,
	input wire PLAYER_2_DOWN,
	input wire PLAYER_2_UP,
	input wire PLAYER_2_LEFT,
	input wire PLAYER_2_RIGHT,
	input wire DIP_SW_1,
	input wire DIP_SW_2,
	input wire DIP_SW_3,
	input wire DIP_SW_4,
	input wire DIP_SW_5,
	input wire DIP_SW_6,
	input wire DIP_SW_7,
	input wire DIP_SW_8,
	input wire IN0_AL,
	input wire IN1_AL,
	input wire IN2_AL,
	input wire IN3_AL,
	input wire IN4_AL,
	
	/* -> CPU Outputs */
	input wire RESET_AL,
	input wire OUT1_AL,
	input wire OUT2_AL,
	output wire CN2_OUT1,
	output wire CN2_OUT2,
	output wire CN2_OUT3,
	output wire CN2_OUT4,
	output wire COIN_CNTR_1,
	output wire COIN_CNTR_2,

	/* -> CPU Inputs & Outputs */
	input wire CLR_AL,
	inout wire DB0,
	inout wire DB1,
	inout wire DB2,
	inout wire DB3,
	inout wire DB4,
	inout wire DB5,
	inout wire DB6,
	inout wire DB7
);


	/*-------------------------------------------------------------- /
	/ --------------------- Module Instantiation ------------------- /
	/ --------------------------------------------------------------*/

	/* -> CPU Inputs */
	/* IC42 - LS368	 */
	ls368 IC42(._1G(IN4_AL), ._1A1(DIP_SW_4), ._1Y1(DB3), ._1A2(DIP_SW_1), ._1Y2(DB0), ._1A3(DIP_SW_2), ._1Y3(DB1), ._1A4(DIP_SW_3), ._1Y4(DB2), ._2G(IN0_AL), ._2A1(COCKTAIL), ._2Y1(DB6), ._2A2(INVERT_VIDEO), ._2Y2(DB7));

	/* IC43 - LS368 */
	ls368 IC43(._1G(IN0_AL), ._1A1(LEFT_COIN_INPUT), ._1Y1(DB3), ._1A2(RIGHT_COIN_INPUT), ._1Y2(DB4), ._1A3(HOPPING_AL_OR_MUSIC), ._1Y3(DB5), ._1A4(_2_PLAYER_START), ._1Y4(DB2), ._2G(IN0_AL), ._2A1(_1_PLAYER_START), ._2Y1(DB1), ._2A2(SERVICE_SW), ._2Y2(DB0));

	/* IC44 - LS368 */
	ls368 IC44(._1G(IN1_AL), ._1A1(PLAYER_1_DOWN), ._1Y1(DB3), ._1A2(PLAYER_1_PUNCH), ._1Y2(DB4), ._1A3(CN2_H), ._1Y3(DB5), ._1A4(PLAYER_1_UP), ._1Y4(DB2), ._2G(IN1_AL), ._2A1(PLAYER_1_LEFT), ._2Y1(DB1), ._2A2(PLAYER_1_RIGHT), ._2Y2(DB0));

	/* IC45 - LS368 */
	ls368 IC45(._1G(IN2_AL), ._1A1(PLAYER_2_DOWN), ._1Y1(DB3), ._1A2(PLAYER_2_PUNCH), ._1Y2(DB4), ._1A3(CN2_M), ._1Y3(DB5), ._1A4(PLAYER_2_UP), ._1Y4(DB2), ._2G(IN2_AL), ._2A1(PLAYER_2_LEFT), ._2Y1(DB1), ._2A2(PLAYER_2_RIGHT), ._2Y2(DB0));

	/* IC51 - LS368 */
	ls368 IC51(._1G(IN4_AL), ._1A1(DIP_SW_5), ._1Y1(DB4), ._1A2(DIP_SW_6), ._1Y2(DB5), ._1A3(DIP_SW_7), ._1Y3(DB6), ._1A4(DIP_SW_8), ._1Y4(DB7), ._2G(IN2_AL), ._2A1(CN2_N), ._2Y1(DB7), ._2A2(CN2_11), ._2Y2(DB6));

	/* -> CPU Outputs */
	/* IC52 - LS175	  */
	ls175 IC52(._CLK(OUT1_AL), ._CLR(CLR_AL), ._1D(DB0), ._1Q(IC52_2_TO_IC39_12), ._1Q_INV(), ._2D(DB1), ._2Q(IC52_7_TO_IC39_14), ._2Q_INV(), ._3D(DB2), ._3Q(), ._3Q_INV(), ._4D(DB3), ._4Q(), ._4Q_INV());
	
	/* IC58 - LS175 */
	ls175 IC58(._CLK(OUT2_AL), ._CLR(CLR_AL), ._1D(DB4), ._1Q(), ._1Q_INV(), ._2D(DB5), ._2Q(), ._2Q_INV(), ._3D(DB6), ._3Q(), ._3Q_INV(), ._4D(DB7), ._4Q(), ._4Q_INV());
	
	/* IC59 - LS175 */
	ls175 IC59(._CLK(OUT2_AL), ._CLR(CLR_AL), ._1D(DB0), ._1Q(CN2_OUT1), ._1Q_INV(), ._2D(DB1), ._2Q(CN2_OUT2), ._2Q_INV(), ._3D(DB2), ._3Q(CN2_OUT3), ._3Q_INV(), ._4D(DB3), ._4Q(CN2_OUT4), ._4Q_INV());
	

	/* -> External Shared Logic
	// IC39 - LS367 - Shared with Custom Microprocessor
	// ls367 IC39(._1G(), ._1A1(), ._1Y1(), ._1A2(), ._1Y2(), ._1A3(), ._1Y3(), ._1A4(), ._1Y4(), ._2G(1'b0), ._2A1(IC52_2_TO_IC39_12), ._2Y1(CN2[37]), ._2A2(IC52_7_TO_IC39_14), ._2Y2(CN2[14]));
	//
	// IC46 - LS368 - Shared with Custom Microprocessor
	// ls368 IC46(._1G(1'b0), ._1A1(), ._1Y1(), ._1A2(CN1[40]), ._1Y2(IC46_5_TO_IC46_6), ._1A3(IC46_5_TO_IC46_6), ._1Y3(CLR_AL), ._1A4(), ._1Y4(), ._2G(IN1_AL), ._2A1(CN2[7]), ._2Y1(CN1[19]), ._2A2(CN2[30]), ._2Y2(CN1[20]));
	*/
	
endmodule
