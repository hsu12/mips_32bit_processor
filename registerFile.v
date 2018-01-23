module registerFile(read1, read2, write_data, r_addr1, r_addr2, w_addr, reg_wr, CLK, RESET);
	output reg [31:0] read1, read2;
	input [31:0] write_data;
	input [4:0] r_addr1, r_addr2, w_addr;
	input reg_wr, CLK, RESET;
    reg [31:0] registers [0:31];
    
    always @(posedge RESET)
		begin
		registers[0]<=0;
		registers[1]<=0;
		registers[2]<=0;
		registers[3]<=0;
		registers[4]<=0;
		registers[5]<=0;
		registers[6]<=0;
		registers[7]<=0;
		registers[8]<=0;
		registers[9]<=0;
		registers[10]<=0;
		registers[11]<=0;
		registers[12]<=0;
		registers[13]<=0;
		registers[14]<=0;
		registers[15]<=0;
		registers[16]<=0;
		registers[17]<=0;
		registers[18]<=0;
		registers[19]<=0;
		registers[20]<=0;
		registers[21]<=0;
		registers[22]<=0;
		registers[23]<=0;
		registers[24]<=0;
		registers[25]<=0;
		registers[26]<=0;
		registers[27]<=0;
		registers[28]<=0;
		registers[29]<=0;
		registers[30]<=0;
		registers[31]<=0;
	end
	
	always @(negedge CLK) 
	begin
        if(reg_wr)
		begin
            registers[w_addr] <= write_data;
			$display("Reg %d current %d new %d" ,w_addr, registers[w_addr], write_data );

        end  
    end
	
	always @(posedge CLK) 
    begin
       read1 <= registers[r_addr1];
       read2 <= registers[r_addr2];
       //$display("Reg %d read %d Reg %d read %d" ,r_addr1, read1, r_addr2,read2 );
               	 $display("----------------------------------------------\n");
  $display("time %0d\t \n", $time);
  $display("Reg0 %d " ,registers[0] );
  $display("Reg1 %d " ,registers[1] );
  $display("Reg2 %d " ,registers[2] );
  $display("Reg3 %d " ,registers[3] );
  $display("Reg4 %d " ,registers[4] );
  $display("Reg5 %d " ,registers[5] );
  $display("Reg6 %d " ,registers[6] );
  $display("Reg7 %d " ,registers[7] );
  $display("Reg8 %d " ,registers[8] );
  $display("Reg9 %d " ,registers[9] );
  $display("Reg10 %d " ,registers[10] );
  $display("Reg11 %d " ,registers[11] );
  $display("Reg12 %d " ,registers[12] );
  $display("Reg13 %d " ,registers[13] );
  $display("Reg14 %d " ,registers[14] );
  $display("Reg15 %d " ,registers[15] );
  $display("Reg16 %d " ,registers[16] );
  $display("Reg17 %d " ,registers[17] );
  $display("Reg18 %d " ,registers[18] );
  $display("Reg19 %d " ,registers[19] );
  $display("Reg20 %d " ,registers[20] );
  $display("Reg21 %d " ,registers[21] );
  $display("Reg22 %d " ,registers[22] );
  $display("Reg23 %d " ,registers[23] );    
    end
	
	/*always @ (reg_wr or write_data)
	 begin
	 
	 $display("----------------------------------------------\n");
	 $display("time %0d\t \n", $time);
	 $display("Reg0 %d " ,registers[0] );
     $display("Reg1 %d " ,registers[1] );
     $display("Reg2 %d " ,registers[2] );
	 $display("Reg3 %d " ,registers[3] );
     $display("Reg4 %d " ,registers[4] );
     $display("Reg5 %d " ,registers[5] );
     $display("Reg6 %d " ,registers[6] );
     $display("Reg7 %d " ,registers[7] );
     $display("Reg8 %d " ,registers[8] );
     $display("Reg9 %d " ,registers[9] );
	 $display("Reg10 %d " ,registers[10] );
	 $display("Reg11 %d " ,registers[11] );
	 $display("Reg12 %d " ,registers[12] );
	 $display("Reg13 %d " ,registers[13] );
	 $display("Reg14 %d " ,registers[14] );
	 $display("Reg15 %d " ,registers[15] );
	 $display("Reg16 %d " ,registers[16] );
	end
	*/
endmodule