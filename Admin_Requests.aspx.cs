using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace BloodConnect
{
    public partial class Admin_Requests : Page
    {
        private const string SessionKey = "AdminBloodRequestsTable";

        protected void Page_Load(object sender, EventArgs e)
        {
            SetActiveMenu();

            if (!IsPostBack)
            {
                CreateSampleData();
                BindRequests();
            }
        }

        private void SetActiveMenu()
        {
            HtmlAnchor requestsLink = Master.FindControl("lnkRequests") as HtmlAnchor;

            if (requestsLink != null)
            {
                requestsLink.Attributes["class"] = "menu-link active";
            }
        }

        private DataTable GetRequestsTable()
        {
            if (Session[SessionKey] == null)
            {
                CreateSampleData();
            }

            return Session[SessionKey] as DataTable;
        }

        private void CreateSampleData()
        {
            DataTable dt = new DataTable();

            dt.Columns.Add("RequestID", typeof(string));
            dt.Columns.Add("Patient", typeof(string));
            dt.Columns.Add("BloodGroup", typeof(string));
            dt.Columns.Add("Units", typeof(int));
            dt.Columns.Add("Hospital", typeof(string));
            dt.Columns.Add("Location", typeof(string));
            dt.Columns.Add("Urgency", typeof(string));
            dt.Columns.Add("Status", typeof(string));
            dt.Columns.Add("RequestDate", typeof(DateTime));

            dt.Rows.Add("BR-2026-001248", "Rahul Shah", "O+", 2,
                "City Care Hospital", "Ahmedabad", "Critical", "Active",
                new DateTime(2024, 10, 24));

            dt.Rows.Add("BR-2026-001247", "Priya Patel", "A+", 3,
                "LifeCare Hospital", "Surat", "High", "Pending",
                new DateTime(2024, 10, 24));

            dt.Rows.Add("BR-2026-001246", "Amit Kumar", "B+", 1,
                "City Hospital", "Vadodara", "Medium", "Fulfilled",
                new DateTime(2024, 10, 23));

            dt.Rows.Add("BR-2026-001245", "Neha Mehta", "O-", 2,
                "Civil Hospital", "Rajkot", "Critical", "Cancelled",
                new DateTime(2024, 10, 23));

            dt.Rows.Add("BR-2026-001244", "Suresh Raina", "B-", 4,
                "Apollo Hospital", "Chennai", "High", "Fulfilled",
                new DateTime(2024, 10, 22));

            dt.Rows.Add("BR-2026-001243", "Vikram Singh", "AB+", 2,
                "Fortis Hospital", "Delhi", "Critical", "Active",
                new DateTime(2024, 10, 22));

            dt.Rows.Add("BR-2026-001242", "Anjali Sharma", "O+", 1,
                "Max Healthcare", "Mumbai", "Medium", "Pending",
                new DateTime(2024, 10, 21));

            Session[SessionKey] = dt;
        }

        private void BindRequests()
        {
            DataTable source = GetRequestsTable();
            DataTable filtered = source.Clone();

            string search = txtSearch.Text.Trim().ToLower();
            string bloodGroup = ddlBloodGroup.SelectedValue.Trim();
            string status = ddlStatus.SelectedValue.Trim();
            string urgency = ddlUrgency.SelectedValue.Trim();

            foreach (DataRow row in source.Rows)
            {
                string requestId = Convert.ToString(row["RequestID"]).ToLower();
                string patient = Convert.ToString(row["Patient"]).ToLower();
                string hospital = Convert.ToString(row["Hospital"]).ToLower();
                string location = Convert.ToString(row["Location"]).ToLower();

                bool matchesSearch =
                    search == "" ||
                    requestId.Contains(search) ||
                    patient.Contains(search) ||
                    hospital.Contains(search) ||
                    location.Contains(search);

                bool matchesBloodGroup =
                    bloodGroup == "" ||
                    Convert.ToString(row["BloodGroup"]) == bloodGroup;

                bool matchesStatus =
                    status == "" ||
                    Convert.ToString(row["Status"]) == status;

                bool matchesUrgency =
                    urgency == "" ||
                    Convert.ToString(row["Urgency"]) == urgency;

                if (matchesSearch && matchesBloodGroup &&
                    matchesStatus && matchesUrgency)
                {
                    filtered.ImportRow(row);
                }
            }

            gvRequests.DataSource = filtered;
            gvRequests.DataBind();

            lblRequestCount.Text = filtered.Rows.Count + " requests";
        }

        protected void Filter_Changed(object sender, EventArgs e)
        {
            BindRequests();
        }

        protected void lnkClearFilters_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            ddlBloodGroup.SelectedIndex = 0;
            ddlStatus.SelectedIndex = 0;
            ddlUrgency.SelectedIndex = 0;

            lblActionMessage.Text = "";
            BindRequests();
        }

        protected void btnShowCreate_Click(object sender, EventArgs e)
        {
            pnlCreateRequest.Visible = true;
            lblCreateMessage.Text = "";
        }

        protected void btnCancelCreate_Click(object sender, EventArgs e)
        {
            ClearCreateForm();
            pnlCreateRequest.Visible = false;
        }

        protected void btnSaveRequest_Click(object sender, EventArgs e)
        {
            string patient = txtPatient.Text.Trim();
            string bloodGroup = ddlNewBloodGroup.SelectedValue.Trim();
            string hospital = txtHospital.Text.Trim();
            string location = txtLocation.Text.Trim();
            string urgency = ddlNewUrgency.SelectedValue.Trim();

            int units;

            if (patient == "" || bloodGroup == "" ||
                hospital == "" || location == "" || urgency == "" ||
                !int.TryParse(txtUnits.Text.Trim(), out units) || units <= 0)
            {
                lblCreateMessage.ForeColor = System.Drawing.Color.DarkRed;
                lblCreateMessage.Text =
                    "Please enter all details and a valid number of units.";
                return;
            }

            DataTable dt = GetRequestsTable();

            int nextNumber = 1249;

            foreach (DataRow row in dt.Rows)
            {
                string id = Convert.ToString(row["RequestID"]);
                string numberPart = id.Substring(id.Length - 6);

                int currentNumber;

                if (int.TryParse(numberPart, out currentNumber) &&
                    currentNumber >= nextNumber)
                {
                    nextNumber = currentNumber + 1;
                }
            }

            string newRequestID =
                "BR-2026-" + nextNumber.ToString("D6");

            dt.Rows.Add(
                newRequestID,
                patient,
                bloodGroup,
                units,
                hospital,
                location,
                urgency,
                "Pending",
                DateTime.Today
            );

            Session[SessionKey] = dt;

            ClearCreateForm();
            pnlCreateRequest.Visible = false;

            lblActionMessage.ForeColor = System.Drawing.Color.DarkGreen;
            lblActionMessage.Text =
                "Request " + newRequestID + " created successfully.";

            BindRequests();
        }

        private void ClearCreateForm()
        {
            txtPatient.Text = "";
            ddlNewBloodGroup.SelectedIndex = 0;
            txtUnits.Text = "";
            txtHospital.Text = "";
            txtLocation.Text = "";
            ddlNewUrgency.SelectedIndex = 0;
            lblCreateMessage.Text = "";
        }

        protected void gvRequests_RowDataBound(
            object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label urgencyLabel =
                    e.Row.FindControl("lblUrgency") as Label;

                Label statusLabel =
                    e.Row.FindControl("lblStatus") as Label;

                if (urgencyLabel != null)
                {
                    string urgency = urgencyLabel.Text.Trim();
                    urgencyLabel.CssClass = "urgency-badge";

                    if (urgency == "Critical")
                        urgencyLabel.CssClass += " urgency-critical";
                    else if (urgency == "High")
                        urgencyLabel.CssClass += " urgency-high";
                    else
                        urgencyLabel.CssClass += " urgency-medium";
                }

                if (statusLabel != null)
                {
                    string status = statusLabel.Text.Trim();
                    statusLabel.CssClass = "status-badge";

                    if (status == "Active")
                        statusLabel.CssClass += " status-active";
                    else if (status == "Pending")
                        statusLabel.CssClass += " status-pending";
                    else if (status == "Fulfilled")
                        statusLabel.CssClass += " status-fulfilled";
                    else
                        statusLabel.CssClass += " status-cancelled";
                }
            }
        }

        protected void gvRequests_RowCommand(
            object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "FulfillRequest")
            {
                string requestID = Convert.ToString(e.CommandArgument);
                DataTable dt = GetRequestsTable();

                foreach (DataRow row in dt.Rows)
                {
                    if (Convert.ToString(row["RequestID"]) == requestID)
                    {
                        if (Convert.ToString(row["Status"]) != "Cancelled")
                        {
                            row["Status"] = "Fulfilled";
                            Session[SessionKey] = dt;

                            lblActionMessage.ForeColor =
                                System.Drawing.Color.DarkGreen;

                            lblActionMessage.Text =
                                requestID + " marked as Fulfilled.";
                        }

                        break;
                    }
                }

                BindRequests();
            }
        }
    }
}