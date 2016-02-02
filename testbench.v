/**
 * Traffic Lights Testbench
 * Author: Gus Smith <hfs5022@psu.edu>
 */
module trafficlights_tb;

reg clock;
reg emergency;
integer cycles;
wire[3:0] EWout;
wire[3:0] NSout;

trafficlightNS ns(
	.clock(clock),
	.emergency(emergency),
	.out(NSout)
);

trafficlightEW ew(
	.clock(clock),
	.emergency(emergency),
	.out(EWout)
);

initial
begin
	clock = 1;
	emergency = 0;
	cycles = 0;
end

// Log info.
initial begin
	$display("\tcycles\temergency\t\tEWout\tNSout");
end
always #10 begin
	$display("%d\t\t\t%b\t%b\t%b", cycles,emergency,EWout,NSout); 
	cycles = cycles + 1;
end

// Generate clock and emergency signals.
always 	#5 clock = !clock;
always	#30 begin 
	emergency = 1;
	#15 emergency = 0;
end

initial #1000 $stop;	// Or $finish?

endmodule
