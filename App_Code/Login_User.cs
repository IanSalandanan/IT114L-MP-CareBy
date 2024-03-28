using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace IT114L_MP_CareBy
{
    public class Login_User
    {
        public bool AuthenticateUser(string usernameOrEmail, string password)
        {

            var connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=""C:\Users\Christian Kerby\source\repos\IT114L-MP-CareBy\App_Data\Careby.mdf"";Integrated Security=True";

            bool loggedIn = false;

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                connection.Open();
                command.CommandText = "SELECT COUNT(*) FROM Users WHERE (Username = @UsernameOrEmail OR Email = @UsernameOrEmail) AND Password = @Password";
                command.Parameters.AddWithValue("@UsernameOrEmail", usernameOrEmail);
                command.Parameters.AddWithValue("@Password", password);
                int count = (int)command.ExecuteScalar();
                loggedIn = count > 0; // If count > 0, credentials are valid
                connection.Close();
            }

            if (loggedIn)
            {
                int logged_userID = GetUserID(usernameOrEmail);//check if nakuha ung UserID pagkalogin
                string userType = GetUserType(usernameOrEmail);

                if (logged_userID == -1)
                {
                    HttpContext.Current.Response.Write("<script>alert(retrieving userID FAILED.');</script>");

                }
                else if (userType == "Therapist")
                {

                    HttpContext.Current.Response.Redirect("~/TherapistPage.aspx");
                }
                else
                {
                    HttpContext.Current.Response.Redirect("~/HomePage.aspx");
                }

            }
            else
            {
                HttpContext.Current.Response.Write("<script>alert('Invalid username/email or password');</script>");
            }

            return loggedIn;
        }

        public int GetUserID(string usernameOrEmail)
        {
            int userID = -1;

            var connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=""C:\Users\Christian Kerby\source\repos\IT114L-MP-CareBy\App_Data\Careby.mdf"";Integrated Security=True";

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                connection.Open();

                // Define the SELECT statement to retrieve UserID based on username or email
                command.CommandText = "SELECT UserID FROM Users WHERE Username = @UsernameOrEmail OR Email = @UsernameOrEmail";
                command.Parameters.AddWithValue("@UsernameOrEmail", usernameOrEmail);

                // Execute the SELECT statement and retrieve the UserID
                object result = command.ExecuteScalar();
                if (result != null)
                {
                    userID = Convert.ToInt32(result);
                }
            }
            return userID;
        }

        public string GetUserType(string usernameOrEmail)
        {
            string userType = "";

            var connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=""C:\Users\Christian Kerby\source\repos\IT114L-MP-CareBy\App_Data\Careby.mdf"";Integrated Security=True";
            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                connection.Open();

                // Define the SELECT statement to retrieve UserID based on username or email
                command.CommandText = "SELECT UserType FROM Users WHERE Username = @UsernameOrEmail OR Email = @UsernameOrEmail";
                command.Parameters.AddWithValue("@UsernameOrEmail", usernameOrEmail);

                // Execute the SELECT statement and retrieve the UserID
                object result = command.ExecuteScalar();
                if (result != null)
                {
                    userType = Convert.ToString(result);
                }
            }
            return userType;
        }

        public void RedirectToAfterLogin()
        {
            HttpContext.Current.Response.Redirect("~/AfterLogin.aspx");
        }
    }
}