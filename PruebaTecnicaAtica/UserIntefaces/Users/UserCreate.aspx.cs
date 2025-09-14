using BusinessLogicLayer;
using Entities;
using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace UserInterfaces.Users
{
    public partial class UserCreate : System.Web.UI.Page
    {
        private UserBLL business = new UserBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            // Mostrar el navbar del master
            SiteMaster master = (SiteMaster)this.Master;
            master.ShowNavbar(true);

            SuccessUser.Text = "Se agrego correctamente el usuario. Se le enviara un email con su contraseña.";
            FailUser.Text = "ATENCION: No se pudo cargar el usuario ";

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
            // Limpiar mensajes anteriores
            Warning.Visible = false;
            SuccessUser.Visible = false;
            FailUser.Visible = false;

            // Validar campos obligatorios
            if (string.IsNullOrWhiteSpace(firstName.Text))
            {
                Warning.Text = "El nombre es obligatorio.";
                Warning.Visible = true;
                return;
            }

            if (string.IsNullOrWhiteSpace(lastName.Text))
            {
                Warning.Text = "El apellido es obligatorio.";
                Warning.Visible = true;
                return;
            }

            if (string.IsNullOrWhiteSpace(email.Text))
            {
                Warning.Text = "El email es obligatorio.";
                Warning.Visible = true;
                return;
            }

            User newUser = new User();
            try
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

                newUser.FirstName = firstName.Text.Trim();
                newUser.LastName = lastName.Text.Trim();
                newUser.Email = email.Text.Trim();

                if (business.CreateManualUser(newUser))
                {
                    SuccessUser.Visible = true;
                    firstName.Text = "";
                    lastName.Text = "";
                    email.Text = "";
                    dayBirth.SelectedIndex = 0;
                    monthBirth.SelectedIndex = 0;
                    yearBirth.SelectedIndex = 0;
                }
                else
                {
                    FailUser.Visible = true;
                }
            }
            catch (Exception)
            {
                FailUser.Visible = true;
                throw;
            }
        }

    }
}