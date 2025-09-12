using BusinessLogicLayer;
using Entities;
using System;
using System.Collections.Generic;

namespace UserIntefaces
{
    public partial class UserList : System.Web.UI.Page
    {
        private UserBLL business;
        public List<User> listUsers;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                business = new UserBLL();
                listUsers = business.GetUsers();
                Session.Add("ListUsers", listUsers);
            }
            catch
            {
                Response.Redirect("Default");
            }

        }
    }
}