using BusinessLogicLayer;
using Entities;
using System;
using System.Collections.Generic;

namespace UserInterfaces.Users
{
    public partial class UserCreate : System.Web.UI.Page
    {
        private UserBLL business = new UserBLL();
        private User user = new User();

        protected void Page_Load(object sender, EventArgs e)
        {
            SuccessUser.Text = "Se agrego correctamente el usuario";
            FailUser.Text = "ATENCION: No se pudo cargar el usuario ";
        }

        protected void createUser_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtPassword.Text!= string.Empty && txtPassword.Text == txtPasswordConfirm.Text)
                {
                    user.FirstName = firstName.Text;
                    user.LastName = lastName.Text;
                    user.Email = email.Text;
                    user.Password = txtPassword.Text;

                    if (business.CreateUser(user))
                    {
                        SuccessUser.Visible = true;
                    }
                    else
                    {
                        FailUser.Visible = true;
                    }
                }
                else 
                {
                    FailUser.Text = "ATENCION: No hay coincidencia en las contraseñas ";
                    FailUser.Visible = true;
                }
            }
            catch (Exception)
            {
                Warning.Visible = true;
            }
        }
    }
}