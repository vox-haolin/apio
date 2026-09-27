
module fsm_moore (

input clk,
input rst_btn,
input go_btn,

output reg [3:0] led,
output reg done_sig

);

localparam STATE_IDLE = 2'd0;
localparam STATE_COUNTING = 2'd1;
localparam STATE_DONE = 2'd2;

localparam MAX_CLK_COUNT = 24'd1500000 -1;
localparam MAX_LED_COUNT = 4'hF;

wire rst;
wire go;

reg div_clk;
reg [1:0] state;
reg [23:0] clk_count;

assign rst = ~rst_btn;
assign go = ~go_btn;

always @ (posedge clk or posedge rst) begin



end



endmodule
