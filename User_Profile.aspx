
<%@ Page Title="My Profile" Language="C#" MasterPageFile="~/User.Master"
    AutoEventWireup="true" CodeBehind="User_Profile.aspx.cs"
    Inherits="BloodConnect.User_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>

    .profile-page {
        padding: 30px;
        background: #f7f6fb;
        min-height: calc(100vh - 80px);
    }

    .page-top {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 25px;
    }

    .page-title h1 {
        margin: 0;
        color: #29233d;
        font-size: 30px;
    }

    .page-title p {
        margin: 7px 0 0;
        color: #777;
        font-size: 14px;
    }

    .edit-btn {
        background: #b51f3a;
        color: white;
        padding: 12px 20px;
        border-radius: 8px;
        text-decoration: none;
        font-weight: 600;
    }

    .edit-btn:hover {
        background: #94182f;
        color: white;
    }

    .profile-layout {
        display: grid;
        grid-template-columns: 290px 1fr;
        gap: 22px;
    }

    .card {
        background: white;
        border-radius: 15px;
        padding: 22px;
        box-shadow: 0 3px 14px rgba(0,0,0,.06);
        margin-bottom: 20px;
    }

    .profile-card {
        text-align: center;
    }

    .avatar-box {
        position: relative;
        display: inline-block;
        margin-bottom: 12px;
    }

    .avatar {
        width: 115px;
        height: 115px;
        border-radius: 50%;
        background: #e8defc;
        color: #6b50b5;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 42px;
        font-weight: 700;
        border: 5px solid #f0ebff;
        box-sizing: border-box;
    }

    .online-dot {
        position: absolute;
        width: 16px;
        height: 16px;
        background: #22a65a;
        border: 3px solid white;
        border-radius: 50%;
        right: 7px;
        bottom: 9px;
    }

    .verified {
        display: inline-block;
        background: #e7f8ee;
        color: #23934d;
        padding: 6px 11px;
        border-radius: 20px;
        font-size: 11px;
        font-weight: 700;
        margin-bottom: 10px;
    }

    .profile-card h2 {
        margin: 5px 0;
        color: #29233d;
        font-size: 22px;
    }

    .role {
        color: #7b61c9;
        font-weight: 600;
        margin-bottom: 15px;
    }

    .small-info {
        color: #777;
        font-size: 13px;
        margin: 7px 0;
    }

    .completion-title {
        display: flex;
        justify-content: space-between;
        font-weight: 700;
        font-size: 13px;
        color: #40384f;
    }

    .progress {
        height: 8px;
        background: #eee;
        border-radius: 10px;
        margin: 12px 0;
        overflow: hidden;
    }

    .progress-bar {
        width: 85%;
        height: 100%;
        background: #7b61c9;
        border-radius: 10px;
    }

    .completion-text {
        color: #777;
        font-size: 12px;
        line-height: 1.5;
    }

    .complete-btn {
        display: block;
        margin-top: 13px;
        padding: 9px;
        border-radius: 7px;
        background: #f2edff;
        color: #6b50b5;
        text-decoration: none;
        font-weight: 600;
        font-size: 13px;
    }

    .quick-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 10px;
    }

    .quick-btn {
        padding: 14px 5px;
        text-align: center;
        background: #faf9fd;
        border-radius: 9px;
        text-decoration: none;
        color: #40384f;
        font-size: 12px;
        font-weight: 600;
    }

    .quick-btn:hover {
        background: #f0ebff;
        color: #6b50b5;
    }

    .section-title {
        font-size: 18px;
        font-weight: 700;
        color: #29233d;
        margin-bottom: 18px;
    }

    .info-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 15px;
    }

    .info-item {
        background: #faf9fd;
        padding: 15px;
        border-radius: 9px;
    }

    .info-label {
        font-size: 12px;
        color: #888;
        margin-bottom: 6px;
    }

    .info-value {
        color: #29233d;
        font-size: 14px;
        font-weight: 600;
    }

    .two-cards {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 20px;
    }

    .blood-pill {
        display: inline-block;
        background: #fdebed;
        color: #b51f3a;
        padding: 7px 13px;
        border-radius: 20px;
        font-weight: 700;
    }

    .card-link {
        display: inline-block;
        margin-top: 15px;
        color: #b51f3a;
        text-decoration: none;
        font-weight: 600;
        font-size: 13px;
    }

    .status-active {
        color: #23934d;
        font-weight: 700;
    }

    .verify {
        color: #23934d;
        font-weight: 600;
    }

    .verify-now {
        color: #d13c75;
        font-weight: 600;
    }

    .privacy-item,
    .security-item {
        display: flex;
        justify-content: space-between;
        padding: 9px 0;
        border-bottom: 1px solid #eee;
        font-size: 13px;
    }

    .privacy-item:last-child,
    .security-item:last-child {
        border-bottom: none;
    }

    .bottom-banner {
        background: white;
        border-radius: 15px;
        padding: 25px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        box-shadow: 0 3px 14px rgba(0,0,0,.06);
        margin-top: 5px;
    }

    .bottom-banner h3 {
        margin: 0 0 6px;
        color: #29233d;
    }

    .bottom-banner p {
        margin: 0;
        color: #777;
        font-size: 13px;
    }

    .red-btn {
        background: #b51f3a;
        color: white;
        padding: 12px 20px;
        border-radius: 8px;
        text-decoration: none;
        font-weight: 600;
    }

    .red-btn:hover {
        background: #94182f;
        color: white;
    }

    @media(max-width: 900px) {

        .profile-layout {
            grid-template-columns: 1fr;
        }

        .two-cards,
        .info-grid {
            grid-template-columns: 1fr;
        }
    }

    @media(max-width: 600px) {

        .profile-page {
            padding: 15px;
        }

        .page-top,
        .bottom-banner {
            flex-direction: column;
            align-items: flex-start;
            gap: 15px;
        }
    }

</style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="profile-page">

    <!-- PAGE HEADER -->

    <div class="page-top">

        <div class="page-title">

            <h1>My Profile</h1>

            <p>
                View and manage your personal information and account details.
            </p>

        </div>

        <a href="User_EditProfile.aspx" class="edit-btn">
            ✎ Edit Profile
        </a>

    </div>


    <div class="profile-layout">


        <!-- LEFT SIDE -->

        <div>


            <!-- PROFILE CARD -->

            <div class="card profile-card">

                <div class="avatar-box">

                    <div class="avatar">

                        <asp:Label ID="lblInitial"
                            runat="server">
                        </asp:Label>

                    </div>

                    <span class="online-dot"></span>

                </div>

                <br />

                <span class="verified">
                    ● VERIFIED USER
                </span>

                <h2>

                    <asp:Label ID="lblName"
                        runat="server">
                    </asp:Label>

                </h2>

                <div class="role">
                    Blood Seeker
                </div>

                <div class="small-info">
                    📍 Ahmedabad
                </div>

                <div class="small-info">
                    📅 Since Jan '26
                </div>

            </div>


            <!-- PROFILE COMPLETION -->

            <div class="card">

                <div class="completion-title">

                    <span>PROFILE COMPLETION</span>

                    <span>85%</span>

                </div>

                <div class="progress">

                    <div class="progress-bar"></div>

                </div>

                <div class="completion-text">

                    Complete your profile to increase trust
                    and visibility when requesting blood.

                </div>

                <a href="User_EditProfile.aspx"
                   class="complete-btn">

                    Complete Profile

                </a>

            </div>


            <!-- QUICK ACTIONS -->

            <div class="card">

                <div class="section-title">
                    Quick Actions
                </div>

                <div class="quick-grid">

                    <a href="User_DonorSearch.aspx"
                       class="quick-btn">
                        🔍<br />
                        Smart Search
                    </a>

                    <a href="User_CreateRequest.aspx"
                       class="quick-btn">
                        ➕<br />
                        New Request
                    </a>

                    <a href="User_MyRequests.aspx"
                       class="quick-btn">
                        🕒<br />
                        My Requests
                    </a>

                    <a href="User_Notifications.aspx"
                       class="quick-btn">
                        🔔<br />
                        Alerts
                    </a>

                </div>

            </div>

        </div>


        <!-- RIGHT SIDE -->

        <div>


            <!-- PERSONAL INFORMATION -->

            <div class="card">

                <div class="section-title">
                    Personal Information
                </div>

                <div class="info-grid">


                    <div class="info-item">

                        <div class="info-label">
                            Full Name
                        </div>

                        <div class="info-value">

                            <asp:Label ID="lblFullName"
                                runat="server">
                            </asp:Label>

                        </div>

                    </div>


                    <div class="info-item">

                        <div class="info-label">
                            Date of Birth
                        </div>

                        <div class="info-value">
                            14 August 1992
                        </div>

                    </div>


                    <div class="info-item">

                        <div class="info-label">
                            Gender
                        </div>

                        <div class="info-value">
                            Female
                        </div>

                    </div>


                    <div class="info-item">

                        <div class="info-label">
                            Phone Number
                        </div>

                        <div class="info-value">
                            +91 98765 43210
                        </div>

                    </div>


                    <div class="info-item">

                        <div class="info-label">
                            Email Address
                        </div>

                        <div class="info-value">

                            <asp:Label ID="lblEmail"
                                runat="server">
                            </asp:Label>

                        </div>

                    </div>


                    <div class="info-item">

                        <div class="info-label">
                            Address
                        </div>

                        <div class="info-value">
                            402, Shivalik Highstreet,
                            Satellite Road
                        </div>

                    </div>


                    <div class="info-item">

                        <div class="info-label">
                            City / Location
                        </div>

                        <div class="info-value">
                            Ahmedabad, Gujarat
                        </div>

                    </div>


                    <div class="info-item">

                        <div class="info-label">
                            PIN Code
                        </div>

                        <div class="info-value">
                            380015
                        </div>

                    </div>

                </div>

            </div>


            <!-- REQUIREMENT + EMERGENCY -->

            <div class="two-cards">


                <!-- REQUIREMENT INFORMATION -->

                <div class="card">

                    <div class="section-title">
                        Requirement Information
                    </div>

                    <div class="info-label">
                        Required Blood Group
                    </div>

                    <span class="blood-pill">
                        O+
                    </span>

                    <div class="info-item"
                         style="margin-top:15px;">

                        <div class="info-label">
                            Primary Location
                        </div>

                        <div class="info-value">
                            Ahmedabad
                        </div>

                    </div>

                    <div class="info-item"
                         style="margin-top:10px;">

                        <div class="info-label">
                            Search Radius
                        </div>

                        <div class="info-value">
                            25 km
                        </div>

                    </div>

                    <a href="User_EditProfile.aspx"
                       class="card-link">

                        Edit Preferences →

                    </a>

                </div>


                <!-- EMERGENCY CONTACT -->

                <div class="card">

                    <div class="section-title">
                        Emergency Contact
                    </div>

                    <div class="info-item">

                        <div class="info-label">
                            Name
                        </div>

                        <div class="info-value">
                            Neha Shah
                        </div>

                    </div>

                    <div class="info-item"
                         style="margin-top:10px;">

                        <div class="info-label">
                            Relationship
                        </div>

                        <div class="info-value">
                            Sister
                        </div>

                    </div>

                    <div class="info-item"
                         style="margin-top:10px;">

                        <div class="info-label">
                            Phone Number
                        </div>

                        <div class="info-value">
                            +91 98765 00011
                        </div>

                    </div>

                    <a href="User_EditProfile.aspx"
                       class="card-link">

                        ✎ Edit Contact

                    </a>

                </div>

            </div>


            <!-- ACCOUNT STATUS + VERIFICATIONS -->

            <div class="two-cards">


                <div class="card">

                    <div class="section-title">
                        Account Status
                    </div>

                    <div class="privacy-item">

                        <span>Account ID</span>

                        <strong>
                            BC-USR-10245
                        </strong>

                    </div>

                    <div class="privacy-item">

                        <span>Account Type</span>

                        <strong>
                            Blood Seeker
                        </strong>

                    </div>

                    <div class="privacy-item">

                        <span>Current Status</span>

                        <span class="status-active">
                            ● Active
                        </span>

                    </div>

                    <div class="privacy-item">

                        <span>Last Updated</span>

                        <strong>
                            2 days ago
                        </strong>

                    </div>

                </div>


                <div class="card">

                    <div class="section-title">
                        Verifications
                    </div>

                    <div class="privacy-item">

                        <span>Email Address</span>

                        <span class="verify">
                            ✓ Verified
                        </span>

                    </div>

                    <div class="privacy-item">

                        <span>Phone Number</span>

                        <span class="verify">
                            ✓ Verified
                        </span>

                    </div>

                    <div class="privacy-item">

                        <span>Govt. ID Proof</span>

                        <span class="verify-now">
                            Verify Now
                        </span>

                    </div>

                </div>

            </div>


            <!-- PRIVACY + SECURITY -->

            <div class="two-cards">


                <div class="card">

                    <div class="section-title">
                        Privacy & Visibility
                    </div>

                    <div class="privacy-item">

                        <span>Profile</span>

                        <strong>
                            Limited
                        </strong>

                    </div>

                    <div class="privacy-item">

                        <span>Contact Info</span>

                        <strong>
                            Private
                        </strong>

                    </div>

                    <div class="privacy-item">

                        <span>Location</span>

                        <strong>
                            Approximate
                        </strong>

                    </div>

                    <a href="#" class="card-link">
                        Manage Privacy →
                    </a>

                </div>


                <div class="card">

                    <div class="section-title">
                        Account Security
                    </div>

                    <div class="security-item">

                        <span>Password</span>

                        <strong>
                            Changed 30d ago
                        </strong>

                    </div>

                    <div class="security-item">

                        <span>Two-Factor (2FA)</span>

                        <strong class="verify">
                            Enabled
                        </strong>

                    </div>

                    <div class="security-item">

                        <span>Login Alerts</span>

                        <strong class="verify">
                            Enabled
                        </strong>

                    </div>

                    <a href="#" class="card-link">
                        Change Password
                    </a>

                    &nbsp;&nbsp;

                    <a href="#" class="card-link">
                        Security Settings
                    </a>

                </div>

            </div>

        </div>

    </div>


    <!-- BOTTOM -->

    <div class="bottom-banner">

        <div>

            <h3>
                Want to update your information?
            </h3>

            <p>
                Keep your profile current to ensure seamless
                communication during emergencies.
            </p>

        </div>

        <a href="User_EditProfile.aspx"
           class="red-btn">

            ✎ Edit Profile Details

        </a>

    </div>

</div>

</asp:Content>
