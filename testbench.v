//Prajval M 16CO234 and Sumukha PK 16CO145

`timescale 1s/100ms
module testbench;
	
reg[5:0] opcode;
wire result, carry, slt, iszero;

ALU M(opcode,result,carry,slt,iszero);

initial
	begin
	$dumpfile("ALU.vcd");
	$dumpvars(0,testbench);
	#100 opcode = 6'b000011; //Testing Operations
	#100 opcode = 6'b000100;
	#100 opcode = 6'b001011;
	#100 opcode = 6'b110001;
	#100 opcode = 6'b110100;
	#100 opcode = 6'b011010;
	#100;
	end

initial 
	begin
	$monitor("OPCODE %b RESULT is %b, iszero is %b, slt is %b\n",opcode,result,iszero,slt);
	end

endmodule