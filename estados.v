module estados(botao,sinal,sinal15,Us,Ua,T,Q,casoEsp);
	input sinal,sinal15,botao,Us,Ua,T;
	output [1:0]Q;
	output casoEsp;
	wire [1:0]preset,resetin,reset,reset1,reset2,D;
	wire casoEsp,encher,goteja,asperge,asperge_esp,goteja_esp;
	wire [5:0] estado0,estado1;
	wire [2:0] aux;
	// Preseta os resets;
	or(resetin[0],Q[1],!Q[1]);
	or(resetin[1],Q[1],!Q[1]);
	
	and(reset1[0],resetin[0],botao);
	and(reset1[1],resetin[1],botao);
	
	// Define o Caso Específico
	and(casoEsp,Ua,!T);
	
	//	Enchendo
	and(encher,Q[0],Q[1],sinal);
	and(reset2[0],encher,sinal);
	and(reset2[1],encher,sinal);
	
	// Limpeza
	xor(aux[0],Q[1],Q[0]);
	and(limpar,aux[0],sinal);
	and(estado0[0],limpar,sinal);
	and(estado1[0],limpar,sinal);
	
	//Gotejamento
	and(goteja,!Q[1],!Q[0],sinal,Ua,!Us,T,!casoEsp);
	and(estado1[1],goteja,sinal);
	
	//Aspersão
	or(aux[1],!T,!Ua);
	and(asperge,aux[1],!Us,!Q[1],!Q[0],!casoEsp,sinal);
	and(estado0[1],asperge,sinal);
	
	// Caso Específico
	// Aspersão aq
	and(asperge_esp,!Q[1],!Q[0],!Us,casoEsp,sinal);
	and(estado0[2],asperge_esp,sinal);
	// Gotejamento aq
	and(goteja_esp,Q[0],!Q[1],!Us,casoEsp,sinal15);
	
	// O sinal que os FlipFlops recebe.
	and(aux[2],casoEsp,sinal15);
	or(troca,aux[2],sinal);
	
	// Aq manda os sinais D0 e D1 pra memória do FlipFlop;
	or(D[0],estado0[0],estado0[1],estado0[2]);
	or(D[1],estado1[0],estado1[1]);
	
	or(reset[0],reset1[0],reset2[0]);
	or(reset[1],reset2[0],reset2[1]);
	
	FlipFlopD(preset[0],reset[0],D[0],troca,Q[0]);
	
	FlipFlopD(preset[1],reset[1],D[1],troca,Q[1]);
	
endmodule