
module RGBLED (
	input clk,
	output reg LEDR,LEDB,LEDG
);

localparam  MAX_COUNT=24'd6750000;
 reg[23:0] current_count=24'd0;
 reg div_clk = 1'd0;
 reg[1:0] sig = 2'd0;
always @ (posedge clk) begin

	if (current_count < MAX_COUNT) begin
		current_count <= current_count +1;
	end else begin
	div_clk <= ~div_clk;
    current_count <= 24'd0;
	end

end
always @ (posedge div_clk) begin
	case(sig)
	2'd1 : begin
		LEDR <= 0;
		LEDG <= 1;
		LEDB <= 1;
		sig <= sig +1;
	end
	2'd2 : begin
		LEDR <= 1;
		LEDG <= 0;
		LEDB <= 1;
		sig <= sig+1;
	end
	2'd3 : begin
         LEDR <= 1;
         LEDG <= 1;
         LEDB <= 0;
          sig <= sig +1;
	end
	default : begin
		LEDR <= 1;
		LEDG <= 1;
		LEDB <= 1;
		sig <=sig +1;
	end
	endcase;
end

endmodule


