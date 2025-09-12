using GestionUsuarios.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace GestionUsuarios.DAL
{
    public class UserDAL
    {
        public List<User> GetUsers()
        {
            DataTable dt = ConnectionDB.EjecutarStoredProcedure("sp_GetUsers");

            List<User> users = new List<User>();
            foreach (DataRow row in dt.Rows)
            {
                users.Add(new User
                {
                    Id = (int)row["Id"],
                    Email = row["Email"].ToString(),
                    FirstName = row["FirstName"].ToString(),
                    LastName = row["LastName"].ToString(),
                    Active = (bool)row["Active"],
                    ConfirmedEmail = (bool)row["ConfirmedEmail"],
                    Creation = (DateTime)row["Creation"]
                });
            }

            return users;
        }
    }
}