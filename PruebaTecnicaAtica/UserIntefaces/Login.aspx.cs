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

        }

        protected void Ingresar_Click(object sender, EventArgs e)
        {
            try
            {
                //User logueado = negocio.existeUsuario(Email.Text);

                //if (logueado.Id == 0)
                //{
                //    ErrorLogueo.Visible = true;
                //}
                //else
                //{
                //    Session.Add("UsuarioLogueado", logueado);
                //    Response.Redirect("Inicio", false);
                //}
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}