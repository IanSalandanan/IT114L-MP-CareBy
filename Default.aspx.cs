using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IT114L_MP_CareBy
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void startbutton_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("~/LogIn.aspx");
        }
    }
}