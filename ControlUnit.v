`define ADD  4'b0111 // 2's compl add
`define ADDI  4'b0111 // 2's compl add
`define ADDU 4'b0001 // unsigned add
`define SUB  4'b0010 // 2's compl subtract
`define SUBU 4'b0011 // unsigned subtract
`define AND  4'b0100 // bitwise AND
`define OR   4'b0101 // bitwise OR
`define XOR  4'b0110 // bitwise XOR
`define SLT  4'b1010 // set result=1 if less than 2's compl
`define SLTU 4'b1011 // set result=1 if less than unsigned
`define NOP  4'b0000 // do nothing
`define RTYPE  4'b1111 // R-Type arithmetic
`define LWSW 4'b1110 //lw or sw
`define SLL  4'b1001 // shift left logical
`define SRA  4'b1101 // shift right arithmetic
`define SRL  4'b0110 // shift right logical
`define BE 4'b1000  //beq/bne

module ControlUnit(
output RegDst, 
output ALUSrc, 
output MemtoReg, 
output RegWrite, 
output MemRead, 
output MemWrite, 
output Branch, 
output Jump, 
output SignExtend, 
output reg [3:0] ALUOp, 
input [5:0] IR,
output BEQ
);

assign RegDst=((~IR[0])*(~IR[1])*(~IR[2])*(~IR[3])*(~IR[4])*(~IR[5]));
assign ALUSrc=((IR[0])*(IR[1])*(~IR[2])*(~IR[4])*(IR[5]))|((~IR[0])*(~IR[1])*(~IR[2])*(IR[3])*(~IR[4])*(~IR[5]))|((IR[0])*(~IR[1])*(~IR[2])*(IR[3])*(~IR[4])*(~IR[5]))|((~IR[1])*(IR[2])*(IR[3])*(~IR[4])*(~IR[5]))|((~IR[0])*(IR[1])*(IR[2])*(IR[3])*(~IR[4])*(~IR[5]))|((~IR[0])*(IR[1])*(~IR[2])*(IR[3])*(~IR[4])*(~IR[5]))|((IR[0])*(~IR[1])*(~IR[2])*(IR[3])*(~IR[4])*(~IR[5]))|((IR[0])*(IR[1])*(~IR[2])*(IR[3])*(~IR[4])*(~IR[5]));
assign MemtoReg=((IR[0])*(IR[1])*(~IR[2])*(~IR[3])*(~IR[4])*(IR[5]));
assign RegWrite=((~IR[0])*(~IR[1])*(~IR[2])*(~IR[3])*(~IR[4])*(~IR[5]))|((IR[0])*(IR[1])*(~IR[2])*(~IR[3])*(~IR[4])*(IR[5]))|((~IR[1])*(~IR[2])*(IR[3])*(~IR[4])*(~IR[5]))|((IR[1])*(~IR[2])*(IR[3])*(~IR[4])*(~IR[5]))|((~IR[1])*(IR[2])*(IR[3])*(~IR[4])*(~IR[5]))|((~IR[0])*(IR[1])*(IR[2])*(IR[3])*(~IR[4])*(~IR[5]));
assign MemRead=((IR[0])*(IR[1])*(~IR[2])*(~IR[3])*(~IR[4])*(IR[5]));
assign MemWrite=((IR[0])*(IR[1])*(~IR[2])*(IR[3])*(~IR[4])*(IR[5]));
assign Branch=((~IR[1])*(IR[2])*(~IR[3])*(~IR[4])*(~IR[5]));
assign BEQ=((~IR[0])*(~IR[1])*(IR[2])*(~IR[3])*(~IR[4])*(~IR[5]));
assign Jump=((~IR[0])*(IR[1])*(~IR[2])*(~IR[3])*(~IR[4])*(~IR[5]));
	always@(IR)
    begin
        case(IR)
            6'b000000 :ALUOp = `RTYPE; 
            6'b100011 :ALUOp = `LWSW; //lw
            6'b101011 :ALUOp = `LWSW; //sw
            6'b001000 :ALUOp = `ADDI;   
            6'b001001 :ALUOp = `ADDU;   //addiu
            6'b001010 :ALUOp = `SLT;  //slti
            6'b001011 :ALUOp = `SLTU; //sltiu ((IR[0])*(IR[1])*(~IR[2])*(IR[3])*(~IR[4])*(~IR[5]))
            6'b001100 :ALUOp = `AND;  //andi
            6'b001101 :ALUOp = `OR;   //ori
            6'b001110 :ALUOp = `XOR;  //xori ((~IR[0])*(IR[1])*(IR[2])*(IR[3])*(~IR[4])*(~IR[5]))
            6'b000100 :ALUOp = `BE;  //BEQ
            6'b000101 :ALUOp = `BE; //BNE
            //6'b000010 :ALUOp = `ADDI; //j
            //6'b101001 :ALUOp = `SLTU;
            //6'b000000 :ALUOp = `SLL;
            //6'b000011 :ALUOp = `SRA;
            //6'b000010 :ALUOp = `SRL;
        default: ALUOp = `NOP;
        endcase
    //case(IR)
    //    6'b000000 :RegDst = 1'b1; 
    //    default: RegDst = 1'b0;
    //endcase
    end
    
endmodule
