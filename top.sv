//VERSION 4.1

module top(CLK, RST_N, idata, ddata_r, iaddr, daddr, ddata_w, WRam);

parameter N = 1024;
localparam n = $clog2(N);

input CLK, RST_N;
input [31 : 0] idata;
input [31 : 0] ddata_r;

output [n-1 : 0] iaddr, daddr;
output [31 : 0] ddata_w;
output WRam;

//CONEXIONES INTERNAS

wire Zero, RegWrite;
wire [3 : 0] OP;
wire [31 : 0] AluRes, AluIn1, AluIn2;
 
wire [31 : 0] NeoPC;
wire [31 : 0] ADRESS;
wire [31 : 0] Add1, Add2;
wire [31 : 0] OutImm;

wire [31 : 0] Reg1, Reg2, WData;

wire [1:0] AluOP;
wire ctrAddSum, ctrReg1, ctrReg2, ctrRam, ctrAddSum_aux, AddPC;

//ASIGNACIONES

assign ctrAddSum = (AddPC || (Zero && ctrAddSum_aux)) ? 1'b1 : 1'b0;
assign daddr = AluRes;
assign ddata_w = Reg2;
assign iaddr = ADRESS[n+1 : 2];

//DATA_PATH

regPC PC_a(
	.CLK(CLK), 
	.RST_n(RST_N), 
	.IN(NeoPC), 
	.OUT(ADRESS));

ALU ALU(
	.Op(OP), 
	.Zero(Zero), 
	.sol(AluRes), 
	.Op1(AluIn1), 
	.Op2(AluIn2));
	
registers Registers(
	.CLK(CLK), 
	.RST_N(RST_N), 
	.Rreg1(idata[19:15]), 
	.Rreg2(idata[24:20]), 
	.Wreg(idata[11:7]), 
	.Wdata(WData), 
	.RegWrite(RegWrite), 
	.Read1(Reg1), 
	.Read2(Reg2));
	
ImmGen ImmGen(
	.IN(idata[31:0]), 
	.OUT(OutImm));
	
adder	 Add(
	.Op1(ADRESS), 
	.Op2(4), 
	.Sol(Add1));

adder	AddSum(
	.Op1(ADRESS), 
	.Op2(OutImm), 
	.Sol(Add2));
	
MUX MUXAddSum(
	.in1(Add1), 
	.in2(Add2), 
	.ctr(ctrAddSum), 
	.out(NeoPC));
	
MUX MUXReg2(
	.in1(Reg2), 
	.in2(OutImm), 
	.ctr(ctrReg2), 
	.out(AluIn2));	
	
MUX MUXReg1(
	.in1(Reg1), 
	.in2(Add1), 
	.ctr(ctrReg1), 
	.out(AluIn1));		

MUX MUXRam(
	.in1(AluRes), 
	.in2(ddata_r), 
	.ctr(ctrRam), 
	.out(WData));		

//CONTROL_PATH

ALUControl	ALUControl(
	.ALUOP(AluOP), 
	.IN({idata[30],idata[14:12]}), 
	.OUT(OP));
	
control conrtol(
	.IN(idata[6:0]), 
	.Brach(ctrAddSum_aux), 
	.PCRead(ctrReg1), 
	.MemtoReg(ctrRam), 
	.ALUOP(AluOP), 
	.MemWrite(WRam), 
	.ALUSrc(ctrReg2), 
	.RegWrite(RegWrite),
	.AddPC(AddPC));


endmodule 