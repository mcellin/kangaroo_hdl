/*#########################################################################
#File Name:     _4116.sv
#Description:   Behavioural representation of 16384x1 Dynamic RAM.
#                            
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         In this implementation, WE and CAS occurring at the same time
#				has not been handled. This is because it is expected that the
#				actual PCB hardware complies with the operational guidelines 
#				set out in note 17 on 3-21 of the datasheet.
##########################################################################*/

module _4116 #(parameter INIT_FILE="") (RAS, CAS, WE, A0, A1, A2, A3, A4, A5, A6, D, Q);

	input wire RAS, CAS, WE, A0, A1, A2, A3, A4, A5, A6, D;
	inout wire Q;
	
	/* Store row address to combine with column address */
	reg [6:0] ras_addr;
	reg output_enable;
	reg data_out;

	/* Store memory */
	reg memory [0:16383];

	/* Output is valid when CAS is low */
	assign Q = (output_enable) ? data_out : 1'bz;

	/* Initialise RAM memory */
	initial begin
		if (INIT_FILE > 0) begin
			$display("Initialising 4116 memory file with " + INIT_FILE);
			$readmemb(INIT_FILE, memory, 0, 16383);
		end
		
		else begin 
			/* Initialize to zero if INIT_FILE is not declared */
			for(int i = 0; i <= 16383; i = i + 1) begin
				memory[i] <= 1'b0;
			end
		end

		/* Set output_enable to high impedance */
		output_enable <= 1'b0;
	end

	/* Output is always high-impedance at posedge CAS */
	always @(posedge CAS) begin
		output_enable <= 1'b0;
	end

	/* Update RAS address on RAS negedge */
	/* "RAS ONLY" Refresh Cycle */
	always @(negedge RAS) begin
		ras_addr[6:0] <= {A6,A5,A4,A3,A2,A1,A0};
	end
	
	/* Read/Write (Early Cycle) */
	always @(negedge CAS) begin
		if (WE == 1'b1) begin /* Read */
			data_out <= memory[{ras_addr,A6,A5,A4,A3,A2,A1,A0}];
			output_enable <= 1'b1;
		end
		
		/* Write (Early Cycle)*/
		else begin /* Early write keeps output at high impedance*/
			memory[{ras_addr,A6,A5,A4,A3,A2,A1,A0}] <= D;
			output_enable <= 1'b0; 
		end
	end

	/* Delayed write/Read-Modify-Write */
	always @(negedge WE) begin
		/* If CAS is already low, WE will strobe in the data and output is enabled*/
		if (CAS == 1'b0) begin
			memory[{ras_addr,A6,A5,A4,A3,A2,A1,A0}] <= D;
			output_enable <= 1'b1;
		end
	end

endmodule
