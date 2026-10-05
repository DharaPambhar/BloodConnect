using System;

namespace BloodConnect
{
    public partial class User_RequestStatus : System.Web.UI.Page
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
                LoadRequestStatus();
            }
        }

        private void LoadRequestStatus()
        {
            // Request status information is currently
            // displayed for UI/design purposes.
            // Database functionality can be connected later.
        }
    }
}