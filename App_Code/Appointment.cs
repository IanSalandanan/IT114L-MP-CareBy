using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace IT114L_MP_CareBy
{
    public class Appointment
    {
        private readonly string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=""C:\Users\Christian Kerby\source\repos\IT114L-MP-CareBy\App_Data\Careby.mdf"";Integrated Security=True";

        public bool CheckExistingAppointments(int userID)
        {
            string query = "SELECT COUNT(*) FROM Appointment_Details WHERE userID = @userID";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@userID", userID);
                    connection.Open();
                    int count = (int)command.ExecuteScalar();
                    return count > 0;
                }
            }
        }
        public void HandleAppointmentSubmission(int userID, string date, string provider, string timeBlock, string description)
        {
            // SQL command to insert appointment details into the database
            string query = "INSERT INTO Appointment_Details (userID, visit_desc, chosen_date, chosen_therapistName, chosen_timeBlock) VALUES (@userID, @Description, @Date, @Provider, @TimeBlock)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters to the SQL command
                    command.Parameters.AddWithValue("@userID", userID);
                    command.Parameters.AddWithValue("@Date", date);
                    command.Parameters.AddWithValue("@Provider", provider);
                    command.Parameters.AddWithValue("@TimeBlock", timeBlock);
                    command.Parameters.AddWithValue("@Description", description);

                    try
                    {
                        // Open the connection and execute the SQL command to insert the appointment details
                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();
                        Console.WriteLine($"Inserted {rowsAffected} rows into the Appointment_Details table.");

                        return;
                    }
                    catch (Exception ex)
                    {
                        // Handle any exceptions
                        Console.WriteLine($"An error occurred: {ex.Message}");
                    }
                }
            }
        }
        public void DeleteAppointment(int userID)
        {
            string query = "DELETE FROM Appointment_Details WHERE userID = @userID";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@userID", userID);
                    try
                    {
                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();
                        Console.WriteLine($"Deleted {rowsAffected} rows from the Appointment_Details table.");
                        return;
                    }
                    catch (Exception ex)
                    {
                        // Handle any exceptions
                        Console.WriteLine($"An error occurred: {ex.Message}");
                    }
                }
            }
        }
    }
}