using System;

namespace BloodConnect
{
    public partial class User_RequestDetails : System.Web.UI.Page
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
                LoadRequestDetails();
            }
        }

        private void LoadRequestDetails()
        {
            // Request details are currently displayed
            // for UI/design purposes.
            // Database functionality can be connected later.
        }
    }
}