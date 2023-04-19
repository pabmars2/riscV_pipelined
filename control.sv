module control(IN, Brach, PCRead, MemtoReg, ALUOP, MemWrite, ALUSrc, RegWrite, AddPC);

input [6:0] IN;
output reg Brach, PCRead, MemtoReg, MemWrite, ALUSrc, RegWrite, AddPC;
output reg [1:0] ALUOP;

always_comb
begin
	case(IN[6:2])
		5'b00000 : 	//l
			begin
				ALUOP =  2'b10;
				Brach = 1'b0;
				PCRead = 1'b0;//
				MemtoReg = 1'b1;
				MemWrite = 1'b0;
				ALUSrc = 1'b1;
				RegWrite = 1'b1;
				AddPC = 1'b0;//
			end
			
		5'b00100 : 	//i
			begin
				ALUOP =  2'b00;
				Brach = 1'b0;
				PCRead = 1'b0;//
				MemtoReg = 1'b0;
				MemWrite = 1'b0;
				ALUSrc = 1'b1;
				RegWrite = 1'b1;
				AddPC = 1'b0;//
			end
		
		5'b01000 : 	//s
			begin
				ALUOP =  2'b10;
				Brach = 1'b0;
				PCRead = 1'b0;//
				MemtoReg = 1'b0;
				MemWrite = 1'b1;
				ALUSrc = 1'b1;
				RegWrite = 1'b0;
				AddPC = 1'b0;//
			end
		
		5'b01100 : 	//r
			begin
				ALUOP =  2'b00;
				Brach = 1'b0;
				PCRead = 1'b0;//
				MemtoReg = 1'b0;
				MemWrite = 1'b0;
				ALUSrc = 1'b0;
				RegWrite = 1'b1;
				AddPC = 1'b0;//
			end
			
		5'b11000 : 	//b
			begin
				ALUOP =  2'b00;
				Brach = 1'b1;
				PCRead = 1'b0;//
				MemtoReg = 1'b0;
				MemWrite = 1'b0;
				ALUSrc = 1'b0;
				RegWrite = 1'b0;
				AddPC = 1'b0;//
			end
			
		5'b11001 : 	//JALR
			begin
				ALUOP =  2'b10;
				Brach = 1'b0;
				PCRead = 1'b1;//
				MemtoReg = 1'b0;
				MemWrite = 1'b0;
				ALUSrc = 1'b0;
				RegWrite = 1'b1;
				AddPC = 1'b1;//
			end
			
		5'b11011	: //JAL
			begin
				ALUOP =  2'b10;
				Brach = 1'b0;
				PCRead = 1'b1;//
				MemtoReg = 1'b0;
				MemWrite = 1'b0;
				ALUSrc = 1'b1;
				RegWrite = 1'b1;
				AddPC = 1'b1;//
			end
			
		5'b01101 : //LUI
			begin
				ALUOP =  2'b11;
				Brach = 1'b0;
				PCRead = 1'b0;//
				MemtoReg = 1'b0;
				MemWrite = 1'b0;
				ALUSrc = 1'b1;
				RegWrite = 1'b1;
				AddPC = 1'b0;//
			end
	
		5'b00101 : //AUIPC
			begin
				ALUOP =  2'b00;
				Brach = 1'b0;
				PCRead = 1'b1;//
				MemtoReg = 1'b0;
				MemWrite = 1'b0;
				ALUSrc = 1'b1;
				RegWrite = 1'b1;
				AddPC = 1'b1;//
			end
			
		default :
			begin
				ALUOP =  2'b00;
				Brach = 1'b0;
				PCRead = 1'b0;
				MemtoReg = 1'b0;
				MemWrite = 1'b0;
				ALUSrc = 1'b0;
				RegWrite = 1'b0;
				AddPC = 1'b0;
			end
			
	endcase
end
endmodule 