using Entities;
using System;
using System.Collections.Generic;

namespace DataAccessLayer
{
    public class UserDAL
    {
        private ConnectionDB connection = new ConnectionDB();
        public List<User> GetUsers()
        {
            try
            {
                List<User> users = new List<User>();

                this.connection.setStoredProcedure("sp_GetUsers");
                this.connection.executeStoredProcedure(true);

                while (connection.Reader.Read())
                {
                    User user = new User();

                    user.Id = (int)connection.Reader["Id"];
                    user.Email = connection.Reader["Email"].ToString();
                    user.FirstName = connection.Reader["FirstName"].ToString();
                    user.LastName = connection.Reader["LastName"].ToString();
                    user.ConfirmedEmail = (bool)connection.Reader["ConfirmedEmail"];
                    user.Active = (bool)connection.Reader["Active"];
                    user.Creation = (DateTime)connection.Reader["Creation"];

                    users.Add(user);
                }

                return users;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                this.connection.cleanParameters();
                this.connection.closeConnection();
            }
        }
    }
}