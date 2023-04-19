module memoriaROM (INSTRUCTION_ADDRESS, INSTRUCTION);

parameter POSICIONES = 1024;

localparam POS = $clog2(POSICIONES);

input [POS - 1:0] INSTRUCTION_ADDRESS;
output [31:0] INSTRUCTION;

reg [31:0] ROM [POSICIONES - 1 : 0];

initial
	begin
		$display("Cargando ROM....");
		$readmemh("rom.txt", ROM); //Cambiar la ruta por la deseada //C:\\Users\\Pablo\\Desktop\\Micro_restored\\rom.txt
		$display("ROM CARGADA!");
	end

assign INSTRUCTION = ROM[INSTRUCTION_ADDRESS];

endmodule 