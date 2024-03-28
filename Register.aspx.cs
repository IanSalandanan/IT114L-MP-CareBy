using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IT114L_MP_CareBy
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void btnRegister_Click(object sender, EventArgs e)
        {

            string username = txtUsername.Text;
            string email = txtEmail.Text;
            string password = txtConfirmpass.Text;
            string fname = txtfname.Text;
            string lname = txtlname.Text;
            string age = txtage.Text;
            string gender = txtgender.Text;


            var Registration = new Registration();
            Registration.CreateUser(username, email, password, fname, lname, age, gender);
        }

        protected void AcctHave(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("~/LogIn.aspx");
        }
    }
}