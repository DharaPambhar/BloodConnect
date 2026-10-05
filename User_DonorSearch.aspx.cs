
using System;

namespace BloodConnect
{
    public partial class User_DonorSearch : System.Web.UI.Page
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
                ddlBloodGroup.SelectedValue = "O+";
                ddlRadius.SelectedValue = "10";
            }
        }


        protected void btnAvailable_Click(object sender, EventArgs e)
        {
            btnAvailable.CssClass = "availability-btn active";
            btnSoon.CssClass = "availability-btn";
            btnAny.CssClass = "availability-btn";
        }


        protected void btnSoon_Click(object sender, EventArgs e)
        {
            btnAvailable.CssClass = "availability-btn";
            btnSoon.CssClass = "availability-btn active";
            btnAny.CssClass = "availability-btn";
        }


        protected void btnAny_Click(object sender, EventArgs e)
        {
            btnAvailable.CssClass = "availability-btn";
            btnSoon.CssClass = "availability-btn";
            btnAny.CssClass = "availability-btn active";
        }


        protected void btnReset_Click(object sender, EventArgs e)
        {
            ddlBloodGroup.SelectedValue = "O+";
            txtLocation.Text = "Ahmedabad, Gujarat";
            ddlRadius.SelectedValue = "10";

            btnAvailable.CssClass = "availability-btn active";
            btnSoon.CssClass = "availability-btn";
            btnAny.CssClass = "availability-btn";

            Response.Write(
                "<script>alert('Search filters have been reset.');</script>"
            );
        }


        protected void btnFindDonors_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(ddlBloodGroup.SelectedValue))
            {
                Response.Write(
                    "<script>alert('Please select a blood group.');</script>"
                );

                return;
            }

            Session["SearchBloodGroup"] = ddlBloodGroup.SelectedValue;
            Session["SearchLocation"] = txtLocation.Text.Trim();
            Session["SearchRadius"] = ddlRadius.SelectedValue;

            Response.Redirect("User_SearchResults.aspx");
        }


        protected void btnClearRecent_Click(object sender, EventArgs e)
        {
            Response.Write(
                "<script>alert('Recent searches cleared.');</script>"
            );
        }
    }
}