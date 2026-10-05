<%@ Page Title="Notifications" Language="C#" MasterPageFile="~/User.Master"
    AutoEventWireup="true" CodeBehind="User_Notifications.aspx.cs"
    Inherits="BloodConnect.User_Notifications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 25px;
        }

        .page-title {
            font-size: 28px;
            font-weight: 700;
            color: #252525;
            margin-bottom: 6px;
        }

        .page-subtitle {
            color: #777;
            font-size: 14px;
        }

        .header-actions {
            display: flex;
            gap: 10px;
        }

        .btn-outline-red {
            background: white;
            color: #c62828;
            border: 1px solid #c62828;
            padding: 10px 17px;
            border-radius: 7px;
            font-size: 13px;
            font-weight: 600;
            text-decoration: none;
        }

        .btn-red {
            background: #c62828;
            color: white;
            border: 1px solid #c62828;
            padding: 10px 17px;
            border-radius: 7px;
            font-size: 13px;
            font-weight: 600;
            text-decoration: none;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 18px;
            margin-bottom: 25px;
        }

        .stat-card {
            background: white;
            border: 1px solid #e7e7e7;
            border-radius: 10px;
            padding: 20px;
        }

        .stat-card.unread {
            border: 1px solid #e04b4b;
        }

        .stat-label {
            font-size: 13px;
            color: #777;
            margin-bottom: 8px;
        }

        .stat-number {
            font-size: 28px;
            font-weight: 700;
            color: #292929;
        }

        .notification-panel {
            background: white;
            border: 1px solid #e5e5e5;
            border-radius: 10px;
            overflow: hidden;
        }

        .category-tabs {
            display: flex;
            align-items: center;
            gap: 28px;
            padding: 0 22px;
            border-bottom: 1px solid #e5e5e5;
        }

        .category-tabs a {
            padding: 17px 2px 14px;
            color: #666;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
            border-bottom: 3px solid transparent;
        }

        .category-tabs a.active {
            color: #c62828;
            border-bottom-color: #c62828;
        }

        .filters {
            display: flex;
            gap: 12px;
            padding: 18px 22px;
            border-bottom: 1px solid #eeeeee;
        }

        .search-box {
            flex: 1;
            position: relative;
        }

        .search-box i {
            position: absolute;
            left: 13px;
            top: 12px;
            color: #999;
        }

        .search-box input {
            width: 100%;
            height: 40px;
            border: 1px solid #ddd;
            border-radius: 7px;
            padding: 0 12px 0 38px;
            font-size: 13px;
            outline: none;
        }

        .filter-select {
            height: 40px;
            min-width: 125px;
            border: 1px solid #ddd;
            border-radius: 7px;
            padding: 0 10px;
            color: #555;
            font-size: 13px;
            background: white;
        }

        .filter-button {
            width: 42px;
            height: 40px;
            border: 1px solid #ddd;
            border-radius: 7px;
            background: white;
            color: #555;
        }

        .notification-item {
            display: flex;
            gap: 15px;
            padding: 21px 22px;
            border-bottom: 1px solid #eeeeee;
        }

        .notification-item:last-child {
            border-bottom: none;
        }

        .notification-item.unread {
            background: #fffafa;
        }

        .notification-icon {
            width: 42px;
            height: 42px;
            min-width: 42px;
            border-radius: 50%;
            background: #f9e1e1;
            color: #c62828;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 17px;
        }

        .notification-content {
            flex: 1;
        }

        .notification-title-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 6px;
        }

        .notification-title {
            font-size: 14px;
            font-weight: 700;
            color: #292929;
        }

        .notification-time {
            color: #999;
            font-size: 12px;
        }

        .unread-dot {
            width: 8px;
            height: 8px;
            background: #d32f2f;
            border-radius: 50%;
            display: inline-block;
            margin-left: 8px;
        }

        .notification-text {
            color: #777;
            font-size: 13px;
            line-height: 1.6;
            margin-bottom: 12px;
        }

        .notification-actions {
            display: flex;
            gap: 8px;
        }

        .small-red-btn {
            background: #c62828;
            color: white;
            padding: 7px 13px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 12px;
            font-weight: 600;
        }

        .small-outline-btn {
            background: white;
            color: #c62828;
            border: 1px solid #c62828;
            padding: 7px 13px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 12px;
            font-weight: 600;
        }

        .read-label {
            color: #999;
            font-size: 11px;
            font-weight: 600;
        }

        @media (max-width: 900px) {
            .stats-grid {
                grid-template-columns: 1fr;
            }

            .page-header {
                flex-direction: column;
                gap: 15px;
            }

            .filters {
                flex-wrap: wrap;
            }

            .search-box {
                width: 100%;
                flex-basis: 100%;
            }

            .category-tabs {
                overflow-x: auto;
            }
        }
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Page Header -->
    <div class="page-header">

        <div>
            <div class="page-title">Notifications</div>
            <div class="page-subtitle">
                Stay updated on your blood requests, donor matches, and account activity.
            </div>
        </div>

        <div class="header-actions">

            <a href="#" class="btn-outline-red">
                <i class="fa-solid fa-gear"></i>
                Notification Settings
            </a>

            <asp:LinkButton ID="btnMarkAllRead"
                runat="server"
                CssClass="btn-red"
                OnClick="btnMarkAllRead_Click">
                <i class="fa-solid fa-check-double"></i>
                Mark All as Read
            </asp:LinkButton>

        </div>

    </div>


    <!-- Statistics -->
    <div class="stats-grid">

        <div class="stat-card">
            <div class="stat-label">Total Notifications</div>
            <div class="stat-number">24</div>
        </div>

        <div class="stat-card unread">
            <div class="stat-label">Unread</div>
            <div class="stat-number">4</div>
        </div>

        <div class="stat-card">
            <div class="stat-label">Important</div>
            <div class="stat-number">2</div>
        </div>

    </div>


    <!-- Notification Panel -->
    <div class="notification-panel">

        <!-- Category Tabs -->
        <div class="category-tabs">

            <a href="#" class="active">
                All
            </a>

            <a href="#">
                Unread (4)
            </a>

            <a href="#">
                Blood Requests
            </a>

            <a href="#">
                Donor Responses
            </a>

            <a href="#">
                Account
            </a>

            <a href="#">
                System
            </a>

        </div>


        <!-- Search / Filters -->
        <div class="filters">

            <div class="search-box">
                <i class="fa-solid fa-magnifying-glass"></i>

                <asp:TextBox ID="txtSearch"
                    runat="server"
                    placeholder="Search notifications...">
                </asp:TextBox>
            </div>

            <asp:DropDownList ID="ddlDate"
                runat="server"
                CssClass="filter-select">

                <asp:ListItem>All Dates</asp:ListItem>
                <asp:ListItem>Today</asp:ListItem>
                <asp:ListItem>This Week</asp:ListItem>
                <asp:ListItem>This Month</asp:ListItem>

            </asp:DropDownList>

            <asp:DropDownList ID="ddlType"
                runat="server"
                CssClass="filter-select">

                <asp:ListItem>All Types</asp:ListItem>
                <asp:ListItem>Blood Requests</asp:ListItem>
                <asp:ListItem>Donor Responses</asp:ListItem>
                <asp:ListItem>Account</asp:ListItem>
                <asp:ListItem>System</asp:ListItem>

            </asp:DropDownList>

            <button type="button" class="filter-button">
                <i class="fa-solid fa-sliders"></i>
            </button>

        </div>


        <!-- Notification 1 -->
        <div class="notification-item unread">

            <div class="notification-icon">
                <i class="fa-solid fa-droplet"></i>
            </div>

            <div class="notification-content">

                <div class="notification-title-row">

                    <div class="notification-title">
                        Potential donor responded to your emergency request!
                        <span class="unread-dot"></span>
                    </div>

                    <div class="notification-time">
                        15m ago
                    </div>

                </div>

                <div class="notification-text">
                    A verified donor matching your required blood type (O+)
                    has accepted your request. Please view the request details
                    to contact the donor.
                </div>

                <div class="notification-actions">

                    <a href="User_RequestDetails.aspx"
                       class="small-red-btn">
                        View Request
                    </a>

                    <a href="User_RequestStatus.aspx"
                       class="small-outline-btn">
                        Track Request
                    </a>

                </div>

            </div>

        </div>


        <!-- Notification 2 -->
        <div class="notification-item unread">

            <div class="notification-icon">
                <i class="fa-solid fa-chart-line"></i>
            </div>

            <div class="notification-content">

                <div class="notification-title-row">

                    <div class="notification-title">
                        Your request status updated
                        <span class="unread-dot"></span>
                    </div>

                    <div class="notification-time">
                        1h ago
                    </div>

                </div>

                <div class="notification-text">
                    The status of your request "REQ-8492" has been changed
                    to "In Progress" by the BloodBank administration.
                </div>

                <div class="notification-actions">

                    <a href="User_RequestStatus.aspx"
                       class="small-outline-btn">
                        View Status
                    </a>

                </div>

            </div>

        </div>


        <!-- Notification 3 -->
        <div class="notification-item">

            <div class="notification-icon">
                <i class="fa-solid fa-file-medical"></i>
            </div>

            <div class="notification-content">

                <div class="notification-title-row">

                    <div class="notification-title">
                        Blood request created successfully
                    </div>

                    <div class="notification-time">
                        2h ago
                    </div>

                </div>

                <div class="notification-text">
                    Your standard blood request for A- has been posted
                    and is currently awaiting approval from moderators.
                </div>

                <div class="read-label">
                    Read
                </div>

            </div>

        </div>


        <!-- Notification 4 -->
        <div class="notification-item">

            <div class="notification-icon">
                <i class="fa-solid fa-shield-halved"></i>
            </div>

            <div class="notification-content">

                <div class="notification-title-row">

                    <div class="notification-title">
                        New login detected
                    </div>

                    <div class="notification-time">
                        Yesterday
                    </div>

                </div>

                <div class="notification-text">
                    We noticed a new login from Chrome on Windows in Mumbai.
                    If this wasn't you, please secure your account.
                </div>

                <div class="read-label">
                    Read
                </div>

            </div>

        </div>

    </div>

</asp:Content>