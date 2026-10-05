<%@ Page Title="My Request" Language="C#" MasterPageFile="~/User.Master"
    AutoEventWireup="true" CodeBehind="User_MyRequests.aspx.cs"
    Inherits="BloodConnect.User_MyRequests" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .page-container {
            padding: 30px;
            background: #f8f9fc;
            min-height: calc(100vh - 70px);
        }

        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 25px;
        }

        .page-header h1 {
            font-size: 28px;
            font-weight: 700;
            color: #252525;
            margin: 0 0 7px 0;
        }

        .page-header p {
            color: #777;
            margin: 0;
            font-size: 14px;
        }

        .header-actions {
            display: flex;
            gap: 10px;
        }

        .emergency-btn {
            background: white;
            color: #c62828;
            border: 1px solid #c62828;
            padding: 10px 17px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
        }

        .create-btn {
            background: #c62828;
            color: white;
            border: 1px solid #c62828;
            padding: 10px 17px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
        }

        .create-btn:hover {
            background: #a91f1f;
            color: white;
        }

        .emergency-btn:hover {
            background: #fff5f5;
            color: #b32020;
        }

        /* STATISTICS */

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 18px;
            margin-bottom: 24px;
        }

        .stat-card {
            background: white;
            border: 1px solid #e9e9ef;
            border-radius: 13px;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 7px rgba(0,0,0,0.03);
        }

        .stat-label {
            color: #777;
            font-size: 13px;
            margin-bottom: 7px;
        }

        .stat-number {
            font-size: 26px;
            font-weight: 700;
            color: #292929;
        }

        .stat-icon {
            width: 43px;
            height: 43px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
        }

        .icon-red {
            background: #fdeaea;
            color: #c62828;
        }

        .icon-purple {
            background: #eee7ff;
            color: #7454c8;
        }

        .icon-yellow {
            background: #fff6db;
            color: #c28b00;
        }

        .icon-blue {
            background: #e8f3ff;
            color: #3973b9;
        }

        /* MAIN CARD */

        .requests-card {
            background: white;
            border: 1px solid #e9e9ef;
            border-radius: 14px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.03);
            overflow: hidden;
        }

        /* TABS */

        .tabs {
            display: flex;
            gap: 25px;
            padding: 0 22px;
            border-bottom: 1px solid #ededed;
        }

        .tab {
            padding: 17px 3px 14px;
            font-size: 13px;
            color: #777;
            text-decoration: none;
            border-bottom: 2px solid transparent;
        }

        .tab.active {
            color: #c62828;
            font-weight: 600;
            border-bottom-color: #c62828;
        }

        /* FILTERS */

        .filter-area {
            padding: 18px 22px;
            border-bottom: 1px solid #eeeeee;
        }

        .filter-row {
            display: grid;
            grid-template-columns: 1.7fr 1fr 1fr 1fr auto;
            gap: 10px;
            align-items: center;
        }

        .search-box {
            position: relative;
        }

        .search-box i {
            position: absolute;
            left: 13px;
            top: 13px;
            color: #999;
            font-size: 13px;
        }

        .search-input {
            width: 100%;
            height: 40px;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 0 12px 0 36px;
            font-size: 13px;
            box-sizing: border-box;
            outline: none;
        }

        .filter-select {
            width: 100%;
            height: 40px;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 0 10px;
            color: #555;
            font-size: 13px;
            background: white;
            outline: none;
        }

        .clear-filter {
            color: #c62828;
            font-size: 12px;
            text-decoration: none;
            white-space: nowrap;
        }

        .clear-filter:hover {
            text-decoration: underline;
        }

        /* TABLE */

        .table-wrapper {
            overflow-x: auto;
        }

        .requests-table {
            width: 100%;
            border-collapse: collapse;
            min-width: 850px;
        }

        .requests-table th {
            background: #fafafa;
            color: #777;
            font-size: 11px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.3px;
            padding: 14px 16px;
            text-align: left;
            border-bottom: 1px solid #eeeeee;
        }

        .requests-table td {
            padding: 17px 16px;
            font-size: 13px;
            color: #444;
            border-bottom: 1px solid #f0f0f0;
            vertical-align: middle;
        }

        .requests-table tr:last-child td {
            border-bottom: none;
        }

        .request-id {
            color: #333;
            font-weight: 600;
        }

        .blood-group {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            background: #fdeaea;
            color: #c62828;
            font-weight: 700;
            min-width: 35px;
            padding: 5px 9px;
            border-radius: 20px;
            font-size: 12px;
        }

        .type-normal {
            color: #555;
            font-size: 12px;
        }

        .type-emergency {
            color: #c62828;
            font-size: 11px;
            font-weight: 700;
        }

        .status {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            padding: 5px 9px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 600;
            white-space: nowrap;
        }

        .status-active {
            background: #e9f8ed;
            color: #218739;
        }

        .status-pending {
            background: #fff6dc;
            color: #b27a00;
        }

        .status-fulfilled {
            background: #e8f3ff;
            color: #3973b9;
        }

        .status-cancelled {
            background: #f1f1f1;
            color: #777;
        }

        .action-links {
            display: flex;
            gap: 10px;
            align-items: center;
        }

        .view-action {
            color: #666;
            text-decoration: none;
            font-size: 16px;
        }

        .more-action {
            color: #777;
            font-size: 18px;
            text-decoration: none;
        }

        .view-action:hover,
        .more-action:hover {
            color: #c62828;
        }

        @media (max-width: 1100px) {
            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .filter-row {
                grid-template-columns: 1fr 1fr;
            }

            .clear-filter {
                grid-column: span 2;
            }
        }

        @media (max-width: 700px) {
            .page-container {
                padding: 18px;
            }

            .page-header {
                flex-direction: column;
                gap: 15px;
            }

            .header-actions {
                width: 100%;
            }

            .header-actions a {
                flex: 1;
                text-align: center;
            }

            .stats-grid {
                grid-template-columns: 1fr;
            }

            .filter-row {
                grid-template-columns: 1fr;
            }

            .clear-filter {
                grid-column: auto;
            }

            .tabs {
                overflow-x: auto;
                gap: 20px;
            }
        }
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-container">

        <!-- PAGE HEADER -->

        <div class="page-header">

            <div>
                <h1>My Blood Requests</h1>

                <p>
                    View, manage, and track all the blood requests you have created.
                </p>
            </div>

            <div class="header-actions">

                <a href="User_NearbyEmergency.aspx"
                   class="emergency-btn">
                    🚨 Emergency Request
                </a>

                <a href="User_CreateRequest.aspx"
                   class="create-btn">
                    + Create Blood Request
                </a>

            </div>

        </div>


        <!-- STATISTICS -->

        <div class="stats-grid">

            <div class="stat-card">

                <div>
                    <div class="stat-label">
                        Total Requests
                    </div>

                    <div class="stat-number">
                        12
                    </div>
                </div>

                <div class="stat-icon icon-red">
                    <i class="fa-solid fa-file-medical"></i>
                </div>

            </div>


            <div class="stat-card">

                <div>
                    <div class="stat-label">
                        Active Requests
                    </div>

                    <div class="stat-number">
                        4
                    </div>
                </div>

                <div class="stat-icon icon-purple">
                    <i class="fa-solid fa-bolt"></i>
                </div>

            </div>


            <div class="stat-card">

                <div>
                    <div class="stat-label">
                        Pending Requests
                    </div>

                    <div class="stat-number">
                        3
                    </div>
                </div>

                <div class="stat-icon icon-yellow">
                    <i class="fa-solid fa-clock"></i>
                </div>

            </div>


            <div class="stat-card">

                <div>
                    <div class="stat-label">
                        Fulfilled Requests
                    </div>

                    <div class="stat-number">
                        5
                    </div>
                </div>

                <div class="stat-icon icon-blue">
                    <i class="fa-solid fa-circle-check"></i>
                </div>

            </div>

        </div>


        <!-- REQUESTS CARD -->

        <div class="requests-card">

            <!-- TABS -->

            <div class="tabs">

                <a href="#" class="tab active">
                    All
                </a>

                <a href="#" class="tab">
                    Active
                </a>

                <a href="#" class="tab">
                    Pending
                </a>

                <a href="#" class="tab">
                    Fulfilled
                </a>

                <a href="#" class="tab">
                    Cancelled
                </a>

            </div>


            <!-- FILTER AREA -->

            <div class="filter-area">

                <div class="filter-row">

                    <div class="search-box">

                        <i class="fa-solid fa-magnifying-glass"></i>

                        <input type="text"
                               class="search-input"
                               placeholder="Search by ID or Hospital..." />

                    </div>


                    <select class="filter-select">

                        <option selected>
                            Blood Group (All)
                        </option>

                        <option>O+</option>
                        <option>O-</option>
                        <option>A+</option>
                        <option>A-</option>
                        <option>B+</option>
                        <option>B-</option>
                        <option>AB+</option>
                        <option>AB-</option>

                    </select>


                    <select class="filter-select">

                        <option selected>
                            Request Type (All)
                        </option>

                        <option>Normal</option>
                        <option>Emergency</option>

                    </select>


                    <select class="filter-select">

                        <option selected>
                            Date (All Time)
                        </option>

                        <option>Today</option>
                        <option>This Week</option>
                        <option>This Month</option>
                        <option>Last 3 Months</option>

                    </select>


                    <a href="#" class="clear-filter">
                        Clear Filters
                    </a>

                </div>

            </div>


            <!-- TABLE -->

            <div class="table-wrapper">

                <table class="requests-table">

                    <thead>

                        <tr>

                            <th>Request ID</th>

                            <th>Blood Group</th>

                            <th>Units</th>

                            <th>Type</th>

                            <th>Hospital</th>

                            <th>Required By</th>

                            <th>Status</th>

                            <th>Action</th>

                        </tr>

                    </thead>


                    <tbody>

                        <!-- REQUEST 1 -->

                        <tr>

                            <td>
                                <span class="request-id">
                                    BR-2026-001246
                                </span>
                            </td>

                            <td>
                                <span class="blood-group">
                                    O+
                                </span>
                            </td>

                            <td>2</td>

                            <td>
                                <span class="type-normal">
                                    Normal
                                </span>
                            </td>

                            <td>
                                CityCare
                            </td>

                            <td>
                                20 Aug 2026
                            </td>

                            <td>
                                <span class="status status-active">
                                    🟢 Active
                                </span>
                            </td>

                            <td>

                                <div class="action-links">

                                    <a href="User_RequestDetails.aspx"
                                       class="view-action"
                                       title="View Request">
                                        <i class="fa-solid fa-eye"></i>
                                    </a>

                                    <a href="#"
                                       class="more-action"
                                       title="More Options">
                                        ⋮
                                    </a>

                                </div>

                            </td>

                        </tr>


                        <!-- REQUEST 2 -->

                        <tr>

                            <td>
                                <span class="request-id">
                                    BR-2026-001245
                                </span>
                            </td>

                            <td>
                                <span class="blood-group">
                                    A+
                                </span>
                            </td>

                            <td>3</td>

                            <td>
                                <span class="type-emergency">
                                    🚨 EMERGENCY
                                </span>
                            </td>

                            <td>
                                Apollo Care
                            </td>

                            <td>
                                <strong>Today</strong>
                            </td>

                            <td>
                                <span class="status status-pending">
                                    🟡 Pending
                                </span>
                            </td>

                            <td>

                                <div class="action-links">

                                    <a href="User_RequestDetails.aspx"
                                       class="view-action"
                                       title="View Request">
                                        <i class="fa-solid fa-eye"></i>
                                    </a>

                                    <a href="#"
                                       class="more-action"
                                       title="More Options">
                                        ⋮
                                    </a>

                                </div>

                            </td>

                        </tr>


                        <!-- REQUEST 3 -->

                        <tr>

                            <td>
                                <span class="request-id">
                                    BR-2026-001198
                                </span>
                            </td>

                            <td>
                                <span class="blood-group">
                                    B+
                                </span>
                            </td>

                            <td>1</td>

                            <td>
                                <span class="type-normal">
                                    Normal
                                </span>
                            </td>

                            <td>
                                Shree Hospital
                            </td>

                            <td>
                                15 Aug 2026
                            </td>

                            <td>
                                <span class="status status-fulfilled">
                                    🔵 Fulfilled
                                </span>
                            </td>

                            <td>

                                <div class="action-links">

                                    <a href="User_RequestDetails.aspx"
                                       class="view-action"
                                       title="View Request">
                                        <i class="fa-solid fa-eye"></i>
                                    </a>

                                    <a href="#"
                                       class="more-action"
                                       title="More Options">
                                        ⋮
                                    </a>

                                </div>

                            </td>

                        </tr>


                        <!-- REQUEST 4 -->

                        <tr>

                            <td>
                                <span class="request-id">
                                    BR-2026-001154
                                </span>
                            </td>

                            <td>
                                <span class="blood-group">
                                    O-
                                </span>
                            </td>

                            <td>2</td>

                            <td>
                                <span class="type-normal">
                                    Normal
                                </span>
                            </td>

                            <td>
                                CityCare
                            </td>

                            <td>
                                10 Aug 2026
                            </td>

                            <td>
                                <span class="status status-cancelled">
                                    ⚪ Cancelled
                                </span>
                            </td>

                            <td>

                                <div class="action-links">

                                    <a href="User_RequestDetails.aspx"
                                       class="view-action"
                                       title="View Request">
                                        <i class="fa-solid fa-eye"></i>
                                    </a>

                                    <a href="#"
                                       class="more-action"
                                       title="More Options">
                                        ⋮
                                    </a>

                                </div>

                            </td>

                        </tr>

                    </tbody>

                </table>

            </div>

        </div>

    </div>

</asp:Content>