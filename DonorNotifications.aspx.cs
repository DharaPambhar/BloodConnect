using System;

namespace WebApplication1
{
    public partial class DonorNotifications : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Notifications Page
            }
        }

        protected void btnMarkAllRead_Click(object sender, EventArgs e)
        {
            lblMessage.Text =
                "All notifications have been marked as read.";
        }
    }
}