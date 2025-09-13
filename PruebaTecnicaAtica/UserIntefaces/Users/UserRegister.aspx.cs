using BusinessLogicLayer;
using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserInterfaces.Users
{
    public partial class UserRegister : System.Web.UI.Page
    {
        private UserBLL business = new UserBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Día
                dayBirth.Items.Add(new ListItem("Día", ""));
                for (int i = 1; i <= 31; i++)
                {
                    dayBirth.Items.Add(new ListItem(i.ToString(), i.ToString()));
                }

                // Mes
                monthBirth.Items.Add(new ListItem("Mes", ""));
                string[] meses = { "ene", "feb", "mar", "abr", "may", "jun", "jul", "ago", "sep", "oct", "nov", "dic" };
                for (int i = 0; i < meses.Length; i++)
                {
                    monthBirth.Items.Add(new ListItem(meses[i], (i + 1).ToString()));
                }

                // Año (ejemplo: 1990 hasta el año actual)
                yearBirth.Items.Add(new ListItem("Año", ""));
                int anioActual = DateTime.Now.Year;
                for (int i = anioActual; i >= 1900; i--)
                {
                    yearBirth.Items.Add(new ListItem(i.ToString(), i.ToString()));
                }
            }
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

                    if (business.CreateUser(newUser, txtPassword.Text))
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