using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LeituraDadosSQL.Repositorio
{
    public class AutorRepositorio
    {
        DataBaseConnect _conexao = new DataBaseConnect();

        public void Insert(string nome, string sobrenome)
        {
            string strQueryInsert = string.Format($"INSERT INTO tbl_autores(Nome_Autor, Sobrenome_Autor) VALUES ('{nome}','{sobrenome}')");
            _conexao.ExecutaComando(strQueryInsert);
        }

        public void Select()
        {
            string strQuerySelect = "SELECT * FROM tbl_autores";

            SqlDataReader dados = _conexao.ExecutaComandoComRetorno(strQuerySelect);

            Console.WriteLine("\nRegistros: \n");
            while (dados.Read())
            {
                Console.WriteLine("Id: " + dados["ID_Autor"]);
                Console.WriteLine("Nome: " + dados["Nome_Autor"]);
                Console.WriteLine("Sobrenome: " + dados["Sobrenome_Autor"]);
                Console.WriteLine("\n");
            }
        }

        public void Excluir(int id)
        {
            string srtQueryDelete = string.Format($"DELETE FROM tbl_autores WHERE ID_Autor = '{id}'");
            _conexao.ExecutaComando(srtQueryDelete);
        }

        public void Alterar(int id, string nome, string sobrenome)
        {
            string strQueryUpdate = string.Format($"UPDATE tbl_autores SET Nome_Autor = '{nome}', Sobrenome_Autor = '{sobrenome}' WHERE ID_Autor = '{id}'");
            _conexao.ExecutaComando(strQueryUpdate);
        }

        public void BuscarPorId(int id)
        {
            string strQuerySelectID = string.Format($"SELECT * FROM tbl_autores WHERE ID_Autor = '{id}'");
            SqlDataReader dadosID = _conexao.ExecutaComandoComRetorno(strQuerySelectID);

            Console.WriteLine("\nRegistro Encontrado: \n");
            while (dadosID.Read())
            {
                Console.WriteLine("Id: " + dadosID["ID_Autor"]);
                Console.WriteLine("Nome: " + dadosID["Nome_Autor"]);
                Console.WriteLine("Sobrenome: " + dadosID["Sobrenome_Autor"]);
                Console.WriteLine("\n");
            }
        }


    }
}
