using System;

namespace BloodConnect
{
    public partial class User_Notifications : System.Web.UI.Page
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
                LoadNotifications();
            }
        }

        private void LoadNotifications()
        {
            // Notification data is currently displayed
            // for UI/design purposes.
            // Database functionality can be connected later.
        }

        protected void btnMarkAllRead_Click(object sender, EventArgs e)
        {
            // Mark all notifications as read
            // can be connected with database later.
        }
    }
}