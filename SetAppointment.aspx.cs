using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IT114L_MP_CareBy
{
    public partial class SetAppointment : System.Web.UI.Page
    {
        private string usernameOrEmail;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                usernameOrEmail = Session["UsernameOrEmail"].ToString();
                PopulateDropDownList();
                PopulateDropDownList2();
            }
        }

        protected void PopulateDropDownList()
        {
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=""C:\Users\Christian Kerby\source\repos\IT114L-MP-CareBy\App_Data\Careby.mdf"";Integrated Security=True";

            string query = "SELECT therapistName FROM Appointments";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    ListItem item = new ListItem();
                    item.Value = reader["therapistName"].ToString();
                    item.Text = reader["therapistName"].ToString();
                    ddlProvidersPopup1.Items.Add(item);
                }

                reader.Close();
                connection.Close();
            }
        }

        protected void btnSubmitAppointment_Click(object sender, EventArgs e)
        {
            int userID = -1;
            // Retrieve appointment details from UI controls
            string date = txtDate.Text;
            string provider = Request.Form[ddlProvidersPopup1.UniqueID]; // Retrieve selected provider from dropdown list
            string timeBlock = Request.Form[DropDownList1.UniqueID]; // Retrieve selected time block from hidden field
            string description = txtDescription.Text; // Retrieve description from text box

            // Retrieve from session (no need to re-declare the variable)
            //string usernameOrEmail = Session["UsernameOrEmail"] as string;

            usernameOrEmail = Session["UsernameOrEmail"].ToString();

            var login_User = new Login_User();
            userID = login_User.GetUserID(usernameOrEmail);
            if (userID != -1)
            {
                HttpContext.Current.Response.Write($"<script>alert('{date} {provider} {timeBlock} {description} {userID}');</script>");
                // Call a method to handle the appointment submission with all necessary details                  
                var appointmentHandler = new Appointment();
                appointmentHandler.HandleAppointmentSubmission(userID, date, provider, timeBlock, description);
                Response.Redirect("~/HomePage.aspx");
            }
            else
            {
                HttpContext.Current.Response.Write($"<script>alert('in AfterLogin.cs, UserID {userID} is NOT retrieved');</script>");
            }
            Response.Redirect("~/HomePage.aspx");
        }

        protected void PopulateDropDownList2()
        {
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=""C:\Users\Christian Kerby\source\repos\IT114L-MP-CareBy\App_Data\Careby.mdf"";Integrated Security=True";

            string query = "SELECT time FROM TimeBlocks";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    ListItem item = new ListItem();
                    item.Value = reader["time"].ToString();
                    item.Text = reader["time"].ToString();
                    DropDownList1.Items.Add(item);
                }

                reader.Close();
                connection.Close();
            }
        }

        protected void SubmitAppointment()
        {

        }

        protected void backBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }
    }
}