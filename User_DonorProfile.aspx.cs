
using System;

namespace BloodConnect
{
    public partial class User_DonorProfile : System.Web.UI.Page
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
                LoadDonorProfile();
            }
        }


        private void LoadDonorProfile()
        {
            // Donor data is currently static for UI design.
            // Database connection can be added later.
        }
    }
}
