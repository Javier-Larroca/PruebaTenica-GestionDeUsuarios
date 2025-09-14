using System;
using System.Web.UI;
using Entities;

namespace UserInterfaces
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadUserInfo();
        }

        private void LoadUserInfo()
        {
            if (Session["LoggedUser"] != null)
            {
                User LoggedUser = (User)Session["LoggedUser"];
                lblLoggedUser.Text = $"{LoggedUser.FirstName} {LoggedUser.LastName}";
            }
            else
            {
                lblLoggedUser.Text = "Usuario";
            }
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Users/UserHome.aspx");
        }

        protected void btnCrearUsuario_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Users/UserCreate.aspx");
        }

        protected void btnAdministrarUsuario_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Users/UserList.aspx");
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            
            Response.Redirect("~/Login.aspx");
        }

        public void ShowNavbar(bool show)
        {
            mainNavbar.Visible = show;
        }
    }
}