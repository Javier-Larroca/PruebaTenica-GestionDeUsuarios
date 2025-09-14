using DataAccessLayer;
using Entities;
using System;
using System.Collections.Generic;

namespace BusinessLogicLayer
{
    public static class UserBLL
    {
        public static List<User> GetUsers()
        {
            return UserDAL.GetUsers();
        }

        public static User GetUserById(int userId)
        {
            try
            {
                return UserDAL.GetUserById(userId);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static bool CreateUser(User user, string password)
        {
            PasswordBLL.CreatePasswordHash(user, password);
            return UserDAL.createUser(user);
        }

        public static bool CreateManualUser(User user)
        {
            string password = PasswordBLL.PasswordGenerate();

            PasswordBLL.CreatePasswordHash(user, password);
            try
            {
                //EmailBLL.SendEmailNewUser(user, password).GetAwaiter().GetResult(); ;
                return UserDAL.createUser(user); 
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static bool DeleteUser(string userId)
        {
            try
            {
                return UserDAL.DeleteUser(userId);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static bool DisableUser(string userId)
        {
            try
            {
                return UserDAL.DisableUser(userId);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static bool EnableUser(string userId)
        {
            try
            {
                return UserDAL.EnableUser(userId);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static bool UpdateUser(User user)
        {
            try
            {
                return UserDAL.UpdateUser(user);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static User Login(string email, string password)
        {
            try
            {
                var user = UserDAL.GetUserByEmail(email);

                if (user == null)
                {
                    return null;
                }

                bool valid = PasswordBLL.VerifyPassword(password, user.PasswordHash, user.PasswordSalt);

                return valid ? user : null;
            }
            catch
            {
                return null;
            }
        }
    }
}