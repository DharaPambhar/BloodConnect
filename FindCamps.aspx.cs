using System;

namespace WebApplication1
{
    public partial class FindCamps : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Find Donation Camps page
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";

            ddlDate.SelectedIndex = 0;
            ddlDistance.SelectedIndex = 0;
            ddlCampType.SelectedIndex = 0;
            ddlBloodGroup.SelectedIndex = 0;
            ddlAvailability.SelectedIndex = 0;
        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
            // Filter functionality can be connected with database later.
        }
    }
}