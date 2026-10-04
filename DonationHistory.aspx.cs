using System;

namespace WebApplication1
{
    public partial class DonationHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Donation History Page
            }
        }

        protected void btnCancelBooking_Click(object sender, EventArgs e)
        {
            lblBookingMessage.Text =
                "Your upcoming donation booking has been cancelled.";
        }

        protected void btnUpcomingDetails_Click(object sender, EventArgs e)
        {
            Response.Redirect("CampDetails.aspx");
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            // Filter functionality can be connected with database later.
        }
    }
}