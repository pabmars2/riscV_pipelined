module MEM_CTRL(ddata_w, daddr_in, daddr_out, ddata_r, mem0_dw, mem0_dr, d_rw, mem0_rw, mem1_dout, mem1_din, mem1_ena);

	input [31:0] daddr_in;
	input [31:0] ddata_w, mem0_dr;
	input [15:0] mem1_din;
	input d_rw;
	
	reg [31:0] in_aux, out_aux;
	
	output mem0_rw;
	output [31:0] daddr_out;
	output [1:0] mem1_ena;
	output [31:0] mem0_dw, ddata_r;
	output [15:0] mem1_dout;
	

assign ddata_r = in_aux;	
assign out_aux = ddata_w;
assign mem0_rw = d_rw;
assign daddr_out = daddr_in;
	
always_comb
	begin
		case(daddr_in)
			32'd1021 :  //LEER PINES
				begin 
					mem1_ena = 2'b01; 
					in_aux = mem1_din; 
					mem1_dout = out_aux[15:0]; 
					mem0_dw = out_aux; 
				end
				
			32'd1022 :  //7SEG
				begin 
					mem1_ena = 2'b10; 
					in_aux = mem0_dr; 
					mem1_dout = out_aux[15:0]; 
					mem0_dw = out_aux; 
				end
				
			32'd1023 :  //LEDS
				begin 
					mem1_ena = 2'b11; 
					in_aux = mem0_dr; 
					mem1_dout = out_aux[15:0]; 
					mem0_dw = out_aux; 
				end
				
			default : 
				begin 
					mem1_ena = 2'b00; 
					in_aux = mem0_dr; 
					mem0_dw = out_aux; 
					mem1_dout = 16'b0; 
				end			
		endcase
	end
	
endmodule 