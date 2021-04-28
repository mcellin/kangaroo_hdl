/*#########################################################################
#File Name:     _2732.sv
#Description:   Behavioural representation of 32 Kbit UV EPROM.
#                            
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         GVPP pin is not present as the ROM will not be reprogrammed.
#				G is Output Enable, E is Chip Select
##########################################################################*/

module _2732 #(parameter INIT_FILE="") (E, G, A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7);

	input E, G, A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11;
	output reg Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7;

	reg [7:0] memory [0:4095];

	/* Initialise memory */
	initial begin
		if (INIT_FILE > 0) begin
			$display("Initialising 2732 ROM with " + INIT_FILE);
			$readmemb(INIT_FILE, memory, 0, 4095);
		end
			
		else begin /* ROM is initialized to 8'b11111111 by default */
			for(int i = 0; i <= 4095; i = i + 1) begin
				memory[i] <= 8'b11111111;
			end
		end
	end

	always @(*) begin
		if (!G && !E) begin /* Output Enabled and Chip Selected */
			{Q7, Q6, Q5, Q4, Q3, Q2, Q1, Q0} <= memory[{A11, A10, A9, A8, A7, A6, A5, A4, A3, A2, A1, A0}];
		end
		
		else begin /* Set output to high impedance */
			{Q7, Q6, Q5, Q4, Q3, Q2, Q1, Q0} <= 8'bzzzzzzzz;
		end
	end
	
endmodule
