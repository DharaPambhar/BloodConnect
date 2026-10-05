
using System;

namespace BloodConnect
{
    public partial class User_NearbyEmergency : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadEmergencyData();
            }
        }


        private void LoadEmergencyData()
        {
            // Emergency request data is currently
            // displayed for UI/design purposes.
            // Database functionality can be connected later.
        }


        protected void btnCreateEmergency_Click(
            object sender,
            EventArgs e)
        {
            // Emergency request submission
            // can be connected with database later.
        }
    }
}
