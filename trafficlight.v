module trafficlight(emergency, clk, rst, LeftTurn_NS, Green_NS, Yellow_NS, Red_NS, LeftTurn_EW, Green_EW, Yellow_EW, Red_EW);
	input emergency, clk, rst;
	output LeftTurn_NS, Green_NS, Yellow_NS, Red_NS, LeftTurn_EW, Green_EW, Yellow_EW, Red_EW;
	
reg[6:0] state;			
reg[6:0] next_state;			

parameter emergency_offset = 36;	

parameter LeftTurn_NS_0 		= 7'd0;	
parameter LeftTurn_NS_1 		= 7'd1;	
parameter LeftTurn_NS_2 		= 7'd2;	
parameter LeftTurn_NS_3 		= 7'd3;	
parameter LeftTurn_NS_4 		= 7'd4;	

parameter Green_NS_0 			= 7'd5;	
parameter Green_NS_1 			= 7'd6;	
parameter Green_NS_2 			= 7'd7;	
parameter Green_NS_3 			= 7'd8;	
parameter Green_NS_4 			= 7'd9;	
parameter Green_NS_5 			= 7'd10;	
parameter Green_NS_6 			= 7'd11;	
parameter Green_NS_7 			= 7'd12;	
parameter Green_NS_8 			= 7'd13;	
parameter Green_NS_9 			= 7'd14;

parameter Yellow_NS_0 			= 7'd15;	
parameter Yellow_NS_1 			= 7'd16;	
parameter Yellow_NS_2 			= 7'd17;	

parameter LeftTurn_EW_0 		= 7'd18;	
parameter LeftTurn_EW_1 		= 7'd19;	
parameter LeftTurn_EW_2 		= 7'd20;	
parameter LeftTurn_EW_3 		= 7'd21;	
parameter LeftTurn_EW_4 		= 7'd22;	

parameter Green_EW_0 			= 7'd23;	
parameter Green_EW_1 			= 7'd24;	
parameter Green_EW_2 			= 7'd25;	
parameter Green_EW_3 			= 7'd26;	
parameter Green_EW_4 			= 7'd27;	
parameter Green_EW_5 			= 7'd28;	
parameter Green_EW_6 			= 7'd29;	
parameter Green_EW_7 			= 7'd30;	
parameter Green_EW_8 			= 7'd31;	
parameter Green_EW_9 			= 7'd32;

parameter Yellow_EW_0 			= 7'd33;	
parameter Yellow_EW_1 			= 7'd34;	
parameter Yellow_EW_2 			= 7'd35;


reg LeftTurn_NS_reg ;
reg Green_NS_reg    ;
reg Yellow_NS_reg   ;
reg Red_NS_reg      ;
reg LeftTurn_EW_reg ;
reg Green_EW_reg    ;
reg Yellow_EW_reg   ;
reg Red_EW_reg      ;


assign LeftTurn_NS   =  LeftTurn_NS_reg ;
assign Green_NS      =  Green_NS_reg    ;
assign Yellow_NS     =  Yellow_NS_reg   ;
assign Red_NS        =  Red_NS_reg      ;
assign LeftTurn_EW   =  LeftTurn_EW_reg ;
assign Green_EW      =  Green_EW_reg    ;
assign Yellow_EW     =  Yellow_EW_reg   ;
assign Red_EW	     =  Red_EW_reg      ;

initial begin
	state <= 7'b0;
	next_state <= 7'b0;
end



always @ (posedge clk) begin
	if (rst) state <= 7'b0;
	// We only want to go into emergency state if we're not already in an emergency state.
	if (emergency && state < emergency_offset) state <= next_state + emergency_offset;
	if (!rst && (!emergency || state >= emergency_offset)) state <= next_state;
end

always @ (state) begin

case(state)
LeftTurn_NS_0:   begin
	LeftTurn_NS_reg  <= 1;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= LeftTurn_NS_1;
end
LeftTurn_NS_1:   begin
	LeftTurn_NS_reg  <= 1;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= LeftTurn_NS_2;
end
LeftTurn_NS_2:   begin
	LeftTurn_NS_reg  <= 1;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= LeftTurn_NS_3;
end
LeftTurn_NS_3:   begin
	LeftTurn_NS_reg  <= 1;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= LeftTurn_NS_4;
end
LeftTurn_NS_4:   begin
	LeftTurn_NS_reg  <= 1;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Green_NS_0;
end
Green_NS_0 	:    begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 1;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 0;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Green_NS_1;
end
Green_NS_1 	:    begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 1;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 0;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Green_NS_2;
end
Green_NS_2 	:    begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 1;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 0;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Green_NS_3;
end
Green_NS_3 	:    begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 1;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 0;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Green_NS_4;
end
Green_NS_4 	:    begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 1;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 0;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Green_NS_5;
end
Green_NS_5 	:    begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 1;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 0;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Green_NS_6;
end
Green_NS_6 	:    begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 1;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 0;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Green_NS_7;
end
Green_NS_7 	:    begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 1;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 0;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Green_NS_8;
end
Green_NS_8 	:    begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 1;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 0;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Green_NS_9;
end
Green_NS_9 	:    begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 1;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 0;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Yellow_NS_0;
end
Yellow_NS_0 :	 begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 1;
	Red_NS_reg       <= 0;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Yellow_NS_1;
end
Yellow_NS_1 :	 begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 1;
	Red_NS_reg       <= 0;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Yellow_NS_2;
end
Yellow_NS_2 :	 begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 1;
	Red_NS_reg       <= 0;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= LeftTurn_EW_0;
end
LeftTurn_EW_0:   begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 1;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= LeftTurn_EW_1;
end
LeftTurn_EW_1:   begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 1;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= LeftTurn_EW_2;
end
LeftTurn_EW_2:   begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 1;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= LeftTurn_EW_3;
end
LeftTurn_EW_3:   begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 1;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= LeftTurn_EW_4;
end
LeftTurn_EW_4:   begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 1;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Green_EW_0;
end
Green_EW_0 	:    begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 1;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 0;
	next_state <= Green_EW_1;
end
Green_EW_1 	:    begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 1;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 0;
	next_state <= Green_EW_2;
end
Green_EW_2 	:    begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 1;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 0;
	next_state <= Green_EW_3;
end
Green_EW_3 	:    begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 1;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 0;
	next_state <= Green_EW_4;
end
Green_EW_4 	:    begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 1;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 0;
	next_state <= Green_EW_5;
end
Green_EW_5 	:    begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 1;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 0;
	next_state <= Green_EW_6;
end
Green_EW_6 	:    begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 1;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 0;
	next_state <= Green_EW_7;
end
Green_EW_7 	:    begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 1;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 0;
	next_state <= Green_EW_8;
end
Green_EW_8 	:    begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 1;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 0;
	next_state <= Green_EW_9;
end
Green_EW_9 	:    begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 1;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 0;
	next_state <= Yellow_EW_0;
end
Yellow_EW_0 :	 begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 1;
	Red_EW_reg       <= 0;
	next_state <= Yellow_EW_1;
end
Yellow_EW_1 :	 begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 1;
	Red_EW_reg       <= 0;
	next_state <= Yellow_EW_2;
end
Yellow_EW_2 :    begin

	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 1;
	Red_EW_reg       <= 0;
	next_state <= LeftTurn_NS_0;
end

LeftTurn_NS_0 + emergency_offset: 	begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= LeftTurn_NS_0;
end
LeftTurn_NS_1 + emergency_offset: 	begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= LeftTurn_NS_1;
end
LeftTurn_NS_2 + emergency_offset: 	begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= LeftTurn_NS_2;
end
LeftTurn_NS_3 + emergency_offset: 	begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= LeftTurn_NS_3;
end
LeftTurn_NS_4 + emergency_offset: 	begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= LeftTurn_NS_4;
end
Green_NS_0  + emergency_offset:		begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Green_NS_0;
end
Green_NS_1  + emergency_offset:		begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Green_NS_1;
end
Green_NS_2  + emergency_offset:		begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Green_NS_2;
end
Green_NS_3  + emergency_offset:		begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Green_NS_3;
end
Green_NS_4  + emergency_offset:		begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Green_NS_4;
end
Green_NS_5  + emergency_offset:		begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Green_NS_5;
end
Green_NS_6  + emergency_offset:		begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Green_NS_6;
end
Green_NS_7  + emergency_offset:		begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Green_NS_7;
end
Green_NS_8  + emergency_offset:		begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Green_NS_8;
end
Green_NS_9  + emergency_offset:		begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Green_NS_9;
end
Yellow_NS_0 + emergency_offset:		begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Yellow_NS_0;
end
Yellow_NS_1 + emergency_offset:		begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Yellow_NS_1;
end
Yellow_NS_2 + emergency_offset:		begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Yellow_NS_2;
end
LeftTurn_EW_0 + emergency_offset: 	begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= LeftTurn_EW_0;
end
LeftTurn_EW_1 + emergency_offset: 	begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= LeftTurn_EW_1;
end
LeftTurn_EW_2 + emergency_offset: 	begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= LeftTurn_EW_2;
end
LeftTurn_EW_3 + emergency_offset: 	begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= LeftTurn_EW_3;
end
LeftTurn_EW_4 + emergency_offset: 	begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= LeftTurn_EW_4;
end
Green_EW_0 	+ emergency_offset: 	begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Green_EW_0;
end
Green_EW_1 	+ emergency_offset: 	begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Green_EW_1;
end
Green_EW_2 	+ emergency_offset: 	begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Green_EW_2;
end
Green_EW_3 	+ emergency_offset: 	begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Green_EW_3;
end
Green_EW_4 	+ emergency_offset: 	begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Green_EW_4;
end
Green_EW_5 	+ emergency_offset: 	begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Green_EW_5;
end
Green_EW_6 	+ emergency_offset: 	begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Green_EW_6;
end
Green_EW_7 	+ emergency_offset: 	begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Green_EW_7;
end
Green_EW_8 	+ emergency_offset: 	begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Green_EW_8;
end
Green_EW_9 	+ emergency_offset: 	begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Green_EW_9;
end
Yellow_EW_0 + emergency_offset: 	begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Yellow_EW_0;
end
Yellow_EW_1 + emergency_offset: 	begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Yellow_EW_1;
end
Yellow_EW_2 + emergency_offset:  	begin
	LeftTurn_NS_reg  <= 0;
	Green_NS_reg     <= 0;
	Yellow_NS_reg    <= 0;
	Red_NS_reg       <= 1;
	LeftTurn_EW_reg  <= 0;
	Green_EW_reg     <= 0;
	Yellow_EW_reg    <= 0;
	Red_EW_reg       <= 1;
	next_state <= Yellow_EW_2;
end

endcase
end

endmodule