using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace IT114L_MP_CareBy
{
    public class Registration
    {
        public void CreateUser(string name, string email, string password, string fname, string lname, string age, string gender)
        {
            var connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=""C:\Users\Christian Kerby\source\repos\IT114L-MP-CareBy\App_Data\Careby.mdf"";Integrated Security=True";



            if (IsUsernameAvailable(name, connectionString))
            {

                using (var connection = new SqlConnection(connectionString))
                using (var command = connection.CreateCommand())
                {
                    connection.Open();
                    command.CommandText =
                        "INSERT INTO Users (Username, Email, Password, FirstName, LastName, age, gender) " +
                        "VALUES (@Username, @Email, @Password, @FirstName, @LastName, @age, @gender)";

                    command.Parameters.AddWithValue("@Username", name);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Password", password);
                    command.Parameters.AddWithValue("@FirstName", fname);
                    command.Parameters.AddWithValue("@LastName", lname);
                    command.Parameters.AddWithValue("@age", age);
                    command.Parameters.AddWithValue("@gender", gender);

                    command.ExecuteNonQuery();
                    connection.Close();
                }


                HttpContext.Current.Response.Redirect("~/LogIn.aspx");
            }
            else
            {

                string script = $"<script>alert('Username already exists. Please choose a different username.');</script>";
                HttpContext.Current.Response.Write(script);
            }
        }

        private bool IsUsernameAvailable(string username, string connectionString)
        {
            bool available = true;


            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                connection.Open();
                command.CommandText = "SELECT COUNT(*) FROM Users WHERE Username = @Username";
                command.Parameters.AddWithValue("@Username", username);
                int count = (int)command.ExecuteScalar();
                available = count == 0;
                connection.Close();
            }

            return available;
        }
    }
}