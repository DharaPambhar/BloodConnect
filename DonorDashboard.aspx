<%@ Page Title="Donor Dashboard" Language="C#" MasterPageFile="~/Donor.Master"
    AutoEventWireup="true"
    CodeBehind="DonorDashboard.aspx.cs"
    Inherits="WebApplication1.DonorDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        /* WELCOME BANNER */

        .welcome-banner {
            background-color: #FFFFFF;
            border-radius: 14px;
            padding: 28px 30px;
            margin-bottom: 25px;
            border: 1px solid #E5E7EB;
            position: relative;
            overflow: hidden;
        }

        .welcome-banner h1 {
            margin: 0 0 8px 0;
            font-size: 25px;
            color: #000000;
        }

        .welcome-banner h1 span {
            color: black;
        }

        .welcome-banner p {
            margin: 0;
            color: #000000;
            font-size: 14px;
            max-width: 720px;
            line-height: 1.6;
        }

        .blood-drop {
            position: absolute;
            right: 45px;
            top: 20px;
            font-size: 75px;
            opacity: 0.08;
        }


        /* STATS */

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 18px;
            margin-bottom: 25px;
        }

        .stat-card {
            background-color: #FFFFFF;
            border: 1px solid #E5E7EB;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.03);
        }

        .stat-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }

        .stat-icon {
            width: 40px;
            height: 40px;
            border-radius: 9px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 19px;
        }

        .pink-icon {
            background-color: #FFF0F3;
            color: #D80032;
        }

        .blue-icon {
            background-color: #EEF3FF;
            color: #3B62F6;
        }

        .green-icon {
            background-color: #EAF8F0;
            color: #1E9E5A;
        }

        .red-icon {
            background-color: #FFECEF;
            color: #D80032;
        }

        .stat-title {
            color: #777777;
            font-size: 13px;
            margin-bottom: 6px;
        }

        .stat-value {
            font-size: 25px;
            font-weight: bold;
            color: #202338;
        }


        /* MAIN GRID */

        .dashboard-grid {
            display: grid;
            grid-template-columns: minmax(0, 2fr) minmax(280px, 1fr);
            gap: 22px;
        }


        /* COMMON CARD */

        .card {
            background-color: #FFFFFF;
            border: 1px solid #E5E7EB;
            border-radius: 12px;
            padding: 22px;
            margin-bottom: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.03);
        }

        .card-title {
            font-size: 17px;
            font-weight: bold;
            color: #202338;
            margin-bottom: 18px;
        }


        /* ELIGIBILITY */

        .eligibility-card {
            border: 1px solid #A8DDBD;
            background-color: #FBFFFC;
        }

        .eligibility-status {
            display: flex;
            align-items: center;
            gap: 10px;
            color: #16834A;
            font-size: 17px;
            font-weight: bold;
            margin-bottom: 12px;
        }

        .check-circle {
            width: 28px;
            height: 28px;
            border-radius: 50%;
            background-color: #E2F7EA;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .eligibility-info {
            color: #666666;
            font-size: 13px;
            line-height: 1.8;
        }

        .red-button {
            display: inline-block;
            background-color: #D80032;
            color: white;
            text-decoration: none;
            padding: 10px 18px;
            border-radius: 6px;
            font-size: 13px;
            margin-top: 14px;
        }

        .red-button:hover {
            background-color: #B9002B;
        }


        /* EMERGENCY */

        .request-item {
            border: 1px solid #EEEEEE;
            border-radius: 9px;
            padding: 17px;
            margin-bottom: 12px;
        }

        .request-top {
            display: flex;
            justify-content: space-between;
            gap: 10px;
        }

        .hospital-name {
            font-size: 14px;
            font-weight: bold;
            color: #202338;
        }

        .blood-group {
            background-color: #FFF0F3;
            color: #D80032;
            padding: 5px 9px;
            border-radius: 5px;
            font-size: 12px;
            font-weight: bold;
        }

        .request-info {
            color: #777777;
            font-size: 12px;
            margin-top: 8px;
        }

        .outline-button {
            display: inline-block;
            border: 1px solid #D80032;
            color: #D80032;
            text-decoration: none;
            padding: 8px 13px;
            border-radius: 6px;
            font-size: 12px;
            margin-top: 12px;
        }

        .outline-button:hover {
            background-color: #FFF0F3;
        }


        /* CAMPS */

        .camp-item {
            border: 1px solid #EEEEEE;
            border-radius: 9px;
            padding: 17px;
        }

        .camp-name {
            font-size: 14px;
            font-weight: bold;
            color: #202338;
            margin-bottom: 8px;
        }

        .camp-info {
            color: #777777;
            font-size: 12px;
            line-height: 1.8;
        }

        .blue-button {
            display: inline-block;
            background-color: #3B62F6;
            color: white;
            text-decoration: none;
            padding: 9px 15px;
            border-radius: 6px;
            font-size: 12px;
            margin-top: 12px;
        }

        .blue-button:hover {
            background-color: #294ED2;
        }


        /* QUICK ACTIONS */

        .quick-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 12px;
        }

        .quick-action {
            border: 1px solid #E5E7EB;
            border-radius: 9px;
            padding: 17px 10px;
            text-align: center;
            text-decoration: none;
            color: #202338;
            font-size: 12px;
        }

        .quick-action:hover {
            border-color: #D80032;
            background-color: #FFF8FA;
        }

        .quick-icon {
            font-size: 22px;
            margin-bottom: 8px;
        }


        /* IMPACT */

        .impact-number {
            font-size: 30px;
            font-weight: bold;
            color: #D80032;
            margin-bottom: 5px;
        }

        .impact-label {
            color: #777777;
            font-size: 13px;
            margin-bottom: 15px;
        }

        .progress {
            width: 100%;
            height: 9px;
            background-color: #EEEEEE;
            border-radius: 10px;
            overflow: hidden;
            margin-bottom: 12px;
        }

        .progress-bar {
            width: 75%;
            height: 100%;
            background-color: #D80032;
            border-radius: 10px;
        }

        .impact-badge {
            background-color: #FFF0F3;
            color: #D80032;
            padding: 9px 10px;
            border-radius: 7px;
            font-size: 11px;
            line-height: 1.5;
        }


        /* ACTIVITY */

        .activity {
            position: relative;
            padding-left: 24px;
            margin-bottom: 18px;
        }

        .activity::before {
            content: "";
            position: absolute;
            left: 3px;
            top: 5px;
            width: 8px;
            height: 8px;
            border-radius: 50%;
            background-color: #D80032;
        }

        .activity::after {
            content: "";
            position: absolute;
            left: 6px;
            top: 15px;
            width: 2px;
            height: calc(100% + 5px);
            background-color: #E5E7EB;
        }

        .activity:last-child::after {
            display: none;
        }

        .activity-title {
            font-size: 13px;
            font-weight: bold;
            color: #202338;
        }

        .activity-info {
            font-size: 11px;
            color: #888888;
            margin-top: 5px;
            line-height: 1.5;
        }


        /* RESPONSIVE */

        @media (max-width: 1050px) {

            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }

        }

        @media (max-width: 800px) {

            .dashboard-grid {
                grid-template-columns: 1fr;
            }

        }

        @media (max-width: 550px) {

            .stats-grid {
                grid-template-columns: 1fr;
            }

            .welcome-banner {
                padding: 22px;
            }

            .welcome-banner h1 {
                font-size: 21px;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">


    <!-- WELCOME BANNER -->

    <div class="welcome-banner">

        <h1>
            Good Morning, <span>Riya! </span>
        </h1>

        <p>
            Your dedication is saving lives.
            Ready to make an impact today?
            Check your eligibility or find a nearby emergency request.
        </p>

        <div class="blood-drop">
            🩸
        </div>

    </div>


    <!-- STATS -->

    <div class="stats-grid">


        <div class="stat-card">

            <div class="stat-top">

                <div class="stat-icon pink-icon">
                    🩸
                </div>

            </div>

            <div class="stat-title">
                Total Donations
            </div>

            <div class="stat-value">
                8
            </div>

        </div>


        <div class="stat-card">

            <div class="stat-top">

                <div class="stat-icon blue-icon">
                    ❤️
                </div>

            </div>

            <div class="stat-title">
                Lives Impacted
            </div>

            <div class="stat-value">
                24
            </div>

        </div>


        <div class="stat-card">

            <div class="stat-top">

                <div class="stat-icon green-icon">
                    ✓
                </div>

            </div>

            <div class="stat-title">
                Next Eligible Date
            </div>

            <div class="stat-value">
                90 Days
            </div>

        </div>


        <div class="stat-card">

            <div class="stat-top">

                <div class="stat-icon red-icon">
                    🚨
                </div>

            </div>

            <div class="stat-title">
                Emergency Responses
            </div>

            <div class="stat-value">
                3
            </div>

        </div>


    </div>


    <!-- MAIN DASHBOARD GRID -->

    <div class="dashboard-grid">


        <!-- LEFT / MAIN COLUMN -->

        <div>


            <!-- ELIGIBILITY -->

            <div class="card eligibility-card">

                <div class="card-title">
                    Donation Eligibility
                </div>

                <div class="eligibility-status">

                    <div class="check-circle">
                        ✓
                    </div>

                    Eligible to Donate

                </div>

                <div class="eligibility-info">

                    Last Donation:
                    <b>Oct 12, 2023</b>

                    <br />

                    Next Eligible:
                    <b>Jan 12, 2024</b>

                </div>

                <a href="DonationEligibility.aspx"
                   class="red-button">
                    Check Eligibility
                </a>

            </div>


            <!-- EMERGENCY REQUESTS -->

            <div class="card">

                <div class="card-title">
                    Nearby Emergency Requests
                </div>


                <div class="request-item">

                    <div class="request-top">

                        <div class="hospital-name">
                            City Care Hospital
                        </div>

                        <div class="blood-group">
                            O+
                        </div>

                    </div>

                    <div class="request-info">
                        Ahmedabad &nbsp; • &nbsp; 3.2 km away
                    </div>

                    <a href="EmergencyDetails.aspx"
                       class="outline-button">
                        Respond Now
                    </a>

                </div>


            </div>


            <!-- CAMPS -->

            <div class="card">

                <div class="card-title">
                    Upcoming Camps Near You
                </div>


                <div class="camp-item">

                    <div class="camp-name">
                        Community Blood Donation Drive
                    </div>

                    <div class="camp-info">

                        📅 March 15, 2024

                        <br />

                        📍 Navrangpura Community Hall

                    </div>

                    <a href="BookDonationSlot.aspx"
                       class="blue-button">
                        Book Slot
                    </a>

                </div>


            </div>


        </div>


        <!-- RIGHT COLUMN -->

        <div>


            <!-- QUICK ACTIONS -->

            <div class="card">

                <div class="card-title">
                    Quick Actions
                </div>


                <div class="quick-grid">


                    <a href="FindBloodDonor.aspx"
                       class="quick-action">

                        <div class="quick-icon">
                            🔍
                        </div>

                        Find Blood

                    </a>


                    <a href="EmergencyDetails.aspx"
                       class="quick-action">

                        <div class="quick-icon">
                            ➕
                        </div>

                        New Request

                    </a>


                    <a href="#"
                       class="quick-action">

                        <div class="quick-icon">
                            🔗
                        </div>

                        Refer Friend

                    </a>


                    <a href="#"
                       class="quick-action">

                        <div class="quick-icon">
                            ❓
                        </div>

                        Support

                    </a>


                </div>

            </div>


            <!-- YOUR IMPACT -->

            <div class="card">

                <div class="card-title">
                    Your Impact
                </div>

                <div class="impact-number">
                    1.2
                </div>

                <div class="impact-label">
                    Gallons Donated
                </div>


                <div class="progress">

                    <div class="progress-bar">
                    </div>

                </div>


                <div class="impact-badge">
                    You are in the Top 15% of donors
                    in your region this year.
                </div>

            </div>


            <!-- RECENT ACTIVITY -->

            <div class="card">

                <div class="card-title">
                    Recent Activity
                </div>


                <div class="activity">

                    <div class="activity-title">
                        Donated Whole Blood
                    </div>

                    <div class="activity-info">
                        Oct 12, 2023
                        • City Care Hospital
                    </div>

                </div>


                <div class="activity">

                    <div class="activity-title">
                        Responded to Emergency
                    </div>

                    <div class="activity-info">
                        Aug 05, 2023
                        • A+ needed urgently
                    </div>

                </div>


                <div class="activity">

                    <div class="activity-title">
                        Profile Updated
                    </div>

                    <div class="activity-info">
                        Jan 15, 2023
                    </div>

                </div>


            </div>


        </div>


    </div>


</asp:Content>