using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IT114L_MP_CareBy
{
    public partial class TherapistPage : System.Web.UI.Page
    {
        private string usernameOrEmail;
        protected void Page_Load(object sender, EventArgs e)
        {
            usernameOrEmail = Session["UsernameOrEmail"].ToString();
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Default.aspx");
        }
        protected void profileBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProfileForm");
        }
    }
}

