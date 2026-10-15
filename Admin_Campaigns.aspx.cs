
using System;
using System.Data;
using System.Globalization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BloodConnect
{
    public partial class Admin_Campaigns : System.Web.UI.Page
    {
        private DataTable Campaigns
        {
            get
            {
                if (Session["CampaignList"] == null)
                {
                    Session["CampaignList"] = CreateCampaignTable();
                }

                return (DataTable)Session["CampaignList"];
            }
            set
            {
                Session["CampaignList"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            string role = Convert.ToString(Session["Role"]);

            if (!role.Equals("Admin", StringComparison.OrdinalIgnoreCase))
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                BindCampaigns();
            }
        }

        private DataTable CreateCampaignTable()
        {
            DataTable dt = new DataTable();

            dt.Columns.Add("CampaignID");
            dt.Columns.Add("CampaignName");
            dt.Columns.Add("CampaignType");
            dt.Columns.Add("Location");
            dt.Columns.Add("CampaignDate");
            dt.Columns.Add("Donors");
            dt.Columns.Add("Units");
            dt.Columns.Add("Status");

            AddCampaign(dt, "CMP-2026-0084", "World Blood Donor Day Drive",
                "Blood Donation Camp", "Ahmedabad", "16 Aug 2026",
                "186", "142", "Active");

            AddCampaign(dt, "CMP-2026-0083", "Save Life Community Drive",
                "Community Drive", "Surat", "22 Aug 2026",
                "94", "—", "Upcoming");

            AddCampaign(dt, "CMP-2026-0082", "Emergency Blood Drive",
                "Emergency Blood Drive", "Vadodara", "14 Aug 2026",
                "128", "96", "Completed");

            AddCampaign(dt, "CMP-2026-0081", "Corporate Blood Donation Camp",
                "Corporate Drive", "Rajkot", "28 Aug 2026",
                "72", "—", "Upcoming");

            AddCampaign(dt, "CMP-2026-0079", "City Mall Blood Drive",
                "Community Drive", "Ahmedabad", "10 Aug 2026",
                "156", "124", "Completed");

            AddCampaign(dt, "CMP-2026-0078", "Tech Park Awareness",
                "Awareness Campaign", "Surat", "12 Aug 2026",
                "82", "—", "Upcoming");

            AddCampaign(dt, "CMP-2026-0077", "University Donation Camp",
                "Blood Donation Camp", "Vadodara", "08 Aug 2026",
                "145", "112", "Completed");

            return dt;
        }

        private void AddCampaign(
            DataTable dt,
            string id,
            string name,
            string type,
            string location,
            string date,
            string donors,
            string units,
            string status)
        {
            dt.Rows.Add(id, name, type, location, date,
                donors, units, status);
        }

        private void BindCampaigns()
        {
            DataTable source = Campaigns;
            DataTable filtered = source.Clone();

            string search = txtSearch.Text.Trim();
            string selectedStatus = ddlStatus.SelectedValue;
            string selectedType = ddlType.SelectedValue;

            foreach (DataRow row in source.Rows)
            {
                bool matchesSearch =
                    string.IsNullOrWhiteSpace(search) ||
                    row["CampaignID"].ToString().IndexOf(
                        search, StringComparison.OrdinalIgnoreCase) >= 0 ||
                    row["CampaignName"].ToString().IndexOf(
                        search, StringComparison.OrdinalIgnoreCase) >= 0 ||
                    row["Location"].ToString().IndexOf(
                        search, StringComparison.OrdinalIgnoreCase) >= 0;

                bool matchesStatus =
                    selectedStatus == "All" ||
                    row["Status"].ToString() == selectedStatus;

                bool matchesType =
                    selectedType == "All" ||
                    row["CampaignType"].ToString() == selectedType;

                if (matchesSearch && matchesStatus && matchesType)
                {
                    filtered.ImportRow(row);
                }
            }

            gvCampaigns.DataSource = filtered;
            gvCampaigns.DataBind();

            lblRecordCount.Text =
                "Showing " + filtered.Rows.Count + " campaigns";
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindCampaigns();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            ddlStatus.SelectedValue = "All";
            ddlType.SelectedValue = "All";

            BindCampaigns();
        }

        protected void btnCreateCampaign_Click(object sender, EventArgs e)
        {
            pnlCreateCampaign.Visible = true;
            lblFormMessage.Text = "";
        }

        protected void btnCancelCampaign_Click(object sender, EventArgs e)
        {
            pnlCreateCampaign.Visible = false;
            ClearCampaignForm();
        }

        protected void btnSaveCampaign_Click(object sender, EventArgs e)
        {
            string name = txtCampaignName.Text.Trim();
            string location = txtLocation.Text.Trim();
            string dateText = txtCampaignDate.Text.Trim();

            if (name == "" || location == "" || dateText == "")
            {
                lblFormMessage.Text =
                    "Please enter the campaign name, location and date.";
                return;
            }

            DateTime campaignDate;

            if (!DateTime.TryParseExact(
                dateText,
                "yyyy-MM-dd",
                CultureInfo.InvariantCulture,
                DateTimeStyles.None,
                out campaignDate))
            {
                lblFormMessage.Text = "Please select a valid campaign date.";
                return;
            }

            int donors;
            int units;

            if (!int.TryParse(txtDonors.Text.Trim(), out donors) ||
                !int.TryParse(txtUnits.Text.Trim(), out units) ||
                donors < 0 || units < 0)
            {
                lblFormMessage.Text =
                    "Donors and units must be valid non-negative numbers.";
                return;
            }

            string status;

            if (campaignDate.Date > DateTime.Today)
            {
                status = "Upcoming";
            }
            else if (campaignDate.Date < DateTime.Today)
            {
                status = "Completed";
            }
            else
            {
                status = "Active";
            }

            DataTable dt = Campaigns;

            int nextNumber = 78 + dt.Rows.Count;

            string newID = "CMP-2026-" + nextNumber.ToString("D4");

            AddCampaign(
                dt,
                newID,
                name,
                ddlNewType.SelectedValue,
                location,
                campaignDate.ToString("dd MMM yyyy", CultureInfo.InvariantCulture),
                donors.ToString(),
                units.ToString(),
                status
            );

            Campaigns = dt;

            pnlCreateCampaign.Visible = false;
            ClearCampaignForm();

            txtSearch.Text = "";
            ddlStatus.SelectedValue = "All";
            ddlType.SelectedValue = "All";

            BindCampaigns();

            lblRecordCount.Text =
                "Campaign created successfully. ID: " + newID;
        }

        private void ClearCampaignForm()
        {
            txtCampaignName.Text = "";
            txtLocation.Text = "";
            txtCampaignDate.Text = "";
            txtDonors.Text = "0";
            txtUnits.Text = "0";
            ddlNewType.SelectedIndex = 0;
            lblFormMessage.Text = "";
        }

        protected void gvCampaigns_RowDataBound(
            object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblStatus =
                    e.Row.FindControl("lblStatus") as Label;

                if (lblStatus != null)
                {
                    switch (lblStatus.Text)
                    {
                        case "Active":
                            lblStatus.CssClass = "status-badge status-active";
                            lblStatus.Text = "● Active";
                            break;

                        case "Upcoming":
                            lblStatus.CssClass = "status-badge status-upcoming";
                            lblStatus.Text = "● Upcoming";
                            break;

                        default:
                            lblStatus.CssClass = "status-badge status-completed";
                            lblStatus.Text = "Completed";
                            break;
                    }
                }
            }
        }

        protected void btnAction_Click(object sender, EventArgs e)
        {
            Button button = sender as Button;

            if (button == null)
            {
                return;
            }

            string campaignID = button.CommandArgument;

            foreach (DataRow row in Campaigns.Rows)
            {
                if (row["CampaignID"].ToString() == campaignID)
                {
                    lblRecordCount.Text =
                        "Selected: " + row["CampaignName"] +
                        " | ID: " + campaignID +
                        " | Location: " + row["Location"] +
                        " | Date: " + row["CampaignDate"] +
                        " | Status: " + row["Status"];

                    return;
                }
            }
        }
    }
}
