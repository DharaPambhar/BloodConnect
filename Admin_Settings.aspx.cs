
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BloodConnect
{
    public partial class Admin_Settings : Page
    {
        private const string SettingsKey = "BloodConnect_Admin_Settings";

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
                LoadSettings();
            }
        }

        private void LoadSettings()
        {
            txtPlatformName.Text = "BloodConnect";
            txtContactNumber.Text = "+91 98765 43210";
            txtPlatformEmail.Text = "admin@bloodconnect.org";
            txtSupportEmail.Text = "support@bloodconnect.org";

            ddlLocation.SelectedValue = "Ahmedabad";
            ddlTimeZone.SelectedValue = "IST";
            ddlDateFormat.SelectedValue = "dd/MM/yyyy";
            ddlLanguage.SelectedValue = "English";
            ddlDefaultPeriod.SelectedValue = "30";

            chkEmergencyRequests.Checked = true;
            chkNewDonors.Checked = true;
            chkBankRegistration.Checked = true;
            chkWeeklyReports.Checked = false;

            chkTwoFactor.Checked = true;
            chkAutoBackup.Checked = true;
            chkMaintenanceMode.Checked = false;

            // Restore saved values for this session, if available.
            object saved = Session[SettingsKey];

            if (saved != null)
            {
                string[] values = saved as string[];

                if (values != null && values.Length == 12)
                {
                    txtPlatformName.Text = values[0];
                    txtContactNumber.Text = values[1];
                    txtPlatformEmail.Text = values[2];
                    txtSupportEmail.Text = values[3];

                    SetDropDownValue(ddlLocation, values[4]);
                    SetDropDownValue(ddlTimeZone, values[5]);
                    SetDropDownValue(ddlDateFormat, values[6]);
                    SetDropDownValue(ddlLanguage, values[7]);
                    SetDropDownValue(ddlDefaultPeriod, values[8]);

                    chkEmergencyRequests.Checked = values[9] == "true";
                    chkNewDonors.Checked = values[10] == "true";
                    chkBankRegistration.Checked = values[11] == "true";
                }
            }
        }

        private void SetDropDownValue(DropDownList list, string value)
        {
            ListItem item = list.Items.FindByValue(value);

            if (item != null)
            {
                list.SelectedValue = value;
            }
        }

        protected void btnSaveChanges_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtPlatformName.Text))
            {
                ShowMessage("Platform Name is required.", false);
                return;
            }

            if (!txtPlatformEmail.Text.Contains("@") ||
                !txtSupportEmail.Text.Contains("@"))
            {
                ShowMessage("Please enter valid platform and support email addresses.", false);
                return;
            }

            // Session-only storage. This does not update a database.
            Session[SettingsKey] = new string[]
            {
                txtPlatformName.Text.Trim(),
                txtContactNumber.Text.Trim(),
                txtPlatformEmail.Text.Trim(),
                txtSupportEmail.Text.Trim(),
                ddlLocation.SelectedValue,
                ddlTimeZone.SelectedValue,
                ddlDateFormat.SelectedValue,
                ddlLanguage.SelectedValue,
                ddlDefaultPeriod.SelectedValue,
                chkEmergencyRequests.Checked.ToString().ToLowerInvariant(),
                chkNewDonors.Checked.ToString().ToLowerInvariant(),
                chkBankRegistration.Checked.ToString().ToLowerInvariant()
            };

            ShowMessage(
                "General settings saved for this session. Database persistence is not configured.",
                true
            );
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            LoadSettings();
            ShowMessage("Unsaved general form changes have been discarded.", true);
        }

        protected void btnResetPreferences_Click(object sender, EventArgs e)
        {
            Session.Remove(SettingsKey);
            LoadSettings();

            chkWeeklyReports.Checked = false;
            chkTwoFactor.Checked = true;
            chkAutoBackup.Checked = true;
            chkMaintenanceMode.Checked = false;

            ShowMessage("Settings restored to the default values for this session.", true);
        }

        protected void btnEditProfile_Click(object sender, EventArgs e)
        {
            ShowMessage(
                "Profile editing is not connected yet. Connect this action to your admin profile form.",
                false
            );
        }

        protected void btnChangeEmail_Click(object sender, EventArgs e)
        {
            ShowMessage(
                "Email changes require an email verification workflow before saving.",
                false
            );
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            ShowMessage(
                "Connect this button to a secure Change Password page with current-password verification.",
                false
            );
        }

        protected void btnDisableAccount_Click(object sender, EventArgs e)
        {
            // Deliberately do not disable the account immediately.
            // Account deactivation should require confirmation and authorization.
            ShowMessage(
                "Account was not disabled. Implement a verified confirmation workflow before deactivation.",
                false
            );
        }

        protected void tabGeneral_Click(object sender, EventArgs e)
        {
            ShowMessage("General settings are displayed below.", true);
        }

        protected void tabAccount_Click(object sender, EventArgs e)
        {
            ShowMessage("Account settings are not yet implemented.", false);
        }

        protected void tabSecurity_Click(object sender, EventArgs e)
        {
            ShowMessage("Security settings are displayed below. Password management needs a secure workflow.", false);
        }

        protected void tabNotifications_Click(object sender, EventArgs e)
        {
            ShowMessage("Notification preferences are displayed below.", true);
        }

        protected void tabSystem_Click(object sender, EventArgs e)
        {
            ShowMessage("System preferences are displayed below.", true);
        }

        protected void tabPrivacy_Click(object sender, EventArgs e)
        {
            ShowMessage("Privacy & Data settings are not yet implemented.", false);
        }

        private void ShowMessage(string message, bool success)
        {
            lblMessage.Text = Server.HtmlEncode(message);
            lblMessage.Style["color"] = success ? "#16824f" : "#b91c1c";
        }
    }
}
