using BusinessLogicLayer;
using System;

namespace UserInterfaces
{
    public partial class Login : System.Web.UI.Page
    {
        UserBLL business = new UserBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            ErrorActive.Visible = false;
            ErrorLogueo.Visible = false;
        }

        protected void Ingresar_Click(object sender, EventArgs e)
        {
            try
            {
                var user = business.Login(email.Text, password.Text);

                if (user != null)
                {
                    if (user.Active)
                    {
                        Session.Add("UsuarioLogueado", user);
                        Response.Redirect("Users/UserHome", false);
                    }
                    else
                    {
                        //Uusuario no activo
                        ErrorActive.Visible = true;
                    }
                }
                else
                {
                    //Error de logueo
                    ErrorLogueo.Visible = true;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void Register_Click(object sender, EventArgs e)
        {
            Response.Redirect("Users/UserRegister", false);
        }
    }
}