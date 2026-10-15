
using System;
using System.Data;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace BloodConnect
{
    public partial class Admin_Donors : Page
    {
        private DataTable DonorsTable
        {
            get
            {
                if (Session["AdminDonorsTable"] == null)
                    Session["AdminDonorsTable"] = CreateSampleDonors();

                return (DataTable)Session["AdminDonorsTable"];
            }
            set { Session["AdminDonorsTable"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // Keep the Donors item active in the shared Admin sidebar.
            HtmlAnchor donorLink = Master.FindControl("lnkDonors") as HtmlAnchor;

            if (donorLink != null)
                donorLink.Attributes["class"] = "menu-link active";

            if (!IsPostBack)
                BindDonors();
        }

        private DataTable CreateSampleDonors()
        {
            DataTable table = new DataTable();

            table.Columns.Add("DonorID", typeof(string));
            table.Columns.Add("Name", typeof(string));
            table.Columns.Add("Email", typeof(string));
            table.Columns.Add("BloodGroup", typeof(string));
            table.Columns.Add("Location", typeof(string));
            table.Columns.Add("Availability", typeof(string));
            table.Columns.Add("Verification", typeof(string));
            table.Columns.Add("Initials", typeof(string));

            table.Rows.Add("DON-8823", "Rahul Shah", "rahul.s@example.com",
                "O+", "Mumbai, MH", "Available", "Verified", "RS");

            table.Rows.Add("DON-8824", "Priya Patel", "p.patel@example.com",
                "A+", "Delhi, DL", "Available", "Verified", "PP");

            table.Rows.Add("DON-8825", "Amit Kumar", "amit.k99@example.com",
                "B+", "Bangalore, KA", "Unavailable", "Pending", "AK");

            table.Rows.Add("DON-8826", "Neha Mehta", "neha.m@example.com",
                "O-", "Pune, MH", "Available", "Verified", "NM");

            return table;
        }

        private void BindDonors()
        {
            DataTable source = DonorsTable;
            DataTable filtered = source.Clone();

            string search = txtDonorSearch.Text.Trim().ToLower();
            string blood = ddlBloodFilter.SelectedValue;
            string availability = ddlAvailabilityFilter.SelectedValue;
            string location = ddlLocationFilter.SelectedValue;
            string verification = ddlVerificationFilter.SelectedValue;

            foreach (DataRow row in source.Rows)
            {
                bool matchSearch =
                    search == "" ||
                    row["Name"].ToString().ToLower().Contains(search) ||
                    row["Email"].ToString().ToLower().Contains(search) ||
                    row["DonorID"].ToString().ToLower().Contains(search);

                bool matchBlood =
                    blood == "ALL" || row["BloodGroup"].ToString() == blood;

                bool matchAvailability =
                    availability == "ALL" ||
                    row["Availability"].ToString() == availability;

                bool matchLocation =
                    location == "ALL" || row["Location"].ToString() == location;

                bool matchVerification =
                    verification == "ALL" ||
                    row["Verification"].ToString() == verification;

                if (matchSearch && matchBlood && matchAvailability &&
                    matchLocation && matchVerification)
                {
                    filtered.ImportRow(row);
                }
            }

            gvDonors.DataSource = filtered;
            gvDonors.DataBind();

            lblDonorBadge.Text = filtered.Rows.Count + " donors";
            lblShowingDonors.Text = "Showing " + filtered.Rows.Count + " donors";
        }

        protected void FilterDonors_Changed(object sender, EventArgs e)
        {
            lblDonorMessage.Text = "";
            BindDonors();
        }

        protected void btnRefreshDonors_Click(object sender, EventArgs e)
        {
            ClearFilters();
            lblDonorMessage.Text = "";
            BindDonors();
        }

        private void ClearFilters()
        {
            txtDonorSearch.Text = "";
            ddlBloodFilter.SelectedValue = "ALL";
            ddlAvailabilityFilter.SelectedValue = "ALL";
            ddlLocationFilter.SelectedValue = "ALL";
            ddlVerificationFilter.SelectedValue = "ALL";
        }

        protected void btnMoreFilters_Click(object sender, EventArgs e)
        {
            pnlMoreFilters.Visible = !pnlMoreFilters.Visible;
        }

        protected void btnClearFilters_Click(object sender, EventArgs e)
        {
            ClearFilters();
            BindDonors();
        }

        protected void gvDonors_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label availability =
                    e.Row.FindControl("lblAvailability") as Label;

                Label verification =
                    e.Row.FindControl("lblVerification") as Label;

                if (availability != null)
                {
                    availability.CssClass =
                        availability.Text == "Available"
                        ? "donor-status availability-yes"
                        : "donor-status availability-no";
                }

                if (verification != null)
                {
                    verification.CssClass =
                        verification.Text == "Verified"
                        ? "donor-status verify-yes"
                        : "donor-status verify-pending";
                }
            }
        }

        protected void ddlDonorAction_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList action = sender as DropDownList;
            GridViewRow gridRow = action.NamingContainer as GridViewRow;

            if (action == null || gridRow == null || action.SelectedValue == "")
                return;

            string donorID = gvDonors.DataKeys[gridRow.RowIndex].Value.ToString();
            DataTable table = DonorsTable;

            DataRow[] rows = table.Select(
                "DonorID = '" + donorID.Replace("'", "''") + "'");

            if (rows.Length > 0)
            {
                if (action.SelectedValue == "Verify")
                    rows[0]["Verification"] = "Verified";
                else if (action.SelectedValue == "Available")
                    rows[0]["Availability"] = "Available";
                else if (action.SelectedValue == "Unavailable")
                    rows[0]["Availability"] = "Unavailable";
            }

            DonorsTable = table;
            lblDonorMessage.Text = "Donor details updated.";
            BindDonors();
        }

        protected void btnAddDonor_Click(object sender, EventArgs e)
        {
            pnlAddDonor.Visible = true;
            lblAddMessage.Text = "";
        }

        protected void btnCancelDonor_Click(object sender, EventArgs e)
        {
            pnlAddDonor.Visible = false;
            lblAddMessage.Text = "";
        }

        protected void btnSaveDonor_Click(object sender, EventArgs e)
        {
            string name = txtDonorName.Text.Trim();
            string email = txtDonorEmail.Text.Trim();
            string location = txtDonorLocation.Text.Trim();

            if (name == "" || email == "" || location == "")
            {
                lblAddMessage.ForeColor = System.Drawing.Color.Firebrick;
                lblAddMessage.Text = "Please fill in the name, email and location.";
                return;
            }

            DataTable table = DonorsTable;

            bool emailExists = table.AsEnumerable().Any(
                row => row.Field<string>("Email").Equals(
                    email, StringComparison.OrdinalIgnoreCase));

            if (emailExists)
            {
                lblAddMessage.ForeColor = System.Drawing.Color.Firebrick;
                lblAddMessage.Text = "This email already exists in the sample list.";
                return;
            }

            int nextNumber = 8823;

            foreach (DataRow row in table.Rows)
            {
                string id = row["DonorID"].ToString();

                if (id.StartsWith("DON-"))
                {
                    int number;

                    if (int.TryParse(id.Substring(4), out number) &&
                        number >= nextNumber)
                    {
                        nextNumber = number + 1;
                    }
                }
            }

            string initials = string.Join("",
                name.Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries)
                    .Take(2)
                    .Select(part => part.Substring(0, 1).ToUpper()));

            table.Rows.Add(
                "DON-" + nextNumber,
                name,
                email,
                ddlNewBlood.SelectedValue,
                location,
                ddlNewAvailability.SelectedValue,
                "Pending",
                initials
            );

            DonorsTable = table;

            txtDonorName.Text = "";
            txtDonorEmail.Text = "";
            txtDonorLocation.Text = "";
            pnlAddDonor.Visible = false;

            lblDonorMessage.Text = "Donor added successfully. Verification is pending.";
            BindDonors();
        }
    }
}
