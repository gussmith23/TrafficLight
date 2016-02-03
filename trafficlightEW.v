/**
 * East-West traffic light.
 * 	Please see the North-South traffic light code for comments. This code is exactly the same
 *	except for initial state. This would best be done with one module whose initial state was
 * 	set through parameters - however, only just learned about parameters after I'd finished
 *	the assignment!
 */
module trafficlightEW(emergency, clk, out);
	input clk;
	input emergency;
	output[3:0] out; 
	
reg[4:0] counter;
reg[4:0] next_counter;
reg[1:0] last_state;
reg[2:0] state;
reg[2:0] next_state;
reg allstop;
reg[3:0] out_reg;

assign out = out_reg;

initial begin
	counter = 0;
	next_counter = 0;
	state = 0;
	next_state = 3'b011;		// EW starts red.
	allstop = 0;
	out_reg = 4'b1001;
end

always @ (posedge clk) begin
	if (emergency == 1 && allstop != 1) begin
		last_state <=  state;
		state <= 3'b100;
		//counter <= counter; 	
	end
	else begin
		counter <= next_counter;
		state <= next_state;
	end
end

always @ (counter or state) begin
allstop <= 0;
case(state)
// Left
3'b000: begin
	out_reg <= 4'b1001;
	if (counter < 4) begin
		next_state <= 3'b000;
		next_counter <= counter + 1;
	end
	else begin
		next_state <= 3'b001;
		next_counter <= 0;
	end
	end
// Green
3'b001: begin
	out_reg <= 4'b0100;
	if (counter < 9) begin
		next_state <= 3'b001;
		next_counter <= counter + 1;
	end
	else begin
		next_state <= 3'b010;
		next_counter <= 0;
	end
	end
// Yellow
3'b010:	begin
	out_reg <= 4'b0010;
	if (counter < 2) begin
		next_state <= 3'b010;
		next_counter <= counter + 1;
	end
	else begin
		next_state <= 3'b011;
		next_counter <= 0;
	end
	end
// Red
3'b011: begin
	out_reg <= 4'b0001;
	if (counter < 17) begin
		next_state <= 3'b011;
		next_counter <= counter + 1;
	end
	else begin
		next_state <= 3'b000;
		next_counter <= 0;
	end
	end
// Allstop
3'b100: begin
		allstop <= 1;
		out_reg <= 4'b0001;
		next_state <= last_state;
	end
endcase
end

endmodule
	
