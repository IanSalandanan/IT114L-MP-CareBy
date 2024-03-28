using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace IT114L_MP_CareBy
{
    public partial class ProfileForm : Page
    {
        private string usernameOrEmail;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                usernameOrEmail = Session["UsernameOrEmail"].ToString();
                email.Enabled = false;
                fname.Enabled = false;
                lname.Enabled = false;
                gender.Enabled = false;
                age.Enabled = false;
                saveBtn.Visible = false;
                editBtn2.Visible = false;

                var login_User = new Login_User();
                int userID = login_User.GetUserID(usernameOrEmail);

                string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=""C:\Users\Christian Kerby\source\repos\IT114L-MP-CareBy\App_Data\Careby.mdf"";Integrated Security=True";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "SELECT Email, FirstName, LastName, age, gender FROM Users WHERE UserID = @UserID";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@UserID", userID);

                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();

                        if (reader.Read())
                        {
                            age.Text = reader["age"].ToString().ToUpper();
                            gender.Text = reader["gender"].ToString().ToUpper();
                            email.Text = reader["Email"].ToString();
                            fname.Text = reader["FirstName"].ToString().ToUpper();
                            lname.Text = reader["LastName"].ToString().ToUpper();
                        }

                        reader.Close();
                    }
                }

                // Get the user type
                string userType = login_User.GetUserType(usernameOrEmail);

                // Adjust button visibility based on user type
                if (userType == "Therapist")
                {
                    backBtn.Visible = false;
                }
                else if (userType == "User")
                {
                    Button1.Visible = false;
                }
            }
        }


        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                editBtn.Visible = true;
                backBtn.Visible = true;
                editBtn2.Visible = false;
                saveBtn.Visible = false;
                email.Enabled = false;
                fname.Enabled = false;
                lname.Enabled = false;
                gender.Enabled = false;
                age.Enabled = false;

                string updatedEmail = email.Text;
                string updatedFirstName = fname.Text;
                string updatedLastName = lname.Text;
                string updatedAge = age.Text;
                string updatedGender = gender.Text;

                UpdateUserData(updatedEmail, updatedFirstName, updatedLastName, updatedAge, updatedGender);

                var login_User = new Login_User();
                string userType = login_User.GetUserType(Session["UsernameOrEmail"].ToString());

                if (userType == "Therapist")
                {
                    backBtn.Visible = false;
                    Button1.Visible = true;
                    backBtn.Visible = false;
                }
            }
        }

        private void UpdateUserData(string updatedEmail, string updatedFirstName, string updatedLastName, string updatedAge, string updatedGender)
        {
            string usernameOrEmail = Session["UsernameOrEmail"].ToString();

            var login_User = new Login_User();
            int userID = login_User.GetUserID(usernameOrEmail);

            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=""C:\Users\Christian Kerby\source\repos\IT114L-MP-CareBy\App_Data\Careby.mdf"";Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "UPDATE Users SET Email = @Email, FirstName = @FirstName, LastName = @LastName, Age = @Age, Gender = @Gender WHERE UserID = @UserID";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", updatedEmail);
                    command.Parameters.AddWithValue("@FirstName", updatedFirstName.ToUpper());
                    command.Parameters.AddWithValue("@LastName", updatedLastName.ToUpper());
                    command.Parameters.AddWithValue("@Age", updatedAge);
                    command.Parameters.AddWithValue("@Gender", updatedGender.ToUpper());
                    command.Parameters.AddWithValue("@UserID", userID);

                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        // Front-end handling for successful update
                    }
                    else
                    {
                        // Front-end handling for unsuccessful update
                    }
                }
            }
        }

        protected void ValidateGender(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            string gender = args.Value.ToUpper();

            if (gender == "MALE" || gender == "FEMALE" || gender == "OTHER")
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void BackBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
            Session.Clear();
        }
        protected void BackBtn2_Click(object sender, EventArgs e)
        {
            Response.Redirect("TherapistPage.aspx");
            Session.Clear();
        }

        protected void EditBtn_Click(object sender, EventArgs e)
        {
            email.Enabled = true;
            fname.Enabled = true;
            lname.Enabled = true;
            gender.Enabled = true;
            age.Enabled = true;
            saveBtn.Visible = true;
            backBtn.Visible = false;
            editBtn2.Visible = true;
            editBtn.Visible = false;
            Button1.Visible = false;
        }

        protected void BackBtnProfile_Click(object sender, EventArgs e)
        {
            backBtn.Visible = true;
            editBtn.Visible = true;
            email.Enabled = false;
            fname.Enabled = false;
            lname.Enabled = false;
            gender.Enabled = false;
            age.Enabled = false;
            saveBtn.Visible = false;
            editBtn2.Visible = false;

            var login_User = new Login_User();
            string userType = login_User.GetUserType(Session["UsernameOrEmail"].ToString());

            if (userType == "Therapist")
            {
                backBtn.Visible = false;
                Button1.Visible = true;
                backBtn.Visible = false;
            }
        }

    }
}
