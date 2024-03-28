using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IT114L_MP_CareBy
{
    public partial class TherapistPage : System.Web.UI.Page
    {
        private string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=""C:\Users\Christian Kerby\source\repos\IT114L-MP-CareBy\App_Data\Careby.mdf"";Integrated Security=True";
        private string usernameOrEmail;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string usernameOrEmail = Session["UsernameOrEmail"] as string;

                if (!string.IsNullOrEmpty(usernameOrEmail))
                {

                    Login_User loginUser = new Login_User();

                    int userID = loginUser.GetUserID(usernameOrEmail);

                    string fullName = GetFullName(userID);

                    string appointmentDetails = GetAppointmentDetails(fullName);

                    string patientname = GetPatientFullName(appointmentDetails);

                }
            }
        }
        private string GetPatientFullName(string appointmentDetails)
        {
            string fullName = "";

            // Retrieve the first name and last name of the user using the userID
            string query = "SELECT CONCAT(FirstName, ' ', LastName) AS FullName FROM Users WHERE UserID = @UserID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@UserID", appointmentDetails);
                    connection.Open();
                    object result = command.ExecuteScalar();
                    if (result != null)
                    {
                        fullName = result.ToString();
                        displayPatient.InnerText = fullName;
                    }
                }
            }

            return fullName;
        }


        private string GetAppointmentDetails(string fullName)
        {
            string patientID = "";

            // Query to retrieve appointment details based on therapist's full name
            string query = @"
                        SELECT chosen_date, chosen_timeBlock, chosen_therapistName, userID
                        FROM appointment_details
                        WHERE chosen_therapistName = @FullName";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@FullName", fullName);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        // Retrieve appointment details from the reader
                        DateTime chosenDate = Convert.ToDateTime(reader["chosen_date"]);
                        string timeBlock = reader["chosen_timeBlock"].ToString();
                        string therapistName = reader["chosen_therapistName"].ToString();
                        int userID = Convert.ToInt32(reader["userID"]);

                        // Assign patient ID to the patientID variable
                        patientID = userID.ToString();

                        // Update the displayDate and displayTime elements
                        displayDate.InnerText = chosenDate.ToShortDateString();
                        displayTime.InnerText = timeBlock;
                    }
                    reader.Close();
                }
            }

            return patientID;
        }




        private string GetFullName(int userID)
        {
            string fullName = "";

            // Retrieve the first name and last name of the user using the userID
            string query = "SELECT CONCAT(FirstName, ' ', LastName) AS FullName FROM Users WHERE UserID = @UserID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@UserID", userID);
                    connection.Open();
                    object result = command.ExecuteScalar();
                    if (result != null)
                    {
                        fullName = result.ToString();
                    }
                }
            }

            return fullName;
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