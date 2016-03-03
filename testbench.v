/**
 * Traffic Lights Testbench
 * Author: Gus Smith <hfs5022@psu.edu>
 */
module trafficlights_tb;

reg clk;
reg rst;
reg emergency;
integer cycles;
wire[3:0] EWout;
wire[3:0] NSout;
wire LeftTurn_NS ;
wire Green_NS    ;
wire Yellow_NS   ;
wire Red_NS      ;
wire LeftTurn_EW ;
wire Green_EW    ;
wire Yellow_EW   ;
wire Red_EW	     ;



/*
trafficlightNS ns(
	.clk(clk),
	.emergency(emergency),
	.out(NSout)
);

trafficlightEW ew(
	.clk(clk),
	.emergency(emergency),
	.out(EWout)
);*/

trafficlight tl(
	.clk(clk),
	.emergency(emergency),
	.rst(rst),
	.LeftTurn_NS(LeftTurn_NS),
	.Green_NS(Green_NS),   
	.Yellow_NS(Yellow_NS),  
	.Red_NS(Red_NS),     
	.LeftTurn_EW(LeftTurn_EW),
	.Green_EW(Green_EW),   
	.Yellow_EW(Yellow_EW),  
	.Red_EW(Red_EW)	  
);

initial
begin
	clk = 1;
	rst = 0;
	emergency = 0;
	cycles = 0;
end

// Log info.
initial begin
	$display("\tcycles\temergency\t\tEWout\tNSout");

end
always #10 begin	
	$display("%d %d %d %d %d %d %d %d %d\t\temer, rst: %d%d",cycles, LeftTurn_NS,Green_NS,Yellow_NS,Red_NS, LeftTurn_EW, Green_EW, Yellow_EW, Red_EW, emergency, rst);	
	cycles = cycles + 1;
end

// Generate clk and emergency signals.
always 	#5 clk = !clk;
always	#30 begin 
	emergency = 1;
	#15 emergency = 0;
end

always #2000 begin
	rst = 1;
	#15 rst = 0;
end

initial #10000 $stop;	// Or $finish?

endmodule
