//Prajval M 16CO234 and Sumukha PK 16CO145

`timescale 1s/100ms
module testbench;

reg [4:0] Rreg1, Rreg2, regNum;
reg enwr;
wire  [31:0] Rdata1, Rdata2; 
reg  [31:0] wrdata;
Regfile M(Rreg1, Rreg2, Rdata1, Rdata2, enwr, wrdata, regNum);

// enwr means write to a register in RegFile enwr complement means read from registers in RegFile

initial
	begin
	$dumpfile("regFile.vcd");
	$dumpvars(0,testbench);
	#100 enwr = 1; wrdata = 32'd64; regNum = 5'd10; Rreg2 = 5'd0; Rreg1 = 5'd0;
	#100 enwr = 1; wrdata = 32'd31; regNum = 5'd14; Rreg2 = 5'd0; Rreg1 = 5'd0;
	#100 enwr = 1; wrdata = 32'd45; regNum = 5'd19; Rreg2 = 5'd0; Rreg1 = 5'd0;
	#100 enwr = 0; Rreg1 = 5'd10; 	Rreg2 = 5'd14;	regNum = 5'dx;	wrdata = 32'dx;
	#100 enwr = 0; Rreg1 = 5'd19; 	Rreg2 = 5'd0;	regNum = 5'dx;	wrdata = 32'dx;
	end

initial 
	begin
	$monitor("%d %d %h %h %b %h %d",Rreg1, Rreg2, Rdata1, Rdata2, enwr, wrdata, regNum); 
	#1000 $finish;
	end
	
endmodule