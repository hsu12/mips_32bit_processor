`define ADD  4'b0111 // 2's compl add
`define ADDU 4'b0001 // unsigned add
`define SUB  4'b0010 // 2's compl subtract
`define SUBU 4'b0011 // unsigned subtract
`define AND  4'b0100 // bitwise AND
`define OR   4'b0101 // bitwise OR
`define XOR  4'b0110 // bitwise XOR
`define SLT  4'b1010 // set result=1 if less than 2's compl
`define SLTU 4'b1011 // set result=1 if less than unsigned
`define NOP  4'b0000 // do nothing
`define SLL  4'b1001 // shift left logical
`define SRA  4'b1101 // shift right arithmetic
`define SRL  4'b0110 // shift right logical

module ALUControl (ALUCtrl, ALUop, funct);
	input [3:0] ALUop;
	input [5:0] funct;
	output reg [3:0] ALUCtrl;
	
	
	always @ (ALUCtrl or ALUop or funct)
	begin 	
		if (ALUop==4'b1111)
		begin
			case(funct)
			    6'b000000 :ALUCtrl = `SLL;
                6'b000011 :ALUCtrl = `SRA;
                6'b000010 :ALUCtrl = `SRL;
				6'b100000 :ALUCtrl = `ADD; 
				6'b100010 :ALUCtrl = `SUB; 
				6'b100001 :ALUCtrl = `ADDU; 
				6'b100011 :ALUCtrl = `SUBU; 
				6'b100100 :ALUCtrl = `AND; 
                6'b100101 :ALUCtrl = `OR;
                6'b100110 :ALUCtrl = `XOR;
                6'b101010 :ALUCtrl = `SLT;
                6'b101001 :ALUCtrl = `SLTU;
			endcase
		end
		else ALUCtrl = ALUop;
		end
endmodule