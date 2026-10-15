
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace BloodConnect
{
    public partial class Admin_Appointments : Page
    {
        private const string TableSessionKey = "AdminAppointmentsTable";

        // Design મુજબ sample dashboard date fixed રાખી છે.
        private readonly DateTime dashboardDate = new DateTime(2026, 8, 16);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CreateSampleData();
                SetActiveMenu();
                BindAppointments();
            }
        }

        private void SetActiveMenu()
        {
            if (Master == null)
                return;

            HtmlAnchor appointmentsLink =
                Master.FindControl("lnkAppointments") as HtmlAnchor;

            if (appointmentsLink != null)
            {
                appointmentsLink.Attributes["class"] = "menu-link active";
            }
        }

        private DataTable CreateAppointmentTable()
        {
            DataTable dt = new DataTable();

            dt.Columns.Add("AppointmentID", typeof(string));
            dt.Columns.Add("DonorName", typeof(string));
            dt.Columns.Add("BloodGroup", typeof(string));
            dt.Columns.Add("DonorDetail", typeof(string));
            dt.Columns.Add("Facility", typeof(string));
            dt.Columns.Add("AppointmentDate", typeof(DateTime));
            dt.Columns.Add("AppointmentTime", typeof(string));
            dt.Columns.Add("Status", typeof(string));

            return dt;
        }

        private void CreateSampleData()
        {
            if (Session[TableSessionKey] != null)
                return;

            DataTable dt = CreateAppointmentTable();

            AddSampleRow(dt, "APT-2026-01482", "Rahul Shah",
                "O+", "Donor ID: 8992", "City Blood Bank",
                new DateTime(2026, 8, 16), "10:00 AM", "Confirmed");

            AddSampleRow(dt, "APT-2026-01481", "Priya Patel",
                "A+", "New Donor", "LifeCare Blood Bank",
                new DateTime(2026, 8, 16), "10:30 AM", "Scheduled");

            AddSampleRow(dt, "APT-2026-01480", "Amit Kumar",
                "B+", "Donor ID: 4120", "Red Cross Center",
                new DateTime(2026, 8, 16), "11:00 AM", "Checked In");

            AddSampleRow(dt, "APT-2026-01479", "Neha Mehta",
                "O-", "VIP Donor", "Hope Blood Center",
                new DateTime(2026, 8, 15), "03:00 PM", "Completed");

            AddSampleRow(dt, "APT-2026-01478", "Karan Patel",
                "AB+", "Donor ID: 2210", "City Blood Bank",
                new DateTime(2026, 8, 15), "04:00 PM", "Cancelled");

            AddSampleRow(dt, "APT-2026-01477", "Sameer Khan",
                "O+", "Donor ID: 7721", "City Blood Bank",
                new DateTime(2026, 8, 15), "05:00 PM", "Completed");

            AddSampleRow(dt, "APT-2026-01476", "Anjali Sharma",
                "A-", "Donor ID: 3342", "LifeCare Blood Bank",
                new DateTime(2026, 8, 15), "05:30 PM", "Confirmed");

            AddSampleRow(dt, "APT-2026-01475", "Rajesh Gupta",
                "B-", "Donor ID: 1109", "Red Cross Center",
                new DateTime(2026, 8, 14), "09:00 AM", "No Show");

            Session[TableSessionKey] = dt;
        }

        private void AddSampleRow(
            DataTable dt,
            string appointmentID,
            string donorName,
            string bloodGroup,
            string donorDetail,
            string facility,
            DateTime appointmentDate,
            string appointmentTime,
            string status)
        {
            dt.Rows.Add(
                appointmentID,
                donorName,
                bloodGroup,
                donorDetail,
                facility,
                appointmentDate,
                appointmentTime,
                status);
        }

        private DataTable GetAppointmentTable()
        {
            if (Session[TableSessionKey] == null)
                CreateSampleData();

            return (DataTable)Session[TableSessionKey];
        }

        private void BindAppointments()
        {
            DataTable source = GetAppointmentTable();
            DataTable filtered = source.Clone();

            string searchText = txtSearch.Text.Trim();
            string selectedStatus = ddlStatusFilter.SelectedValue;
            string selectedDate = ddlDateFilter.SelectedValue;
            string selectedFacility = ddlFacilityFilter.SelectedValue;

            foreach (DataRow row in source.Rows)
            {
                bool matchesSearch = true;
                bool matchesStatus = true;
                bool matchesDate = true;
                bool matchesFacility = true;

                if (!string.IsNullOrWhiteSpace(searchText))
                {
                    string appointmentID = row["AppointmentID"].ToString();
                    string donorName = row["DonorName"].ToString();
                    string donorDetail = row["DonorDetail"].ToString();
                    string facility = row["Facility"].ToString();

                    matchesSearch =
                        appointmentID.IndexOf(searchText,
                            StringComparison.OrdinalIgnoreCase) >= 0
                        || donorName.IndexOf(searchText,
                            StringComparison.OrdinalIgnoreCase) >= 0
                        || donorDetail.IndexOf(searchText,
                            StringComparison.OrdinalIgnoreCase) >= 0
                        || facility.IndexOf(searchText,
                            StringComparison.OrdinalIgnoreCase) >= 0;
                }

                if (selectedStatus != "All")
                {
                    matchesStatus =
                        row["Status"].ToString() == selectedStatus;
                }

                DateTime appointmentDate =
                    Convert.ToDateTime(row["AppointmentDate"]);

                if (selectedDate == "Today")
                {
                    matchesDate = appointmentDate.Date == dashboardDate.Date;
                }
                else if (selectedDate == "Yesterday")
                {
                    matchesDate = appointmentDate.Date ==
                                  dashboardDate.Date.AddDays(-1);
                }
                else if (selectedDate == "Last7Days")
                {
                    matchesDate =
                        appointmentDate.Date <= dashboardDate.Date &&
                        appointmentDate.Date >= dashboardDate.Date.AddDays(-6);
                }

                if (selectedFacility != "All")
                {
                    matchesFacility =
                        row["Facility"].ToString() == selectedFacility;
                }

                if (matchesSearch && matchesStatus &&
                    matchesDate && matchesFacility)
                {
                    filtered.ImportRow(row);
                }
            }

            gvAppointments.DataSource = filtered;
            gvAppointments.DataBind();

            lblResultCount.Text =
                filtered.Rows.Count + " appointments shown";
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            BindAppointments();
        }

        protected void FilterChanged(object sender, EventArgs e)
        {
            BindAppointments();
        }

        protected void btnClearFilters_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            ddlStatusFilter.SelectedValue = "All";
            ddlDateFilter.SelectedValue = "All";
            ddlFacilityFilter.SelectedValue = "All";

            pnlMoreFilters.Visible = false;
            lblPageMessage.Text = "";

            BindAppointments();
        }

        protected void btnMoreFilters_Click(object sender, EventArgs e)
        {
            pnlMoreFilters.Visible = !pnlMoreFilters.Visible;
        }

        protected void btnListView_Click(object sender, EventArgs e)
        {
            lblPageMessage.Text =
                "List view selected. Appointments are displayed in the table below.";
        }

        protected void btnCalendarView_Click(object sender, EventArgs e)
        {
            lblPageMessage.Text =
                "Calendar view selected. The appointment list remains available below.";
        }

        protected void btnViewSchedule_Click(object sender, EventArgs e)
        {
            ddlDateFilter.SelectedValue = "Today";
            ddlStatusFilter.SelectedValue = "All";
            ddlFacilityFilter.SelectedValue = "All";
            txtSearch.Text = "";

            BindAppointments();

            lblPageMessage.Text =
                "Showing the schedule for 16 August 2026.";
        }

        protected void btnCreateAppointment_Click(object sender, EventArgs e)
        {
            pnlCreateAppointment.Visible = true;
            lblFormMessage.Text = "";
            lblPageMessage.Text = "";
        }

        protected void btnCancelCreate_Click(object sender, EventArgs e)
        {
            pnlCreateAppointment.Visible = false;
            ClearCreateForm();
        }

        private void ClearCreateForm()
        {
            txtDonorName.Text = "";
            ddlBloodGroup.SelectedIndex = 0;
            ddlFacility.SelectedIndex = 0;
            txtAppointmentDate.Text = "";
            txtAppointmentTime.Text = "";
            ddlNewStatus.SelectedIndex = 0;
            lblFormMessage.Text = "";
        }

        protected void btnSaveAppointment_Click(object sender, EventArgs e)
        {
            string donorName = txtDonorName.Text.Trim();
            string bloodGroup = ddlBloodGroup.SelectedValue;
            string facility = ddlFacility.SelectedValue;
            string dateText = txtAppointmentDate.Text.Trim();
            string timeText = txtAppointmentTime.Text.Trim();
            string status = ddlNewStatus.SelectedValue;

            if (donorName == "" || bloodGroup == "" ||
                facility == "" || dateText == "" || timeText == "")
            {
                lblFormMessage.Text =
                    "Please fill in all appointment fields.";
                return;
            }

            DateTime appointmentDate;
            if (!DateTime.TryParse(dateText, out appointmentDate))
            {
                lblFormMessage.Text = "Please enter a valid appointment date.";
                return;
            }

            DateTime parsedTime;
            if (!DateTime.TryParse(timeText, out parsedTime))
            {
                lblFormMessage.Text = "Please enter a valid appointment time.";
                return;
            }

            DataTable dt = GetAppointmentTable();

            int nextNumber = 1482;
            foreach (DataRow row in dt.Rows)
            {
                string id = row["AppointmentID"].ToString();
                string numberText = id.Replace("APT-2026-", "");

                int number;
                if (int.TryParse(numberText, out number) && number >= nextNumber)
                    nextNumber = number + 1;
            }

            string newID = "APT-2026-" + nextNumber.ToString("D5");

            string donorDetail = "New Donor";

            dt.Rows.Add(
                newID,
                donorName,
                bloodGroup,
                donorDetail,
                facility,
                appointmentDate.Date,
                parsedTime.ToString("hh:mm tt"),
                status);

            Session[TableSessionKey] = dt;

            pnlCreateAppointment.Visible = false;
            ClearCreateForm();

            ddlStatusFilter.SelectedValue = "All";
            ddlDateFilter.SelectedValue = "All";
            ddlFacilityFilter.SelectedValue = "All";
            txtSearch.Text = "";

            BindAppointments();

            lblPageMessage.Text =
                "Appointment " + newID + " was added to this session.";
        }

        protected void gvAppointments_RowCommand(
            object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewAppointment")
            {
                string appointmentID = e.CommandArgument.ToString();
                DataTable dt = GetAppointmentTable();

                foreach (DataRow row in dt.Rows)
                {
                    if (row["AppointmentID"].ToString() == appointmentID)
                    {
                        lblPageMessage.Text =
                            "Appointment: " + row["AppointmentID"] +
                            " | Donor: " + row["DonorName"] +
                            " | Blood Group: " + row["BloodGroup"] +
                            " | Facility: " + row["Facility"] +
                            " | Date: " +
                            Convert.ToDateTime(row["AppointmentDate"])
                                .ToString("dd MMM yyyy") +
                            " | Time: " + row["AppointmentTime"] +
                            " | Status: " + row["Status"];

                        return;
                    }
                }

                lblPageMessage.Text = "Appointment details could not be found.";
            }
        }

        protected void gvAppointments_RowDataBound(
            object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblStatus = e.Row.FindControl("lblStatus") as Label;

                if (lblStatus == null)
                    return;

                string status = lblStatus.Text.Trim();

                switch (status)
                {
                    case "Confirmed":
                        lblStatus.CssClass = "status-badge status-confirmed";
                        break;

                    case "Scheduled":
                        lblStatus.CssClass = "status-badge status-scheduled";
                        break;

                    case "Checked In":
                        lblStatus.CssClass = "status-badge status-checked-in";
                        break;

                    case "Completed":
                        lblStatus.CssClass = "status-badge status-completed";
                        break;

                    case "Cancelled":
                        lblStatus.CssClass = "status-badge status-cancelled";
                        break;

                    case "No Show":
                        lblStatus.CssClass = "status-badge status-no-show";
                        break;

                    default:
                        lblStatus.CssClass = "status-badge";
                        break;
                }
            }
        }
    }
}
