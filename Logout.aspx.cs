using System;

namespace WebApplication1
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Logout confirmation page
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            string role = Convert.ToString(Session["Role"]);

            if (role == "Donor")
            {
                Response.Redirect("DonorDashboard.aspx");
            }
            else if (role == "Blood Seeker")
            {
                Response.Redirect("User_Dashboard.aspx");
            }
            else if (role == "Admin")
            {
                Response.Redirect("AdminDashboard.aspx");
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnConfirmLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("Login.aspx");
        }
    }
}