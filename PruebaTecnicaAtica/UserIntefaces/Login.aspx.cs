using BusinessLogicLayer;
using System;

namespace UserInterfaces
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ErrorActive.Visible = false;
            ErrorLogueo.Visible = false;
            Session.Clear();
            Session.Abandon();
        }

        protected void Ingresar_Click(object sender, EventArgs e)
        {
            try
            {
                var user = UserBLL.Login(email.Text, password.Text);

                if (user != null)
                {
                    if (user.Active)
                    {
                        Session.Add("LoggedUser", user);
                        Response.Redirect("Users/UserHome", false);
                    }
                    else
                    {
                        ErrorActive.Visible = true;
                    }
                }
                else
                {
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