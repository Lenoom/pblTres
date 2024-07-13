module muxDigitos(seletor,unid_out,dez_out,estado_out,segmentos);
	input [6:0] unid_out,dez_out,estado_out;
	input [1:0]seletor;
	output [6:0]segmentos;
	wire [3:0]aux;
	
	// Setando o digito 2 como 1 para desativar ele;
	wire [6:0]apagado;
	or(apagado[0],seletor[0],!seletor[0]);
	or(apagado[1],seletor[0],!seletor[0]);
	or(apagado[2],seletor[0],!seletor[0]);
	or(apagado[3],seletor[0],!seletor[0]);
	or(apagado[4],seletor[0],!seletor[0]);
	or(apagado[5],seletor[0],!seletor[0]);
	or(apagado[6],seletor[0],!seletor[0]);
	
	
	// Mux p baixo.
	
	and(aux[0],!seletor[1],!seletor[1],unid_out);
	
	and(aux[1],seletor[1],!seletor[0],dez_out);
	
	and(aux[3],seletor[1],seletor[0],estado_out);
	
	or(segmentos,aux[0],aux[1],aux[2],aux[3]);
endmodule