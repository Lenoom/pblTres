module geraPreset(estado,casoEsp,unid_preset,dez_preset);
	input [1:0]estado;
	input casoEsp;
	output [3:0]unid_preset;
	output [1:0]dez_preset;
	wire [6:0]aux;
	
	// Preset 4 digitos unidade.
	
	// 000X 
	and(aux[0],casoEsp,estado[1]);
	and(aux[1],!casoEsp,estado[0]);
	or(unid_preset[0],aux[0],aux[1]);
	
	// 00X0
	and(unid_preset[1],casoEsp,!estado[1],estado[0]);
	
	// 0X00
	and(aux[2],!casoEsp,estado[0]);
	and(aux[3],casoEsp,estado[1]);
	or(unid_preset[2],aux[2],aux[3]);
	
	// X000
	and(unid_preset[3],estado[0],!estado[0]);
	
	// Preset 2 digitos dezena.
	// 0X
	and(aux[4],!casoEsp,!estado[1]);
	or(dez_preset[0],aux[4],!estado[0]);
	
	// X0
	and(aux[5],!casoEsp,estado[1],!estado[0]);
	and(aux[6],casoEsp,!estado[1],estado[0]);
	or(dez_preset[1],aux[5],aux[6]);
		
endmodule