using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Boleto
{
    class Program
    {
        static void Main(string[] args)
        {
            DateTime dataOriginal;
            DateTime dataPagamento;
            decimal valorOriginal = 0;
            decimal valorJuros = 0;
            decimal valorMulta = 0;
            decimal valorTotal = 0;
            char resp;

            Console.Write("Digite a data original no formato dd/mm/aaaa: ");
            dataOriginal = Convert.ToDateTime(Console.ReadLine());

            Console.Write("Digite o valor do boleto: ");
            valorOriginal = Convert.ToDecimal(Console.ReadLine());

            Console.Write("Digite a data do pagamento no formato dd/mm/aaaa: ");
            dataPagamento = Convert.ToDateTime(Console.ReadLine());

            TimeSpan diferenca = Convert.ToDateTime(dataPagamento).Subtract(Convert.ToDateTime(dataOriginal));
            int diasAtraso = diferenca.Days;

            var feriado = new Feriado();
            DateTime diaUtil = feriado.DiaUtil(dataOriginal);

            bool seriaFeriado = feriado.SeriaFeriado(dataOriginal);
            bool seriaFinalDeSemana = feriado.SeriaFinalDeSemana(dataOriginal);


            if (!seriaFeriado && !seriaFinalDeSemana || dataPagamento != diaUtil)
            {
                valorJuros = Convert.ToDecimal(diasAtraso * 0.03); //* valorOriginal;
                valorMulta = 2;
            }

            if (dataPagamento > dataOriginal)
                valorTotal = valorOriginal + valorJuros + valorMulta;
            else
                valorTotal = valorOriginal;


            Console.WriteLine("Valor dos juros: " + valorJuros);
            Console.WriteLine("Valor total: " + valorTotal);
            
            Console.ReadKey();
        }

        public class Feriado
        {
            public DateTime DiaUtil(DateTime dia)
            {
                
                while (true)
                {
                    if (dia.DayOfWeek == DayOfWeek.Saturday)
                    {
                        dia = dia.AddDays(2);
                        return DiaUtil(dia);
                    }
                    else if (dia.DayOfWeek == DayOfWeek.Sunday)
                    {
                        dia = dia.AddDays(1);
                        return DiaUtil(dia);
                    }
                    else if (SeriaFeriado(dia) == true)
                    {
                        dia = dia.AddDays(1);
                        return DiaUtil(dia);
                    }
                    else return dia;
                }
            }


            public Boolean SeriaFinalDeSemana(DateTime dataPagamento)
            {
                var seriaFinalDeSemana = false;
                var diaDaSemana = dataPagamento.DayOfWeek.ToString();

                if (diaDaSemana == "Saturday" || diaDaSemana == "Sunday")
                {
                    seriaFinalDeSemana = true;
                }

                return seriaFinalDeSemana;
            }

            // Formula desenvolvida por Karl Friedrich Gauss
            // Estabelecendo o método gaussiano de cálculo manual válido de 1900 a 2099
            // OBS: Carnaval ainda eh considerado ponto facultativo no Brasil e
            //      por este motivo foi comentado da lista de feriados
            public Boolean SeriaFeriado(DateTime checkDate)
            {
                DateTime dateToBeChecked = new DateTime(checkDate.Year, checkDate.Month, checkDate.Day);
                int anoCheckDate = checkDate.Year;
                int a = (int)anoCheckDate % 4;
                int b = (int)anoCheckDate % 7;
                int c = (int)anoCheckDate % 19;
                int d = (int)((19 * c) + 24) % 30;
                int e = (int)((2 * a) + (4 * b) + (6 * d) + 5) % 7;
                int diaPascoa = 22 + d + e;
                int mesPascoa = 3;
                if (diaPascoa > 31)
                {
                    diaPascoa = d + e - 9;
                    mesPascoa = 4;
                }
                List<String> feriados = new List<String>();
                feriados.Add(new DateTime(anoCheckDate, mesPascoa, diaPascoa).ToString()); //Pascoa
                feriados.Add(new DateTime(anoCheckDate, mesPascoa, diaPascoa).AddDays(-2).ToString()); //Sexta Feira da Paixão
                feriados.Add(new DateTime(anoCheckDate, mesPascoa, diaPascoa).AddDays(60).ToString()); //Corpus Cristi
                                                                                                       //feriados.Add(new DateTime(checkDate.Year, mesPascoa, diaPascoa).AddDays(-47).ToString()); //Carnaval
                feriados.Add(new DateTime(anoCheckDate, 1, 1).ToString()); //Dia de Ano Novo (Confraternização Universal)
                feriados.Add(new DateTime(anoCheckDate, 4, 21).ToString()); //Dia de Tiradentes
                feriados.Add(new DateTime(anoCheckDate, 5, 1).ToString()); //Dia do Trabalho
                feriados.Add(new DateTime(anoCheckDate, 9, 7).ToString()); //Dia da Independência
                feriados.Add(new DateTime(anoCheckDate, 10, 12).ToString()); //Dia da Padroeira do Brasil
                feriados.Add(new DateTime(anoCheckDate, 11, 2).ToString()); //Dia de Finados
                feriados.Add(new DateTime(anoCheckDate, 11, 15).ToString()); //Data da Proclamação da República
                feriados.Add(new DateTime(anoCheckDate, 12, 25).ToString()); //Natal
                return feriados.Contains(dateToBeChecked.ToString());
            }
        }
    }
}
