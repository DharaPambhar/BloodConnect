using System;

namespace WebApplication1
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void LOGIN_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                // Login successful
                Session["User"] = EMAILTXT.Text;

                // Open Donor Dashboard
                Response.Redirect("DonorDashboard.aspx");
            }
        }
    }
}