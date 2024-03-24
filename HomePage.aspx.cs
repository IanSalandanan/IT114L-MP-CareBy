using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace IT114L_MP_CareBy
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            pnlmodal.Visible = false;

            if (!IsPostBack)
            {

            }
        }

        //protected void Appointment_Calendar_SelectionChanged(object sender, EventArgs e)
        //{
        //    SelectedDateLabel.Text = "Selected Date: " + Appointment_Calendar.SelectedDate.ToShortDateString();
        //}

        protected void btn_close_click(object sender, EventArgs e)
        {
            pnlmodal.Visible = false;
        }

        protected void see_profile_btn_click(object sender, EventArgs e)
        {
            string btnID = ((Button)sender).ID; // see_profile_btn5
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

        protected void profileBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProfileForm");
        }
    }
}