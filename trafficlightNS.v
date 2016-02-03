/**
 * North-South traffic light
 * Author: Gus Smith <hfs5022@psu.edu>
 * Inputs:
 * 	emergency: 	indicates the presence of an emergency vehicle.
 *	clk: 			clk signal.
 * Outputs:
 *	out:				a 4-wide wire vector with the following components:
 *		out[3]: 	left turn signal.
 *		out[2]:		green signal.
 *		out[1]:		yellow signal.
 *		out[0]:		red signal.
 * Description:
 *	This traffic light cycles through its four states as follows: 5 cycles
 *	of left turn + red, 10 cycles of green, 3 cycles of yellow, and 18
 *	cycles of red. When the emergency signal is raised, the light goes
 *	to red for a single cycle and then returns to its previous state with
 *	the remaining cycles.
 */
module trafficlightNS(emergency, clk, out);
	input clk;
	input emergency;
	output[3:0] out; 
	
reg[4:0] counter;
reg[4:0] next_counter;
reg[1:0] last_state;		// Note that last_state has only 4 possible values (all but allstop).
reg[2:0] state;					
reg[2:0] next_state;
reg allstop;
reg[3:0] out_reg;

assign out = out_reg;

initial begin
	counter = 0;
	next_counter = 0;
	state = 3'b000;
	next_state = 0;			// North-South starts in left turn + red state.
	allstop = 0;
	out_reg = 4'b1001;
end

always @ (posedge clk) begin
	
	// If emergency vehicle present, save current state and go to allstop state.
	if (emergency == 1 && allstop != 1) begin
		last_state <=  state;
		state <= 3'b100;
		//counter <= counter; // No change
	end
	
	// Else, simply update state.
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
	
