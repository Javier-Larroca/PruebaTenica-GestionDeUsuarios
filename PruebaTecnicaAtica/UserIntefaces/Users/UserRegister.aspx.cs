using BusinessLogicLayer;
using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserIntefaces.Users
{
    public partial class UserRegister : System.Web.UI.Page
    {
        private UserBLL business = new UserBLL();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void createUser_Click(object sender, EventArgs e)
        {
            User newUser = new User();
            try
            {
                if (txtPassword.Text != string.Empty && txtPassword.Text == txtPasswordConfirm.Text)
                {
                    int day, month, year;

                    if (int.TryParse(dayBirth.SelectedValue, out day) &&
                        int.TryParse(monthBirth.SelectedValue, out month) &&
                        int.TryParse(yearBirth.SelectedValue, out year))
                    {
                        newUser.Birthdate = new DateTime(year, month, day);
                    }
                    else
                    {
                        Warning.Text = "Debe seleccionar una fecha de nacimiento válida.";
                        Warning.Visible = true;
                        return;
                    }
                    newUser.FirstName = firstName.Text;
                    newUser.LastName = lastName.Text;
                    newUser.Email = email.Text;
                    newUser.Password = txtPassword.Text;

                    if (business.CreateUser(newUser))
                    {
                        Response.Redirect("../Login");
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