using BusinessLogicLayer;
using Entities;
using System;
using System.Collections.Generic;

namespace UserInterfaces.Users
{
    public partial class UserList : System.Web.UI.Page
    {
        private UserBLL business;
        public List<User> listUsers = new List<User>();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            // Mostrar el navbar del master
            SiteMaster master = (SiteMaster)this.Master;
            master.ShowNavbar(true);

            try
            {
                business = new UserBLL();
                listUsers = business.GetUsers() ?? new List<User>();
                Session.Add("ListUsers", listUsers);
            }
            catch (Exception ex)
            {
                listUsers = new List<User>();
                Session.Add("ListUsers", listUsers);
            }
        }
    }
}
