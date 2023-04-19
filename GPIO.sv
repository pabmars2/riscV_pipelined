module GPIO(CLK, RST_n, mem1_dout, mem1_ena, mem1_din, DIN_SW, DOUT_LD, DOUT_7S);

	input CLK, RST_n;
	input [15:0] mem1_dout, DIN_SW;
	input [1:0] mem1_ena;
	
	output [15:0] mem1_din, DOUT_LD, DOUT_7S;
	
	reg [15:0] aux [2:0];
	
	assign aux[0] = DIN_SW;
	
	assign DOUT_LD = aux[1];
	assign DOUT_7S = aux[2];
	assign mem1_din = aux[0];
	
	always_ff @(posedge CLK)
	begin
		if(!RST_n)
			begin
				aux[1] <= 15'd0;
				aux[2] <= 15'd0;
			end
		else
			if(mem1_ena[1])
				if(mem1_ena[0])
					aux[1] <= mem1_dout;
				else
					aux[2] <= mem1_dout;
	end	
endmodule 