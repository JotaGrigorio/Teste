Algoritmo "Concessionária"
// Avaliação de Desenvolvimento - Lógica
// Empresa   : Netspeed

// Descrição   : 1. Uma concessionária de carros está vendendo os seus veículos com desconto.
// Faça um algoritmo em Portugol (ou na linguagem de sua preferência) que calcule e
// exiba o valor do desconto e o valor a ser pago pelo cliente de vários carros.
// O desconto deverá ser calculado de acordo com o ano do veículo.

// Até 2000 - 12%
// Acima de 2000 - 7%

//O algoritmo deverá perguntar se deseja continuar calculando desconto até que a resposta seja “N” (Não).
//Informar total de carros com ano até 2000 e total geral.

// Autor   : Junio Grigório
// Data atual  : 17/06/2022

Var
// Seção de Declarações das variáveis 
ano: inteiro
valor: real
desconto: real
totalCarros: inteiro
totalGeral: inteiro
resp: caracter


Inicio

// Seção de Comandos
LimpaTela

Enquanto resp  <> "N" Faca
resp <- "S"

Escreva ("Digite o ano do veículo: ")
Leia(ano)

Escreva ("Digite o valor do veículo: ")
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

         Escreval("Total de carros com ano até 2000: ", totalCarros)
         Escreval("Total geral de carros: ", totalGeral)

Fimalgoritmo