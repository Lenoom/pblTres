module muxDigitos(seletor,unid_out,dez_out,estado_out,agroDef,segmentos);
	input [6:0] unid_out,dez_out,estado_out,agroDef;
	input [1:0]seletor;
	output [6:0]segmentos;
	wire [3:0]aux;
	
	// Mux p baixo.
	
	and(aux[0],!seletor[1],!seletor[1],unid_out);
	
	and(aux[1],!seletor[1],seletor[0],dez_out);
	
	and(aux[2],seletor[1],!seletor[0],agroDef);
	
	and(aux[3],seletor[1],seletor[0],estado_out);
	
	or(segmentos,aux[0],aux[1],aux[2],aux[3]);
	
endmodule