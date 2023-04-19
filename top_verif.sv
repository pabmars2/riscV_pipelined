module top_verif(CLK, RST_N, DIN_SW, DOUT_LD, hex0, hex1, hex2, hex3);

parameter N = 1024;
localparam n = $clog2(N);

input CLK, RST_N;
input [15:0] DIN_SW;

output [15:0] DOUT_LD;
output [6:0] hex0, hex1, hex2, hex3;

wire [31 : 0] idata, ddata_w, ddata_r, ddata_r2;
wire [15:0] mem1_dout, mem1_din, DOUT_7S;
wire [n-1 : 0] daddr, daddr2, iaddr;
wire WRam, mem_rw;
wire [1:0] mem1_ena;


memoriaRAM #(.ADDRESS_SIZE(N))	RAM(
	.CLK(CLK), 
	.ADDRESS(daddr2), 
	.MEM_WRITE(mem_rw), 
	.WRITE_DATA(ddata_w2), 
	.READ_DATA(ddata_r2));
	
memoriaROM	#(.POSICIONES(N)) ROM(
	.INSTRUCTION_ADDRESS(iaddr), 
	.INSTRUCTION(idata));
	
top #(.N(N))	top(
	.CLK(CLK), 
	.RST_N(RST_N), 
	.idata(idata), 
	.ddata_r(ddata_r), 
	.iaddr(iaddr), 
	.daddr(daddr), 
	.ddata_w(ddata_w), 
	.WRam(WRam));

MEM_CTRL mem_ctrl(.ddata_w(ddata_w), 
						.daddr_in(daddr),
						.daddr_out(daddr2),
						.ddata_r(ddata_r), 
						.mem0_dw(ddata_w2), 
						.mem0_dr(ddata_r2), 
						.d_rw(WRam), 
						.mem0_rw(mem_rw), 
						.mem1_dout(mem1_dout), 
						.mem1_din(mem1_din), 
						.mem1_ena(mem1_ena));
						
GPIO gpio  (.CLK(CLK), 
				.RST_n(RST_N),
				.mem1_dout(mem1_dout),  
				.mem1_ena(mem1_ena), 
				.mem1_din(mem1_din), 
				.DIN_SW(DIN_SW), 
				.DOUT_LD(DOUT_LD), 
				.DOUT_7S(DOUT_7S));
				
hex7seg HEX0  (.hex_digit(DOUT_7S[3:0]),
					.oSEG(hex0));
					
hex7seg HEX1  (.hex_digit(DOUT_7S[7:4]),
					.oSEG(hex1));
					
hex7seg HEX2  (.hex_digit(DOUT_7S[11:8]),
					.oSEG(hex2));
					
hex7seg HEX3  (.hex_digit(DOUT_7S[15:12]),
					.oSEG(hex3));

endmodule 