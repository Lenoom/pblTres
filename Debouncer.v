module Debouncer(clock,botao,saida);
   input clock, botao;
   output saida;
   wire [2:0]aux;
	wire preset,reset;

	FlipFlopD(preset,reset,botao,clock,aux[0]);
	FlipFlopD(preset,reset,aux[0],clock,aux[1]);
   not(aux[2],aux[1]);
   and(saida, aux[2],aux[0]);
endmodule