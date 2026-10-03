<%@ Page Title="Donor Profile" Language="C#" MasterPageFile="~/Donor.Master"
    AutoEventWireup="true"
    CodeBehind="Donor_profile.aspx.cs"
    Inherits="WebApplication1.Donor_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        .profile-page {
            max-width: 1100px;
            margin: auto;
        }

        /* PAGE TITLE */

        .page-title {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 22px;
        }

        .page-title h1 {
            margin: 0;
            font-size: 28px;
            color: #202338;
        }

        .page-title p {
            margin: 6px 0 0;
            color: #6B7280;
            font-size: 14px;
        }

        .edit-button {
            display: inline-block;
            background-color: #D80032;
            color: white;
            text-decoration: none;
            padding: 11px 20px;
            border-radius: 7px;
            font-size: 13px;
            font-weight: bold;
        }

        .edit-button:hover {
            background-color: #B8002B;
            color: white;
        }

        /* PROFILE HEADER */

        .profile-header {
            background-color: white;
            border: 1px solid #E5E7EB;
            border-radius: 14px;
            padding: 25px 30px;
            display: flex;
            align-items: center;
            gap: 25px;
            margin-bottom: 25px;
        }

        .profile-photo {
            width: 90px;
            height: 90px;
            border-radius: 50%;
            background-color: #FFF0F3;
            color: #D80032;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 32px;
            font-weight: bold;
            position: relative;
        }

        .verified-icon {
            position: absolute;
            right: 0;
            bottom: 3px;
            width: 25px;
            height: 25px;
            border-radius: 50%;
            background-color: #22C55E;
            color: white;
            font-size: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 3px solid white;
        }

        .profile-header h2 {
            margin: 0 0 7px;
            font-size: 25px;
            color: #202338;
        }

        .profile-header p {
            margin: 5px 0;
            color: #6B7280;
            font-size: 14px;
        }

        .profile-status {
            margin-left: auto;
            background-color: #ECFDF5;
            color: #15803D;
            padding: 8px 14px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: bold;
        }

        /* STATUS BOX */

        .status-container {
            margin-left: auto;
            display: flex;
            gap: 12px;
        }

        .status-box {
            min-width: 130px;
            background-color: #FFF7F8;
            border-radius: 10px;
            padding: 14px;
            text-align: center;
        }

        .status-box-title {
            display: block;
            font-size: 10px;
            color: #6B7280;
            font-weight: bold;
            margin-bottom: 7px;
        }

        .blood-group {
            color: #D80032;
            font-size: 22px;
            font-weight: bold;
        }

        .eligible {
            color: #15803D;
            font-size: 12px;
            font-weight: bold;
        }

        /* GRID */

        .profile-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .profile-card {
            background-color: white;
            border: 1px solid #E5E7EB;
            border-radius: 14px;
            padding: 25px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.03);
        }

        .profile-card.full {
            grid-column: 1 / 3;
        }

        .profile-card h2 {
            margin: 0 0 20px;
            font-size: 17px;
            color: #202338;
        }

        /* INFORMATION ROW */

        .info-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 13px 0;
            border-bottom: 1px solid #F0F0F0;
        }

        .info-row:last-child {
            border-bottom: none;
        }

        .info-label {
            color: #6B7280;
            font-size: 13px;
        }

        .info-value {
            color: #202338;
            font-size: 13px;
            font-weight: bold;
            text-align: right;
        }

        .red-value {
            color: #D80032;
            font-weight: bold;
        }

        .green-value {
            color: #15803D;
            font-weight: bold;
        }

        .blue-tag {
            background-color: #E8F1FF;
            color: #3973C6;
            padding: 5px 10px;
            border-radius: 15px;
            font-size: 12px;
            font-weight: bold;
        }

        /* ELIGIBILITY */

        .eligibility-box {
            background-color: #ECFDF5;
            border: 1px solid #BBF7D0;
            border-radius: 10px;
            padding: 18px;
        }

        .eligibility-title {
            color: #15803D;
            font-weight: bold;
            font-size: 14px;
            margin-bottom: 6px;
        }

        .eligibility-text {
            color: #4B5563;
            font-size: 13px;
            margin: 0;
        }

        /* ACCOUNT STATUS */

        .account-status {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 12px;
        }

        .account-item {
            padding: 13px;
            background-color: #F8F9FA;
            border-radius: 8px;
            color: #333;
            font-size: 13px;
        }

        .account-item span {
            color: #15803D;
            font-weight: bold;
        }

        /* QUICK ACTIONS */

        .quick-actions {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 12px;
        }

        .quick-action {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px;
            border: 1px solid #E5E7EB;
            border-radius: 9px;
            text-decoration: none;
            color: #202338;
            font-size: 13px;
            font-weight: 600;
        }

        .quick-action:hover {
            border-color: #D80032;
            color: #D80032;
        }

        .arrow {
            color: #D80032;
            font-size: 17px;
        }

        /* SECURITY */

        .security-banner {
            margin-top: 20px;
            background-color: #EAEFFD;
            border-radius: 12px;
            padding: 18px 20px;
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .security-icon {
            font-size: 25px;
        }

        .security-banner h3 {
            margin: 0 0 5px;
            color: #263B70;
            font-size: 15px;
        }

        .security-banner p {
            margin: 0;
            color: #59688D;
            font-size: 12px;
        }

        /* MOBILE */

        @media (max-width: 800px) {

            .profile-grid {
                grid-template-columns: 1fr;
            }

            .profile-card.full {
                grid-column: 1;
            }

            .profile-header {
                flex-wrap: wrap;
            }

            .status-container {
                margin-left: 0;
                width: 100%;
            }

            .status-box {
                flex: 1;
            }

            .page-title {
                flex-wrap: wrap;
                gap: 15px;
            }
        }

        @media (max-width: 500px) {

            .account-status,
            .quick-actions {
                grid-template-columns: 1fr;
            }

            .profile-page {
                padding: 10px;
            }
        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="profile-page">


        <!-- PAGE TITLE -->

        <div class="page-title">

            <div>
                <h1>My Profile</h1>

                <p>
                    View and manage your donor information and account details.
                </p>
            </div>

            <a href="EditProfile.aspx" class="edit-button">
                ✎ Edit Profile
            </a>

        </div>


        <!-- PROFILE SUMMARY -->

        <div class="profile-header">

            <div class="profile-photo">

                R

                <div class="verified-icon">
                    ✓
                </div>

            </div>


            <div>

                <h2>Riya Shah</h2>

                <p>Blood Donor</p>

                <p>Member since January 2025</p>

                <p>Ahmedabad, Gujarat</p>

            </div>


            <!-- BLOOD + ELIGIBILITY -->

            <div class="status-container">

                <div class="status-box">

                    <span class="status-box-title">
                        BLOOD GROUP
                    </span>

                    <span class="blood-group">
                        O+
                    </span>

                </div>


                <div class="status-box">

                    <span class="status-box-title">
                        ELIGIBILITY
                    </span>

                    <span class="eligible">
                        ✓ Eligible to Donate
                    </span>

                </div>

            </div>

        </div>


        <!-- MAIN GRID -->

        <div class="profile-grid">


            <!-- PERSONAL INFORMATION -->

            <div class="profile-card">

                <h2>Personal Information</h2>


                <div class="info-row">

                    <span class="info-label">
                        Full Name
                    </span>

                    <span class="info-value">
                        Jane Doe
                    </span>

                </div>


                <div class="info-row">

                    <span class="info-label">
                        Date of Birth
                    </span>

                    <span class="info-value">
                        15 Aug 1995
                    </span>

                </div>


                <div class="info-row">

                    <span class="info-label">
                        Gender
                    </span>

                    <span class="info-value">
                        Female
                    </span>

                </div>


                <div class="info-row">

                    <span class="info-label">
                        Phone
                    </span>

                    <span class="info-value">
                        +91 98765 43210
                    </span>

                </div>


                <div class="info-row">

                    <span class="info-label">
                        Email
                    </span>

                    <span class="info-value">
                        jane.doe@example.com
                    </span>

                </div>


                <div class="info-row">

                    <span class="info-label">
                        City
                    </span>

                    <span class="info-value">
                        Ahmedabad
                    </span>

                </div>


                <div class="info-row">

                    <span class="info-label">
                        State
                    </span>

                    <span class="info-value">
                        Gujarat
                    </span>

                </div>


                <div class="info-row">

                    <span class="info-label">
                        Pincode
                    </span>

                    <span class="info-value">
                        380015
                    </span>

                </div>

            </div>


            <!-- DONOR PROFILE DETAILS -->

            <div class="profile-card">

                <h2>Donor Profile Details</h2>


                <div class="info-row">

                    <span class="info-label">
                        Blood Group
                    </span>

                    <span class="red-value">
                        O+
                    </span>

                </div>


                <div class="info-row">

                    <span class="info-label">
                        Last Donation Date
                    </span>

                    <span class="info-value">
                        12 May 2026
                    </span>

                </div>


                <div class="info-row">

                    <span class="info-label">
                        Next Eligible Date
                    </span>

                    <span class="green-value">
                        10 Aug 2026
                    </span>

                </div>


                <div class="info-row">

                    <span class="info-label">
                        Donation Frequency
                    </span>

                    <span class="blue-tag">
                        Regular Donor
                    </span>

                </div>


                <div class="info-row">

                    <span class="info-label">
                        Total Donations
                    </span>

                    <span class="info-value">
                        8
                    </span>

                </div>


                <div class="info-row">

                    <span class="info-label">
                        Lives Impacted (Est.)
                    </span>

                    <span class="info-value">
                        24
                    </span>

                </div>


                <div class="info-row">

                    <span class="info-label">
                        Emergency Responses
                    </span>

                    <span class="info-value">
                        3
                    </span>

                </div>

            </div>


            <!-- ACCOUNT STATUS -->

            <div class="profile-card">

                <h2>Account Status</h2>


                <div class="account-status">

                    <div class="account-item">
                        ✓ Verified Email
                    </div>

                    <div class="account-item">
                        ✓ Verified Phone Number
                    </div>

                    <div class="account-item">
                        ✓ Profile Information Complete
                    </div>

                    <div class="account-item">
                        ✓ Active Account
                    </div>

                </div>

            </div>


            <!-- QUICK ACTIONS -->

            <div class="profile-card">

                <h2>Quick Actions</h2>


                <div class="quick-actions">

                    <a href="EditProfile.aspx"
                       class="quick-action">

                        <span>✎ Edit Profile</span>

                        <span class="arrow">→</span>

                    </a>


                    <a href="Donation_Eligibility.aspx"
                       class="quick-action">

                        <span>🛡 Check Eligibility</span>

                        <span class="arrow">→</span>

                    </a>


                    <a href="Donation_History.aspx"
                       class="quick-action">

                        <span>↺ View Donation History</span>

                        <span class="arrow">→</span>

                    </a>


                    <a href="Notifications.aspx"
                       class="quick-action">

                        <span>🔔 View Notifications</span>

                        <span class="arrow">→</span>

                    </a>

                </div>

            </div>


            <!-- DONATION ELIGIBILITY -->

            <div class="profile-card full">

                <h2>Donation Eligibility</h2>


                <div class="eligibility-box">

                    <div class="eligibility-title">
                        ✓ Eligible to Donate
                    </div>

                    <p class="eligibility-text">

                        You are currently eligible to donate blood.
                        Your next donation can help save more lives.

                    </p>

                </div>

            </div>


        </div>


        <!-- SECURITY BANNER -->

        <div class="security-banner">

            <div class="security-icon">
                🔒
            </div>

            <div>

                <h3>
                    Your Information is Secure
                </h3>

                <p>
                    BloodConnect uses industry-standard encryption to protect
                    your personal and medical information. Your privacy is our top priority.
                </p>

            </div>

        </div>


    </div>

</asp:Content>