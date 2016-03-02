module trafficlightNS(emergency, clk, rst, NS_left, NS_green, NS_yellow, NS_red, EW_left, EW_green, EW_yellow, EW_red);
	input emergency, clk, rst;
	output NS_left, NS_green, NS_yellow, NS_red, EW_left, EW_green, EW_yellow, EW_red;
	
reg[6:0] state;			

int emergency_offset = 36;		


always @ (posedge clk) begin
	if (rst) state <= 7'b0;
	if (emergency) state <= state + emergency_offset;
end