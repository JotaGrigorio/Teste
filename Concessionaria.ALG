Algoritmo "Concession�ria"
// Avalia��o de Desenvolvimento - L�gica
// Empresa   : Netspeed

// Descri��o   : 1. Uma concession�ria de carros est� vendendo os seus ve�culos com desconto.
// Fa�a um algoritmo em Portugol (ou na linguagem de sua prefer�ncia) que calcule e
// exiba o valor do desconto e o valor a ser pago pelo cliente de v�rios carros.
// O desconto dever� ser calculado de acordo com o ano do ve�culo.

// At� 2000 - 12%
// Acima de 2000 - 7%

//O algoritmo dever� perguntar se deseja continuar calculando desconto at� que a resposta seja �N� (N�o).
//Informar total de carros com ano at� 2000 e total geral.

// Autor   : Junio Grig�rio
// Data atual  : 17/06/2022

Var
// Se��o de Declara��es das vari�veis 
ano: inteiro
valor: real
desconto: real
totalCarros: inteiro
totalGeral: inteiro
resp: caracter


Inicio

// Se��o de Comandos
LimpaTela

Enquanto resp  <> "N" Faca
resp <- "S"

Escreva ("Digite o ano do ve�culo: ")
Leia(ano)

Escreva ("Digite o valor do ve�culo: ")
Leia(valor)

         SE (ano <= 2000) Entao
         desconto :=  valor * 0.12
         valor := valor - desconto
         totalCarros := totalCarros + 1
         Senao
         FimSe
         SE (ano > 2000) Entao
         desconto :=  valor * 0.07
         valor := valor - desconto
         FimSe

         totalGeral := totalGeral + 1

         Escreval("Valor do desconto: ", desconto)
         Escreval("Valor a ser pago pelo cliente: ", valor)
         
         Escreval("Deseja calcular novo desconto? (S/N): ")
         Leia (resp)
         
Fimenquanto

         Escreval("Total de carros com ano at� 2000: ", totalCarros)
         Escreval("Total geral de carros: ", totalGeral)

Fimalgoritmo