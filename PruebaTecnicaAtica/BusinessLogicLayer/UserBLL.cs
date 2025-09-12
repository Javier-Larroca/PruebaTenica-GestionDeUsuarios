using DataAccessLayer;
using Entities;
using System.Collections.Generic;

namespace BusinessLogicLayer
{
    public class UserBLL
    {
        private readonly UserDAL _userDAL = new UserDAL();

        public List<User> GetUsers()
        {
            return _userDAL.GetUsers();
        }
    }
}