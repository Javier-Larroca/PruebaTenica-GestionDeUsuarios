using BusinessLogicLayer;
using System;
using System.Web.UI;

namespace UserInterfaces
{
    public partial class _Default : Page
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
