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
                    user.Birthdate = (DateTime)connection.Reader["Birthdate"];
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

        public bool createUser(User user)
        {
            try
            {
                this.connection.setStoredProcedure("sp_InsertUsers");
                this.connection.addParameter("@Email", user.Email);
                this.connection.addParameter("@FirstName", user.FirstName);
                this.connection.addParameter("@LastName", user.LastName);
                this.connection.addParameter("@Birthdate", user.Birthdate);
                this.connection.addParameter("@PasswordHash", user.PasswordHash);
                this.connection.addParameter("@PasswordSalt", user.PasswordSalt);
                this.connection.executeStoredProcedure();
                this.connection.cleanParameters();
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                this.connection.closeConnection();
            }
        }


        public User GetUserByEmail(string email)
        {
            try
            {
                this.connection.setStoredProcedure("sp_GetUserByEmail");
                this.connection.addParameter("@Email", email);
                this.connection.executeStoredProcedure(true);

                if (connection.Reader.Read())
                {
                    User user = new User
                    {
                        Id = (int)connection.Reader["Id"],
                        Email = connection.Reader["Email"].ToString(),
                        PasswordHash = (byte[])connection.Reader["PasswordHash"],
                        PasswordSalt = (byte[])connection.Reader["PasswordSalt"],
                        FirstName = connection.Reader["FirstName"].ToString(),
                        LastName = connection.Reader["LastName"].ToString(),
                        Birthdate = (DateTime)connection.Reader["Birthdate"],
                        ConfirmedEmail = (bool)connection.Reader["ConfirmedEmail"],
                        Active = (bool)connection.Reader["Active"],
                        Creation = (DateTime)connection.Reader["Creation"]
                    };
                    return user;
                }

                return null;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al buscar usuario por email", ex);
            }
            finally
            {
                this.connection.cleanParameters();
                this.connection.closeConnection();
            }
        }
    }
}