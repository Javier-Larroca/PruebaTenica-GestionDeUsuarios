using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer
{
    public class ConnectionDB
    {
        private static string connectionString = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
        private SqlConnection conection;
        private SqlCommand command;
        private SqlDataReader reader;

        public ConnectionDB()
        {
            this.conection = new SqlConnection(connectionString);
            this.command = new SqlCommand();
        }

        public void addParameter(string nombre, object valor)
        {
            this.command.Parameters.AddWithValue(nombre, valor);
        }

        public void closeConnection()
        {
            if (this.reader != null)
            {
                this.reader.Close();
            }
            this.conection.Close();
        }

        public SqlDataReader Reader
        {
            get { return this.reader; }
        }

        public void setStoredProcedure(string storedPocedure)
        {
            this.command.CommandType = CommandType.StoredProcedure;
            this.command.CommandText = storedPocedure;
        }

        internal void executeStoredProcedure(bool isReaderr = false)
        {
            this.command.Connection = this.conection;

            if (this.conection.State == ConnectionState.Closed)
            {
                this.conection.Open();
            }

            try
            {
                if (!isReaderr)
                { 
                    this.command.ExecuteNonQuery(); 
                }
                else
                {
                    this.reader = this.command.ExecuteReader();
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }

        public void cleanParameters()
        {
            this.command.Parameters.Clear();
        }
    }
}