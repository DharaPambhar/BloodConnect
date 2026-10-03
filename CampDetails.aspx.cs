using System;

namespace WebApplication1
{
    public partial class CampDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Camp Details Page
            }
        }

        protected void btnBookTop_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookDonationSlot.aspx");
        }

        protected void btnBookBottom_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookDonationSlot.aspx");
        }

        protected void btnShare_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "Camp details are ready to share.";
        }
    }
}