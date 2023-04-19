module hex7seg (hex_digit, oSEG); 

input [3:0] hex_digit; 
output reg [6:0] oSEG;
 
always@ (hex_digit) 
	begin 
		case (hex_digit) 
			4'b 0000: oSEG=7'b 1000000; 
			4'b 0001: oSEG=7'b 1111001; 
			4'b 0010: oSEG=7'b 0100100; 
			4'b 0011: oSEG=7'b 0110000; 
			4'b 0100: oSEG=7'b 0011001; 
			4'b 0101: oSEG=7'b 0010010; 
			4'b 0110: oSEG=7'b 0000010; 
			4'b 0111: oSEG=7'b 1111000; 
			4'b 1000: oSEG=7'b 0000000; 
			4'b 1001: oSEG=7'b 0010000;
			4'b 1010: oSEG=7'b 0001000; 
			4'b 1011: oSEG=7'b 0000011; 
			4'b 1100: oSEG=7'b 1000110; 
			4'b 1101: oSEG=7'b 0100001; 
			4'b 1110: oSEG=7'b 0000110; 
			4'b 1111: oSEG=7'b 0001110;
			default: oSEG=7'b 0000000; 
		endcase 
	end 
endmodule 