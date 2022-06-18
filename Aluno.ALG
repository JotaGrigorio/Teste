Algoritmo "Aluno"
// Avaliação de Desenvolvimento - Lógica
// Empresa   : Netspeed

// Descrição   : Escreva um algoritmo em Portugol (ou na linguagem de sua preferência), que leia um número não determinado de valores.
// Cada conjunto formado por número do aluno (código) e suas três notas.

// Calcular para cada aluno a média ponderada com pesos respectivos de 4 para a MAIOR nota,
// e 3 para as outras duas notas.
// Escrever o número do aluno (código), suas 3 notas, a média calculada e uma mensagem (APROVADO),
// se a média for = 6 e (REPROVADO) se a média for < 6.

// Encerrar a leitura de valores assim que for digitado 0 no código de aluno.

// Autor   : Junio Grigório
// Data atual  : 17/06/2022

Var
// Seção de Declarações das variáveis 
codigo: inteiro
nota1, nota2, nota3: real
media: real
resp: caracter
i: inteiro


Inicio

// Seção de Comandos
LimpaTela

Enquanto resp  <> "N" Faca
resp <- "S"

   Escreva ("Digite o código do aluno: ")
   Leia(codigo)
   
   SE (codigo = 0) Entao
   Fimalgoritmo
   Senao
   FimSe

   Escreva ("Digite a primeira nota: ")
   Leia(nota1)
   Escreva ("Digite a segunda nota: ")
   Leia(nota2)
   Escreva ("Digite a terceira nota: ")
   Leia(nota3)
   
   SE (nota1 >= nota2) E (nota1 >= nota3) Entao
   media := (nota1 * 4 +  nota2 * 3 + nota3 * 3) / 10
   Senao
   FimSe
   SE (nota2 >= nota1) E (nota2 >= nota3) Entao
   media := (nota1 * 3 +  nota2 * 4 + nota3 * 3) / 10
   Senao
   FimSe
   SE (nota3 >= nota1) E (nota3 >= nota2) Entao
   media := (nota1 * 3 + nota2 * 3 + nota3 * 4) / 10
   FimSe

   Escreval("Aluno código: ", codigo)
   Escreval("Primeira nota: ", nota1)
   Escreval("Segunda nota: ", nota2)
   Escreval("Terceira nota: ", nota3)
   Escreval("Média: ", media)

   SE (media >= 6) Entao
   Escreval("APROVADO")
   Senao
   FimSe
   SE (media < 6) Entao
   Escreval("REPROVADO")
   Senao
   FimSe

   Escreval("Deseja calcular novo aluno? (S/N): ")
   Leia (resp)
         
Fimenquanto


Fimalgoritmo