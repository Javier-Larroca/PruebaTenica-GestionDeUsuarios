using BusinessLogicLayer;
using Entities;
using System;

namespace UserInterfaces.Users
{
    public partial class UserRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBirthDateControls();
            }
        }

        protected void createUser_Click(object sender, EventArgs e)
        {
            Warning.Visible = false;
            SuccessUser.Visible = false;
            FailUser.Visible = false;

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
            if (txtPassword.Text == string.Empty || txtPassword.Text != txtPasswordConfirm.Text)
            {
                Warning.Text = "No hay coincidencia en las contraseñas ";
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

                if (UserBLL.CreateUser(newUser, txtPassword.Text))
                {
                    Response.Redirect("../Login");
                }
                else
                {
                    FailUser.Text = "ATENCIÓN: Ocurrio un error al registrar el ususario. ";
                    FailUser.Visible = true;
                }
            }
            catch (Exception ex)
            {
                FailUser.Text = "ATENCIÓN: Ocurrio un error al registrar el ususario. ";
                FailUser.Visible = true;
                Warning.Text = ex.Message;
                Warning.Visible = true;
            }
        }

        private void LoadBirthDateControls()
        {
            dayBirth.Items.Clear();
            dayBirth.Items.Add(new System.Web.UI.WebControls.ListItem("Día", ""));
            for (int i = 1; i <= 31; i++)
            {
                dayBirth.Items.Add(new System.Web.UI.WebControls.ListItem(i.ToString(), i.ToString()));
            }

            monthBirth.Items.Clear();
            monthBirth.Items.Add(new System.Web.UI.WebControls.ListItem("Mes", ""));
            string[] months = { "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
                              "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" };
            for (int i = 0; i < months.Length; i++)
            {
                monthBirth.Items.Add(new System.Web.UI.WebControls.ListItem(months[i], (i + 1).ToString()));
            }

            yearBirth.Items.Clear();
            yearBirth.Items.Add(new System.Web.UI.WebControls.ListItem("Año", ""));
            int currentYear = DateTime.Now.Year;
            for (int i = currentYear; i >= 1900; i--)
            {
                yearBirth.Items.Add(new System.Web.UI.WebControls.ListItem(i.ToString(), i.ToString()));
            }
        }
    }
}