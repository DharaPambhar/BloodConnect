
<%@ Page Title="Admin Settings" Language="C#" MasterPageFile="~/Admin.Master"
    AutoEventWireup="true" CodeBehind="Admin_Settings.aspx.cs"
    Inherits="BloodConnect.Admin_Settings" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Admin Settings | BloodConnect
</asp:Content>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
<style>
.settings-page {
    color: #252941;
    width: 100%;
    box-sizing: border-box;
}
.settings-page * { box-sizing: border-box; }

.settings-heading {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 16px;
    flex-wrap: wrap;
    margin-bottom: 23px;
}
.settings-heading h2 {
    margin: 0 0 7px;
    font-size: 26px;
    font-weight: 750;
}
.settings-heading p {
    margin: 0;
    font-size: 13px;
    color: #777b8d;
    line-height: 1.6;
}

.settings-tabs {
    display: flex;
    gap: 25px;
    overflow-x: auto;
    border-bottom: 1px solid #e9e9f1;
    margin-bottom: 23px;
}
.settings-tab {
    display: inline-block;
    padding: 13px 2px;
    color: #777b8d !important;
    text-decoration: none !important;
    font-size: 13px;
    white-space: nowrap;
    border-bottom: 3px solid transparent;
}
.settings-tab.active {
    color: #a71930 !important;
    border-bottom-color: #a71930;
    font-weight: 700;
}

.settings-layout {
    display: grid;
    grid-template-columns: minmax(0, 1.45fr) minmax(290px, 1fr);
    gap: 20px;
    align-items: start;
}
.settings-column {
    display: flex;
    flex-direction: column;
    gap: 20px;
    min-width: 0;
}
.settings-card {
    background: #fff;
    border: 1px solid #e9e9f1;
    border-radius: 12px;
    padding: 22px;
    box-shadow: 0 3px 12px rgba(30,30,70,.035);
    min-width: 0;
}
.card-heading {
    display: flex;
    align-items: center;
    gap: 10px;
    margin-bottom: 7px;
}
.card-heading h3 {
    margin: 0;
    font-size: 16px;
    font-weight: 700;
    color: #252941;
}
.card-description {
    margin: 0 0 21px;
    color: #9295a5;
    font-size: 12px;
    line-height: 1.6;
}
.heading-icon {
    width: 35px;
    height: 35px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 9px;
    background: #fff0f2;
    font-size: 18px;
    flex-shrink: 0;
}

.form-grid {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 18px 16px;
}
.form-field {
    display: flex;
    flex-direction: column;
    gap: 7px;
    min-width: 0;
}
.form-field.full { grid-column: 1 / -1; }
.form-field label {
    color: #50556a;
    font-size: 12px;
    font-weight: 600;
}
.form-control {
    width: 100%;
    min-width: 0;
    height: 41px;
    padding: 9px 11px;
    background: #fff;
    border: 1px solid #dedfea;
    border-radius: 7px;
    color: #34384d;
    font-family: inherit;
    font-size: 13px;
    outline: none;
}
.form-control:focus {
    border-color: #a71930;
    box-shadow: 0 0 0 2px rgba(167,25,48,.08);
}

.form-actions {
    display: flex;
    justify-content: flex-end;
    gap: 10px;
    flex-wrap: wrap;
    margin-top: 24px;
    padding-top: 18px;
    border-top: 1px solid #f0f0f5;
}
.btn {
    border: 1px solid transparent;
    border-radius: 7px;
    padding: 10px 15px;
    font-size: 12px;
    font-weight: 650;
    cursor: pointer;
    text-decoration: none;
    display: inline-block;
}
.btn-primary { background: #a71930; color: #fff !important; }
.btn-primary:hover { background: #861329; }
.btn-secondary { background: #f3f4f7; color: #55596b !important; border-color: #e3e4eb; }
.btn-outline { background: #fff; color: #a71930 !important; border-color: #e1a8b2; }
.btn-soft { background: #efefff; color: #5144b9 !important; border-color: #e0defb; }
.btn-danger { background: #b91c1c; color: #fff !important; }

.message-label {
    display: block;
    margin: 0 0 16px;
    color: #16824f;
    font-size: 13px;
    line-height: 1.6;
}
.message-label:empty { display: none; }

.profile-top {
    display: flex;
    align-items: center;
    gap: 14px;
    margin-bottom: 18px;
}
.profile-avatar {
    width: 58px;
    height: 58px;
    border-radius: 50%;
    background: #f0eefe;
    color: #5144b9;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 23px;
    font-weight: 750;
    flex-shrink: 0;
}
.profile-name {
    margin: 0 0 5px;
    font-size: 15px;
    font-weight: 700;
}
.profile-email {
    color: #9295a5;
    font-size: 11px;
    overflow-wrap: anywhere;
}
.badge-row {
    display: flex;
    gap: 7px;
    flex-wrap: wrap;
    margin: 14px 0 18px;
}
.pill {
    border-radius: 20px;
    padding: 6px 9px;
    font-size: 10px;
    font-weight: 650;
}
.pill-purple { background: #efedff; color: #6653c5; }
.pill-green { background: #e7f8ee; color: #16824f; }
.profile-detail {
    display: flex;
    justify-content: space-between;
    gap: 12px;
    padding: 12px 0;
    border-top: 1px solid #f0f0f5;
    font-size: 12px;
}
.profile-detail span { color: #9295a5; }
.profile-detail strong { font-weight: 600; text-align: right; }
.profile-actions {
    display: flex;
    gap: 10px;
    flex-wrap: wrap;
    margin-top: 16px;
}
.text-link {
    color: #a71930 !important;
    text-decoration: none !important;
    font-size: 12px;
    font-weight: 650;
    padding: 10px 2px;
}

.preference-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 15px;
    padding: 13px 0;
    border-bottom: 1px solid #f0f0f5;
}
.preference-row:last-child { border-bottom: none; padding-bottom: 0; }
.preference-text { min-width: 0; }
.preference-title {
    font-size: 12px;
    font-weight: 650;
    color: #45495d;
    display: block;
}
.preference-description {
    display: block;
    margin-top: 4px;
    color: #9295a5;
    font-size: 11px;
    line-height: 1.5;
}

/* ASP.NET CheckBox styled as a toggle */
.toggle-control {
    display: inline-flex;
    align-items: center;
    flex-shrink: 0;
}
.toggle-control input[type=checkbox] {
    appearance: none;
    -webkit-appearance: none;
    width: 38px;
    height: 21px;
    margin: 0;
    border-radius: 20px;
    background: #d6d8e1;
    position: relative;
    cursor: pointer;
    transition: background .2s;
}
.toggle-control input[type=checkbox]::before {
    content: "";
    position: absolute;
    width: 15px;
    height: 15px;
    left: 3px;
    top: 3px;
    background: #fff;
    border-radius: 50%;
    box-shadow: 0 1px 3px rgba(0,0,0,.18);
    transition: transform .2s;
}
.toggle-control input[type=checkbox]:checked { background: #20a464; }
.toggle-control input[type=checkbox]:checked::before { transform: translateX(17px); }
.toggle-control input[type=checkbox]:focus-visible {
    outline: 2px solid #7773ed;
    outline-offset: 3px;
}

.security-box {
    background: #f7f7ff;
    border: 1px solid #e7e5ff;
    border-radius: 9px;
    padding: 13px;
    margin-bottom: 15px;
}
.security-box strong {
    display: block;
    color: #5144b9;
    font-size: 12px;
    margin-bottom: 5px;
}
.security-box span {
    display: block;
    color: #777b8d;
    font-size: 11px;
    line-height: 1.5;
}

.danger-card {
    border: 1px solid #f0c6cb;
    background: #fff;
}
.danger-card .card-heading h3 { color: #b91c1c; }
.danger-card .heading-icon { background: #fff0f0; }
.danger-warning {
    color: #777b8d;
    font-size: 12px;
    line-height: 1.6;
    margin: 10px 0 17px;
}
.danger-actions {
    display: flex;
    flex-direction: column;
    gap: 10px;
}
.danger-actions .btn { width: 100%; text-align: center; }

@media(max-width:1000px) {
    .settings-layout { grid-template-columns: minmax(0,1fr); }
}
@media(max-width:560px) {
    .settings-card { padding: 16px; }
    .form-grid { grid-template-columns: minmax(0,1fr); }
    .form-field.full { grid-column: auto; }
    .settings-heading h2 { font-size: 23px; }
    .settings-tabs { gap: 18px; }
}
</style>
</asp:Content>

<asp:Content ID="PageHeadingContent" ContentPlaceHolderID="PageHeading" runat="server">
    Settings
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="settings-page">

    <div class="settings-heading">
        <div>
            <h2>Admin Settings</h2>
            <p>Manage platform configuration, security, and administrative preferences.</p>
        </div>
    </div>

    <asp:Label ID="lblMessage" runat="server"
        CssClass="message-label" EnableViewState="false" />

    <!-- Settings tabs -->
    <div class="settings-tabs">
        <asp:LinkButton ID="tabGeneral" runat="server" CssClass="settings-tab active"
            CausesValidation="false" OnClick="tabGeneral_Click">General</asp:LinkButton>
        <asp:LinkButton ID="tabAccount" runat="server" CssClass="settings-tab"
            CausesValidation="false" OnClick="tabAccount_Click">Account</asp:LinkButton>
        <asp:LinkButton ID="tabSecurity" runat="server" CssClass="settings-tab"
            CausesValidation="false" OnClick="tabSecurity_Click">Security</asp:LinkButton>
        <asp:LinkButton ID="tabNotifications" runat="server" CssClass="settings-tab"
            CausesValidation="false" OnClick="tabNotifications_Click">Notifications</asp:LinkButton>
        <asp:LinkButton ID="tabSystem" runat="server" CssClass="settings-tab"
            CausesValidation="false" OnClick="tabSystem_Click">System Preferences</asp:LinkButton>
        <asp:LinkButton ID="tabPrivacy" runat="server" CssClass="settings-tab"
            CausesValidation="false" OnClick="tabPrivacy_Click">Privacy &amp; Data</asp:LinkButton>
    </div>

    <div class="settings-layout">

        <!-- LEFT COLUMN -->
        <div class="settings-column">

            <!-- General configuration -->
            <div class="settings-card">
                <div class="card-heading">
                    <span class="heading-icon">⚙️</span>
                    <h3>General Configuration</h3>
                </div>
                <p class="card-description">
                    Configure your platform's main contact information and regional settings.
                </p>

                <div class="form-grid">

                    <div class="form-field full">
                        <label for="txtPlatformName">Platform Name</label>
                        <asp:TextBox ID="txtPlatformName" runat="server"
                            CssClass="form-control" MaxLength="100" />
                    </div>

                    <div class="form-field">
                        <label for="txtContactNumber">Contact Number</label>
                        <asp:TextBox ID="txtContactNumber" runat="server"
                            CssClass="form-control" MaxLength="20" />
                    </div>

                    <div class="form-field">
                        <label for="txtPlatformEmail">Platform Email</label>
                        <asp:TextBox ID="txtPlatformEmail" runat="server"
                            CssClass="form-control" TextMode="Email" MaxLength="150" />
                    </div>

                    <div class="form-field full">
                        <label for="txtSupportEmail">Support Email</label>
                        <asp:TextBox ID="txtSupportEmail" runat="server"
                            CssClass="form-control" TextMode="Email" MaxLength="150" />
                    </div>

                    <div class="form-field">
                        <label for="ddlLocation">Default Location</label>
                        <asp:DropDownList ID="ddlLocation" runat="server" CssClass="form-control">
                            <asp:ListItem>Ahmedabad</asp:ListItem>
                            <asp:ListItem>Rajkot</asp:ListItem>
                            <asp:ListItem>Surat</asp:ListItem>
                            <asp:ListItem>Vadodara</asp:ListItem>
                            <asp:ListItem>Gandhinagar</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="form-field">
                        <label for="ddlTimeZone">Time Zone</label>
                        <asp:DropDownList ID="ddlTimeZone" runat="server" CssClass="form-control">
                            <asp:ListItem Value="IST">IST (UTC+05:30)</asp:ListItem>
                            <asp:ListItem Value="UTC">UTC</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="form-field">
                        <label for="ddlDateFormat">Date Format</label>
                        <asp:DropDownList ID="ddlDateFormat" runat="server" CssClass="form-control">
                            <asp:ListItem Value="dd/MM/yyyy">DD/MM/YYYY</asp:ListItem>
                            <asp:ListItem Value="MM/dd/yyyy">MM/DD/YYYY</asp:ListItem>
                            <asp:ListItem Value="yyyy-MM-dd">YYYY-MM-DD</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="form-field">
                        <label for="ddlLanguage">Language</label>
                        <asp:DropDownList ID="ddlLanguage" runat="server" CssClass="form-control">
                            <asp:ListItem Value="English">English</asp:ListItem>
                            <asp:ListItem Value="Gujarati">Gujarati</asp:ListItem>
                            <asp:ListItem Value="Hindi">Hindi</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                </div>

                <div class="form-actions">
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel"
                        CssClass="btn btn-secondary" CausesValidation="false"
                        OnClick="btnCancel_Click" />
                    <asp:Button ID="btnSaveChanges" runat="server" Text="Save Changes"
                        CssClass="btn btn-primary" OnClick="btnSaveChanges_Click" />
                </div>
            </div>

            <!-- Notifications -->
            <div class="settings-card">
                <div class="card-heading">
                    <span class="heading-icon">🔔</span>
                    <h3>Notifications</h3>
                </div>
                <p class="card-description">
                    Choose which events should be included in administrator notifications.
                </p>

                <div class="preference-row">
                    <div class="preference-text">
                        <span class="preference-title">Emergency Requests</span>
                        <span class="preference-description">Receive urgent blood request alerts.</span>
                    </div>
                    <asp:CheckBox ID="chkEmergencyRequests" runat="server"
                        CssClass="toggle-control" Checked="true" />
                </div>

                <div class="preference-row">
                    <div class="preference-text">
                        <span class="preference-title">New Donors</span>
                        <span class="preference-description">Get notified about new donor registrations.</span>
                    </div>
                    <asp:CheckBox ID="chkNewDonors" runat="server"
                        CssClass="toggle-control" Checked="true" />
                </div>

                <div class="preference-row">
                    <div class="preference-text">
                        <span class="preference-title">Bank Registration</span>
                        <span class="preference-description">Receive new blood bank registration alerts.</span>
                    </div>
                    <asp:CheckBox ID="chkBankRegistration" runat="server"
                        CssClass="toggle-control" Checked="true" />
                </div>

                <div class="preference-row">
                    <div class="preference-text">
                        <span class="preference-title">Weekly Reports</span>
                        <span class="preference-description">Receive weekly activity summaries.</span>
                    </div>
                    <asp:CheckBox ID="chkWeeklyReports" runat="server"
                        CssClass="toggle-control" />
                </div>
            </div>

        </div>

        <!-- RIGHT COLUMN -->
        <div class="settings-column">

            <!-- Admin profile -->
            <div class="settings-card">
                <div class="card-heading">
                    <h3>Admin Profile</h3>
                </div>
                <p class="card-description">Your administrator account information.</p>

                <div class="profile-top">
                    <div class="profile-avatar">A</div>
                    <div>
                        <p class="profile-name">Admin Administrator</p>
                        <div class="profile-email">admin@bloodconnect.org</div>
                    </div>
                </div>

                <div class="badge-row">
                    <span class="pill pill-purple">Super Administrator</span>
                    <span class="pill pill-green">● Active</span>
                </div>

                <div class="profile-detail">
                    <span>Role</span>
                    <strong>System Admin</strong>
                </div>
                <div class="profile-detail">
                    <span>Last Login</span>
                    <strong>Today, 10:45 AM</strong>
                </div>

                <div class="profile-actions">
                    <asp:Button ID="btnEditProfile" runat="server"
                        Text="Edit Profile" CssClass="btn btn-outline"
                        CausesValidation="false" OnClick="btnEditProfile_Click" />
                    <asp:LinkButton ID="btnChangeEmail" runat="server"
                        CssClass="text-link" CausesValidation="false"
                        OnClick="btnChangeEmail_Click">Change Email</asp:LinkButton>
                </div>
            </div>

            <!-- Security -->
            <div class="settings-card">
                <div class="card-heading">
                    <span class="heading-icon">🛡️</span>
                    <h3>Security</h3>
                </div>
                <p class="card-description">
                    Manage account protection and authentication preferences.
                </p>

                <div class="security-box">
                    <strong>🔑 Password Security</strong>
                    <span>Protect your administrator account with a strong, unique password.</span>
                </div>

                <asp:Button ID="btnChangePassword" runat="server"
                    Text="🔑 Change Password" CssClass="btn btn-soft"
                    CausesValidation="false" OnClick="btnChangePassword_Click" />

                <div class="preference-row" style="margin-top:14px;">
                    <div class="preference-text">
                        <span class="preference-title">Two-Factor Authentication</span>
                        <span class="preference-description">Add an extra layer of account security.</span>
                    </div>
                    <asp:CheckBox ID="chkTwoFactor" runat="server"
                        CssClass="toggle-control" Checked="true" />
                </div>
            </div>

            <!-- System preferences -->
            <div class="settings-card">
                <div class="card-heading">
                    <span class="heading-icon">▦</span>
                    <h3>System Preferences</h3>
                </div>
                <p class="card-description">
                    Configure maintenance and backup preferences.
                </p>

                <div class="preference-row">
                    <div class="preference-text">
                        <span class="preference-title">Auto Backup</span>
                        <span class="preference-description">Enable scheduled data backups.</span>
                    </div>
                    <asp:CheckBox ID="chkAutoBackup" runat="server"
                        CssClass="toggle-control" Checked="true" />
                </div>

                <div class="preference-row">
                    <div class="preference-text">
                        <span class="preference-title">Maintenance Mode</span>
                        <span class="preference-description">Mark the platform for maintenance.</span>
                    </div>
                    <asp:CheckBox ID="chkMaintenanceMode" runat="server"
                        CssClass="toggle-control" />
                </div>

                <div class="form-field" style="margin-top:18px;">
                    <label for="ddlDefaultPeriod">Default Reporting Period</label>
                    <asp:DropDownList ID="ddlDefaultPeriod" runat="server"
                        CssClass="form-control">
                        <asp:ListItem Value="7">Last 7 Days</asp:ListItem>
                        <asp:ListItem Value="30" Selected="True">Last 30 Days</asp:ListItem>
                        <asp:ListItem Value="90">Last 90 Days</asp:ListItem>
                        <asp:ListItem Value="365">Last 12 Months</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <!-- Danger zone -->
            <div class="settings-card danger-card">
                <div class="card-heading">
                    <span class="heading-icon">⚠️</span>
                    <h3>Danger Zone</h3>
                </div>

                <p class="danger-warning">
                    Actions here are permanent and affect system functionality.
                    Review carefully before proceeding.
                </p>

                <div class="danger-actions">
                    <asp:Button ID="btnResetPreferences" runat="server"
                        Text="Reset Preferences" CssClass="btn btn-outline"
                        CausesValidation="false" OnClick="btnResetPreferences_Click" />

                    <asp:Button ID="btnDisableAccount" runat="server"
                        Text="Disable Account" CssClass="btn btn-danger"
                        CausesValidation="false" OnClick="btnDisableAccount_Click" />
                </div>
            </div>

        </div>
    </div>
</div>

</asp:Content>
