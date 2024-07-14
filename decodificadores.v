module decodificadores(estado_in,unid_in,dez_in,unid_out,dez_out,estado_out);
	input [1:0]estado_in,dez_in;
	input [3:0]unid_in;
	output [6:0]dez_out,unid_out,estado_out;
	wire [14:0]aux;
	
	//Decodificador estado
	// Estado a
	and(estado_out[0],estado_in[0],estado_in[1]);
	// Estado b
	xnor(aux[13],estado_in[1],estado_in[0]);
	and(aux[14],!estado_in[0],estado_in[1]);
	or(estado_out[1],aux[14],aux[13]);
	// Estado c
	xnor(estado_out[2],estado_in[0],estado_in[1]);
	// Estado d
	and(estado_out[3],!estado_in[0],estado_in[1]);
	// Estado e
	and(estado_out[4],estado_in[0],!estado_in[0]);
	// Estado f
	and(estado_out[5],estado_in[0],!estado_in[0]);
	// Estado g
	and(estado_out[6],estado_in[1],estado_in[1]);
	
	// Decodificador Num 2 bits
	// Dez a
	and(dez_out[0],!dez_in[1],dez_in[0]);
	// Dez b
	or(dez_out[1],!dez_in[0],dez_in[0]);
	// Dez c
	and(dez_out[2],dez_in[1],!dez_in[0]);
	// Dez d
	and(dez_out[3],!dez_in[1],dez_in[0]);
	// Dez e
	and(dez_out[4],dez_in[0],dez_in[0]);
	// Dez f
	or(dez_out[5],dez_in[1],dez_in[0]);
	// Dez g
	not(dez_out[6],dez_in[1]);
	
	// Decodificador Num 4 bits
	// Dez a
	or(aux[0],unid_in[2],!unid_in[3]);
	and(unid_out[0],aux[0],!unid_in[1],!unid_in[0]);
	
	// Dez b
	and(aux[1],!unid_in[1],unid_in[0]);
	and(aux[2],unid_in[1],!unid_in[0]);
	or(aux[3],aux[1],aux[2]);
	and(unid_out[1],aux[3],unid_in[2]);
	
	// Dez c
	and(unid_out[2],!unid_in[2],unid_in[1],!unid_in[0]);
	
	// Dez d
	and(aux[4],!unid_in[3],!unid_in[2],!unid_in[1],unid_in[0]);
	and(aux[5],unid_in[2],unid_in[1],unid_in[0]);
	and(aux[6],unid_in[2],!unid_in[1],!unid_in[0]);
	or(unid_out[3],aux[4],aux[5],aux[6]);
	
	// Dez e
	and(aux[7],!unid_in[1],unid_in[2]);
	or(unid_out[4],aux[7],unid_in[0]);
	
	// Dez f
	and(aux[8],!unid_in[3],!unid_in[2],unid_in[0]);
	and(aux[9],unid_in[1],unid_in[0]);
	and(aux[10],!unid_in[2],unid_in[1]);
	or(unid_out[5],aux[8],aux[9],aux[10]);
	
	// Dez g - g=A'B'C' + BCD
	and(aux[11],unid_in[2],unid_in[1],unid_in[0]);
	and(aux[12],!unid_in[3],!unid_in[2],!unid_in[1]);
	or(unid_out[6],aux[11],aux[12]);
	
	
endmodule