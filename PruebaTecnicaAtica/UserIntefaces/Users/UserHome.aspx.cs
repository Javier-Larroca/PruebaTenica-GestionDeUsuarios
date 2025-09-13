using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserInterfaces.Users
{
    public partial class UserHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Mostrar el navbar del master
            SiteMaster master = (SiteMaster)this.Master;
            master.ShowNavbar(true);
        }
    }
}