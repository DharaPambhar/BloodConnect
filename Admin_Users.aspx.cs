
using System;
using System.Data;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BloodConnect
{
    public partial class Admin_Users : Page
    {
        private DataTable UsersTable
        {
            get
            {
                if (Session["AdminUsersTable"] == null)
                {
                    Session["AdminUsersTable"] = CreateSampleUsers();
                }

                return (DataTable)Session["AdminUsersTable"];
            }
            set
            {
                Session["AdminUsersTable"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // Keep Users highlighted in the Admin sidebar.
            if (!IsPostBack)
            {
                BindUsers();
            }
        }

        private DataTable CreateSampleUsers()
        {
            DataTable table = new DataTable();

            table.Columns.Add("UserID", typeof(string));
            table.Columns.Add("Name", typeof(string));
            table.Columns.Add("Email", typeof(string));
            table.Columns.Add("Phone", typeof(string));
            table.Columns.Add("Role", typeof(string));
            table.Columns.Add("BloodGroup", typeof(string));
            table.Columns.Add("Location", typeof(string));
            table.Columns.Add("Status", typeof(string));
            table.Columns.Add("Initials", typeof(string));

            table.Rows.Add("BC-8892", "Rahul Shah", "rahul.s@example.com",
                "9876500001", "DONOR", "O+", "Ahmedabad", "Active", "RS");

            table.Rows.Add("BC-8893", "Priya Patel", "p.patel92@email.com",
                "9876500002", "SEEKER", "A+", "Surat", "Active", "PP");

            table.Rows.Add("BC-8894", "Amit Kumar", "amit.kumar@domain.in",
                "9876500003", "DONOR", "B+", "Vadodara", "Pending", "AK");

            table.Rows.Add("BC-8895", "Neha Mehta", "neha.m@mail.com",
                "9876500004", "SEEKER", "O-", "Rajkot", "Suspended", "NM");

            return table;
        }

        private void BindUsers()
        {
            DataTable source = UsersTable;
            DataTable filtered = source.Clone();

            string search = txtSearch.Text.Trim().ToLower();
            string role = ddlRole.SelectedValue;
            string status = ddlStatus.SelectedValue;

            foreach (DataRow row in source.Rows)
            {
                bool matchesSearch =
                    search == "" ||
                    row["Name"].ToString().ToLower().Contains(search) ||
                    row["Email"].ToString().ToLower().Contains(search) ||
                    row["Phone"].ToString().ToLower().Contains(search) ||
                    row["UserID"].ToString().ToLower().Contains(search);

                bool matchesRole =
                    role == "ALL" || row["Role"].ToString() == role;

                bool matchesStatus =
                    status == "ALL" || row["Status"].ToString() == status;

                if (matchesSearch && matchesRole && matchesStatus)
                {
                    filtered.ImportRow(row);
                }
            }

            gvUsers.DataSource = filtered;
            gvUsers.DataBind();

            lblUserCount.Text = filtered.Rows.Count.ToString();
            UpdateSelectedCount();
        }

        protected void Filter_Changed(object sender, EventArgs e)
        {
            lblMessage.Text = "";
            BindUsers();
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            ddlRole.SelectedValue = "ALL";
            ddlStatus.SelectedValue = "ALL";
            lblMessage.Text = "";
            BindUsers();
        }

        protected void chkSelect_CheckedChanged(object sender, EventArgs e)
        {
            UpdateSelectedCount();
        }

        private void UpdateSelectedCount()
        {
            int selected = 0;

            foreach (GridViewRow row in gvUsers.Rows)
            {
                CheckBox checkBox = row.FindControl("chkSelect") as CheckBox;

                if (checkBox != null && checkBox.Checked)
                {
                    selected++;
                }
            }

            lblSelected.Text = selected + " selected";
        }

        protected void btnVerify_Click(object sender, EventArgs e)
        {
            UpdateSelectedUsers("Verify");
        }

        protected void btnSuspend_Click(object sender, EventArgs e)
        {
            UpdateSelectedUsers("Suspend");
        }

        private void UpdateSelectedUsers(string action)
        {
            DataTable table = UsersTable;
            int updated = 0;

            foreach (GridViewRow gridRow in gvUsers.Rows)
            {
                CheckBox checkBox = gridRow.FindControl("chkSelect") as CheckBox;

                if (checkBox != null && checkBox.Checked)
                {
                    string userID = gvUsers.DataKeys[gridRow.RowIndex].Value.ToString();

                    DataRow[] rows = table.Select(
                        "UserID = '" + userID.Replace("'", "''") + "'");

                    if (rows.Length > 0)
                    {
                        if (action == "Verify" &&
                            rows[0]["Status"].ToString() == "Pending")
                        {
                            rows[0]["Status"] = "Active";
                            updated++;
                        }
                        else if (action == "Suspend" &&
                                 rows[0]["Status"].ToString() != "Suspended")
                        {
                            rows[0]["Status"] = "Suspended";
                            updated++;
                        }
                    }
                }
            }

            UsersTable = table;
            lblMessage.Text = updated > 0
                ? updated + " user(s) updated successfully."
                : "Select applicable users to perform this action.";

            BindUsers();
        }

        protected void ddlAction_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = sender as DropDownList;
            GridViewRow gridRow = ddl.NamingContainer as GridViewRow;

            if (ddl == null || gridRow == null || ddl.SelectedValue == "")
                return;

            string userID = gvUsers.DataKeys[gridRow.RowIndex].Value.ToString();
            DataTable table = UsersTable;

            DataRow[] rows = table.Select(
                "UserID = '" + userID.Replace("'", "''") + "'");

            if (rows.Length > 0)
            {
                switch (ddl.SelectedValue)
                {
                    case "Verify":
                        if (rows[0]["Status"].ToString() == "Pending")
                            rows[0]["Status"] = "Active";
                        break;

                    case "Suspend":
                        rows[0]["Status"] = "Suspended";
                        break;

                    case "Activate":
                        rows[0]["Status"] = "Active";
                        break;
                }
            }

            UsersTable = table;
            BindUsers();
        }

        protected void gvUsers_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label roleLabel = e.Row.FindControl("lblRoleBadge") as Label;
                Label statusLabel = e.Row.FindControl("lblStatus") as Label;

                if (roleLabel != null)
                {
                    roleLabel.CssClass = roleLabel.Text == "DONOR"
                        ? "role-badge role-donor"
                        : "role-badge role-seeker";
                }

                if (statusLabel != null)
                {
                    switch (statusLabel.Text)
                    {
                        case "Active":
                            statusLabel.CssClass = "status-badge status-active";
                            break;

                        case "Pending":
                            statusLabel.CssClass = "status-badge status-pending";
                            break;

                        case "Suspended":
                            statusLabel.CssClass = "status-badge status-suspended";
                            break;
                    }
                }
            }
        }

        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            pnlAddUser.Visible = true;
            lblFormMessage.Text = "";
        }

        protected void btnCancelAdd_Click(object sender, EventArgs e)
        {
            pnlAddUser.Visible = false;
            lblFormMessage.Text = "";
        }

        protected void btnSaveUser_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string phone = txtPhone.Text.Trim();
            string location = txtLocation.Text.Trim();

            if (name == "" || email == "" || phone == "" || location == "")
            {
                lblFormMessage.ForeColor = System.Drawing.Color.Firebrick;
                lblFormMessage.Text = "Please fill in all user fields.";
                return;
            }

            DataTable table = UsersTable;

            bool emailExists = table.AsEnumerable().Any(
                r => r.Field<string>("Email").Equals(
                    email, StringComparison.OrdinalIgnoreCase));

            if (emailExists)
            {
                lblFormMessage.ForeColor = System.Drawing.Color.Firebrick;
                lblFormMessage.Text = "This email already exists in the sample list.";
                return;
            }

            int nextNumber = 8892;

            foreach (DataRow row in table.Rows)
            {
                string id = row["UserID"].ToString();

                if (id.StartsWith("BC-"))
                {
                    int number;
                    if (int.TryParse(id.Substring(3), out number) &&
                        number >= nextNumber)
                    {
                        nextNumber = number + 1;
                    }
                }
            }

            string initials = string.Join("", name
                .Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries)
                .Take(2)
                .Select(part => part.Substring(0, 1).ToUpper()));

            table.Rows.Add(
                "BC-" + nextNumber,
                name,
                email,
                phone,
                ddlNewRole.SelectedValue,
                ddlNewBloodGroup.SelectedValue,
                location,
                "Pending",
                initials
            );

            UsersTable = table;

            txtName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtLocation.Text = "";
            pnlAddUser.Visible = false;

            lblMessage.Text = "User added successfully with Pending status.";
            BindUsers();
        }
    }
}
