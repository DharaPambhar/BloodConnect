using System;

namespace BloodConnect
{
    public partial class User_CreateRequest : System.Web.UI.Page
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
                LoadRequestData();
            }
        }

        private void LoadRequestData()
        {
            // Blood request data is currently displayed
            // for UI/design purposes.
            // Database functionality can be connected later.
        }

        protected void btnSubmitRequest_Click(object sender, EventArgs e)
        {
            // Blood request submission can be connected
            // with the database later.
        }
    }
}