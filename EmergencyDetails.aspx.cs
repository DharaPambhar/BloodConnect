using System;

namespace WebApplication1
{
    public partial class EmergencyDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Emergency Request Details page
            }
        }

        protected void btnRespond_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "Your response has been recorded. The hospital will contact you for final confirmation.";
        }

        protected void btnNotAvailable_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "Thank you for responding. Your availability has been marked as unavailable.";
        }
    }
}