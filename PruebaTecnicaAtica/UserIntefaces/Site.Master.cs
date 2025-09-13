using System;
using System.Web.UI;

namespace UserInterfaces
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
            // Limpiar la sesión
            Session.Clear();
            Session.Abandon();
            
            // Redirigir al login
            Response.Redirect("~/Login.aspx");
        }

        // Método público para mostrar/ocultar el navbar
        public void ShowNavbar(bool show)
        {
            mainNavbar.Visible = show;
        }
    }
}