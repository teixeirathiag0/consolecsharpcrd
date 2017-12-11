using LeituraDadosSQL.Repositorio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LeituraDadosSQL
{
    class Program
    {
        static void Main(string[] args)
        {
            while (true)
            {
                DataBaseConnect _conexao = new DataBaseConnect();

                AutorRepositorio ar = new AutorRepositorio();

                Console.WriteLine("Escolha uma Opção: \n");
                Console.WriteLine("1 - Inserir um Registro ");
                Console.WriteLine("2 - Listar todos os registros ");
                Console.WriteLine("3 - Excluir um Registro");
                Console.WriteLine("4 - Alterar um Registro");
                Console.WriteLine("5 - Buscar registro por ID");
                Console.Write("\n\nDigite sua Opção: ");

                Autor a = new Autor();

                char operacao = char.Parse(Console.ReadLine());
                switch (operacao)
                {
                    case '1':
                            Console.Write("Digite o nome do autor: ");
                            a.Nome = Console.ReadLine();

                            Console.Write("Digite o sobrenome do autor: ");
                            a.Sobrenome = Console.ReadLine();

                            ar.Insert(a.Nome, a.Sobrenome);
                            break;
                    case '2':
                            ar.Select();

                            break;
                    case '3':
                            Console.Write("Digite o numero do registro da qual deseja excluir:  ");
                            a.IdAutor = int.Parse(Console.ReadLine());
                            ar.Excluir(a.IdAutor);

                            break;
                    case '4':
                            Console.Write("ID do registro que deseja alterar: ");
                            a.IdAutor = int.Parse(Console.ReadLine());

                            Console.Write("Digite o novo nome: ");
                            a.Nome = Console.ReadLine();

                            Console.Write("Digite o novo sobrenome: ");
                            a.Sobrenome = Console.ReadLine();

                            ar.Alterar(a.IdAutor, a.Nome, a.Sobrenome);

                            break;
                    case '5':
                            Console.Write("ID do registro que deseja listar: ");
                            a.IdAutor = int.Parse(Console.ReadLine());
                            ar.BuscarPorId(a.IdAutor);
                            
                            break;
                }

                Console.ReadKey();
                Console.Clear();
            }
        }
    }

}
