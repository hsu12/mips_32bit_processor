module  PC(next, current, Reset_l, firstPC, CLK,branch,brAddr,Jump);
	output reg [31:0] next;
	input [31:0] current, firstPC,brAddr;
	input Reset_l,branch,Jump;
	input CLK;
	
	always @(negedge CLK)
	begin
 	if (Reset_l==1)
	next<=firstPC;
	else if(branch==1)
	next<=brAddr+32'd4;
    else if(Jump==1)
    next<=brAddr;
	else
 	next<= current+32'd4;
end

	
endmodule