/*#########################################################################
#File Name:     _2114.sv
#Description:   Behavioural representation of 1024 x 4 Static RAM.
#                            
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         
##########################################################################*/

module _2114 #(parameter INIT_FILE="") (WE, CS, A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, D0, D1, D2, D3);
	
	input wire WE, CS, A0, A1, A2, A3, A4, A5, A6, A7, A8, A9;
	inout wire D0, D1, D2, D3;

	reg [3:0] memory [0:1023];
	reg [3:0] data_out;


	/* Bidirectional Port
	// 	Not Selected (Driven): CS high, WE don't care
	// 	Read (Driver): CS low, WE high
	// 	Write (Driven): CS low, WE low
	*/
	assign {D3,D2,D1,D0} = (!CS && WE) ? data_out : 4'bzzzz;
	

	/* Initialise RAM memory */
	initial begin
		if (INIT_FILE > 0) begin
			$display("Initialising 2114 memory file with " + INIT_FILE);
			$readmemb(INIT_FILE, memory, 0, 1023);
		end
		
		else begin 
			/* Initialize to zero if INIT_FILE is not declared */
			for(int i = 0; i <= 1023; i = i + 1) begin
				memory[i] <= 8'b00000000;
			end
		end
	end

	/* Read */
	always @(*) begin
		if (!CS && WE) begin
			data_out <= memory[{A9,A8,A7,A6,A5,A4,A3,A2,A1,A0}];
		end
	end

	/* Write */
	always @(*) begin
		if (!CS && !WE) begin
			memory[{A9,A8,A7,A6,A5,A4,A3,A2,A1,A0}] <= {D3,D2,D1,D0};
		end
	end

endmodule
