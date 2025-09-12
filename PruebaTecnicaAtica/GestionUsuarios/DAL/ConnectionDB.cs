using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace GestionUsuarios.DAL
{
    public static class ConnectionDB
    {
        private static string connectionString =
            "Data Source=localhost;Initial Catalog=UsersAdministration_DB;Integrated Security=True;";

        public static DataTable EjecutarStoredProcedure(string nombreSP, params SqlParameter[] parametros)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(nombreSP, conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                if (parametros != null)
                    cmd.Parameters.AddRange(parametros);

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
        }
    }
}