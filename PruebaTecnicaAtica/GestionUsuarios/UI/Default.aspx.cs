using GestionUsuarios.BLL;
using System;

namespace GestionUsuarios.UI
{
    public partial class Default : System.Web.UI.Page
    {
        private readonly UserBLL userBLL = new UserBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gvUsuarios.DataSource = userBLL.GetUsers();
                gvUsuarios.DataBind();
            }
        }
    }
}