<%@ Page Title="Notifications" Language="C#" MasterPageFile="~/Donor.Master"
    AutoEventWireup="true"
    CodeBehind="DonorNotifications.aspx.cs"
    Inherits="WebApplication1.DonorNotifications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        * {
            box-sizing: border-box;
        }

        .notifications-page {
            padding: 5px 0 35px 0;
        }

        /* ================= PAGE HEADER ================= */

        .notification-page-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 25px;
            gap: 20px;
        }

        .notification-main-title {
            margin: 0 0 6px 0;
            font-size: 27px;
            font-weight: 700;
            color: #202338;
        }

        .notification-subtitle {
            margin: 0;
            color: #6B7280;
            font-size: 13px;
        }

        .mark-read-btn {
            background: white;
            color: #D80032;
            border: 1px solid #D80032;
            border-radius: 7px;
            padding: 10px 16px;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
            white-space: nowrap;
        }

        .mark-read-btn:hover {
            background: #FFF0F3;
        }


        /* ================= MAIN LAYOUT ================= */

        .notifications-layout {
            display: grid;
            grid-template-columns: 235px 1fr;
            gap: 22px;
            align-items: start;
        }


        /* ================= LEFT SIDEBAR ================= */

        .filter-sidebar {
            background: white;
            border: 1px solid #E5E7EB;
            border-radius: 12px;
            padding: 18px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.03);
        }

        .filter-section {
            margin-bottom: 24px;
        }

        .filter-section:last-child {
            margin-bottom: 0;
        }

        .filter-heading {
            color: #9CA3AF;
            font-size: 10px;
            font-weight: 700;
            text-transform: uppercase;
            margin-bottom: 11px;
            letter-spacing: .3px;
        }


        /* STATUS CARDS */

        .status-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 11px;
            border-radius: 7px;
            margin-bottom: 6px;
            color: #4B5563;
            font-size: 12px;
            font-weight: 600;
        }

        .status-item.active {
            background: #F8E7EC;
            color: #D80032;
        }

        .status-number {
            font-size: 11px;
            font-weight: 700;
        }


        /* CATEGORY */

        .category-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 9px 11px;
            border-radius: 7px;
            margin-bottom: 4px;
            color: #4B5563;
            font-size: 12px;
        }

        .category-item.active {
            background: #F8E7EC;
            color: #D80032;
            font-weight: 600;
        }

        .category-count {
            color: #9CA3AF;
            font-size: 11px;
        }

        .category-item.active .category-count {
            color: #D80032;
        }


        /* ================= RIGHT CONTENT ================= */

        .notifications-content {
            min-width: 0;
        }


        /* SEARCH SORT */

        .search-sort-bar {
            background: white;
            border: 1px solid #E5E7EB;
            border-radius: 11px;
            padding: 13px;
            display: grid;
            grid-template-columns: 1fr 150px 150px;
            gap: 10px;
            margin-bottom: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.03);
        }

        .search-wrapper {
            position: relative;
        }

        .search-icon {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: #9CA3AF;
            font-size: 14px;
            pointer-events: none;
        }

        .search-box {
            width: 100%;
            height: 38px;
            border: 1px solid #D1D5DB;
            border-radius: 7px;
            padding: 0 12px 0 35px;
            font-size: 12px;
            color: #374151;
            outline: none;
        }

        .search-box:focus {
            border-color: #D80032;
        }

        .sort-dropdown {
            width: 100%;
            height: 38px;
            border: 1px solid #D1D5DB;
            border-radius: 7px;
            padding: 0 9px;
            background: white;
            color: #374151;
            font-size: 12px;
            outline: none;
        }

        .sort-dropdown:focus {
            border-color: #D80032;
        }


        /* ================= NOTIFICATION BOX ================= */

        .notification-list-card {
            background: white;
            border: 1px solid #E5E7EB;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0,0,0,0.03);
        }

        .notification-list-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 16px 19px;
            border-bottom: 1px solid #E5E7EB;
        }

        .list-title {
            color: #202338;
            font-size: 16px;
            font-weight: 700;
        }

        .list-count {
            color: #6B7280;
            font-size: 11px;
        }


        /* ================= DATE SECTION ================= */

        .date-section-title {
            padding: 15px 19px 8px 19px;
            color: #9CA3AF;
            font-size: 10px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: .5px;
        }


        /* ================= NOTIFICATION ITEM ================= */

        .notification-item {
            display: flex;
            align-items: flex-start;
            gap: 13px;
            padding: 16px 19px;
            border-bottom: 1px solid #F0F1F3;
            position: relative;
            transition: .2s;
        }

        .notification-item:last-child {
            border-bottom: none;
        }

        .notification-item.unread {
            background: #FFF7F9;
            border-left: 3px solid #D80032;
        }

        .notification-item.read {
            background: #FFFFFF;
        }

        .notification-item:hover {
            background: #FAFAFA;
        }

        .notification-item.unread:hover {
            background: #FFF2F5;
        }


        /* ICON */

        .notification-icon {
            width: 43px;
            height: 43px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 19px;
            flex-shrink: 0;
        }

        .emergency-icon {
            background: #F8E7EC;
        }

        .confirmed-icon {
            background: #D1FAE5;
        }

        .camp-icon {
            background: #DBEAFE;
        }

        .eligibility-icon {
            background: #F3F4F6;
        }


        /* CONTENT */

        .notification-details {
            flex: 1;
            min-width: 0;
        }

        .notification-top {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-bottom: 5px;
            flex-wrap: wrap;
        }

        .notification-title {
            color: #202338;
            font-size: 13px;
            font-weight: 700;
        }

        .notification-description {
            color: #6B7280;
            font-size: 12px;
            line-height: 1.6;
            max-width: 850px;
        }

        .notification-time {
            color: #9CA3AF;
            font-size: 10px;
            margin-top: 7px;
        }


        /* BADGES */

        .badge {
            display: inline-block;
            padding: 4px 7px;
            border-radius: 12px;
            font-size: 8px;
            font-weight: 700;
            letter-spacing: .3px;
        }

        .urgent-badge {
            background: #FEE2E2;
            color: #D80032;
        }

        .confirmed-badge {
            background: #D1FAE5;
            color: #15803D;
        }


        /* UNREAD DOT */

        .unread-marker {
            width: 8px;
            height: 8px;
            border-radius: 50%;
            background: #D80032;
            flex-shrink: 0;
            margin-top: 7px;
        }


        /* ACTION */

        .notification-action {
            display: inline-block;
            margin-top: 8px;
            text-decoration: none;
            color: #2563EB;
            font-size: 11px;
            font-weight: 600;
        }

        .notification-action:hover {
            text-decoration: underline;
        }


        /* ================= MESSAGE ================= */

        .message-label {
            display: block;
            margin-top: 12px;
            color: #15803D;
            font-size: 12px;
        }


        /* ================= RESPONSIVE ================= */

        @media (max-width: 1000px) {

            .notifications-layout {
                grid-template-columns: 200px 1fr;
            }

            .search-sort-bar {
                grid-template-columns: 1fr 130px 130px;
            }

        }


        @media (max-width: 800px) {

            .notifications-layout {
                grid-template-columns: 1fr;
            }

            .filter-sidebar {
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 20px;
            }

            .filter-section {
                margin-bottom: 0;
            }

        }


        @media (max-width: 650px) {

            .notification-page-header {
                flex-direction: column;
            }

            .search-sort-bar {
                grid-template-columns: 1fr;
            }

            .filter-sidebar {
                display: block;
            }

            .filter-section {
                margin-bottom: 20px;
            }

            .notification-item {
                padding: 14px;
            }

            .notification-icon {
                width: 38px;
                height: 38px;
                font-size: 17px;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="notifications-page">


        <!-- ================= PAGE HEADER ================= -->

        <div class="notification-page-header">

            <div>

                <h1 class="notification-main-title">
                    Notifications
                </h1>

                <p class="notification-subtitle">
                    Stay updated with your donation activities, emergency requests,
                    camps, and account updates.
                </p>

            </div>


            <asp:Button
                ID="btnMarkAllRead"
                runat="server"
                Text="✓✓ Mark All as Read"
                CssClass="mark-read-btn"
                OnClick="btnMarkAllRead_Click" />

        </div>


        <!-- ================= MAIN LAYOUT ================= -->

        <div class="notifications-layout">


            <!-- ================= LEFT FILTER SIDEBAR ================= -->

            <div class="filter-sidebar">


                <!-- STATUS -->

                <div class="filter-section">

                    <div class="filter-heading">
                        Notification Status
                    </div>


                    <div class="status-item active">

                        <span>
                            All
                        </span>

                        <span class="status-number">
                            12
                        </span>

                    </div>


                    <div class="status-item">

                        <span>
                            Unread
                        </span>

                        <span class="status-number">
                            3
                        </span>

                    </div>


                    <div class="status-item">

                        <span>
                            Important
                        </span>

                        <span class="status-number">
                            2
                        </span>

                    </div>

                </div>


                <!-- CATEGORIES -->

                <div class="filter-section">

                    <div class="filter-heading">
                        Categories
                    </div>


                    <div class="category-item active">

                        <span>
                            All Types
                        </span>

                        <span class="category-count">
                            12
                        </span>

                    </div>


                    <div class="category-item">

                        <span>
                            Emergency
                        </span>

                        <span class="category-count">
                            2
                        </span>

                    </div>


                    <div class="category-item">

                        <span>
                            Donations
                        </span>

                        <span class="category-count">
                            5
                        </span>

                    </div>


                    <div class="category-item">

                        <span>
                            Camps
                        </span>

                        <span class="category-count">
                            3
                        </span>

                    </div>


                    <div class="category-item">

                        <span>
                            Account
                        </span>

                        <span class="category-count">
                            2
                        </span>

                    </div>

                </div>

            </div>


            <!-- ================= RIGHT CONTENT ================= -->

            <div class="notifications-content">


                <!-- SEARCH + SORT -->

                <div class="search-sort-bar">


                    <div class="search-wrapper">

                        <span class="search-icon">
                            🔍
                        </span>

                        <asp:TextBox
                            ID="txtSearch"
                            runat="server"
                            CssClass="search-box"
                            placeholder="Search notifications...">
                        </asp:TextBox>

                    </div>


                    <asp:DropDownList
                        ID="ddlDate"
                        runat="server"
                        CssClass="sort-dropdown">

                        <asp:ListItem Text="All Dates" Value="All"></asp:ListItem>
                        <asp:ListItem Text="Today" Value="Today"></asp:ListItem>
                        <asp:ListItem Text="Yesterday" Value="Yesterday"></asp:ListItem>

                    </asp:DropDownList>


                    <asp:DropDownList
                        ID="ddlSort"
                        runat="server"
                        CssClass="sort-dropdown">

                        <asp:ListItem Text="Newest First" Value="Newest"></asp:ListItem>
                        <asp:ListItem Text="Oldest First" Value="Oldest"></asp:ListItem>

                    </asp:DropDownList>

                </div>


                <!-- ================= NOTIFICATION LIST ================= -->

                <div class="notification-list-card">


                    <div class="notification-list-header">

                        <div class="list-title">
                            Notifications
                        </div>

                        <div class="list-count">
                            12 total notifications
                        </div>

                    </div>


                    <!-- ================= TODAY ================= -->

                    <div class="date-section-title">
                        Today · 3 Unread
                    </div>


                    <!-- NOTIFICATION 1 -->

                    <div class="notification-item unread">


                        <div class="notification-icon emergency-icon">
                            🛑
                        </div>


                        <div class="notification-details">

                            <div class="notification-top">

                                <span class="notification-title">
                                    Emergency blood request near you
                                </span>

                                <span class="badge urgent-badge">
                                    URGENT
                                </span>

                            </div>


                            <div class="notification-description">
                                A patient at City General Hospital urgently requires
                                O- blood. You are eligible to donate. Please respond
                                if available.
                            </div>


                            <div class="notification-time">
                                25m ago
                            </div>


                            <a href="EmergencyDetails.aspx"
                               class="notification-action">
                                View Request →
                            </a>

                        </div>


                        <div class="unread-marker"></div>

                    </div>


                    <!-- NOTIFICATION 2 -->

                    <div class="notification-item unread">


                        <div class="notification-icon confirmed-icon">
                            🟢
                        </div>


                        <div class="notification-details">

                            <div class="notification-top">

                                <span class="notification-title">
                                    Donation slot confirmed
                                </span>

                                <span class="badge confirmed-badge">
                                    CONFIRMED
                                </span>

                            </div>


                            <div class="notification-description">
                                Your appointment for Whole Blood donation at
                                Downtown Blood Center on Friday, 10:00 AM
                                has been confirmed.
                            </div>


                            <div class="notification-time">
                                1h ago
                            </div>


                            <a href="DonationHistory.aspx"
                               class="notification-action">
                                View Booking →
                            </a>

                        </div>


                        <div class="unread-marker"></div>

                    </div>


                    <!-- NOTIFICATION 3 -->

                    <div class="notification-item unread">


                        <div class="notification-icon camp-icon">
                            🔵
                        </div>


                        <div class="notification-details">

                            <div class="notification-top">

                                <span class="notification-title">
                                    New donation camp nearby
                                </span>

                            </div>


                            <div class="notification-description">
                                A new community blood drive has been scheduled
                                at the Community Center this weekend.
                            </div>


                            <div class="notification-time">
                                3h ago
                            </div>


                            <a href="FindCamps.aspx"
                               class="notification-action">
                                View Camp →
                            </a>

                        </div>


                        <div class="unread-marker"></div>

                    </div>


                    <!-- ================= YESTERDAY ================= -->

                    <div class="date-section-title">
                        Yesterday
                    </div>


                    <!-- NOTIFICATION 4 -->

                    <div class="notification-item read">


                        <div class="notification-icon eligibility-icon">
                            🛡️
                        </div>


                        <div class="notification-details">

                            <div class="notification-top">

                                <span class="notification-title">
                                    Eligibility reminder
                                </span>

                            </div>


                            <div class="notification-description">
                                You are now eligible to donate whole blood again.
                                Check your full eligibility status.
                            </div>


                            <div class="notification-time">
                                Yesterday, 5:30 PM
                            </div>


                            <a href="Donation_Eligibility.aspx"
                               class="notification-action">
                                Check Eligibility →
                            </a>

                        </div>

                    </div>


                </div>


                <!-- MESSAGE -->

                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="message-label">
                </asp:Label>


            </div>

        </div>

    </div>

</asp:Content>