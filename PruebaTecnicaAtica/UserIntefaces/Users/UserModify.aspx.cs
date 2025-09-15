using BusinessLogicLayer;
using Entities;
using System;

namespace UserInterfaces.Users
{
    public partial class UserModify : System.Web.UI.Page
    {
        private int UserId
        {
            get { return ViewState["UserId"] != null ? (int)ViewState["UserId"] : 0; }
            set { ViewState["UserId"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            SiteMaster master = (SiteMaster)this.Master;
            master.ShowNavbar(true);

            if (Session["LoggedUser"] == null)
            {
                Response.Redirect("~/Users/UserLogin.aspx");
            }

            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null && int.TryParse(Request.QueryString["id"], out int userId))
                {
                    UserId = userId;
                    LoadUserData();
                }
                else
                {
                    Response.Redirect("UserList.aspx");
                }
            }
        }

        private void LoadUserData()
        {
            try
            {
                User userToModify = UserBLL.GetUserById(UserId);

                if (userToModify != null)
                {
                    firstName.Text = userToModify.FirstName;
                    lastName.Text = userToModify.LastName;
                    email.Text = userToModify.Email;

                    LoadBirthDateControls();
                    dayBirth.SelectedValue = userToModify.Birthdate.Day.ToString();
                    monthBirth.SelectedValue = userToModify.Birthdate.Month.ToString();
                    yearBirth.SelectedValue = userToModify.Birthdate.Year.ToString();

                    ddlActive.SelectedValue = userToModify.Active.ToString().ToLower();
                }
                else
                {
                    ShowMessage("Usuario no encontrado.", "error");
                    Response.Redirect("UserList.aspx");
                }
            }
            catch (Exception ex)
            {
                ShowMessage($"Error al cargar los datos del usuario: {ex.Message}", "error");
                Response.Redirect("UserList.aspx");
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Warning.Visible = false;
            SuccessUser.Visible = false;
            FailUser.Visible = false;

            if (string.IsNullOrWhiteSpace(firstName.Text))
            {
                ShowMessage("El nombre es obligatorio.", "warning");
                return;
            }
            if (string.IsNullOrWhiteSpace(lastName.Text))
            {
                ShowMessage("El apellido es obligatorio.", "warning");
                return;
            }
            if (string.IsNullOrWhiteSpace(email.Text))
            {
                ShowMessage("El email es obligatorio.", "warning");
                return;
            }
            if (!IsValidBirthDate())
            {
                ShowMessage("Debe seleccionar una fecha de nacimiento válida.", "warning");
                return;
            }

            try
            {
                User updatedUser = new User
                {
                    Id = UserId,
                    FirstName = firstName.Text.Trim(),
                    LastName = lastName.Text.Trim(),
                    Email = email.Text.Trim(),
                    Birthdate = GetSelectedBirthDate(),
                    Active = bool.Parse(ddlActive.SelectedValue)
                };

                bool result = UserBLL.UpdateUser(updatedUser);

                if (result)
                {
                    ShowMessage("Usuario actualizado correctamente.", "success");
                    Response.AddHeader("REFRESH", "2;URL=UserList.aspx");
                }
                else
                {
                    ShowMessage("Error al actualizar el usuario.", "error");
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

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserList.aspx");
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
            dayBirth.Items.Add(new System.Web.UI.WebControls.ListItem("Día", ""));
            for (int i = 1; i <= 31; i++)
                dayBirth.Items.Add(new System.Web.UI.WebControls.ListItem(i.ToString(), i.ToString()));

            monthBirth.Items.Clear();
            monthBirth.Items.Add(new System.Web.UI.WebControls.ListItem("Mes", ""));
            string[] months = { "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" };
            for (int i = 0; i < months.Length; i++)
                monthBirth.Items.Add(new System.Web.UI.WebControls.ListItem(months[i], (i + 1).ToString()));

            yearBirth.Items.Clear();
            yearBirth.Items.Add(new System.Web.UI.WebControls.ListItem("Año", ""));
            int currentYear = DateTime.Now.Year;
            for (int i = currentYear; i >= 1900; i--)
                yearBirth.Items.Add(new System.Web.UI.WebControls.ListItem(i.ToString(), i.ToString()));
        }

        private void ShowMessage(string message, string type)
        {
            switch (type.ToLower())
            {
                case "success":
                    SuccessUser.Text = message;
                    SuccessUser.Visible = true;
                    break;
                case "warning":
                    Warning.Text = message;
                    Warning.Visible = true;
                    break;
                case "error":
                    FailUser.Text = message;
                    FailUser.Visible = true;
                    break;
            }
        }
    }
}
