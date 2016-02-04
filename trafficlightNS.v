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
reg[1:0] saved_state;		// Note that saved_state has only 4 possible values (all but allstop).
reg[2:0] state;					
reg[2:0] next_state;
//reg allstop;
reg[3:0] out_reg;

// States
parameter GREEN 	= 2'b00;
parameter YELLOW 	= 2'b01;
parameter RED		= 2'b11;
parameter ALLSTOP	= 2'b10;

// Defines which state we enter into first.
parameter FIRST_STATE = GREEN;

assign out = out_reg;

initial begin
	counter = 0;
	next_counter = 0;
	state = FIRST_STATE;
	next_state = FIRST_STATE;			// North-South starts in left turn + red state.
	//allstop = 0;
	out_reg = 4'b1001;
end

always @ (posedge clk) begin
	
	// If emergency vehicle present, save the next state we would have gone to
	//		and instead go to allstop state.
	if (emergency == 1 && state != ALLSTOP /*&& allstop != 1*/) begin
		saved_state <=  next_state;
		state <= ALLSTOP;
		//counter <= counter; // No change
	end
	
	// Else, simply update state.
	else begin		
		counter <= next_counter;
		state <= next_state;
	end
end

always @ (counter or state) begin
//allstop <= 0;
case(state)
// Green
GREEN: begin
	out_reg <= 4'b0100;
	if (counter < 5) begin
		out_reg <= 4'b1001;
		next_state <= GREEN;
		next_counter <= counter + 1;
	end
	else if (counter < 14) begin
		next_state <= GREEN;
		next_counter <= counter + 1;		
	end
	else begin
		next_state <= YELLOW;
		next_counter <= 0;
	end
	end
// Yellow
YELLOW:	begin
	out_reg <= 4'b0010;
	if (counter < 2) begin
		next_state <= YELLOW;
		next_counter <= counter + 1;
	end
	else begin
		next_state <= RED;
		next_counter <= 0;
	end
	end
// Red
RED: begin
	out_reg <= 4'b0001;
	if (counter < 17) begin
		next_state <= RED;
		next_counter <= counter + 1;
	end
	else begin
		next_state <= GREEN;
		next_counter <= 0;
	end
	end
// Allstop
ALLSTOP: begin
		//allstop <= 1;
		out_reg <= 4'b0001;
		next_state <= saved_state;
	end
endcase
end

endmodule
	
