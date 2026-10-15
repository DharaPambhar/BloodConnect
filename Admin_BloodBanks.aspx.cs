
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Drawing;

namespace BloodConnect
{
    public partial class Admin_BloodBanks : Page
    {
        private const string SessionKey = "AdminBloodBanksTable";

        protected void Page_Load(object sender, EventArgs e)
        {
            SetActiveMenu();

            if (!IsPostBack)
            {
                CreateSampleData();
                BindBloodBanks();
            }
        }

        private void SetActiveMenu()
        {
            HtmlAnchor link =
                Master.FindControl("lnkBloodBanks") as HtmlAnchor;

            if (link != null)
                link.Attributes["class"] = "menu-link active";
        }

        private void CreateSampleData()
        {
            DataTable dt = new DataTable();

            dt.Columns.Add("BankName", typeof(string));
            dt.Columns.Add("Phone", typeof(string));
            dt.Columns.Add("BankID", typeof(string));
            dt.Columns.Add("Type", typeof(string));
            dt.Columns.Add("Location", typeof(string));
            dt.Columns.Add("Units", typeof(int));
            dt.Columns.Add("StockStatus", typeof(string));
            dt.Columns.Add("Status", typeof(string));

            dt.Rows.Add("City Blood Bank", "+91 98765 43210",
                "BB-10048", "Government", "Ahmedabad",
                1842, "Healthy", "Active");

            dt.Rows.Add("LifeCare Blood Bank", "+91 98765 32111",
                "BB-10047", "Private", "Surat",
                1264, "Healthy", "Active");

            dt.Rows.Add("Hope Blood Center", "+91 98765 43212",
                "BB-10046", "NGO", "Rajkot",
                486, "Low", "Active");

            dt.Rows.Add("Civil Hospital Blood Bank", "+91 98765 43213",
                "BB-10045", "Hospital", "Vadodara",
                182, "Critical", "Active");

            Session[SessionKey] = dt;
        }

        private DataTable GetBloodBanksTable()
        {
            if (Session[SessionKey] == null)
                CreateSampleData();

            return Session[SessionKey] as DataTable;
        }

        private string GetStockStatus(int units)
        {
            if (units < 200)
                return "Critical";

            if (units < 600)
                return "Low";

            return "Healthy";
        }

        private void BindBloodBanks()
        {
            DataTable source = GetBloodBanksTable();
            DataTable filtered = source.Clone();

            string search = txtBankSearch.Text.Trim().ToLower();
            string status = ddlStatusFilter.SelectedValue;
            string type = ddlTypeFilter.SelectedValue;
            string location = ddlLocationFilter.SelectedValue;

            foreach (DataRow row in source.Rows)
            {
                string name = Convert.ToString(row["BankName"]).ToLower();
                string bankID = Convert.ToString(row["BankID"]).ToLower();
                string city = Convert.ToString(row["Location"]).ToLower();
                string phone = Convert.ToString(row["Phone"]).ToLower();

                bool matchesSearch =
                    search == "" ||
                    name.Contains(search) ||
                    bankID.Contains(search) ||
                    city.Contains(search) ||
                    phone.Contains(search);

                bool matchesStatus =
                    status == "" ||
                    Convert.ToString(row["Status"]) == status;

                bool matchesType =
                    type == "" ||
                    Convert.ToString(row["Type"]) == type;

                bool matchesLocation =
                    location == "" ||
                    Convert.ToString(row["Location"]) == location;

                if (matchesSearch && matchesStatus &&
                    matchesType && matchesLocation)
                {
                    filtered.ImportRow(row);
                }
            }

            gvBloodBanks.DataSource = filtered;
            gvBloodBanks.DataBind();

            lblBankCount.Text = filtered.Rows.Count + " records";
            lblBankMessage.Text = "";
        }

        protected void BankFilter_Changed(object sender, EventArgs e)
        {
            BindBloodBanks();
        }

        protected void lnkClearFilters_Click(object sender, EventArgs e)
        {
            txtBankSearch.Text = "";
            ddlStatusFilter.SelectedIndex = 0;
            ddlTypeFilter.SelectedIndex = 0;
            ddlLocationFilter.SelectedIndex = 0;

            BindBloodBanks();
        }

        protected void btnAddBloodBank_Click(object sender, EventArgs e)
        {
            pnlAddBloodBank.Visible = true;
            lblFormMessage.Text = "";
        }

        protected void btnCancelBank_Click(object sender, EventArgs e)
        {
            pnlAddBloodBank.Visible = false;
            lblFormMessage.Text = "";
        }

        protected void btnSaveBank_Click(object sender, EventArgs e)
        {
            string name = txtBankName.Text.Trim();
            string phone = txtBankPhone.Text.Trim();
            string bankID = txtBankID.Text.Trim();
            string location = txtBankLocation.Text.Trim();

            int units;

            if (name == "" || phone == "" || bankID == "" || location == "")
            {
                lblFormMessage.ForeColor = Color.DarkRed;
                lblFormMessage.Text = "Please fill in all blood bank details.";
                return;
            }

            if (!int.TryParse(txtBankUnits.Text.Trim(), out units) || units < 0)
            {
                lblFormMessage.ForeColor = Color.DarkRed;
                lblFormMessage.Text = "Enter a valid non-negative number of blood units.";
                return;
            }

            DataTable dt = GetBloodBanksTable();

            foreach (DataRow existing in dt.Rows)
            {
                if (Convert.ToString(existing["BankID"])
                    .Equals(bankID, StringComparison.OrdinalIgnoreCase))
                {
                    lblFormMessage.ForeColor = Color.DarkRed;
                    lblFormMessage.Text = "This Bank ID already exists.";
                    return;
                }
            }

            string stockStatus = GetStockStatus(units);

            dt.Rows.Add(
                name,
                phone,
                bankID,
                ddlNewType.SelectedValue,
                location,
                units,
                stockStatus,
                ddlNewStatus.SelectedValue
            );

            Session[SessionKey] = dt;

            txtBankName.Text = "";
            txtBankPhone.Text = "";
            txtBankID.Text = "";
            txtBankLocation.Text = "";
            txtBankUnits.Text = "";

            pnlAddBloodBank.Visible = false;

            lblBankMessage.ForeColor = Color.DarkGreen;
            lblBankMessage.Text =
                "Blood bank " + name + " was added successfully.";

            BindBloodBanks();
        }

        protected void gvBloodBanks_RowCommand(
            object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewBank")
            {
                string bankID = Convert.ToString(e.CommandArgument);
                DataTable dt = GetBloodBanksTable();

                foreach (DataRow row in dt.Rows)
                {
                    if (Convert.ToString(row["BankID"]) == bankID)
                    {
                        lblBankMessage.ForeColor = Color.DarkSlateBlue;
                        lblBankMessage.Text =
                            "Selected: " + Convert.ToString(row["BankName"]) +
                            " | ID: " + bankID +
                            " | Location: " + Convert.ToString(row["Location"]) +
                            " | Status: " + Convert.ToString(row["Status"]);
                        break;
                    }
                }
            }
        }

        protected void gvBloodBanks_RowDataBound(
            object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.DataRow)
                return;

            Label stockLabel =
                e.Row.FindControl("lblStockStatus") as Label;

            Label statusLabel =
                e.Row.FindControl("lblStatus") as Label;

            if (stockLabel != null)
            {
                string stock = stockLabel.Text.Trim();
                stockLabel.CssClass = "stock-badge";

                switch (stock)
                {
                    case "Healthy":
                        stockLabel.CssClass += " stock-healthy";
                        break;

                    case "Low":
                        stockLabel.CssClass += " stock-low";
                        break;

                    default:
                        stockLabel.CssClass += " stock-critical";
                        break;
                }
            }

            if (statusLabel != null)
            {
                string status = statusLabel.Text.Trim();

                switch (status)
                {
                    case "Active":
                        statusLabel.CssClass = "status-badge bank-active";
                        break;

                    case "Pending":
                        statusLabel.CssClass = "status-badge bank-pending";
                        break;

                    default:
                        statusLabel.CssClass = "status-badge bank-inactive";
                        break;
                }
            }
        }
    }
}
