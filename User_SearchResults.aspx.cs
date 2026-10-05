
using System;

namespace BloodConnect
{
    public partial class User_SearchResults : System.Web.UI.Page
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
                LoadSearchData();
            }
        }


        private void LoadSearchData()
        {
            string bloodGroup =
                Convert.ToString(Session["SearchBloodGroup"]);

            string location =
                Convert.ToString(Session["SearchLocation"]);

            string radius =
                Convert.ToString(Session["SearchRadius"]);


            if (string.IsNullOrWhiteSpace(bloodGroup))
            {
                bloodGroup = "O+";
            }

            if (string.IsNullOrWhiteSpace(location))
            {
                location = "Ahmedabad";
            }

            if (string.IsNullOrWhiteSpace(radius))
            {
                radius = "10";
            }
        }


        protected void btnApplyFilters_Click(
            object sender,
            EventArgs e)
        {
            // Filter functionality can be connected
            // with database later.
        }


        protected void btnReset_Click(
            object sender,
            EventArgs e)
        {
            Session["SearchBloodGroup"] = "O+";
            Session["SearchLocation"] = "Ahmedabad";
            Session["SearchRadius"] = "10";

            Response.Redirect("User_SearchResults.aspx");
        }


        protected void ddlSort_SelectedIndexChanged(
            object sender,
            EventArgs e)
        {
            // Sorting functionality can be connected
            // with database later.
        }
    }
}