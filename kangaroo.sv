/*#########################################################################
#File Name:     kangaroo.sv
#Description:   Representation connecting CPU PCB and Video PCB.         
#
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         Controller inputs not included in port list for simulation
#				purposes. They are in Assignments.
##########################################################################*/

module kangaroo(
	/*-------------------------------------------------------------- /
	/ --------------------- Inputs and Outputs --------------------- /
	/ --------------------------------------------------------------*/
	
	input wire CLK,
	input wire RST,
	input wire NMI_AL,
	input wire [7:0] DIP_SWITCHES,
	input wire SERVICE_SW,
	
	output wire RED,
	output wire GREEN,
	output wire BLUE,
	output wire SYNC
);


	/*-------------------------------------------------------------- /
	/ --------------------- Inputs and Outputs --------------------- /
	/ --------------------------------------------------------------*/

	wire [50:1] CN1;
	wire [44:1] CN2;
	wire [20:1] CN4;


	/*-------------------------------------------------------------- /
	/ ------------------------ Assignments ------------------------- /
	/ --------------------------------------------------------------*/
	
	/* CN4 Outputs */
	assign RED = CN4[1];
	assign GREEN = CN4[2];
	assign BLUE = CN4[3];
	assign SYNC = CN4[4];

	/* CN2 Inputs */
	assign CN2[26] = 1'b1; /* INVERT_VIDEO			*/
	assign CN2[3]  = 1'b1; /* COCKTAIL				*/
	assign CN2[25] = 1'b1; /* HOPPING_AL_OR_MUSIC	*/
	assign CN2[2]  = 1'b1; /* RIGHT_COIN_INPUT		*/
	assign CN2[24] = 1'b1; /* LEFT_COIN_INPUT		*/
	assign CN2[1]  = 1'b1; /* _2_PLAYER_START		*/
	assign CN2[23] = 1'b1; /* _1_PLAYER_START		*/
	assign CN2[30] = 1'b1; /* SELF_TEST				*/
	assign CN2[7]  = 1'b1; /* CN2_7					*/
	assign CN2[29] = 1'b1; /* CN2_H					*/
	assign CN2[6]  = 1'b1; /* PLAYER_1_PUNCH		*/
	assign CN2[28] = 1'b1; /* PLAYER_1_DOWN			*/
	assign CN2[5]  = 1'b1; /* PLAYER_1_UP			*/
	assign CN2[27] = 1'b1; /* PLAYER_1_LEFT			*/
	assign CN2[4]  = 1'b1; /* PLAYER_1_RIGHT		*/
	assign CN2[34] = 1'b1; /* CN2_N					*/
	assign CN2[11] = 1'b1; /* CN2_11				*/
	assign CN2[33] = 1'b1; /* CN2_M					*/
	assign CN2[10] = 1'b1; /* PLAYER_2_PUNCH		*/
	assign CN2[32] = 1'b1; /* PLAYER_2_DOWN			*/
	assign CN2[9]  = 1'b1; /* PLAYER_2_UP			*/
	assign CN2[31] = 1'b1; /* PLAYER_2_LEFT			*/
	assign CN2[8]  = 1'b1; /* PLAYER_2_RIGHT		*/

	/* CN2 Outputs - For reference
	//		CN2[36]; // CN2_OUT1
	//		CN2[13]; // CN2_OUT2
	//		CN2[35]; // CN2_OUT3
	//		CN2[12]; // CN2_OUT4
	//		CN2[37]; // COIN_CNTR_1
	//		CN2[14]; // COIN_CNTR_2
	//		CN2[15]; // CN2_SOUND_OUT
	//		CN2[16]; // CN2_SOUND_RTN
	*/


	/*-------------------------------------------------------------- /
	/ --------------------- Module Instantiation ------------------- /
	/ --------------------------------------------------------------*/
		
	/* -> CPU PCB */
	cpu_board cpu_board(
		.CN1(CN1),
		.CN2(CN2),
		.RESET_GEN(RST),
		.NMI_AL(NMI_AL),
		.SERVICE_SW(SERVICE_SW),
		.DIP_SW(DIP_SWITCHES)
	);

	/* -> Video PCB */
	video_board video_board(
		.CN1(CN1),
		.CN4(CN4),
		.CLOCK_10MHZ(CLK)
	);

endmodule