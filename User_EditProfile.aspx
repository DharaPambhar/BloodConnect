
<%@ Page Title="Edit Profile" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="User_EditProfile.aspx.cs" Inherits="BloodConnect.User_EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit Profile
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">

<style>

    .edit-page {
        width: 100%;
        padding-bottom: 90px;
    }

    .page-intro {
        margin-bottom: 22px;
    }

    .page-intro h2 {
        margin: 0 0 6px;
        font-size: 24px;
        font-weight: 700;
        color: #292733;
    }

    .page-intro p {
        margin: 0;
        color: #88838f;
        font-size: 12px;
    }

    .edit-layout {
        display: grid;
        grid-template-columns: 300px 1fr;
        gap: 22px;
        align-items: start;
    }

    .left-column,
    .right-column {
        min-width: 0;
    }

    .card {
        background: #ffffff;
        border: 1px solid #eeeeee;
        border-radius: 16px;
        padding: 20px;
        margin-bottom: 20px;
    }

    .card-title {
        font-size: 15px;
        font-weight: 700;
        color: #292733;
        margin-bottom: 16px;
    }

    .card-subtitle {
        font-size: 10px;
        color: #999;
        line-height: 1.5;
    }

    /* PROFILE COMPLETION */

    .completion-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 10px;
    }

    .completion-header strong {
        font-size: 13px;
        color: #333;
    }

    .completion-percent {
        font-size: 13px;
        color: #bd1e2d;
        font-weight: 700;
    }

    .progress-bg {
        width: 100%;
        height: 7px;
        background: #f0eeee;
        border-radius: 10px;
        overflow: hidden;
        margin-bottom: 10px;
    }

    .progress-fill {
        width: 95%;
        height: 100%;
        background: #bd1e2d;
        border-radius: 10px;
    }

    /* PROFILE PHOTO */

    .photo-area {
        text-align: center;
    }

    .profile-photo {
        width: 95px;
        height: 95px;
        margin: 0 auto 12px;
        border-radius: 50%;
        background: #eee9ff;
        color: #7050ad;
        border: 3px solid #f3efff;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 34px;
        font-weight: 700;
        position: relative;
    }

    .edit-pencil {
        position: absolute;
        right: -2px;
        bottom: 3px;
        width: 29px;
        height: 29px;
        border-radius: 50%;
        background: #bd1e2d;
        color: white;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 11px;
    }

    .photo-name {
        font-size: 15px;
        font-weight: 700;
        color: #292733;
    }

    .photo-blood {
        margin-top: 5px;
        color: #b91c1c;
        font-size: 11px;
        font-weight: 700;
    }

    .photo-buttons {
        display: flex;
        gap: 8px;
        justify-content: center;
        margin-top: 15px;
    }

    .remove-btn,
    .upload-btn {
        height: 34px;
        padding: 0 13px;
        border-radius: 7px;
        font-size: 10px;
        font-weight: 600;
        display: inline-flex;
        align-items: center;
        justify-content: center;
    }

    .remove-btn {
        background: white;
        border: 1px solid #dddddd;
        color: #777;
    }

    .upload-btn {
        background: #fff0f3;
        border: 1px solid #ffdce2;
        color: #bd1e2d;
    }

    .photo-note {
        margin-top: 12px;
        color: #999;
        font-size: 9px;
        line-height: 1.5;
    }

    /* QUICK ACTIONS */

    .quick-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 9px;
    }

    .quick-action {
        min-height: 70px;
        border: 1px solid #eeeeee;
        border-radius: 10px;
        background: #fafafa;
        text-decoration: none;
        color: #555;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        gap: 7px;
        position: relative;
    }

    .quick-action i {
        font-size: 15px;
        color: #7354ad;
    }

    .quick-action span {
        font-size: 10px;
        font-weight: 600;
    }

    .alert-dot {
        position: absolute;
        top: 7px;
        right: 8px;
        width: 7px;
        height: 7px;
        border-radius: 50%;
        background: #bd1e2d;
    }

    /* FORM CARDS */

    .form-card {
        background: white;
        border: 1px solid #eeeeee;
        border-radius: 16px;
        padding: 22px;
        margin-bottom: 20px;
    }

    .form-card-header {
        border-bottom: 1px solid #eeeeee;
        padding-bottom: 14px;
        margin-bottom: 20px;
    }

    .form-card-header h3 {
        margin: 0 0 5px;
        color: #292733;
        font-size: 16px;
        font-weight: 700;
    }

    .form-card-header p {
        margin: 0;
        color: #999;
        font-size: 10px;
    }

    .form-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 17px 20px;
    }

    .form-group {
        width: 100%;
    }

    .form-group.full {
        grid-column: 1 / -1;
    }

    .form-group label {
        display: block;
        margin-bottom: 7px;
        font-size: 10px;
        font-weight: 600;
        color: #666;
    }

    .required {
        color: #bd1e2d;
    }

    .form-control {
        width: 100%;
        height: 40px;
        box-sizing: border-box;
        border: 1px solid #e1e1e5;
        border-radius: 8px;
        background: #fff;
        padding: 0 11px;
        color: #444;
        font-size: 11px;
        outline: none;
    }

    .form-control:focus {
        border-color: #b9a2e8;
    }

    textarea.form-control {
        height: 72px;
        padding-top: 10px;
        resize: vertical;
    }

    .verified-pill {
        display: inline-block;
        margin-left: 7px;
        padding: 3px 7px;
        border-radius: 20px;
        background: #e3f7eb;
        color: #218653;
        font-size: 8px;
        font-weight: 700;
    }

    .readonly {
        background: #f7f7f8;
        color: #888;
    }

    /* PREFERENCES */

    .settings-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 20px;
    }

    .setting-card {
        background: white;
        border: 1px solid #eeeeee;
        border-radius: 16px;
        padding: 20px;
    }

    .setting-card h3 {
        margin: 0 0 5px;
        font-size: 14px;
        color: #292733;
    }

    .setting-card > p {
        margin: 0 0 18px;
        font-size: 10px;
        color: #999;
    }

    .setting-row {
        display: flex;
        justify-content: space-between;
        align-items: center;
        min-height: 48px;
        border-bottom: 1px solid #f0f0f0;
        gap: 15px;
    }

    .setting-row:last-child {
        border-bottom: none;
    }

    .setting-info strong {
        display: block;
        font-size: 11px;
        color: #444;
        margin-bottom: 3px;
    }

    .setting-info span {
        font-size: 9px;
        color: #999;
    }

    /* TOGGLE */

    .toggle {
        width: 40px;
        height: 22px;
        border-radius: 20px;
        background: #bd1e2d;
        display: flex;
        align-items: center;
        justify-content: flex-end;
        padding: 2px;
        box-sizing: border-box;
    }

    .toggle-off {
        background: #d8d8d8;
        justify-content: flex-start;
    }

    .toggle-circle {
        width: 18px;
        height: 18px;
        background: white;
        border-radius: 50%;
    }

    .status-pill {
        padding: 5px 9px;
        border-radius: 20px;
        background: #e3f7eb;
        color: #218653;
        font-size: 9px;
        font-weight: 700;
    }

    .change-password {
        color: #bd1e2d;
        font-size: 10px;
        font-weight: 600;
        text-decoration: none;
    }

    /* BOTTOM ACTION */

    .bottom-action {
        position: fixed;
        bottom: 0;
        left: 255px;
        right: 0;
        background: white;
        border-top: 1px solid #e8e8e8;
        min-height: 65px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 10px 28px;
        box-sizing: border-box;
        z-index: 100;
    }

    .unsaved-message {
        color: #777;
        font-size: 10px;
    }

    .unsaved-message i {
        color: #888;
        margin-right: 5px;
    }

    .bottom-buttons {
        display: flex;
        gap: 9px;
    }

    .cancel-button {
        height: 38px;
        padding: 0 18px;
        border: 1px solid #dddddd;
        border-radius: 8px;
        background: white;
        color: #666;
        text-decoration: none;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        font-size: 11px;
        font-weight: 600;
    }

    .save-button {
        height: 38px;
        padding: 0 20px;
        border: none;
        border-radius: 8px;
        background: #bd1e2d;
        color: white;
        font-size: 11px;
        font-weight: 600;
        cursor: pointer;
    }

    .save-button:hover {
        background: #a81725;
    }

    .message {
        display: block;
        margin-bottom: 15px;
        padding: 10px 13px;
        border-radius: 8px;
        font-size: 10px;
    }

    .success {
        background: #e3f7eb;
        color: #218653;
    }

    .error {
        background: #fff0f0;
        color: #b91c1c;
    }

    @media(max-width:1100px) {

        .edit-layout {
            grid-template-columns: 1fr;
        }

        .left-column {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .left-column .card {
            margin-bottom: 0;
        }

        .quick-card {
            grid-column: 1 / -1;
        }
    }

    @media(max-width:750px) {

        .form-grid,
        .settings-grid,
        .left-column {
            grid-template-columns: 1fr;
        }

        .form-group.full {
            grid-column: auto;
        }

        .bottom-action {
            left: 0;
            padding: 10px 15px;
        }

        .unsaved-message {
            display: none;
        }

        .bottom-buttons {
            width: 100%;
        }

        .cancel-button,
        .save-button {
            flex: 1;
        }
    }

</style>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="PageHeading" runat="server">
    Edit Profile
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="edit-page">

    <div class="page-intro">
        <h2>Edit Profile</h2>
        <p>
            Update your personal information, contact details, and preferences.
        </p>
    </div>


    <asp:Label ID="lblMessage"
        runat="server"
        Visible="false">
    </asp:Label>


    <div class="edit-layout">

        <div class="left-column">

            <div class="card">

                <div class="card-title">
                    Profile Completion
                </div>

                <div class="completion-header">
                    <strong>Profile completed</strong>
                    <span class="completion-percent">95%</span>
                </div>

                <div class="progress-bg">
                    <div class="progress-fill"></div>
                </div>

                <div class="card-subtitle">
                    Complete your profile to increase trust within the community.
                </div>

            </div>


            <div class="card">

                <div class="card-title">
                    Profile Picture
                </div>

                <div class="photo-area">

                    <div class="profile-photo">

                        <asp:Label ID="lblInitial"
                            runat="server">
                            R
                        </asp:Label>

                        <div class="edit-pencil">
                            <i class="fa-solid fa-pencil"></i>
                        </div>

                    </div>

                    <div class="photo-name">
                        <asp:Label ID="lblProfileName"
                            runat="server">
                            Rahul Shah
                        </asp:Label>
                    </div>

                    <div class="photo-blood">
                        O+ Blood Group
                    </div>

                    <div class="photo-buttons">

                        <button type="button"
                                class="remove-btn">
                            Remove
                        </button>

                        <button type="button"
                                class="upload-btn">
                            Upload New
                        </button>

                    </div>

                    <div class="photo-note">
                        JPG, GIF or PNG. Max size of 5MB.
                    </div>

                </div>

            </div>


            <div class="card quick-card">

                <div class="card-title">
                    Quick Actions
                </div>

                <div class="quick-grid">

                    <a href="User_Profile.aspx"
                       class="quick-action">

                        <i class="fa-solid fa-user"></i>
                        <span>View Profile</span>

                    </a>


                    <a href="User_DonorSearch.aspx"
                       class="quick-action">

                        <i class="fa-solid fa-magnifying-glass"></i>
                        <span>Find Donor</span>

                    </a>


                    <a href="User_MyRequests.aspx"
                       class="quick-action">

                        <i class="fa-solid fa-clock-rotate-left"></i>
                        <span>My Requests</span>

                    </a>


                    <a href="User_Notifications.aspx"
                       class="quick-action">

                        <span class="alert-dot"></span>

                        <i class="fa-solid fa-bell"></i>
                        <span>Alerts</span>

                    </a>

                </div>

            </div>

        </div>


        <div class="right-column">


            <div class="form-card">

                <div class="form-card-header">

                    <h3>
                        Personal Information
                    </h3>

                    <p>
                        Keep your personal details up to date.
                    </p>

                </div>


                <div class="form-grid">


                    <div class="form-group">

                        <label>
                            Full Name <span class="required">*</span>
                        </label>

                        <asp:TextBox ID="txtFullName"
                            runat="server"
                            CssClass="form-control">
                        </asp:TextBox>

                    </div>


                    <div class="form-group">

                        <label>
                            Date of Birth
                        </label>

                        <asp:TextBox ID="txtDOB"
                            runat="server"
                            CssClass="form-control"
                            TextMode="Date">
                        </asp:TextBox>

                    </div>


                    <div class="form-group">

                        <label>
                            Gender
                        </label>

                        <asp:DropDownList ID="ddlGender"
                            runat="server"
                            CssClass="form-control">

                            <asp:ListItem Text="Male"
                                Value="Male">
                            </asp:ListItem>

                            <asp:ListItem Text="Female"
                                Value="Female">
                            </asp:ListItem>

                            <asp:ListItem Text="Other"
                                Value="Other">
                            </asp:ListItem>

                        </asp:DropDownList>

                    </div>


                    <div class="form-group">

                        <label>
                            Phone Number

                            <span class="verified-pill">
                                ✓ Verified
                            </span>

                        </label>

                        <asp:TextBox ID="txtPhone"
                            runat="server"
                            CssClass="form-control">
                        </asp:TextBox>

                    </div>


                    <div class="form-group full">

                        <label>
                            Email Address

                            <span class="verified-pill">
                                ✓ Verified
                            </span>

                        </label>

                        <asp:TextBox ID="txtEmail"
                            runat="server"
                            CssClass="form-control readonly"
                            ReadOnly="true">
                        </asp:TextBox>

                    </div>


                </div>

            </div>


            <div class="form-card">

                <div class="form-card-header">

                    <h3>
                        Address Information
                    </h3>

                    <p>
                        Update your current address and location details.
                    </p>

                </div>


                <div class="form-grid">


                    <div class="form-group">

                        <label>
                            Address Line 1
                            <span class="required">*</span>
                        </label>

                        <asp:TextBox ID="txtAddress1"
                            runat="server"
                            CssClass="form-control">
                        </asp:TextBox>

                    </div>


                    <div class="form-group">

                        <label>
                            Address Line 2
                            <span style="font-weight:400;color:#aaa;">
                                (Optional)
                            </span>
                        </label>

                        <asp:TextBox ID="txtAddress2"
                            runat="server"
                            CssClass="form-control">
                        </asp:TextBox>

                    </div>


                    <div class="form-group">

                        <label>
                            City
                        </label>

                        <asp:TextBox ID="txtCity"
                            runat="server"
                            CssClass="form-control">
                        </asp:TextBox>

                    </div>


                    <div class="form-group">

                        <label>
                            State
                        </label>

                        <asp:DropDownList ID="ddlState"
                            runat="server"
                            CssClass="form-control">

                            <asp:ListItem Text="Gujarat"
                                Value="Gujarat">
                            </asp:ListItem>

                            <asp:ListItem Text="Maharashtra"
                                Value="Maharashtra">
                            </asp:ListItem>

                            <asp:ListItem Text="Rajasthan"
                                Value="Rajasthan">
                            </asp:ListItem>

                            <asp:ListItem Text="Madhya Pradesh"
                                Value="Madhya Pradesh">
                            </asp:ListItem>

                        </asp:DropDownList>

                    </div>


                    <div class="form-group">

                        <label>
                            PIN Code
                        </label>

                        <asp:TextBox ID="txtPincode"
                            runat="server"
                            CssClass="form-control">
                        </asp:TextBox>

                    </div>


                    <div class="form-group">

                        <label>
                            Country
                        </label>

                        <asp:DropDownList ID="ddlCountry"
                            runat="server"
                            CssClass="form-control">

                            <asp:ListItem Text="India"
                                Value="India">
                            </asp:ListItem>

                            <asp:ListItem Text="United States"
                                Value="United States">
                            </asp:ListItem>

                            <asp:ListItem Text="United Kingdom"
                                Value="United Kingdom">
                            </asp:ListItem>

                        </asp:DropDownList>

                    </div>


                </div>

            </div>


            <div class="settings-grid">


                <div class="setting-card">

                    <h3>
                        Blood Requirement Preferences
                    </h3>

                    <p>
                        Set your default blood search preferences.
                    </p>


                    <div class="form-group">

                        <label>
                            Blood Group
                        </label>

                        <asp:DropDownList ID="ddlBloodGroup"
                            runat="server"
                            CssClass="form-control">

                            <asp:ListItem Text="O+" Value="O+"></asp:ListItem>
                            <asp:ListItem Text="O-" Value="O-"></asp:ListItem>
                            <asp:ListItem Text="A+" Value="A+"></asp:ListItem>
                            <asp:ListItem Text="A-" Value="A-"></asp:ListItem>
                            <asp:ListItem Text="B+" Value="B+"></asp:ListItem>
                            <asp:ListItem Text="B-" Value="B-"></asp:ListItem>
                            <asp:ListItem Text="AB+" Value="AB+"></asp:ListItem>
                            <asp:ListItem Text="AB-" Value="AB-"></asp:ListItem>

                        </asp:DropDownList>

                    </div>


                    <div class="form-group"
                         style="margin-top:15px;">

                        <label>
                            Search Radius
                        </label>

                        <asp:DropDownList ID="ddlRadius"
                            runat="server"
                            CssClass="form-control">

                            <asp:ListItem Text="5 km" Value="5"></asp:ListItem>
                            <asp:ListItem Text="10 km" Value="10"></asp:ListItem>
                            <asp:ListItem Text="15 km" Value="15"></asp:ListItem>
                            <asp:ListItem Text="25 km" Value="25"></asp:ListItem>
                            <asp:ListItem Text="50 km" Value="50"></asp:ListItem>

                        </asp:DropDownList>

                    </div>


                    <div class="form-group"
                         style="margin-top:15px;">

                        <label>
                            Primary Location
                        </label>

                        <asp:TextBox ID="txtPrimaryLocation"
                            runat="server"
                            CssClass="form-control">
                        </asp:TextBox>

                    </div>


                    <div class="form-group"
                         style="margin-top:15px;">

                        <label>
                            Default Urgency
                        </label>

                        <asp:DropDownList ID="ddlUrgency"
                            runat="server"
                            CssClass="form-control">

                            <asp:ListItem Text="Normal"
                                Value="Normal">
                            </asp:ListItem>

                            <asp:ListItem Text="Urgent"
                                Value="Urgent">
                            </asp:ListItem>

                            <asp:ListItem Text="Emergency"
                                Value="Emergency">
                            </asp:ListItem>

                        </asp:DropDownList>

                    </div>

                </div>


                <div class="setting-card">

                    <h3>
                        Privacy & Visibility
                    </h3>

                    <p>
                        Control what other users can see.
                    </p>


                    <div class="setting-row">

                        <div class="setting-info">

                            <strong>
                                Profile Visibility
                            </strong>

                            <span>
                                Allow others to view profile
                            </span>

                        </div>

                        <div class="toggle">
                            <div class="toggle-circle"></div>
                        </div>

                    </div>


                    <div class="setting-row">

                        <div class="setting-info">

                            <strong>
                                Show Contact Info
                            </strong>

                            <span>
                                Display phone & email
                            </span>

                        </div>

                        <div class="toggle">
                            <div class="toggle-circle"></div>
                        </div>

                    </div>


                    <div class="setting-row">

                        <div class="setting-info">

                            <strong>
                                Location Visibility
                            </strong>

                            <span>
                                Control location display
                            </span>

                        </div>

                        <asp:DropDownList ID="ddlLocationVisibility"
                            runat="server"
                            CssClass="form-control"
                            style="width:130px;height:34px;">

                            <asp:ListItem Text="Approximate Area"
                                Value="Approximate Area">
                            </asp:ListItem>

                            <asp:ListItem Text="Exact Location"
                                Value="Exact Location">
                            </asp:ListItem>

                            <asp:ListItem Text="Hidden"
                                Value="Hidden">
                            </asp:ListItem>

                        </asp:DropDownList>

                    </div>

                </div>


                <div class="setting-card">

                    <h3>
                        Notifications
                    </h3>

                    <p>
                        Manage your notification preferences.
                    </p>


                    <div class="setting-row">

                        <div class="setting-info">
                            <strong>Emergency Requests</strong>
                        </div>

                        <div class="toggle">
                            <div class="toggle-circle"></div>
                        </div>

                    </div>


                    <div class="setting-row">

                        <div class="setting-info">
                            <strong>Donor Matches</strong>
                        </div>

                        <div class="toggle">
                            <div class="toggle-circle"></div>
                        </div>

                    </div>


                    <div class="setting-row">

                        <div class="setting-info">
                            <strong>Status Updates</strong>
                        </div>

                        <div class="toggle">
                            <div class="toggle-circle"></div>
                        </div>

                    </div>


                    <div class="setting-row">

                        <div class="setting-info">
                            <strong>Promotional</strong>
                        </div>

                        <div class="toggle toggle-off">
                            <div class="toggle-circle"></div>
                        </div>

                    </div>

                </div>


                <div class="setting-card">

                    <h3>
                        Account Security
                    </h3>

                    <p>
                        Manage your account security settings.
                    </p>


                    <div class="setting-row">

                        <div class="setting-info">

                            <strong>
                                Password
                            </strong>

                            <span>
                                Last changed 3 months ago
                            </span>

                        </div>

                        <a href="#"
                           class="change-password">
                            Change Password
                        </a>

                    </div>


                    <div class="setting-row">

                        <div class="setting-info">

                            <strong>
                                Two-Factor Authentication
                            </strong>

                            <span>
                                Extra security for your account
                            </span>

                        </div>

                        <span class="status-pill">
                            Enabled
                        </span>

                    </div>

                </div>


            </div>

        </div>

    </div>


    <div class="bottom-action">

        <div class="unsaved-message">

            <i class="fa-solid fa-circle-info"></i>

            Your changes are not saved yet.

        </div>


        <div class="bottom-buttons">

            <asp:HyperLink ID="btnCancel"
                runat="server"
                NavigateUrl="~/User_Profile.aspx"
                CssClass="cancel-button">

                Cancel

            </asp:HyperLink>


            <asp:Button ID="btnSave"
                runat="server"
                Text="Save Changes"
                CssClass="save-button"
                OnClick="btnSave_Click" />

        </div>

    </div>

</div>

</asp:Content>
