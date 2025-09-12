using GestionUsuarios.DAL;
using GestionUsuarios.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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