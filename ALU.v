// Prajval M 16CO234 and Sumukha PK 16CO145

module ALU( opcode, result, carry, slt, iszero);

input [5:0] opcode;
output reg result, slt, iszero, carry;
reg a, b, A, B;

//ALU accepts 6 bit OPCODE 

always @ (opcode)begin	//Plays the role of several intermediate MUX to select which operation
	a = opcode[1];
	b = opcode[0];
	case({opcode[5:2]})
		4'b0000://and
			begin
			$display("AND");
			result = a&b;
			end
		4'b0001://or
			begin
			$display("OR");
			result = a|b;
			end
		4'b0010://addition
			begin
				result = a^b;
				carry = a&b;
				$display("ADDITION carry = %b",carry);
			end
		4'b1100://NOR
			begin
				$display("NOR");
				A = ~a;
				B = ~b;
				result = A&B;
			end
		4'b1101://NAND
			begin
				$display("NAND");
				A = ~a;
				B = ~b;
				result = A|B;
			end
		4'b0110://SUB
			begin
				B = ~b;
				result = a^B^1;
				carry = a&B|a&1|B&1;
				$display("SUBTRACTION carry = %b",carry);
			end
	endcase
	if(result == 0)							
		iszero = 1;										//iszero is set 1 when result is 0
	else
		iszero = 0;
	if(a<b)
		slt = 1;										//slt is set 1 when a is less than b;
	else 
		slt = 0;
	end
	
endmodule

	
		