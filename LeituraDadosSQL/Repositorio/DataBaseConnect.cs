using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LeituraDadosSQL
{
    class DataBaseConnect : IDisposable
    {
        private readonly SqlConnection minhaConexao;

        private readonly string ConnectionString = @"data source=.\SQLEXPRESS; Integrated Security=SSPI; Initial Catalog =db_Biblioteca";


        public DataBaseConnect()
        {
            minhaConexao = Connect();
        }

        private SqlConnection Connect()
        {
            var connection = new SqlConnection(ConnectionString);
            if (connection.State == ConnectionState.Broken)
            {
                connection.Close();
                connection.Open();
            }
            if (connection.State != ConnectionState.Open)
            {
                connection.Open();
            }

            return connection;
        }

        public void ExecutaComando(string strQuery)
        {
            var cmdComando = new SqlCommand
            {
                CommandText = strQuery,
                CommandType = CommandType.Text,
                Connection = minhaConexao
            };
            cmdComando.ExecuteNonQuery();
        }

        public SqlDataReader ExecutaComandoComRetorno(string strQuery)
        {
            var cmdComando = new SqlCommand(strQuery, minhaConexao);

            return cmdComando.ExecuteReader();
        }

        public void Dispose()
        {
            if(minhaConexao.State == ConnectionState.Open)
            {
                minhaConexao.Close();
            }
        }

    }
}
