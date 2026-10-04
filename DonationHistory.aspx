<%@ Page Title="Donation History" Language="C#" MasterPageFile="~/Donor.Master"
    AutoEventWireup="true"
    CodeBehind="DonationHistory.aspx.cs"
    Inherits="WebApplication1.DonationHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        .history-page {
            padding: 5px 0 30px 0;
        }

        /* PAGE HEADER */

        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 22px;
            gap: 20px;
        }

        .page-title {
            font-size: 27px;
            font-weight: 700;
            color: #202338;
            margin: 0 0 6px 0;
        }

        .page-subtitle {
            color: #6B7280;
            font-size: 14px;
            margin: 0;
        }

        .camp-btn {
            background: #D80032;
            color: white;
            text-decoration: none;
            padding: 11px 18px;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 600;
            display: inline-block;
            border: none;
        }

        .camp-btn:hover {
            background: #B8002A;
            color: white;
        }


        /* STATISTICS */

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 16px;
            margin-bottom: 22px;
        }

        .stat-card {
            background: white;
            border: 1px solid #E5E7EB;
            border-radius: 12px;
            padding: 19px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.03);
            min-height: 105px;
        }

        .stat-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .stat-label {
            font-size: 11px;
            color: #6B7280;
            font-weight: 700;
            letter-spacing: .5px;
        }

        .stat-icon {
            width: 34px;
            height: 34px;
            border-radius: 8px;
            background: #F8E7EC;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 17px;
        }

        .stat-value {
            margin-top: 13px;
            font-size: 25px;
            font-weight: 700;
            color: #202338;
        }

        .impact-card {
            background: #D80032;
            border-color: #D80032;
        }

        .impact-card .stat-label,
        .impact-card .stat-value {
            color: white;
        }

        .impact-card .stat-icon {
            background: rgba(255,255,255,0.18);
        }


        /* UPCOMING APPOINTMENT */

        .upcoming-card {
            background: white;
            border: 1px solid #BFDBFE;
            border-top: 4px solid #2563EB;
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 22px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.03);
        }

        .upcoming-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 20px;
        }

        .upcoming-title {
            font-size: 18px;
            font-weight: 700;
            color: #202338;
            margin-bottom: 7px;
        }

        .confirmed-pill {
            display: inline-block;
            background: #D1FAE5;
            color: #15803D;
            padding: 4px 9px;
            border-radius: 15px;
            font-size: 10px;
            font-weight: 700;
            margin-left: 7px;
        }

        .upcoming-info {
            display: flex;
            flex-wrap: wrap;
            gap: 18px;
            margin-top: 12px;
            color: #4B5563;
            font-size: 13px;
        }

        .upcoming-actions {
            display: flex;
            gap: 9px;
            white-space: nowrap;
        }

        .cancel-btn {
            background: white;
            color: #D80032;
            border: 1px solid #D80032;
            border-radius: 7px;
            padding: 9px 14px;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
        }

        .details-btn {
            background: #2563EB;
            color: white;
            border: 1px solid #2563EB;
            border-radius: 7px;
            padding: 9px 14px;
            font-size: 12px;
            font-weight: 600;
            text-decoration: none;
            display: inline-block;
        }


        /* SEARCH / FILTER */

        .filter-card {
            background: white;
            border: 1px solid #E5E7EB;
            border-radius: 12px;
            padding: 18px;
            margin-bottom: 18px;
        }

        .tabs {
            display: flex;
            gap: 25px;
            border-bottom: 1px solid #E5E7EB;
            margin-bottom: 17px;
        }

        .tab {
            padding: 10px 2px 12px 2px;
            color: #6B7280;
            font-size: 13px;
            font-weight: 600;
            text-decoration: none;
            border-bottom: 2px solid transparent;
        }

        .tab:hover {
            color: #D80032;
        }

        .tab-active {
            color: #D80032;
            border-bottom-color: #D80032;
        }

        .filter-row {
            display: grid;
            grid-template-columns: 1fr 180px auto;
            gap: 12px;
            align-items: center;
        }

        .search-box {
            position: relative;
        }

        .search-input {
            width: 100%;
            box-sizing: border-box;
            border: 1px solid #D1D5DB;
            border-radius: 7px;
            padding: 10px 12px 10px 38px;
            font-size: 13px;
            outline: none;
        }

        .search-input:focus {
            border-color: #2563EB;
        }

        .search-icon {
            position: absolute;
            left: 13px;
            top: 9px;
            font-size: 15px;
            color: #6B7280;
        }

        .year-select {
            width: 100%;
            border: 1px solid #D1D5DB;
            border-radius: 7px;
            padding: 10px;
            font-size: 13px;
            color: #374151;
            background: white;
        }

        .filter-btn {
            background: white;
            border: 1px solid #D1D5DB;
            border-radius: 7px;
            padding: 10px 15px;
            font-size: 13px;
            font-weight: 600;
            color: #374151;
            cursor: pointer;
        }


        /* TABLE */

        .history-card {
            background: white;
            border: 1px solid #E5E7EB;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0,0,0,0.03);
        }

        .table-header {
            padding: 18px 20px;
            border-bottom: 1px solid #E5E7EB;
        }

        .table-title {
            font-size: 17px;
            font-weight: 700;
            color: #202338;
        }

        .history-table {
            width: 100%;
            border-collapse: collapse;
        }

        .history-table th {
            background: #F9FAFB;
            color: #6B7280;
            font-size: 10px;
            font-weight: 700;
            text-align: left;
            padding: 13px 15px;
            border-bottom: 1px solid #E5E7EB;
            letter-spacing: .3px;
        }

        .history-table td {
            padding: 15px;
            border-bottom: 1px solid #F0F1F3;
            font-size: 12px;
            color: #374151;
            vertical-align: middle;
        }

        .history-table tr:last-child td {
            border-bottom: none;
        }

        .date-text {
            font-weight: 700;
            color: #202338;
        }

        .donation-name {
            font-weight: 600;
            color: #202338;
        }

        .location-text {
            color: #6B7280;
        }

        .blood-pill {
            display: inline-block;
            background: #F8E7EC;
            color: #D80032;
            padding: 5px 10px;
            border-radius: 15px;
            font-size: 11px;
            font-weight: 700;
        }

        .completed-pill {
            display: inline-block;
            background: #D1FAE5;
            color: #15803D;
            padding: 5px 9px;
            border-radius: 15px;
            font-size: 10px;
            font-weight: 700;
        }

        .view-link {
            color: #2563EB;
            text-decoration: none;
            font-size: 11px;
            font-weight: 700;
        }

        .view-link:hover {
            text-decoration: underline;
        }


        /* RESPONSIVE */

        @media (max-width: 1100px) {

            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .history-card {
                overflow-x: auto;
            }

            .history-table {
                min-width: 900px;
            }
        }

        @media (max-width: 800px) {

            .page-header {
                flex-direction: column;
                align-items: flex-start;
            }

            .filter-row {
                grid-template-columns: 1fr;
            }

            .upcoming-header {
                flex-direction: column;
            }

            .upcoming-actions {
                margin-top: 5px;
            }
        }

        @media (max-width: 600px) {

            .stats-grid {
                grid-template-columns: 1fr;
            }

            .tabs {
                gap: 15px;
                overflow-x: auto;
            }

            .upcoming-info {
                flex-direction: column;
                gap: 8px;
            }
        }

    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="history-page">

        <!-- PAGE HEADER -->

        <div class="page-header">

            <div>

                <h1 class="page-title">
                    Donation History
                </h1>

                <p class="page-subtitle">
                    View your past blood donations, upcoming appointments, and donation records.
                </p>

            </div>

            <a href="FindCamps.aspx" class="camp-btn">
                🎯 Find Donation Camps
            </a>

        </div>


        <!-- STATISTICS -->

        <div class="stats-grid">

            <div class="stat-card">

                <div class="stat-top">

                    <span class="stat-label">
                        TOTAL DONATIONS
                    </span>

                    <span class="stat-icon">
                        🩸
                    </span>

                </div>

                <div class="stat-value">
                    8
                </div>

            </div>


            <div class="stat-card">

                <div class="stat-top">

                    <span class="stat-label">
                        THIS YEAR
                    </span>

                    <span class="stat-icon">
                        📅
                    </span>

                </div>

                <div class="stat-value">
                    3
                </div>

            </div>


            <div class="stat-card">

                <div class="stat-top">

                    <span class="stat-label">
                        LAST DONATION
                    </span>

                    <span class="stat-icon">
                        🕒
                    </span>

                </div>

                <div class="stat-value" style="font-size:20px;">
                    12 June 2026
                </div>

            </div>


            <div class="stat-card impact-card">

                <div class="stat-top">

                    <span class="stat-label">
                        LIVES IMPACTED
                    </span>

                    <span class="stat-icon">
                        ❤️
                    </span>

                </div>

                <div class="stat-value">
                    24+
                </div>

            </div>

        </div>


        <!-- UPCOMING APPOINTMENT -->

        <div class="upcoming-card">

            <div class="upcoming-header">

                <div>

                    <div class="upcoming-title">

                        Save Life Blood Drive

                        <span class="confirmed-pill">
                            CONFIRMED
                        </span>

                    </div>

                    <div class="upcoming-info">

                        <span>📅 16 August 2026</span>

                        <span>🕒 10:00 AM – 10:30 AM</span>

                        <span>📍 Community Hall, Ahmedabad</span>

                    </div>

                </div>


                <div class="upcoming-actions">

                    <asp:Button
                        ID="btnCancelBooking"
                        runat="server"
                        Text="Cancel Booking"
                        CssClass="cancel-btn"
                        OnClick="btnCancelBooking_Click" />

                    <asp:Button
                        ID="btnUpcomingDetails"
                        runat="server"
                        Text="View Details"
                        CssClass="details-btn"
                        OnClick="btnUpcomingDetails_Click" />

                </div>

            </div>

            <asp:Label
                ID="lblBookingMessage"
                runat="server"
                style="display:block; margin-top:12px; color:#15803D; font-size:12px;">
            </asp:Label>

        </div>


        <!-- SEARCH AND FILTER -->

        <div class="filter-card">

            <div class="tabs">

                <a href="#" class="tab tab-active">
                    All (8)
                </a>

                <a href="#" class="tab">
                    Upcoming (1)
                </a>

                <a href="#" class="tab">
                    Completed (7)
                </a>

                <a href="#" class="tab">
                    Cancelled (0)
                </a>

            </div>


            <div class="filter-row">

                <div class="search-box">

                    <span class="search-icon">
                        🔍
                    </span>

                    <asp:TextBox
                        ID="txtSearch"
                        runat="server"
                        CssClass="search-input"
                        placeholder="Search history...">
                    </asp:TextBox>

                </div>


                <asp:DropDownList
                    ID="ddlYear"
                    runat="server"
                    CssClass="year-select">

                    <asp:ListItem Text="Year" Value="" />

                    <asp:ListItem Text="2026" Value="2026" />

                    <asp:ListItem Text="2025" Value="2025" />

                    <asp:ListItem Text="2024" Value="2024" />

                </asp:DropDownList>


                <asp:Button
                    ID="btnFilter"
                    runat="server"
                    Text="⚙ Filters"
                    CssClass="filter-btn"
                    OnClick="btnFilter_Click" />

            </div>

        </div>


        <!-- DONATION HISTORY TABLE -->

        <div class="history-card">

            <div class="table-header">

                <div class="table-title">
                    Donation History
                </div>

            </div>


            <table class="history-table">

                <thead>

                    <tr>

                        <th>DATE</th>
                        <th>DONATION</th>
                        <th>CAMP / HOSPITAL</th>
                        <th>LOCATION</th>
                        <th>BLOOD GROUP</th>
                        <th>STATUS</th>
                        <th>ACTION</th>

                    </tr>

                </thead>


                <tbody>

                    <tr>

                        <td>
                            <span class="date-text">
                                12 Jun 2026
                            </span>
                        </td>

                        <td>
                            <span class="donation-name">
                                Whole Blood
                            </span>
                        </td>

                        <td>
                            City Hospital Drive
                        </td>

                        <td>
                            <span class="location-text">
                                Ahmedabad
                            </span>
                        </td>

                        <td>
                            <span class="blood-pill">
                                A+
                            </span>
                        </td>

                        <td>
                            <span class="completed-pill">
                                COMPLETED
                            </span>
                        </td>

                        <td>
                            <a href="DonationDetails.aspx" class="view-link">
                                VIEW DETAILS ⋮
                            </a>
                        </td>

                    </tr>


                    <tr>

                        <td>
                            <span class="date-text">
                                15 Mar 2026
                            </span>
                        </td>

                        <td>
                            <span class="donation-name">
                                Plasma
                            </span>
                        </td>

                        <td>
                            Red Cross Center
                        </td>

                        <td>
                            <span class="location-text">
                                Mumbai
                            </span>
                        </td>

                        <td>
                            <span class="blood-pill">
                                A+
                            </span>
                        </td>

                        <td>
                            <span class="completed-pill">
                                COMPLETED
                            </span>
                        </td>

                        <td>
                            <a href="DonationDetails.aspx" class="view-link">
                                VIEW DETAILS ⋮
                            </a>
                        </td>

                    </tr>


                    <tr>

                        <td>
                            <span class="date-text">
                                10 Jan 2026
                            </span>
                        </td>

                        <td>
                            <span class="donation-name">
                                Whole Blood
                            </span>
                        </td>

                        <td>
                            Lions Club Camp
                        </td>

                        <td>
                            <span class="location-text">
                                Ahmedabad
                            </span>
                        </td>

                        <td>
                            <span class="blood-pill">
                                A+
                            </span>
                        </td>

                        <td>
                            <span class="completed-pill">
                                COMPLETED
                            </span>
                        </td>

                        <td>
                            <a href="DonationDetails.aspx" class="view-link">
                                VIEW DETAILS ⋮
                            </a>
                        </td>

                    </tr>


                    <tr>

                        <td>
                            <span class="date-text">
                                05 Oct 2025
                            </span>
                        </td>

                        <td>
                            <span class="donation-name">
                                Whole Blood
                            </span>
                        </td>

                        <td>
                            Corporate Drive
                        </td>

                        <td>
                            <span class="location-text">
                                Pune
                            </span>
                        </td>

                        <td>
                            <span class="blood-pill">
                                A+
                            </span>
                        </td>

                        <td>
                            <span class="completed-pill">
                                COMPLETED
                            </span>
                        </td>

                        <td>
                            <a href="DonationDetails.aspx" class="view-link">
                                VIEW DETAILS ⋮
                            </a>
                        </td>

                    </tr>


                    <tr>

                        <td>
                            <span class="date-text">
                                20 Jul 2025
                            </span>
                        </td>

                        <td>
                            <span class="donation-name">
                                Platelets
                            </span>
                        </td>

                        <td>
                            Apollo Hospital
                        </td>

                        <td>
                            <span class="location-text">
                                Mumbai
                            </span>
                        </td>

                        <td>
                            <span class="blood-pill">
                                A+
                            </span>
                        </td>

                        <td>
                            <span class="completed-pill">
                                COMPLETED
                            </span>
                        </td>

                        <td>
                            <a href="DonationDetails.aspx" class="view-link">
                                VIEW DETAILS ⋮
                            </a>
                        </td>

                    </tr>


                    <tr>

                        <td>
                            <span class="date-text">
                                12 Apr 2025
                            </span>
                        </td>

                        <td>
                            <span class="donation-name">
                                Whole Blood
                            </span>
                        </td>

                        <td>
                            Rotary Club Camp
                        </td>

                        <td>
                            <span class="location-text">
                                Ahmedabad
                            </span>
                        </td>

                        <td>
                            <span class="blood-pill">
                                A+
                            </span>
                        </td>

                        <td>
                            <span class="completed-pill">
                                COMPLETED
                            </span>
                        </td>

                        <td>
                            <a href="DonationDetails.aspx" class="view-link">
                                VIEW DETAILS ⋮
                            </a>
                        </td>

                    </tr>


                    <tr>

                        <td>
                            <span class="date-text">
                                08 Dec 2024
                            </span>
                        </td>

                        <td>
                            <span class="donation-name">
                                Whole Blood
                            </span>
                        </td>

                        <td>
                            Civil Hospital
                        </td>

                        <td>
                            <span class="location-text">
                                Surat
                            </span>
                        </td>

                        <td>
                            <span class="blood-pill">
                                A+
                            </span>
                        </td>

                        <td>
                            <span class="completed-pill">
                                COMPLETED
                            </span>
                        </td>

                        <td>
                            <a href="DonationDetails.aspx" class="view-link">
                                VIEW DETAILS ⋮
                            </a>
                        </td>

                    </tr>

                </tbody>

            </table>

        </div>

    </div>

</asp:Content>