using System;

namespace WebApplication1
{
    public partial class NearbyEmergency : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Nearby Emergency Requests page
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";

            ddlBloodGroup.SelectedIndex = 0;
            ddlDistance.SelectedIndex = 0;
            ddlUrgency.SelectedIndex = 0;
            ddlRequestType.SelectedIndex = 0;
        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
            // Filter functionality can be connected with database later.
        }
    }
}