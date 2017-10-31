// Prajval M 16CO234 and Sumukha PK 16CO145

module Regfile( Rreg1, Rreg2, Rdata1, Rdata2, enwr, wrdata, regNum);

input [4:0] Rreg1, Rreg2, regNum;
output reg [31:0] Rdata1, Rdata2;
input enwr;
input [31:0]wrdata;
reg [0:31][31:0] Reg;

initial begin
		Rdata1 = 32'b0;
		Rdata2 = 32'b0;
end
always @(Rreg1 or Rreg2 or wrdata) begin //Clock will be used in the starting of the processor hence clock is not used
	if(enwr) begin
		Reg[regNum] = wrdata;			//[regNum] plays the role of a decoder
	end
	else begin
		if(Rreg1)
			Rdata1 = Reg[Rreg1];		//[Rreg1] acts like a multiplexer
		else
			Rdata1 = 32'b0;
		
		if(Rreg2)
			Rdata2 = Reg[Rreg2];		//[Rreg2] acts like a multiplexer
		else
			Rdata2 = 32'b0;
	end
end

endmodule

