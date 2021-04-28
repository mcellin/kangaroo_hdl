/*#########################################################################
#File Name:     kangaroo_tb.sv
#Description:   Overall Kangaroo representation test bench.         
#
#Date:          
#Programmer:    Jonathon McEllin, S00150412
#Version:       Rev. 1.00
#
#Notes:         The purpose of this test bench was for implementation
#				debugging and to obtain the CSV output to construct an image.
##########################################################################*/

`timescale 100ns/1ps
module kangaroo_tb;
/*-------------------------- Inputs and Outputs --------------------------*/
	reg clk, rst, nmi_al;
	reg [7:0] dip_switches;
	reg service_sw;
	wire red, green, blue, sync, hsync, vsync, pixel_clock;

/*---------------------- Variables and Assignments -----------------------*/
	integer fd;

	assign hsync = kangaroo.video_board.video_out.TRGA_AL;
	assign vsync = kangaroo.video_board.video_out.VSYNC_AL;
	assign pixel_clock = kangaroo.video_board.video_clock_sync_chain_and_timing_signals.KOS1;

/*--------------------- Instantiate Device Under Test --------------------*/
	kangaroo kangaroo(
		.CLK(clk),
		.RST(rst),
		.NMI_AL(nmi_al),
		.DIP_SWITCHES(dip_switches),
		.SERVICE_SW(service_sw),
		.RED(red),
		.GREEN(green),
		.BLUE(blue),
		.SYNC(sync)
	);

/*--------------------------------- Clock --------------------------------*/
	always begin
	  #0.5 clk = ~clk; /*10MHz*/
	end

/*--------------------------------- Test ---------------------------------*/
	
	/* -> Print microprocessor instructions */
	/*
	always @(kangaroo.cpu_board.cpu_game_microprocessor_and_address_decoder.IC34.execute_.M1 or kangaroo.cpu_board.cpu_game_microprocessor_and_address_decoder.IC34.execute_.T3) begin
		// Monitor PC to compare with MAME
		if(kangaroo.cpu_board.cpu_game_microprocessor_and_address_decoder.IC34.execute_.M1 == 1'b1 && kangaroo.cpu_board.cpu_game_microprocessor_and_address_decoder.IC34.execute_.T3 == 1'b1) begin
			$strobe("%4H: IR=%2H Time: %t",kangaroo.cpu_board.cpu_game_microprocessor_and_address_decoder.IC34.A,kangaroo.cpu_board.cpu_game_microprocessor_and_address_decoder.IC34.ir_.opcode,$time);
			//$fstrobe(fd,"%4H: IR=%2H Time: %t",kangaroo.cpu_board.cpu_game_microprocessor_and_address_decoder.IC34.A,kangaroo.cpu_board.cpu_game_microprocessor_and_address_decoder.IC34.ir_.opcode,$time);
		end
	end

	initial begin
		//fd=$fopen("execution.log");
		$dumpfile("kangaroo_tb.vcd");
		$dumpvars(1, kangaroo_tb);
		dip_switches = 8'b11111111; service_sw = 1'b1; clk = 1'b1; rst = 1'b0; nmi_al = 1'b1;
		#1000 rst = 1'b1;
		#10000 nmi_al = 1'b0;
		#1000 nmi_al = 1'b1;
		
		// Run simulation for 5 seconds
		//#500000000 $stop;
		//#64000000 $stop;

		//#32000000 $fclose(fd); $stop;
		//#5000000 $fclose(fd); $stop;
		//#100000000 $fclose(fd); $stop;
		//#2000000 $stop;
		#50000 $fclose(fd); $stop;
	end
	*/


	/* -> Print video signals to output file */
	always @(posedge pixel_clock) begin
		//$strobe(fd,"Red: %b,Green: %b, Blue: %b, HSYNC: %b, VSYNC: %b",red, green, blue, hsync, vsync);
		$fstrobe(fd,"%b,%b,%b,%b,%b",red, green, blue, hsync, vsync);
	end

	initial begin
		fd=$fopen("video_output.log");
		dip_switches = 8'b11111111; service_sw = 1'b1; clk = 1'b1; rst = 1'b0; nmi_al = 1'b1;
		#100 rst = 1'b1;
		#1000 nmi_al = 1'b0;
		#1000 nmi_al = 1'b1;
		
		/* Run simulation for 60 seconds */
		#600000000 $fclose(fd); $stop;
	end

endmodule
