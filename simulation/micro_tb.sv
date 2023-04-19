`timescale 1ns/1ps

module micro_tb();

logic iCLK, iRST_N;

top_verif	tpv(
	.CLK(iCLK), 
	.RST_N(iRST_N)
);
	
//Asercion sobre la escritura de la ram
//Asercion sobre el OPMODE de cada instrucción
//Asercion sobre el puntero de la pila (Me parece un poco ridiculo, pero por si acaso :p)	
//Asercion sobre la escritura del dato en la RAM

always @(negedge iCLK)
	case(tpv.iaddr)
	
		0:
			begin
				assert(tpv.WRam == 0) else $error ("NO DEBE ESCRIBIR EN LA RAM");
				assert(tpv.idata[6:0] == 7'b0110111) else $error ("ERROR EN LA OPERACION");
				assert(tpv.iaddr == 0) else $error ("EL PC NO APUNTA A LA OPERACIÓN INDICADA");
				assert(tpv.ddata_w !== 32'hx) else $error ("ERROR AL ESCRIBIR EL DATO EN LA RAM");
			end
			
		1:
			begin
				assert(tpv.WRam == 0) else $error ("NO DEBE ESCRIBIR EN LA RAM");
				assert(tpv.idata[6:0] == 7'b0010011) else $error ("ERROR EN LA OPERACION");
				assert(tpv.iaddr == 1) else $error ("EL PC NO APUNTA A LA OPERACIÓN INDICADA");
				assert(tpv.ddata_w !== 32'hx) else $error ("ERROR AL ESCRIBIR EL DATO EN LA RAM");
			end
			
		2:
			begin
				assert(tpv.WRam == 1) else $error ("ERROR ESCRIBIENDO EN LA RAM");
				assert(tpv.idata[6:0] == 7'b0100011) else $error ("ERROR EN LA OPERACION");
				assert(tpv.iaddr == 2) else $error ("EL PC NO APUNTA A LA OPERACIÓN INDICADA");
				assert(tpv.ddata_w !== 32'hx) else $error ("ERROR AL ESCRIBIR EL DATO EN LA RAM");
			end
		3:
			begin
				assert(tpv.WRam == 0) else $error ("NO DEBE ESCRIBIR EN LA RAM");
				assert(tpv.idata[6:0] == 7'b0000011) else $error ("ERROR EN LA OPERACION");
				assert(tpv.iaddr == 3) else $error ("EL PC NO APUNTA A LA OPERACIÓN INDICADA");
				assert(tpv.ddata_w !== 32'hx) else $error ("ERROR AL ESCRIBIR EL DATO EN LA RAM");
			end
			
		4:
			begin
				assert(tpv.WRam == 0) else $error ("NO DEBE ESCRIBIR EN LA RAM");
				assert(tpv.idata[6:0] == 7'b0010011) else $error ("ERROR EN LA OPERACION");
				assert(tpv.iaddr == 4) else $error ("EL PC NO APUNTA A LA OPERACIÓN INDICADA");
				assert(tpv.ddata_w !== 32'hx) else $error ("ERROR AL ESCRIBIR EL DATO EN LA RAM");
			end
			
		5:
			begin
				assert(tpv.WRam == 0) else $error ("NO DEBE ESCRIBIR EN LA RAM");
				assert(tpv.idata[6:0] == 7'b0010011) else $error ("ERROR EN LA OPERACION");
				assert(tpv.iaddr == 5) else $error ("EL PC NO APUNTA A LA OPERACIÓN INDICADA");
				assert(tpv.ddata_w !== 32'hx) else $error ("ERROR AL ESCRIBIR EL DATO EN LA RAM");
			end
		6:
			begin
				assert(tpv.WRam == 0) else $error ("NO DEBE ESCRIBIR EN LA RAM");
				assert(tpv.idata[6:0] == 7'b0110011) else $error ("ERROR EN LA OPERACION");
				assert(tpv.iaddr == 6) else $error ("EL PC NO APUNTA A LA OPERACIÓN INDICADA");
				assert(tpv.ddata_w !== 32'hx) else $error ("ERROR AL ESCRIBIR EL DATO EN LA RAM");
			end
		7:
			begin
				assert(tpv.WRam == 0) else $error ("NO DEBE ESCRIBIR EN LA RAM");
				assert(tpv.idata[6:0] == 7'b0010011) else $error ("ERROR EN LA OPERACION");
				assert(tpv.iaddr == 7) else $error ("EL PC NO APUNTA A LA OPERACIÓN INDICADA");
				assert(tpv.ddata_w !== 32'hx) else $error ("ERROR AL ESCRIBIR EL DATO EN LA RAM");
			end
		8:
			begin
				assert(tpv.WRam == 0) else $error ("NO DEBE ESCRIBIR EN LA RAM");
				assert(tpv.idata[6:0] == 7'b1100011) else $error ("ERROR EN LA OPERACION");
				assert(tpv.iaddr == 8) else $error ("EL PC NO APUNTA A LA OPERACIÓN INDICADA");
				assert(tpv.ddata_w !== 32'hx) else $error ("ERROR AL ESCRIBIR EL DATO EN LA RAM");
			end
		9:
			begin
				assert(tpv.WRam == 0) else $error ("NO DEBE ESCRIBIR EN LA RAM");
				assert(tpv.idata[6:0] == 7'b0110011) else $error ("ERROR EN LA OPERACION");
				assert(tpv.iaddr == 9) else $error ("EL PC NO APUNTA A LA OPERACIÓN INDICADA");
				assert(tpv.ddata_w !== 32'hx) else $error ("ERROR AL ESCRIBIR EL DATO EN LA RAM");
			end
		10:
			begin
				assert(tpv.WRam == 0) else $error ("NO DEBE ESCRIBIR EN LA RAM");
				assert(tpv.idata[6:0] == 7'b0110011) else $error ("ERROR EN LA OPERACION");
				assert(tpv.iaddr == 10) else $error ("EL PC NO APUNTA A LA OPERACIÓN INDICADA");
				assert(tpv.ddata_w !== 32'hx) else $error ("ERROR AL ESCRIBIR EL DATO EN LA RAM");
			end
		11:
			begin
				assert(tpv.WRam == 0) else $error ("NO DEBE ESCRIBIR EN LA RAM");
				assert(tpv.idata[6:0] == 7'b0010011) else $error ("ERROR EN LA OPERACION");
				assert(tpv.iaddr == 11) else $error ("EL PC NO APUNTA A LA OPERACIÓN INDICADA");
				assert(tpv.ddata_w !== 32'hx) else $error ("ERROR AL ESCRIBIR EL DATO EN LA RAM");
			end
		12:
			begin
				assert(tpv.WRam == 0) else $error ("NO DEBE ESCRIBIR EN LA RAM");
				assert(tpv.idata[6:0] == 7'b1100011) else $error ("ERROR EN LA OPERACION");
				assert(tpv.iaddr == 12) else $error ("EL PC NO APUNTA A LA OPERACIÓN INDICADA");
				assert(tpv.ddata_w !== 32'hx) else $error ("ERROR AL ESCRIBIR EL DATO EN LA RAM");
			end
		13:
			begin
				assert(tpv.WRam == 0) else $error ("NO DEBE ESCRIBIR EN LA RAM");
				assert(tpv.idata[6:0] == 7'b0110011) else $error ("ERROR EN LA OPERACION");
				assert(tpv.iaddr == 13) else $error ("EL PC NO APUNTA A LA OPERACIÓN INDICADA");
				assert(tpv.ddata_w !== 32'hx) else $error ("ERROR AL ESCRIBIR EL DATO EN LA RAM");
			end
		14:
			begin
				assert(tpv.WRam == 0) else $error ("NO DEBE ESCRIBIR EN LA RAM");
				assert(tpv.idata[6:0] == 7'b0110011) else $error ("ERROR EN LA OPERACION");
				assert(tpv.iaddr == 14) else $error ("EL PC NO APUNTA A LA OPERACIÓN INDICADA");
				assert(tpv.ddata_w !== 32'hx) else $error ("ERROR AL ESCRIBIR EL DATO EN LA RAM");
			end
		15:
			begin
				assert(tpv.WRam == 0) else $error ("NO DEBE ESCRIBIR EN LA RAM");
				assert(tpv.idata[6:0] == 7'b0110011) else $error ("ERROR EN LA OPERACION");
				assert(tpv.iaddr == 15) else $error ("EL PC NO APUNTA A LA OPERACIÓN INDICADA");
				assert(tpv.ddata_w !== 32'hx) else $error ("ERROR AL ESCRIBIR EL DATO EN LA RAM");
			end
		16:
			begin
				assert(tpv.WRam == 0) else $error ("NO DEBE ESCRIBIR EN LA RAM");
				assert(tpv.idata[6:0] == 7'b0110011) else $error ("ERROR EN LA OPERACION");
				assert(tpv.iaddr == 16) else $error ("EL PC NO APUNTA A LA OPERACIÓN INDICADA");
				assert(tpv.ddata_w !== 32'hx) else $error ("ERROR AL ESCRIBIR EL DATO EN LA RAM");
			end
		17:
			begin
				assert(tpv.WRam == 0) else $error ("NO DEBE ESCRIBIR EN LA RAM");
				assert(tpv.idata[6:0] == 7'b0010011) else $error ("ERROR EN LA OPERACION");
				assert(tpv.iaddr == 17) else $error ("EL PC NO APUNTA A LA OPERACIÓN INDICADA");
				assert(tpv.ddata_w !== 32'hx) else $error ("ERROR AL ESCRIBIR EL DATO EN LA RAM");
			end
		18:
			begin
				assert(tpv.WRam == 0) else $error ("NO DEBE ESCRIBIR EN LA RAM");
				assert(tpv.idata[6:0] == 7'b1101111) else $error ("ERROR EN LA OPERACION");
				assert(tpv.iaddr == 18) else $error ("EL PC NO APUNTA A LA OPERACIÓN INDICADA");
				assert(tpv.ddata_w !== 32'hx) else $error ("ERROR AL ESCRIBIR EL DATO EN LA RAM");
			end
			
		19: $stop;
	endcase
	
always
begin
	iCLK = 1'b0;
	#50;
	iCLK =1'b1;
	#50;
end

initial 
begin
	iRST_N = 1'b1;
	#1;
	iRST_N = 1'b0;
	#99;
	iRST_N = 1'b1;
end	

endmodule 