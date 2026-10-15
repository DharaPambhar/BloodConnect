
using System;
using System.IO;
using System.Web.UI;

namespace BloodConnect
{
    public partial class Admin : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check login
            if (Session["User"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            // Check admin role
            string role = Convert.ToString(Session["Role"]);

            if (!role.Equals("Admin",
                StringComparison.OrdinalIgnoreCase))
            {
                Response.Redirect("Login.aspx");
                return;
            }

            // Automatically highlight current page
            SetActiveMenu();

            // Admin profile
            if (!IsPostBack)
            {
                string firstName =
                    Convert.ToString(Session["FirstName"]);

                string lastName =
                    Convert.ToString(Session["LastName"]);

                if (string.IsNullOrWhiteSpace(firstName))
                {
                    firstName = "Admin";
                }

                string fullName =
                    (firstName + " " + lastName).Trim();

                if (string.IsNullOrWhiteSpace(fullName))
                {
                    fullName = "Admin";
                }

                lblAdminName.Text = Server.HtmlEncode(fullName);

                lblAdminInitial.Text = Server.HtmlEncode(
                    firstName.Substring(0, 1).ToUpper());
            }
        }

        private void SetActiveMenu()
        {
            string currentPage = Path.GetFileName(
                Request.Url.AbsolutePath
            ).ToLowerInvariant();

            // Reset all menu links
            lnkDashboard.Attributes["class"] = "menu-link";
            lnkUsers.Attributes["class"] = "menu-link";
            lnkDonors.Attributes["class"] = "menu-link";
            lnkRequests.Attributes["class"] = "menu-link";
            lnkInventory.Attributes["class"] = "menu-link";
            lnkBloodBanks.Attributes["class"] = "menu-link";
            lnkAppointments.Attributes["class"] = "menu-link";
            lnkHospitals.Attributes["class"] = "menu-link";
            lnkCampaigns.Attributes["class"] = "menu-link";
            lnkSettings.Attributes["class"] = "menu-link";
            lnkLogout.Attributes["class"] = "menu-link logout-link";

            // Activate matching page
            switch (currentPage)
            {
                case "admin_dashboard.aspx":
                    lnkDashboard.Attributes["class"] = "menu-link active";
                    break;

                case "admin_users.aspx":
                    lnkUsers.Attributes["class"] = "menu-link active";
                    break;

                case "admin_donors.aspx":
                    lnkDonors.Attributes["class"] = "menu-link active";
                    break;

                case "admin_requests.aspx":
                    lnkRequests.Attributes["class"] = "menu-link active";
                    break;

                case "admin_inventory.aspx":
                    lnkInventory.Attributes["class"] = "menu-link active";
                    break;

                case "admin_bloodbanks.aspx":
                    lnkBloodBanks.Attributes["class"] = "menu-link active";
                    break;

                case "admin_appointments.aspx":
                    lnkAppointments.Attributes["class"] = "menu-link active";
                    break;

                case "admin_hospitals.aspx":
                    lnkHospitals.Attributes["class"] = "menu-link active";
                    break;

                case "admin_campaigns.aspx":
                    lnkCampaigns.Attributes["class"] = "menu-link active";
                    break;

                

                case "admin_settings.aspx":
                    lnkSettings.Attributes["class"] = "menu-link active";
                    break;
            }
        }
    }
}
