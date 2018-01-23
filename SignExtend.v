
module SignExtend(
input [15:0]IR, 
output [31:0]Immed
);

wire sign;
assign Immed[15:0]=IR[15:0];

assign sign=IR[15];
//assign Immed[15]=sign;
assign Immed[16]=sign;
assign Immed[17]=sign;
assign Immed[18]=sign;
assign Immed[19]=sign;
assign Immed[20]=sign;
assign Immed[21]=sign;
assign Immed[22]=sign;
assign Immed[23]=sign;
assign Immed[24]=sign;
assign Immed[25]=sign;
assign Immed[26]=sign;
assign Immed[27]=sign;
assign Immed[28]=sign;
assign Immed[29]=sign;
assign Immed[30]=sign;
assign Immed[31]=sign;

//assign Immed={{16{IR[15]}},IR};

endmodule
