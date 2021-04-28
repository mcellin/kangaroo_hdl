/*#########################################################################
#File Name:     video_video_output.sv
#Description:   Representation of Video Output schematic diagram contained 
#               in Kangaroo Schematic Package Supplement Sheet 11B.
#				 			          
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

module video_video_output(
	/*-------------------------------------------------------------- /
	/ --------------------- Inputs and Outputs --------------------- /
	/ --------------------------------------------------------------*/
	
	/* -> Video Output */
	input wire AVR,
	input wire BVR,
	input wire AVG,
	input wire BVG,
	input wire AVB,
	input wire BVB,
	input wire TRGA_AL,
	input wire VSYNC_AL,

	output wire RED_OUT,
	output wire GREEN_OUT,
	output wire BLUE_OUT,
	output wire SYNC_OUT,


	/* -> External Shared Logic */
	/* IC118 - LS00 */
	input wire IC118_8_TO_IC135_12_AND_IC135_13
);


	/*-------------------------------------------------------------- /
	/ --------------------- Module Instantiation ------------------- /
	/ --------------------------------------------------------------*/

	/* -> Video Output */
	/* IC135 - LS00 */
	ls00 IC135(._1A(BVB), ._1B(AVB), ._1Y(BLUE_OUT), ._2A(AVR), ._2B(BVR), ._2Y(RED_OUT), ._3A(AVG), ._3B(BVG), ._3Y(GREEN_OUT), ._4A(IC118_8_TO_IC135_12_AND_IC135_13), ._4B(IC118_8_TO_IC135_12_AND_IC135_13), ._4Y(SYNC_OUT));

	/* -> External Shared Logic
	// IC118 - LS00
	//ls00 IC118(._1A(), ._1B(), ._1Y(), ._2A(), ._2B(), ._2Y(), ._3A(VSYNC_AL), ._3B(TRGA_AL), ._3Y(IC118_8_TO_IC135_12_AND_IC135_13), ._4A(), ._4B(), ._4Y());
	*/
	
endmodule
