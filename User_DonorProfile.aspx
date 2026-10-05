
<%@ Page Title="Donor Profile" Language="C#" MasterPageFile="~/User.Master"
    AutoEventWireup="true"
    CodeBehind="User_DonorProfile.aspx.cs"
    Inherits="BloodConnect.User_DonorProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>

    .donor-profile-page {
        width: 100%;
    }

    /* ================= PROFILE BANNER ================= */

    .profile-banner {
        background: #FFFFFF;
        border: 1px solid #E5E7EB;
        border-radius: 16px;
        padding: 25px;
        margin-bottom: 20px;
    }

    .profile-main {
        display: flex;
        align-items: center;
        gap: 20px;
    }

    .donor-avatar {
        width: 90px;
        height: 90px;
        border-radius: 50%;
        background: #E8DEF7;
        color: #684BA2;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 25px;
        font-weight: 700;
        border: 3px solid #F2EAFB;
        flex-shrink: 0;
    }

    .profile-info {
        flex: 1;
    }

    .profile-name-row {
        display: flex;
        align-items: center;
        gap: 9px;
        margin-bottom: 8px;
    }

    .profile-name {
        color: #302D35;
        font-size: 24px;
        font-weight: 700;
    }

    .verified-badge {
        background: #E5F6EA;
        color: #25814A;
        border-radius: 15px;
        padding: 5px 9px;
        font-size: 9px;
        font-weight: bold;
    }

    .profile-details {
        display: flex;
        align-items: center;
        gap: 13px;
        flex-wrap: wrap;
        color: #716B77;
        font-size: 10px;
    }

    .detail-item {
        display: flex;
        align-items: center;
        gap: 5px;
    }

    .detail-item i {
        color: #9E3347;
    }

    .blood-pill {
        background: #F8E1E6;
        color: #922A40;
        border-radius: 16px;
        padding: 6px 11px;
        font-weight: bold;
    }

    .available-pill {
        background: #E6F7EB;
        color: #25814A;
        border-radius: 16px;
        padding: 6px 11px;
        font-weight: bold;
    }


    /* ================= ACTIONS ================= */

    .profile-actions {
        display: flex;
        gap: 9px;
        margin-top: 22px;
        padding-top: 20px;
        border-top: 1px solid #EEEAF1;
    }

    .request-btn {
        background: #8F2638;
        color: #FFFFFF;
        border: 1px solid #8F2638;
        border-radius: 8px;
        padding: 10px 17px;
        text-decoration: none;
        font-size: 10px;
        font-weight: bold;
    }

    .request-btn:hover {
        background: #751D2D;
        color: #FFFFFF;
    }

    .back-btn {
        background: #FFFFFF;
        color: #5F5866;
        border: 1px solid #CFC8D5;
        border-radius: 8px;
        padding: 10px 17px;
        text-decoration: none;
        font-size: 10px;
        font-weight: bold;
    }

    .back-btn:hover {
        border-color: #8F2638;
        color: #8F2638;
    }


    /* ================= CONTENT GRID ================= */

    .content-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 18px;
    }

    .info-card {
        background: #FFFFFF;
        border: 1px solid #E5E7EB;
        border-radius: 15px;
        padding: 20px;
    }

    .card-title {
        display: flex;
        align-items: center;
        gap: 8px;
        color: #302D35;
        font-size: 14px;
        font-weight: bold;
        margin-bottom: 17px;
        padding-bottom: 12px;
        border-bottom: 1px solid #EEEAF1;
    }

    .card-title i {
        color: #8F2638;
    }


    /* ================= INFO ROWS ================= */

    .info-row {
        display: flex;
        justify-content: space-between;
        gap: 15px;
        padding: 10px 0;
        border-bottom: 1px solid #F0EDF2;
    }

    .info-row:last-child {
        border-bottom: none;
    }

    .info-label {
        color: #817B87;
        font-size: 10px;
    }

    .info-value {
        color: #403B45;
        font-size: 10px;
        font-weight: 600;
        text-align: right;
    }


    /* ================= STATS ================= */

    .stats-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 10px;
    }

    .stat-box {
        background: #F8F5FB;
        border-radius: 10px;
        padding: 15px 8px;
        text-align: center;
    }

    .stat-number {
        color: #6B50A0;
        font-size: 19px;
        font-weight: bold;
        margin-bottom: 4px;
    }

    .stat-label {
        color: #7D7783;
        font-size: 8px;
    }


    /* ================= AVAILABILITY ================= */

    .availability-box {
        background: #F3FAF5;
        border: 1px solid #D9EEDD;
        border-radius: 10px;
        padding: 14px;
        display: flex;
        align-items: center;
        gap: 11px;
    }

    .availability-icon {
        width: 35px;
        height: 35px;
        border-radius: 50%;
        background: #DDF3E3;
        color: #25814A;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .availability-title {
        color: #267443;
        font-size: 11px;
        font-weight: bold;
        margin-bottom: 3px;
    }

    .availability-text {
        color: #6C8272;
        font-size: 9px;
    }


    /* ================= SAFETY ================= */

    .safety-note {
        margin-top: 18px;
        background: #F5F7FA;
        border: 1px solid #DFE4EA;
        border-radius: 11px;
        padding: 13px 15px;
        display: flex;
        gap: 10px;
        color: #6D7279;
        font-size: 9px;
        line-height: 1.6;
    }

    .safety-note i {
        color: #65809C;
        font-size: 13px;
        margin-top: 2px;
    }


    /* ================= RESPONSIVE ================= */

    @media (max-width: 850px) {

        .profile-main {
            align-items: flex-start;
        }

        .content-grid {
            grid-template-columns: 1fr;
        }

    }

    @media (max-width: 600px) {

        .profile-main {
            flex-direction: column;
        }

        .profile-actions {
            flex-direction: column;
        }

        .profile-actions a {
            text-align: center;
        }

        .stats-grid {
            grid-template-columns: 1fr;
        }

    }

</style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

<div class="donor-profile-page">


    <!-- ================= DONOR PROFILE SUMMARY ================= -->

    <div class="profile-banner">

        <div class="profile-main">


            <!-- DONOR AVATAR -->

            <div class="donor-avatar">
                AP
            </div>


            <!-- DONOR INFORMATION -->

            <div class="profile-info">

                <div class="profile-name-row">

                    <div class="profile-name">
                        Ananya Patel
                    </div>

                    <span class="verified-badge">

                        <i class="fa-solid fa-circle-check"></i>
                        Verified

                    </span>

                </div>


                <div class="profile-details">


                    <span class="blood-pill">

                        <i class="fa-solid fa-droplet"></i>
                        O+

                    </span>


                    <span class="detail-item">

                        <i class="fa-solid fa-location-dot"></i>

                        Navrangpura, Ahmedabad

                    </span>


                    <span class="detail-item">

                        <i class="fa-solid fa-ruler-horizontal"></i>

                        1.8 km away

                    </span>


                    <span class="available-pill">

                        <i class="fa-solid fa-circle-check"></i>

                        Available Now

                    </span>


                </div>

            </div>

        </div>


        <!-- ================= ACTION BUTTONS ================= -->

        <div class="profile-actions">

            <a href="User_CreateRequest.aspx"
               class="request-btn">

                <i class="fa-solid fa-paper-plane"></i>

                Send Blood Request

            </a>


            <a href="User_SearchResults.aspx"
               class="back-btn">

                <i class="fa-solid fa-arrow-left"></i>

                Back to Search Results

            </a>

        </div>

    </div>


    <!-- ================= CONTENT ================= -->

    <div class="content-grid">


        <!-- ================= DONOR INFORMATION ================= -->

        <div class="info-card">

            <div class="card-title">

                <i class="fa-solid fa-user"></i>

                Donor Information

            </div>


            <div class="info-row">

                <span class="info-label">
                    Full Name
                </span>

                <span class="info-value">
                    Ananya Patel
                </span>

            </div>


            <div class="info-row">

                <span class="info-label">
                    Blood Group
                </span>

                <span class="info-value">
                    O+
                </span>

            </div>


            <div class="info-row">

                <span class="info-label">
                    Location
                </span>

                <span class="info-value">
                    Navrangpura, Ahmedabad
                </span>

            </div>


            <div class="info-row">

                <span class="info-label">
                    Distance
                </span>

                <span class="info-value">
                    1.8 km
                </span>

            </div>


            <div class="info-row">

                <span class="info-label">
                    Verification
                </span>

                <span class="info-value"
                      style="color:#25814A;">

                    <i class="fa-solid fa-circle-check"></i>
                    Verified Donor

                </span>

            </div>

        </div>


        <!-- ================= DONATION STATS ================= -->

        <div class="info-card">

            <div class="card-title">

                <i class="fa-solid fa-chart-simple"></i>

                Donation Statistics

            </div>


            <div class="stats-grid">

                <div class="stat-box">

                    <div class="stat-number">
                        12
                    </div>

                    <div class="stat-label">
                        Total Donations
                    </div>

                </div>


                <div class="stat-box">

                    <div class="stat-number">
                        8
                    </div>

                    <div class="stat-label">
                        Successful
                    </div>

                </div>


                <div class="stat-box">

                    <div class="stat-number">
                        4
                    </div>

                    <div class="stat-label">
                        This Year
                    </div>

                </div>

            </div>

        </div>


        <!-- ================= AVAILABILITY ================= -->

        <div class="info-card">

            <div class="card-title">

                <i class="fa-solid fa-clock"></i>

                Current Availability

            </div>


            <div class="availability-box">

                <div class="availability-icon">

                    <i class="fa-solid fa-check"></i>

                </div>


                <div>

                    <div class="availability-title">
                        Available Now
                    </div>

                    <div class="availability-text">
                        This donor has marked themselves as available
                        for blood donation.
                    </div>

                </div>

            </div>

        </div>


        <!-- ================= DONOR LOCATION ================= -->

        <div class="info-card">

            <div class="card-title">

                <i class="fa-solid fa-location-dot"></i>

                Location Details

            </div>


            <div class="info-row">

                <span class="info-label">
                    Area
                </span>

                <span class="info-value">
                    Navrangpura
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
                    Distance From You
                </span>

                <span class="info-value">
                    1.8 km
                </span>

            </div>

        </div>

    </div>


    <!-- ================= SAFETY NOTE ================= -->

    <div class="safety-note">

        <i class="fa-solid fa-circle-info"></i>

        <div>

            <strong>
                Safety Note:
            </strong>

            Donor information is provided for blood donation
            coordination only. Please communicate securely through
            BloodConnect and do not share unnecessary personal
            information.

        </div>

    </div>


</div>

</asp:Content>
