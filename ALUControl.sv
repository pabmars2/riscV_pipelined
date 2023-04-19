module ALUControl(ALUOP, IN, OUT);

input [1 : 0] ALUOP;
input [3 : 0] IN;
output reg [3 : 0] OUT;

always_comb
begin
	case(ALUOP)
		2'b00 : OUT = IN;
		2'b01 : OUT = 4'b1000;
		2'b10 : OUT = 4'b0000;
		2'b11 : OUT = 4'b1111; //auixiliar auipc y lui
		default : OUT = 0;			
	endcase
end
endmodule 