
using System;

namespace BloodConnect
{
    public partial class User : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check Login
            if (Session["User"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            // Load User Information
            if (!IsPostBack)
            {
                string firstName =
                    Convert.ToString(Session["FirstName"]);

                string lastName =
                    Convert.ToString(Session["LastName"]);

                // Default Name
                if (string.IsNullOrWhiteSpace(firstName))
                {
                    firstName = "User";
                }

                // Full Name
                string fullName =
                    (firstName + " " + lastName).Trim();

                if (string.IsNullOrWhiteSpace(fullName))
                {
                    fullName = "User";
                }

                // Display Name
                lblUserName.Text = fullName;

                // Display First Letter
                lblUserInitial.Text =
                    firstName.Substring(0, 1).ToUpper();
            }
        }

        // Active Sidebar Menu
        public string GetActiveClass(string pageName)
        {
            string currentPage =
                System.IO.Path.GetFileName(
                    Request.Url.AbsolutePath);

            if (currentPage.Equals(
                pageName,
                StringComparison.OrdinalIgnoreCase))
            {
                return "menu-link active";
            }

            return "menu-link";
        }
    }
}
