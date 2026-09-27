module top_design (

	input clk,
	input rst_btn,
	output LEDR,LEDB

);
	
	wire rst;
	
//assign LEDB=1;	

	assign rst = ~rst_btn;

	clock_divider #(.COUNT_WIDTH(32),
					.MAX_COUNT(6_000_000-1) )
//	clock_divider 
	 div_01(
		.clk(clk),
		.rst(rst),
		.out(LEDR)
	);


//the version  2001
	clock_divider  div_02(
		.clk(clk),
		.rst(rst),
		.out(LEDB)
	);

	

endmodule
