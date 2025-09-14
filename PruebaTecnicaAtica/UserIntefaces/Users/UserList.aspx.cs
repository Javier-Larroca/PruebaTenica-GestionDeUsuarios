using BusinessLogicLayer;
using Entities;
using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserInterfaces.Users
{
    public partial class UserList : System.Web.UI.Page
    {
        public List<User> listUsers = new List<User>();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            SiteMaster master = (SiteMaster)this.Master;
            master.ShowNavbar(true);

            if (!IsPostBack)
            {
                LoadUsers();
            }
        }

        private void LoadUsers()
        {
            try
            {
                listUsers = UserBLL.GetUsers() ?? new List<User>();
                
                if (listUsers.Count > 0)
                {
                    rptUsers.DataSource = listUsers;
                    rptUsers.DataBind();
                    trNoUsers.Visible = false;
                }
                else
                {
                    trNoUsers.Visible = true;
                }
                
                Session.Add("ListUsers", listUsers);
            }
            catch (Exception ex)
            {
                listUsers = new List<User>();
                trNoUsers.Visible = true;
                Session.Add("ListUsers", listUsers);
            }
        }

        protected void rptUsers_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            try
            {
                string userId = e.CommandArgument?.ToString();
                bool result = false;
                string actionMessage = "";

                System.Diagnostics.Debug.WriteLine($"rptUsers_ItemCommand: CommandName='{e.CommandName}', UserId='{userId}'");

                switch (e.CommandName)
                {
                    case "ModifyUser":
                        Response.Redirect($"UserModify.aspx?id={userId}");
                        return;

                    case "DisableUser":
                        result = UserBLL.DisableUser(userId);
                        actionMessage = result ? "Usuario deshabilitado correctamente." : "Error al deshabilitar el usuario.";
                        break;

                    case "EnableUser":
                        result = UserBLL.EnableUser(userId);
                        actionMessage = result ? "Usuario habilitado correctamente." : "Error al habilitar el usuario.";
                        break;

                    case "DeleteUser":
                        System.Diagnostics.Debug.WriteLine($"Eliminando usuario con ID: {userId}");
                        result = UserBLL.DeleteUser(userId);
                        System.Diagnostics.Debug.WriteLine($"Resultado de eliminación: {result}");
                        actionMessage = result ? "Usuario eliminado correctamente." : "Error al eliminar el usuario.";
                        break;
                }

                System.Diagnostics.Debug.WriteLine($"Resultado final: {result}, Mensaje: {actionMessage}");

                if (result)
                {
                    LoadUsers();
                    ShowMessage(actionMessage, true);
                }
                else
                {
                    ShowMessage(actionMessage, false);
                }


            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Excepción en rptUsers_ItemCommand: {ex.Message}");
                ShowMessage($"Error inesperado: {ex.Message}", false);
            }
        }

        private void ShowMessage(string message, bool isSuccess)
        {
            System.Diagnostics.Debug.WriteLine($"ShowMessage llamado: '{message}', Success: {isSuccess}");
            
            string alertType = isSuccess ? "success" : "danger";
            string iconClass = isSuccess ? "fa-check-circle" : "fa-exclamation-circle";
            string title = isSuccess ? "Éxito" : "Error";
            
            string script = $@"
                // Crear el mensaje de alerta
                const alertHtml = `
                    <div class='alert alert-{alertType} alert-dismissible fade show' role='alert'>
                        <i class='fas {iconClass} me-2'></i>
                        <strong>{title}:</strong> {message}
                        <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>
                    </div>
                `;
                
                // Insertar el mensaje al inicio del contenedor principal
                const container = document.querySelector('.card-body');
                if (container) {{
                    container.insertAdjacentHTML('afterbegin', alertHtml);
                    
                    // Scroll hacia arriba
                    window.scrollTo({{ top: 0, behavior: 'smooth' }});
                    
                    // Auto-ocultar después de 5 segundos
                    setTimeout(function() {{
                        const alert = container.querySelector('.alert');
                        if (alert) {{
                            alert.style.transition = 'opacity 0.5s';
                            alert.style.opacity = '0';
                            setTimeout(function() {{
                                alert.remove();
                            }}, 500);
                        }}
                    }}, 5000);
                }}
            ";
            
            ScriptManager.RegisterStartupScript(this, GetType(), "showMessage", script, true);
        }

        public string GetConfirmMessage(bool isActive)
        {
            if (isActive)
            {
                return "confirm('¿Estás seguro de que deseas deshabilitar este usuario?');";
            }
            else
            {
                return "confirm('¿Estás seguro de que deseas habilitar este usuario?');";
            }
        }
    }
}
