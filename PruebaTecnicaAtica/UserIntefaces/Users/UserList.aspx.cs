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
        private UserBLL business;
        public List<User> listUsers = new List<User>();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            // Mostrar el navbar del master
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
                business = new UserBLL();
                listUsers = business.GetUsers() ?? new List<User>();
                
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
                
                if (string.IsNullOrEmpty(userId))
                {
                    ShowMessage("Error: No se pudo obtener el ID del usuario.", "error");
                    return;
                }

                business = new UserBLL();
                bool result = false;
                string actionMessage = "";

                switch (e.CommandName)
                {
                    case "ModifyUser":
                        // Redirigir a la página de modificación con el ID del usuario
                        Response.Redirect($"UserCreate.aspx?action=modify&id={userId}");
                        return;

                    case "DisableUser":
                        result = business.DisableUser(int.Parse(userId));
                        actionMessage = result ? "Usuario deshabilitado correctamente." : "Error al deshabilitar el usuario.";
                        break;

                    case "DeleteUser":
                        result = business.DeleteUser(int.Parse(userId));
                        actionMessage = result ? "Usuario eliminado correctamente." : "Error al eliminar el usuario.";
                        break;

                    default:
                        ShowMessage("Acción no reconocida.", "error");
                        return;
                }

                if (result)
                {
                    ShowMessage(actionMessage, "success");
                    // Recargar la lista de usuarios
                    LoadUsers();
                }
                else
                {
                    ShowMessage(actionMessage, "error");
                }
            }
            catch (Exception ex)
            {
                ShowMessage($"Error al procesar la acción: {ex.Message}", "error");
            }
        }

        private void ShowMessage(string message, string type)
        {
            string script = $@"
                <script type='text/javascript'>
                    $(document).ready(function() {{
                        var alertClass = '{type}' === 'success' ? 'alert-success' : 'alert-danger';
                        var alertHtml = '<div class=""alert "" + alertClass + "" alert-dismissible fade show"" role=""alert"">' +
                                       '<strong>{(type == "success" ? "Éxito:" : "Error:")}</strong> {message}' +
                                       '<button type=""button"" class=""btn-close"" data-bs-dismiss=""alert"" aria-label=""Close""></button>' +
                                       '</div>';
                        $('body').prepend(alertHtml);
                        
                        // Auto-hide after 5 seconds
                        setTimeout(function() {{
                            $('.alert').fadeOut();
                        }}, 5000);
                    }});
                </script>";
            
            ClientScript.RegisterStartupScript(this.GetType(), "ShowMessage", script);
        }
    }
}
