using DataAccessLayer;
using Entities;
using System.Collections;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Text;

namespace BusinessLogicLayer
{
    public class UserBLL
    {
        private readonly UserDAL userDAL = new UserDAL();

        public List<User> GetUsers()
        {
            return userDAL.GetUsers();
        }

        public bool CreateUser(User user)
        {
            this.CreatePasswordHash(user);
            return userDAL.createUser(user);
        }

        private void CreatePasswordHash(User user)
        {
            using (var hmac = new HMACSHA256())
            {
                user.PasswordSalt = hmac.Key;
                user.PasswordHash = hmac.ComputeHash(Encoding.UTF8.GetBytes(user.Password));
            }
        }

        private bool VerifyPassword(string password, byte[] storedHash, byte[] storedSalt)
        {
            using (var hmac = new HMACSHA256(storedSalt))
            {
                var computedHash = hmac.ComputeHash(Encoding.UTF8.GetBytes(password));
                return StructuralComparisons.StructuralEqualityComparer.Equals(computedHash, storedHash);
            }
        }
    }
}