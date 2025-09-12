using GestionUsuarios.DAL;
using GestionUsuarios.Entities;
using System.Collections.Generic;

namespace GestionUsuarios.BLL
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