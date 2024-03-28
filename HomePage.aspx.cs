using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace IT114L_MP_CareBy
{
    public partial class HomePage : System.Web.UI.Page
    {
        private string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=""C:\Users\Christian Kerby\source\repos\IT114L-MP-CareBy\App_Data\Careby.mdf"";Integrated Security=True";
        private string usernameOrEmail;
        protected void Page_Load(object sender, EventArgs e)
        {
            pnlmodal.Visible = false;

            string usernameOrEmail = Session["UsernameOrEmail"].ToString();

            var login_User = new Login_User();
            int userID = login_User.GetUserID(usernameOrEmail);

            if (userID != -1)
            {
                var appointment = new Appointment();
                bool hasAppointments = appointment.CheckExistingAppointments(userID);

                if (hasAppointments)
                {



                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        string fetchQuery = "SELECT chosen_date, chosen_therapistName, chosen_timeBlock, visit_desc FROM Appointment_Details WHERE userID = @userID";

                        using (SqlCommand command = new SqlCommand(fetchQuery, connection))
                        {
                            command.Parameters.AddWithValue("@userID", userID);

                            try
                            {
                                connection.Open();
                                SqlDataReader reader = command.ExecuteReader();

                                if (reader.HasRows)
                                {
                                    // Loop through each row and update the HTML elements
                                    while (reader.Read())
                                    {
                                        string chosenDate = reader["chosen_date"].ToString();
                                        string chosenTherapistName = reader["chosen_therapistName"].ToString();
                                        string chosenTimeBlock = reader["chosen_timeBlock"].ToString();
                                        string visitDesc = reader["visit_desc"].ToString();

                                        // Update the HTML elements

                                        displayDate.InnerText = DateTime.Parse(chosenDate).ToString("yyyy-MM-dd");
                                        displayProvider.InnerText = chosenTherapistName;
                                        displayTime.InnerText = chosenTimeBlock;

                                    }
                                }
                                else
                                {
                                    // If no appointments found
                                    // Display a message or take other actions
                                }

                                reader.Close();
                            }
                            catch (Exception ex)
                            {
                                // Handle any exceptions
                            }
                        }
                    }
                }
                else
                {
                    // If the user has no appointments, you can display a message or take other actions
                }
            }

        }
        private int GetUserIDFromSession()
        {
            string usernameOrEmail = Session["UsernameOrEmail"]?.ToString();
            if (usernameOrEmail != null)
            {
                var login_User = new Login_User();
                return login_User.GetUserID(usernameOrEmail);
            }
            return -1;
        }


        protected void cancelBtn_Click(object sender, EventArgs e)
        {
            int userID = GetUserIDFromSession();
            if (userID != -1)
            {
                var appointment = new Appointment();
                appointment.DeleteAppointment(userID);
            }
            Response.Redirect("HomePage.aspx");
        }

        protected void startBtn2_Click(object sender, EventArgs e)
        {
            int userID = GetUserIDFromSession();
            if (userID != -1)
            {
                var appointment = new Appointment();
                bool hasAppointment = appointment.CheckExistingAppointments(userID);
                if (hasAppointment)
                {
                    // Redirect to the AppointmentVideo.aspx page
                    Response.Redirect("AppointmentVideo.aspx");
                }
                else
                {
                    // Display an alert if no appointment exists
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('You do not have any upcoming appointments.');", true);
                }
            }
        }

        protected void setAppPage(object sender, EventArgs e) // SET APPOINTMENT
        {
            Response.Redirect("~/SetAppointment.aspx");
        }

        protected void profileBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProfileForm.aspx");
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Default.aspx");
        }

        protected void btn_close_click(object sender, EventArgs e)
        {
            pnlmodal.Visible = false;
        }

        protected void view_profile_btn_click(object sender, EventArgs e)
        {
            string btnID = ((Button)sender).ID;
            int index = int.Parse(btnID.Substring(btnID.Length - 1));

            string pNameID = "provider_name_title" + index;
            string pRoleID = "provider_role" + index;

            HtmlGenericControl CtrlName = providers_container.FindControl(pNameID) as HtmlGenericControl;
            HtmlGenericControl CtrlRole = providers_container.FindControl(pRoleID) as HtmlGenericControl;

            if ((CtrlName != null && CtrlName.TagName == "p") && (CtrlRole != null && CtrlRole.TagName == "p"))
            {
                string PNameText = CtrlName.InnerText;
                modal_provider_name.InnerHtml = PNameText;

                string PRoleNameText = CtrlRole.InnerText;
                modal_provider_role.InnerHtml = PRoleNameText;
            }

            pnlmodal.Visible = true;
        }
    }
}