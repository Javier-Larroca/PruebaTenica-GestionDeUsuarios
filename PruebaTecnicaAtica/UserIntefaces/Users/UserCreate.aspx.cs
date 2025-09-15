using BusinessLogicLayer;
using Entities;
using System;
using System.Web.UI.WebControls;

namespace UserInterfaces.Users
{
    public partial class UserCreate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SiteMaster master = (SiteMaster)this.Master;
            master.ShowNavbar(true);

            if (Session["LoggedUser"] == null)
            {
                // Usuario no logueado → redirigir al login
                Response.Redirect("~/Users/UserLogin.aspx");
            }

            SuccessUser.Text = "Se agregó correctamente el usuario. Se le enviará un email con su contraseña.";
            FailUser.Text = "ATENCIÓN: No se pudo cargar el usuario.";

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

            if (!IsValidBirthDate())
            {
                Warning.Text = "Debe seleccionar una fecha de nacimiento válida.";
                Warning.Visible = true;
                return;
            }

            User newUser = new User();
            try
            {
                newUser.Birthdate = GetSelectedBirthDate();
                newUser.FirstName = firstName.Text.Trim();
                newUser.LastName = lastName.Text.Trim();
                newUser.Email = email.Text.Trim();

                if (UserBLL.CreateManualUser(newUser))
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
            catch (Exception ex)
            {
                FailUser.Text = "ATENCIÓN: Ocurrió un error al registrar el usuario.";
                FailUser.Visible = true;
                Warning.Text = ex.Message;
                Warning.Visible = true;
            }
        }

        private bool IsValidBirthDate()
        {
            return dayBirth.SelectedIndex > 0 && monthBirth.SelectedIndex > 0 && yearBirth.SelectedIndex > 0;
        }

        private DateTime GetSelectedBirthDate()
        {
            int day = int.Parse(dayBirth.SelectedValue);
            int month = int.Parse(monthBirth.SelectedValue);
            int year = int.Parse(yearBirth.SelectedValue);
            return new DateTime(year, month, day);
        }

        private void LoadBirthDateControls()
        {
            dayBirth.Items.Clear();
            dayBirth.Items.Add(new ListItem("Día", ""));
            for (int i = 1; i <= 31; i++)
            {
                dayBirth.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }

            monthBirth.Items.Clear();
            monthBirth.Items.Add(new ListItem("Mes", ""));
            string[] months = { "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
                                "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" };
            for (int i = 0; i < months.Length; i++)
            {
                monthBirth.Items.Add(new ListItem(months[i], (i + 1).ToString()));
            }

            yearBirth.Items.Clear();
            yearBirth.Items.Add(new ListItem("Año", ""));
            int currentYear = DateTime.Now.Year;
            for (int i = currentYear; i >= 1900; i--)
            {
                yearBirth.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }
        }
    }
}
