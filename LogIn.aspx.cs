using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IT114L_MP_CareBy
{
    public partial class LogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            string usernameOrEmail = txtLoginUsername.Text;
            string password = txtLoginPassword.Text;

            Session["UsernameOrEmail"] = usernameOrEmail;

            var Login_User = new Login_User();
            Login_User.AuthenticateUser(usernameOrEmail, password);


        }

        protected void NoAcct(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("~/Register.aspx");
        }
    }
}