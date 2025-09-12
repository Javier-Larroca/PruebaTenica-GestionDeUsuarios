using BusinessLogicLayer;
using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserInterfaces
{
    public partial class Login : System.Web.UI.Page
    {
        UserBLL business = new UserBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            ErrorActivo.Visible = false;
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
                        Response.Redirect("Inicio", false);
                    }
                    else
                    {
                        //Uusuario no activo
                        ErrorActivo.Visible = true;
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