module digitoAgrodef(clock,sinal,botao,segmentos);
	input clock,sinal,botao;
	output [6:0]segmentos; // a = 0 g = 6
	wire [2:0]Q;
	wire flag;
	
	or(flag,sinal,botao);
	contadorseis(clock,flag,Q);
	
	// A
	and(segmentos[0],Q[0],!Q[1],Q[2]);
	// B
	and(segmentos[1],!Q[0],!Q[1],!Q[2]);
	// C
	and(segmentos[2],Q[0],!Q[1],!Q[2]);
	// D
	and(segmentos[3],!Q[0],Q[1],!Q[2]);
	// E
	and(segmentos[4],Q[0],Q[1],!Q[2]);
	// F
	and(segmentos[5],!Q[0],!Q[1],Q[2]);
	// G
	or(segmentos[6],Q[1],!Q[1]);
	
endmodule