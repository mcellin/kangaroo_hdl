/*#########################################################################
#File Name:     cpu_custom_microcomputer_dummy.sv
#Description:   As the firmware for MB8841 does not currently exist, this
#				dummy module replicates the functionality of MAME's solution
#				to enable the game to run.
#				Kangaroo Schematic Package Supplement Sheet 7A  
#				          
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         The NMI need to be pulsed at startup to allow the game 
#				processor to start correctly. Refer to MAME's kangaroo.cpp
#				for more details.
##########################################################################*/

module cpu_custom_microcomputer_dummy(
	/*-------------------------------------------------------------- /
	/ --------------------- Inputs and Outputs --------------------- /
	/ --------------------------------------------------------------*/
	input wire CPU_CLOCK,
	input wire RESET_AL,
	input wire IN3_AL,
	input wire CLR_AL,

	output reg NMI_AL,

	inout wire DB0,
	inout wire DB1,
	inout wire DB2,
	inout wire DB3
);

	/*-------------------------------------------------------------- /
	/ -------------------- Module Implementation ------------------- /
	/ --------------------------------------------------------------*/
	reg [3:0] m_mcu_clock;

	/* Drive databus if IN3 is low */
	bufif0(DB0, m_mcu_clock[0], IN3_AL);
	bufif0(DB1, m_mcu_clock[1], IN3_AL);
	bufif0(DB2, m_mcu_clock[2], IN3_AL);
	bufif0(DB3, m_mcu_clock[3], IN3_AL);
	
	always @(negedge IN3_AL) begin
		m_mcu_clock <= m_mcu_clock + 1;
	end

	always @(posedge CPU_CLOCK) begin
		if (RESET_AL == 1'b0) begin
			NMI_AL <= 1'b1;
			m_mcu_clock <= 4'h0;
		end
		else begin
			NMI_AL <= 1'b0;
		end
	end	

endmodule
