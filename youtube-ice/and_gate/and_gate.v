module and_gate (

	input	[1:0]	pmod,

	output	[2:0]	led

);

	wire not_pmod_0;
	
	assign not_pmod_0 = ~pmod[0];
	assign led[1:0] = {2{not_pmod_0}};


endmodule 


