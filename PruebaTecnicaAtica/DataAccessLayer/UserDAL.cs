using Entities;
using System;
using System.Collections.Generic;
using System.Data;

namespace DataAccessLayer
{
    public static class UserDAL
    {
        private static ConnectionDB connection = new ConnectionDB();
        public static List<User> GetUsers()
        {
            try
            {
                List<User> users = new List<User>();

                connection.setStoredProcedure("sp_GetUsers");
                connection.executeStoredProcedure(true);

                while (connection.Reader.Read())
                {
                    User user = UserMapper(connection.Reader);
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
                connection.cleanParameters();
                connection.closeConnection();
            }
        }

        public static bool createUser(User user)
        {
            try
            {
                connection.setStoredProcedure("sp_InsertUsers");
                connection.addParameter("@Email", user.Email);
                connection.addParameter("@FirstName", user.FirstName);
                connection.addParameter("@LastName", user.LastName);
                connection.addParameter("@Birthdate", user.Birthdate);
                connection.addParameter("@PasswordHash", user.PasswordHash);
                connection.addParameter("@PasswordSalt", user.PasswordSalt);
                connection.executeStoredProcedure();
                connection.cleanParameters();
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                connection.closeConnection();
            }
        }

        public static User GetUserByEmail(string email)
        {
            try
            {
                connection.setStoredProcedure("sp_GetUserByEmail");
                connection.addParameter("@Email", email);
                connection.executeStoredProcedure(true);

                if (connection.Reader.Read())
                {
                    User user = UserMapper(connection.Reader);
                    user.PasswordHash = (byte[])connection.Reader["PasswordHash"];
                    user.PasswordSalt = (byte[])connection.Reader["PasswordSalt"];
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
                connection.cleanParameters();
                connection.closeConnection();
            }
        }

        public static User GetUserById(int userId)
        {
            try
            {
                connection.setStoredProcedure("sp_GetUserById");
                connection.addParameter("@Id", userId.ToString());
                connection.executeStoredProcedure(true);

                if (connection.Reader.Read())
                {
                    User user = UserMapper(connection.Reader);
                    return user;
                }

                return null;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al buscar usuario por ID", ex);
            }
            finally
            {
                connection.cleanParameters();
                connection.closeConnection();
            }
        }

        public static bool DeleteUser(string userId)
        {
            try
            {
                connection.setStoredProcedure("sp_DeleteUser");
                connection.addParameter("@Id", userId);
                connection.executeStoredProcedure();
                
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al eliminar usuario", ex);
            }
            finally
            {
                connection.cleanParameters();
                connection.closeConnection();
            }
        }

        public static bool DisableUser(string userId)
        {
            try
            {
                connection.setStoredProcedure("sp_DisableUser");
                connection.addParameter("@Id", userId.ToString());
                connection.executeStoredProcedure();
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al deshabilitar usuario", ex);
            }
            finally
            {
                connection.cleanParameters();
                connection.closeConnection();
            }
        }

        public static bool EnableUser(string userId)
        {
            try
            {
                connection.setStoredProcedure("sp_EnableUser");
                connection.addParameter("@Id", userId);
                connection.executeStoredProcedure();
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al habilitar usuario", ex);
            }
            finally
            {
                connection.cleanParameters();
                connection.closeConnection();
            }
        }

        public static bool UpdateUser(User user)
        {
            try
            {
                connection.setStoredProcedure("sp_UpdateUser");
                connection.addParameter("@Id", user.Id.ToString());
                connection.addParameter("@Email", user.Email);
                connection.addParameter("@FirstName", user.FirstName);
                connection.addParameter("@LastName", user.LastName);
                connection.addParameter("@Birthdate", user.Birthdate);
                connection.addParameter("@Active", user.Active);
                connection.executeStoredProcedure();
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al actualizar usuario", ex);
            }
            finally
            {
                connection.cleanParameters();
                connection.closeConnection();
            }
        }

        private static User UserMapper(IDataReader dr)
        {
            User user = new User();

            user.Id = dr["Id"] != null && !string.IsNullOrEmpty(dr["Id"].ToString()) ? int.Parse(dr["Id"].ToString()) : 0;
            user.Email = dr["Email"] != null ? dr["Email"].ToString() : string.Empty;
            user.FirstName = dr["FirstName"] != null ? dr["FirstName"].ToString() : string.Empty;
            user.LastName = dr["LastName"] != null ? dr["LastName"].ToString() : string.Empty;
            user.Birthdate = dr["Birthdate"] != null && !string.IsNullOrEmpty(dr["Birthdate"].ToString()) ? DateTime.Parse(dr["Birthdate"].ToString()) : DateTime.MinValue;
            user.Active = dr["Active"] != null && !string.IsNullOrEmpty(dr["Active"].ToString()) ? bool.Parse(dr["Active"].ToString()) : false;
            user.Creation = dr["Creation"] != null && !string.IsNullOrEmpty(dr["Creation"].ToString()) ? DateTime.Parse(dr["Creation"].ToString()) : DateTime.MinValue;

            return user;
        }
    }
}