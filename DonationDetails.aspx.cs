using System;

namespace WebApplication1
{
    public partial class DonationDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Donation Details Page
            }
        }

        protected void btnCertificateTop_Click(object sender, EventArgs e)
        {
            lblMessage.Text =
                "Certificate download will be available soon.";
        }

        protected void btnReceiptTop_Click(object sender, EventArgs e)
        {
            lblMessage.Text =
                "Receipt download will be available soon.";
        }

        protected void btnContactCamp_Click(object sender, EventArgs e)
        {
            lblCampMessage.Text =
                "Camp contact: +91 79 4000 1234";
        }

        protected void btnViewCertificate_Click(object sender, EventArgs e)
        {
            lblMessage.Text =
                "Certificate details are displayed for this donation.";
        }

        protected void btnDownloadCertificate_Click(object sender, EventArgs e)
        {
            lblMessage.Text =
                "Certificate PDF download will be available soon.";
        }

        protected void btnDownloadReceipt_Click(object sender, EventArgs e)
        {
            lblMessage.Text =
                "Receipt download will be available soon.";
        }
    }
}