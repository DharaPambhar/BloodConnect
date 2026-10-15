
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Drawing;

namespace BloodConnect
{
    public partial class Admin_Inventory : Page
    {
        private const string SessionKey = "AdminInventoryTable";

        protected void Page_Load(object sender, EventArgs e)
        {
            SetActiveMenu();

            if (!IsPostBack)
            {
                CreateSampleData();
                BindInventory();
            }
        }

        // Activate Inventory menu in Admin.Master
        private void SetActiveMenu()
        {
            HtmlAnchor inventoryLink =
                Master.FindControl("lnkInventory") as HtmlAnchor;

            if (inventoryLink != null)
            {
                inventoryLink.Attributes["class"] = "menu-link active";
            }
        }

        // Create sample inventory data
        private void CreateSampleData()
        {
            DataTable dt = new DataTable();

            dt.Columns.Add("InventoryID", typeof(int));
            dt.Columns.Add("BloodGroup", typeof(string));
            dt.Columns.Add("BloodBank", typeof(string));
            dt.Columns.Add("Location", typeof(string));
            dt.Columns.Add("Available", typeof(int));
            dt.Columns.Add("Reserved", typeof(int));
            dt.Columns.Add("Status", typeof(string));
            dt.Columns.Add("LastUpdated", typeof(DateTime));

            dt.Rows.Add(1, "A+", "City Blood Bank", "Ahmedabad",
                1420, 84, "Healthy", new DateTime(2026, 8, 15));

            dt.Rows.Add(2, "AB-", "Hope Blood Center", "Rajkot",
                18, 12, "Critical", new DateTime(2026, 8, 14));

            dt.Rows.Add(3, "O+", "Civil Hospital Blood Bank", "Surat",
                850, 120, "Healthy", new DateTime(2026, 8, 15));

            dt.Rows.Add(4, "B-", "Red Cross Society", "Vadodara",
                92, 18, "Low", new DateTime(2026, 8, 13));

            dt.Rows.Add(5, "A-", "City Blood Bank", "Ahmedabad",
                340, 25, "Moderate", new DateTime(2026, 8, 15));

            dt.Rows.Add(6, "B+", "Hope Blood Center", "Rajkot",
                2100, 110, "Healthy", new DateTime(2026, 8, 15));

            dt.Rows.Add(7, "O-", "Civil Hospital Blood Bank", "Surat",
                110, 20, "Low", new DateTime(2026, 8, 14));

            dt.Rows.Add(8, "AB+", "Red Cross Society", "Vadodara",
                860, 45, "Healthy", new DateTime(2026, 8, 15));

            Session[SessionKey] = dt;
        }

        // Get inventory table from session
        private DataTable GetInventoryTable()
        {
            if (Session[SessionKey] == null)
            {
                CreateSampleData();
            }

            return Session[SessionKey] as DataTable;
        }

        // Calculate stock status
        private string GetStockStatus(int available)
        {
            if (available < 50)
                return "Critical";

            if (available < 150)
                return "Low";

            if (available < 400)
                return "Moderate";

            return "Healthy";
        }

        // Bind filtered inventory to GridView
        private void BindInventory()
        {
            DataTable source = GetInventoryTable();
            DataTable filtered = source.Clone();

            string search = txtInventorySearch.Text.Trim().ToLower();
            string bloodGroup = ddlFilterGroup.SelectedValue;
            string status = ddlFilterStatus.SelectedValue;

            foreach (DataRow row in source.Rows)
            {
                string group =
                    Convert.ToString(row["BloodGroup"]);

                string bank =
                    Convert.ToString(row["BloodBank"]).ToLower();

                string location =
                    Convert.ToString(row["Location"]).ToLower();

                string currentStatus =
                    Convert.ToString(row["Status"]);

                bool matchesSearch =
                    search == "" ||
                    group.ToLower().Contains(search) ||
                    bank.Contains(search) ||
                    location.Contains(search);

                bool matchesGroup =
                    bloodGroup == "" || group == bloodGroup;

                bool matchesStatus =
                    status == "" || currentStatus == status;

                if (matchesSearch && matchesGroup && matchesStatus)
                {
                    filtered.ImportRow(row);
                }
            }

            gvInventory.DataSource = filtered;
            gvInventory.DataBind();

            lblInventoryCount.Text =
                filtered.Rows.Count + " records";

            lblInventoryMessage.Text = "";
        }

        // Search and filter event
        protected void InventoryFilter_Changed(object sender, EventArgs e)
        {
            BindInventory();
        }

        // Clear filters
        protected void lnkClearInventoryFilters_Click(
            object sender, EventArgs e)
        {
            txtInventorySearch.Text = "";
            ddlFilterGroup.SelectedIndex = 0;
            ddlFilterStatus.SelectedIndex = 0;

            BindInventory();
        }

        // Open stock update form
        protected void btnUpdateStock_Click(object sender, EventArgs e)
        {
            pnlUpdateStock.Visible = true;
            lblStockMessage.Text = "";
        }

        // Resolve critical stock alert
        protected void btnResolve_Click(object sender, EventArgs e)
        {
            DataTable dt = GetInventoryTable();
            bool found = false;

            foreach (DataRow row in dt.Rows)
            {
                if (Convert.ToString(row["BloodBank"]) == "Hope Blood Center" &&
                    Convert.ToString(row["BloodGroup"]) == "AB-")
                {
                    ddlEditBank.SelectedValue = "Hope Blood Center";
                    ddlEditGroup.SelectedValue = "AB-";

                    txtAvailableUnits.Text =
                        Convert.ToString(row["Available"]);

                    txtReservedUnits.Text =
                        Convert.ToString(row["Reserved"]);

                    found = true;
                    break;
                }
            }

            pnlUpdateStock.Visible = true;

            if (found)
            {
                lblStockMessage.ForeColor = Color.DarkRed;
                lblStockMessage.Text =
                    "Critical stock record loaded. Update the stock and save.";
            }
        }

        // Edit a selected inventory row
        protected void gvInventory_RowCommand(
            object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditStock")
            {
                int inventoryID;

                if (!int.TryParse(
                    Convert.ToString(e.CommandArgument), out inventoryID))
                {
                    return;
                }

                DataTable dt = GetInventoryTable();

                foreach (DataRow row in dt.Rows)
                {
                    if (Convert.ToInt32(row["InventoryID"]) == inventoryID)
                    {
                        ddlEditBank.SelectedValue =
                            Convert.ToString(row["BloodBank"]);

                        ddlEditGroup.SelectedValue =
                            Convert.ToString(row["BloodGroup"]);

                        txtAvailableUnits.Text =
                            Convert.ToString(row["Available"]);

                        txtReservedUnits.Text =
                            Convert.ToString(row["Reserved"]);

                        pnlUpdateStock.Visible = true;
                        lblStockMessage.Text = "";
                        break;
                    }
                }
            }
        }

        // Save updated stock
        protected void btnSaveStock_Click(object sender, EventArgs e)
        {
            int available;
            int reserved;

            if (!int.TryParse(txtAvailableUnits.Text.Trim(), out available) ||
                !int.TryParse(txtReservedUnits.Text.Trim(), out reserved) ||
                available < 0 || reserved < 0)
            {
                lblStockMessage.ForeColor = Color.DarkRed;
                lblStockMessage.Text =
                    "Enter valid non-negative numbers for available and reserved units.";
                return;
            }

            string bank = ddlEditBank.SelectedValue;
            string group = ddlEditGroup.SelectedValue;

            DataTable dt = GetInventoryTable();
            DataRow matchingRow = null;

            foreach (DataRow row in dt.Rows)
            {
                if (Convert.ToString(row["BloodBank"]) == bank &&
                    Convert.ToString(row["BloodGroup"]) == group)
                {
                    matchingRow = row;
                    break;
                }
            }

            if (matchingRow == null)
            {
                lblStockMessage.ForeColor = Color.DarkRed;
                lblStockMessage.Text =
                    "No inventory record exists for this blood bank and blood group.";
                return;
            }

            matchingRow["Available"] = available;
            matchingRow["Reserved"] = reserved;
            matchingRow["Status"] = GetStockStatus(available);
            matchingRow["LastUpdated"] = DateTime.Today;

            Session[SessionKey] = dt;

            pnlUpdateStock.Visible = false;

            lblInventoryMessage.ForeColor = Color.DarkGreen;
            lblInventoryMessage.Text =
                "Stock updated successfully for " + group +
                " at " + bank + ".";

            BindInventory();
        }

        // Cancel stock update
        protected void btnCancelStock_Click(object sender, EventArgs e)
        {
            pnlUpdateStock.Visible = false;
            lblStockMessage.Text = "";
        }

        // Apply status and number colors
        protected void gvInventory_RowDataBound(
            object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.DataRow)
                return;

            Label groupLabel =
                e.Row.FindControl("lblGroup") as Label;

            Label availableLabel =
                e.Row.FindControl("lblAvailable") as Label;

            Label statusLabel =
                e.Row.FindControl("lblStockStatus") as Label;

            if (groupLabel != null)
            {
                groupLabel.CssClass = "table-group";

                if (groupLabel.Text.Trim() == "AB-")
                {
                    groupLabel.CssClass += " table-group-critical";
                }
            }

            if (statusLabel != null)
            {
                string status = statusLabel.Text.Trim();

                statusLabel.CssClass = "status-badge";

                switch (status)
                {
                    case "Healthy":
                        statusLabel.CssClass += " status-healthy";
                        break;

                    case "Moderate":
                        statusLabel.CssClass += " status-moderate";
                        break;

                    case "Low":
                        statusLabel.CssClass += " status-low";
                        break;

                    default:
                        statusLabel.CssClass += " status-critical";
                        break;
                }
            }

            if (availableLabel != null)
            {
                int available;

                if (int.TryParse(availableLabel.Text, out available))
                {
                    availableLabel.CssClass = "available-normal";

                    if (available < 50)
                    {
                        availableLabel.CssClass = "available-critical";
                    }
                    else if (available < 150)
                    {
                        availableLabel.CssClass = "available-low";
                    }
                }
            }
        }
    }
}
