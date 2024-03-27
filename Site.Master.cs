using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IT114L_MP_CareBy
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void homeClick(object sender, EventArgs e)
        {

        }

        protected void aboutClick(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ScrollToLogin", "window.location.hash='#about-page'", true);
        }

        protected void contactClick(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ScrollToLogin", "window.location.hash='#contact-page'", true);
        }
    }
}