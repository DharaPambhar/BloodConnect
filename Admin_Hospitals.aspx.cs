
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BloodConnect
{
    public partial class Admin_Hospitals : System.Web.UI.Page
    {
        private DataTable Hospitals
        {
            get
            {
                if (Session["HospitalList"] == null)
                {
                    Session["HospitalList"] = CreateHospitalTable();
                }

                return (DataTable)Session["HospitalList"];
            }
            set
            {
                Session["HospitalList"] = value;
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
                BindHospitals();
            }
        }

        private DataTable CreateHospitalTable()
        {
            DataTable dt = new DataTable();

            dt.Columns.Add("HospitalID");
            dt.Columns.Add("HospitalName");
            dt.Columns.Add("HospitalType");
            dt.Columns.Add("Location");
            dt.Columns.Add("Contact");
            dt.Columns.Add("Availability");
            dt.Columns.Add("Connection");
            dt.Columns.Add("Status");

            AddHospital(dt, "HSP-10126", "City Care Hospital", "Private",
                "Ahmedabad", "9876543210", "Available", "Connected", "Active");

            AddHospital(dt, "HSP-10125", "Civil Hospital", "Government",
                "Ahmedabad", "9876532109", "Available", "Connected", "Active");

            AddHospital(dt, "HSP-10124", "LifeCare Hospital", "Private",
                "Surat", "9876521098", "Available", "Connected", "Active");

            AddHospital(dt, "HSP-10123", "Sunrise Multi-Specialty", "Private",
                "Vadodara", "9876510987", "Not Available", "Connected", "Active");

            AddHospital(dt, "HSP-10122", "Hope General Hospital", "Trust",
                "Rajkot", "9876587654", "Available", "Not Connected", "Pending");

            AddHospital(dt, "HSP-10121", "Sterling Hospital", "Private",
                "Vadodara", "9876554321", "Available", "Connected", "Active");

            AddHospital(dt, "HSP-10120", "Apollo Hospitals", "Private",
                "Ahmedabad", "9876545678", "Available", "Connected", "Active");

            AddHospital(dt, "HSP-10119", "Zydus Hospital", "Private",
                "Ahmedabad", "9876534567", "Available", "Connected", "Active");

            return dt;
        }

        private void AddHospital(
            DataTable dt,
            string id,
            string name,
            string type,
            string location,
            string contact,
            string availability,
            string connection,
            string status)
        {
            dt.Rows.Add(id, name, type, location, contact,
                availability, connection, status);
        }

        private void BindHospitals()
        {
            DataTable source = Hospitals;
            DataTable filtered = source.Clone();

            string search = txtSearch.Text.Trim();
            string selectedStatus = ddlStatus.SelectedValue;
            string selectedType = ddlType.SelectedValue;

            foreach (DataRow row in source.Rows)
            {
                bool matchesSearch = string.IsNullOrWhiteSpace(search) ||
                    row["HospitalID"].ToString().IndexOf(
                        search, StringComparison.OrdinalIgnoreCase) >= 0 ||
                    row["HospitalName"].ToString().IndexOf(
                        search, StringComparison.OrdinalIgnoreCase) >= 0 ||
                    row["Location"].ToString().IndexOf(
                        search, StringComparison.OrdinalIgnoreCase) >= 0 ||
                    row["Contact"].ToString().IndexOf(
                        search, StringComparison.OrdinalIgnoreCase) >= 0;

                bool matchesStatus = selectedStatus == "All" ||
                    row["Status"].ToString() == selectedStatus;

                bool matchesType = selectedType == "All" ||
                    row["HospitalType"].ToString() == selectedType;

                if (matchesSearch && matchesStatus && matchesType)
                {
                    filtered.ImportRow(row);
                }
            }

            gvHospitals.DataSource = filtered;
            gvHospitals.DataBind();

            lblRecordCount.Text = "Showing " +
                filtered.Rows.Count + " hospitals";
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindHospitals();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            ddlStatus.SelectedValue = "All";
            ddlType.SelectedValue = "All";

            BindHospitals();
        }

        protected void btnMoreFilters_Click(object sender, EventArgs e)
        {
            // Apply the selected status and type filters.
            BindHospitals();

            lblRecordCount.Text += " • Filters applied";
        }

        protected void btnAddHospital_Click(object sender, EventArgs e)
        {
            pnlAddHospital.Visible = true;
            lblFormMessage.Text = "";
        }

        protected void btnCancelAdd_Click(object sender, EventArgs e)
        {
            pnlAddHospital.Visible = false;
            ClearHospitalForm();
        }

        protected void btnSaveHospital_Click(object sender, EventArgs e)
        {
            string name = txtHospitalName.Text.Trim();
            string location = txtLocation.Text.Trim();
            string contact = txtContact.Text.Trim();

            if (name == "" || location == "" || contact == "")
            {
                lblFormMessage.Text =
                    "Please enter the hospital name, location and contact number.";
                return;
            }

            if (contact.Length != 10 || !IsDigitsOnly(contact))
            {
                lblFormMessage.Text =
                    "Enter a valid 10-digit contact number.";
                return;
            }

            DataTable dt = Hospitals;

            string newID = "HSP-" + (10127 + dt.Rows.Count - 8).ToString();

            AddHospital(
                dt,
                newID,
                name,
                ddlNewType.SelectedValue,
                location,
                contact,
                ddlAvailability.SelectedValue,
                ddlConnection.SelectedValue,
                "Pending"
            );

            Hospitals = dt;

            pnlAddHospital.Visible = false;
            ClearHospitalForm();

            ddlStatus.SelectedValue = "All";
            ddlType.SelectedValue = "All";
            txtSearch.Text = "";

            BindHospitals();

            lblRecordCount.Text =
                "Hospital added successfully. ID: " + newID;
        }

        private bool IsDigitsOnly(string value)
        {
            foreach (char character in value)
            {
                if (character < '0' || character > '9')
                {
                    return false;
                }
            }

            return true;
        }

        private void ClearHospitalForm()
        {
            txtHospitalName.Text = "";
            txtLocation.Text = "";
            txtContact.Text = "";
            ddlNewType.SelectedIndex = 0;
            ddlAvailability.SelectedIndex = 0;
            ddlConnection.SelectedIndex = 0;
            lblFormMessage.Text = "";
        }

        protected void gvHospitals_RowDataBound(
            object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblStatus = e.Row.FindControl("lblStatus") as Label;
                Label lblAvailability =
                    e.Row.FindControl("lblAvailability") as Label;
                Label lblConnection =
                    e.Row.FindControl("lblConnection") as Label;

                if (lblStatus != null)
                {
                    if (lblStatus.Text == "Active")
                    {
                        lblStatus.CssClass = "status-badge status-active";
                    }
                    else
                    {
                        lblStatus.CssClass = "status-badge status-pending";
                    }
                }

                if (lblAvailability != null)
                {
                    if (lblAvailability.Text == "Available")
                    {
                        lblAvailability.CssClass = "availability-yes";
                        lblAvailability.Text = "● Available";
                    }
                    else
                    {
                        lblAvailability.CssClass = "availability-no";
                        lblAvailability.Text = "● Not Available";
                    }
                }

                if (lblConnection != null)
                {
                    if (lblConnection.Text == "Connected")
                    {
                        lblConnection.CssClass = "connection-yes";
                    }
                    else
                    {
                        lblConnection.CssClass = "connection-no";
                    }
                }
            }
        }

        protected void btnAction_Click(object sender, EventArgs e)
        {
            Button button = sender as Button;

            if (button != null)
            {
                string hospitalID = button.CommandArgument;

                foreach (DataRow row in Hospitals.Rows)
                {
                    if (row["HospitalID"].ToString() == hospitalID)
                    {
                        lblRecordCount.Text =
                            "Selected: " + row["HospitalName"] +
                            " (" + hospitalID + "), " +
                            row["Location"] + ", Contact: " +
                            row["Contact"] + ", Status: " + row["Status"];
                        break;
                    }
                }
            }
        }
    }
}
