module main(Us,Ua,T,button,segmentos,digito);
	input Us,Ua,T,button;
	output [3:0]digito;
	output [6:0]segmentos;
	wire [1:0]estado;
	wire botao,sinal;
	
	Debouncer(clock,button,botao);
	or(sinal,botao,flag);
	
	// juntar tudo aqui - Fazer a maquina de estados.
	
	
endmodule