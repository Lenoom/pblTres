module varredura(clock,digito,segmentos,botao);
	input clock,botao;
	output [3:0]digito;
	output [6:0]segmentos;
	wire [1:0]preset,Q;
	wire [6:0]unid_out,dez_out,estado_out;
	
	// Definindo o preset de 3 (11)
	or(preset[0],digito[0],!digito[0]);
	or(preset[1],digito[0],!digito[0]);
	
	contadortres(clock,preset,botao,Q); // Lembrar de verificar qual sinal vai ser esse botão
	
	and(digito[0],!Q[0],!Q[1]);
	
	and(digito[1],Q[0],!Q[1]);
	
	and(digito[2],!Q[0],Q[1]);
	
	and(digito[3],Q[0],Q[1]);
	
	// Mux segmentos
	muxDigitos(Q,unid_out,dez_out,estado_out,segmentos);
	
endmodule