using DataAccessLayer;
using Entities;
using System;
using System.Collections.Generic;

namespace BusinessLogicLayer
{
    public class UserBLL
    {
        private readonly UserDAL userDAL = new UserDAL();

        public List<User> GetUsers()
        {
            return userDAL.GetUsers();
        }

        public bool CreateUser(User user, string password)
        {
            PasswordBLL.CreatePasswordHash(user, password);
            return userDAL.createUser(user);
        }

        public bool CreateManualUser(User user)
        {
            string password = PasswordBLL.PasswordGenerate();

            PasswordBLL.CreatePasswordHash(user, password);
            try
            {
                //EmailBLL.SendEmailNewUser(user, password).GetAwaiter().GetResult(); ;
                return userDAL.createUser(user); 
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public User Login(string email, string password)
        {
            try
            {
                var user = this.userDAL.GetUserByEmail(email);

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