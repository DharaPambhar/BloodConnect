
<%@ Page Title="User Dashboard" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="User_Dashboard.aspx.cs" Inherits="BloodConnect.User_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    User Dashboard
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        .dashboard {
            width: 100%;
        }

        .welcome-box {
            background: linear-gradient(135deg, #f2edff, #faf8ff);
            border: 1px solid #e5dcfa;
            border-radius: 18px;
            padding: 28px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .welcome-box h2 {
            margin: 0 0 8px;
            color: #292538;
            font-size: 26px;
            font-weight: 700;
        }

        .welcome-box p {
            margin: 0;
            color: #777487;
            font-size: 14px;
        }

        .verified {
            display: inline-block;
            margin-top: 15px;
            padding: 7px 13px;
            border-radius: 30px;
            background: #e3f7eb;
            color: #218653;
            font-size: 11px;
            font-weight: 700;
        }

        .welcome-icon {
            width: 65px;
            height: 65px;
            border-radius: 18px;
            background: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 29px;
            color: #7858b8;
        }

        .emergency-box {
            background: #fff5f5;
            border: 1px solid #ffdcdc;
            border-left: 5px solid #bd1e2d;
            border-radius: 15px;
            padding: 18px 22px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 22px;
        }

        .emergency-left {
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .emergency-icon {
            width: 42px;
            height: 42px;
            border-radius: 12px;
            background: #ffe2e2;
            color: #c62828;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .emergency-left strong {
            display: block;
            font-size: 15px;
            margin-bottom: 4px;
        }

        .emergency-left span {
            font-size: 12px;
            color: #777;
        }

        .emergency-btn {
            background: #b91c1c;
            color: white;
            padding: 11px 17px;
            border-radius: 9px;
            text-decoration: none;
            font-size: 12px;
            font-weight: 600;
        }

        .emergency-btn:hover {
            background: #991b1b;
            color: white;
        }

        .dashboard-grid {
            display: grid;
            grid-template-columns: 1.7fr .9fr;
            gap: 22px;
        }

        .section-card {
            background: white;
            border: 1px solid #eeeeee;
            border-radius: 16px;
            padding: 22px;
            margin-bottom: 22px;
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 18px;
        }

        .section-header h3 {
            margin: 0;
            font-size: 17px;
            font-weight: 700;
            color: #292733;
        }

        .view-all {
            color: #7354ad;
            text-decoration: none;
            font-size: 12px;
            font-weight: 600;
        }

        .search-row {
            display: grid;
            grid-template-columns: 1fr 1.4fr 1fr auto;
            gap: 10px;
        }

        .field label {
            display: block;
            font-size: 11px;
            color: #777;
            margin-bottom: 6px;
            font-weight: 600;
        }

        .input-control {
            width: 100%;
            height: 42px;
            border: 1px solid #e2e2e6;
            border-radius: 9px;
            padding: 0 11px;
            font-size: 12px;
            outline: none;
        }

        .advanced-btn {
            height: 42px;
            padding: 11px 15px;
            border: none;
            border-radius: 9px;
            background: #eee9ff;
            color: #7050ad;
            font-size: 12px;
            font-weight: 600;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            white-space: nowrap;
        }

        .advanced-btn:hover {
            background: #e2d9ff;
            color: #7050ad;
        }

        .quick-title {
            margin: 18px 0 10px;
            font-size: 11px;
            color: #888;
            font-weight: 600;
        }

        .blood-buttons {
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
        }

        .blood-btn {
            width: 50px;
            height: 37px;
            border: 1px solid #efd4d4;
            border-radius: 8px;
            background: #fff8f8;
            color: #b91c1c;
            font-size: 11px;
            font-weight: 700;
            cursor: pointer;
        }

        .blood-btn:hover {
            background: #b91c1c;
            color: white;
        }

        .request-card {
            border: 1px solid #eeeeee;
            border-radius: 12px;
            padding: 16px;
            margin-bottom: 12px;
        }

        .request-top {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .blood-group {
            width: 38px;
            height: 38px;
            border-radius: 9px;
            background: #fff0f0;
            color: #b91c1c;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
            font-weight: 800;
        }

        .tag {
            padding: 5px 8px;
            border-radius: 5px;
            font-size: 9px;
            font-weight: 700;
        }

        .emergency-tag {
            background: #ffe2e2;
            color: #c62828;
        }

        .active-tag {
            background: #e3f7eb;
            color: #218653;
        }

        .normal-tag {
            background: #eee9ff;
            color: #7050ad;
        }

        .searching-tag {
            background: #fff3dc;
            color: #aa7524;
        }

        .location {
            margin-top: 10px;
            font-size: 12px;
            color: #666;
        }

        .status {
            margin-top: 5px;
            color: #999;
            font-size: 11px;
        }

        .actions {
            margin-top: 12px;
        }

        .small-btn {
            display: inline-block;
            padding: 7px 12px;
            border: 1px solid #ddd;
            border-radius: 7px;
            color: #666;
            text-decoration: none;
            font-size: 10px;
            margin-right: 5px;
        }

        .match-btn {
            background: #f0ebff;
            color: #7050ad;
            border-color: #e4daf9;
        }

        .donor-card {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 13px 0;
            border-bottom: 1px solid #eeeeee;
        }

        .donor-card:last-child {
            border-bottom: none;
        }

        .donor-left {
            display: flex;
            align-items: center;
            gap: 11px;
        }

        .avatar {
            width: 42px;
            height: 42px;
            border-radius: 50%;
            background: #f0ebff;
            color: #7354ad;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 13px;
            font-weight: 700;
        }

        .donor-name {
            font-size: 13px;
            font-weight: 700;
        }

        .donor-info {
            font-size: 10px;
            color: #999;
            margin-top: 4px;
        }

        .contact-btn {
            border: none;
            background: #f0ebff;
            color: #7050ad;
            padding: 7px 12px;
            border-radius: 7px;
            font-size: 10px;
            font-weight: 600;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
            margin-bottom: 22px;
        }

        .stat-card {
            background: white;
            border: 1px solid #eeeeee;
            border-radius: 13px;
            padding: 16px;
        }

        .stat-icon {
            width: 34px;
            height: 34px;
            border-radius: 9px;
            background: #f0ebff;
            color: #7354ad;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 9px;
        }

        .stat-number {
            font-size: 22px;
            font-weight: 700;
        }

        .stat-label {
            font-size: 10px;
            color: #999;
        }

        .activity {
            display: flex;
            gap: 10px;
            margin-bottom: 17px;
        }

        .activity-dot {
            width: 9px;
            height: 9px;
            min-width: 9px;
            border-radius: 50%;
            background: #668bd0;
            margin-top: 5px;
        }

        .red-dot {
            background: #c62828;
        }

        .activity-text {
            font-size: 11px;
            color: #555;
            line-height: 1.5;
        }

        .activity-time {
            display: block;
            color: #aaa;
            font-size: 9px;
            margin-top: 2px;
        }

        .urgent-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 12px 0;
            border-bottom: 1px solid #eeeeee;
        }

        .urgent-left {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .urgent-blood {
            width: 37px;
            height: 37px;
            border-radius: 9px;
            background: #fff0f0;
            color: #b91c1c;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 11px;
            font-weight: 800;
        }

        .urgent-info strong {
            display: block;
            font-size: 12px;
        }

        .urgent-info span {
            font-size: 9px;
            color: #999;
        }

        .urgent-label {
            color: #b91c1c;
            font-size: 9px;
            font-weight: 700;
        }

        .disclaimer {
            background: #f7f8fa;
            border: 1px solid #e8e9ec;
            border-radius: 11px;
            padding: 13px;
            color: #777;
            font-size: 10px;
            line-height: 1.5;
        }

        @media(max-width:1000px) {
            .dashboard-grid {
                grid-template-columns: 1fr;
            }

            .search-row {
                grid-template-columns: 1fr 1fr;
            }
        }

        @media(max-width:650px) {
            .search-row {
                grid-template-columns: 1fr;
            }

            .emergency-box {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="PageHeading" runat="server">
    User Dashboard
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="dashboard">

        <div class="welcome-box">
            <div>
                <h2>
                    Good Morning,
                    <asp:Label ID="lblWelcomeName" runat="server">User</asp:Label>
                    👏
                </h2>

                <p>
                    Find the right blood donor quickly and manage your
                    blood requests in one place.
                </p>

                <span class="verified">
                    <i class="fa-solid fa-circle-check"></i>
                    VERIFIED USER
                </span>
            </div>

            <div class="welcome-icon">
                <i class="fa-solid fa-hand-holding-droplet"></i>
            </div>
        </div>


        <div class="emergency-box">

            <div class="emergency-left">

                <div class="emergency-icon">
                    <i class="fa-solid fa-triangle-exclamation"></i>
                </div>

                <div>
                    <strong>Need Blood Urgently?</strong>

                    <span>
                        Create an emergency request to alert donors
                        within a 10km radius immediately.
                    </span>
                </div>

            </div>

            <a href="User_NearbyEmergency.aspx"
               class="emergency-btn">
                Create Emergency Request →
            </a>

        </div>


        <div class="dashboard-grid">

            <div>

                <div class="section-card">

                    <div class="section-header">
                        <h3>Find a Blood Donor</h3>
                    </div>

                    <div class="search-row">

                        <div class="field">

                            <label>Blood Group</label>

                            <select class="input-control">
                                <option>Select Group</option>
                                <option>O+</option>
                                <option>O-</option>
                                <option>A+</option>
                                <option>A-</option>
                                <option>B+</option>
                                <option>B-</option>
                                <option>AB+</option>
                                <option>AB-</option>
                            </select>

                        </div>


                        <div class="field">

                            <label>Location</label>

                            <input type="text"
                                   class="input-control"
                                   placeholder="Enter area or pincode" />

                        </div>


                        <div class="field">

                            <label>Radius</label>

                            <select class="input-control">
                                <option>Within 5 km</option>
                                <option>Within 10 km</option>
                                <option>Within 15 km</option>
                                <option>Within 25 km</option>
                            </select>

                        </div>


                        <asp:HyperLink ID="AdvancedSearchLink"
                            runat="server"
                            NavigateUrl="~/User_DonorSearch.aspx"
                            CssClass="advanced-btn">
                            Advanced Search
                        </asp:HyperLink>

                    </div>


                    <div class="quick-title">
                        Or select quickly
                    </div>


                    <div class="blood-buttons">

                        <button type="button" class="blood-btn">O+</button>
                        <button type="button" class="blood-btn">O-</button>
                        <button type="button" class="blood-btn">A+</button>
                        <button type="button" class="blood-btn">A-</button>
                        <button type="button" class="blood-btn">B+</button>
                        <button type="button" class="blood-btn">B-</button>
                        <button type="button" class="blood-btn">AB+</button>
                        <button type="button" class="blood-btn">AB-</button>

                    </div>

                </div>


                <div class="section-card">

                    <div class="section-header">

                        <h3>Active Blood Requests</h3>

                        <a href="User_MyRequests.aspx"
                           class="view-all">
                            View All &gt;
                        </a>

                    </div>


                    <div class="request-card">

                        <div class="request-top">

                            <div class="blood-group">
                                O+
                            </div>

                            <span class="tag emergency-tag">
                                ⚡ EMERGENCY
                            </span>

                            <span class="tag active-tag">
                                ACTIVE
                            </span>

                        </div>


                        <div class="location">

                            <i class="fa-solid fa-location-dot"></i>
                            Ahmedabad (Apollo Hospital)

                        </div>


                        <div class="status">
                            Donor search in progress...
                        </div>


                        <div class="actions">

                            <a href="User_RequestDetails.aspx"
                               class="small-btn">
                                Details
                            </a>

                            <a href="User_SearchResults.aspx"
                               class="small-btn match-btn">
                                Matches (2)
                            </a>

                        </div>

                    </div>


                    <div class="request-card">

                        <div class="request-top">

                            <div class="blood-group">
                                A+
                            </div>

                            <span class="tag normal-tag">
                                NORMAL
                            </span>

                            <span class="tag searching-tag">
                                SEARCHING
                            </span>

                        </div>


                        <div class="location">

                            <i class="fa-solid fa-location-dot"></i>
                            Ahmedabad (Civil Hospital)

                        </div>


                        <div class="status">
                            Searching for potential donors...
                        </div>


                        <div class="actions">

                            <a href="User_RequestDetails.aspx"
                               class="small-btn">
                                Details
                            </a>

                            <a href="User_SearchResults.aspx"
                               class="small-btn match-btn">
                                Matches (0)
                            </a>

                        </div>

                    </div>

                </div>


                <div class="section-card">

                    <div class="section-header">

                        <h3>Potential Donors Nearby</h3>

                        <a href="User_DonorSearch.aspx"
                           class="view-all">
                            View All &gt;
                        </a>

                    </div>


                    <div class="donor-card">

                        <div class="donor-left">

                            <div class="avatar">
                                AP
                            </div>

                            <div>

                                <div class="donor-name">
                                    Ananya Patel
                                </div>

                                <div class="donor-info">
                                    O+ • 1.2 km • VERIFIED DONOR
                                </div>

                            </div>

                        </div>

                        <button type="button"
                                class="contact-btn">
                            Contact
                        </button>

                    </div>


                    <div class="donor-card">

                        <div class="donor-left">

                            <div class="avatar">
                                AM
                            </div>

                            <div>

                                <div class="donor-name">
                                    Arjun Mehta
                                </div>

                                <div class="donor-info">
                                    O+ • 3.5 km • VERIFIED DONOR
                                </div>

                            </div>

                        </div>

                        <button type="button"
                                class="contact-btn">
                            Contact
                        </button>

                    </div>


                    <div class="donor-card">

                        <div class="donor-left">

                            <div class="avatar">
                                PS
                            </div>

                            <div>

                                <div class="donor-name">
                                    Priya Shah
                                </div>

                                <div class="donor-info">
                                    O+ • 4.8 km • REGULAR DONOR
                                </div>

                            </div>

                        </div>

                        <button type="button"
                                class="contact-btn">
                            Contact
                        </button>

                    </div>

                </div>

            </div>


            <div>


                <div class="stats-grid">

                    <div class="stat-card">

                        <div class="stat-icon">
                            <i class="fa-solid fa-droplet"></i>
                        </div>

                        <div class="stat-number">
                            2
                        </div>

                        <div class="stat-label">
                            Active Requests
                        </div>

                    </div>


                    <div class="stat-card">

                        <div class="stat-icon">
                            <i class="fa-solid fa-user-group"></i>
                        </div>

                        <div class="stat-number">
                            8
                        </div>

                        <div class="stat-label">
                            Donors Contacted
                        </div>

                    </div>


                    <div class="stat-card">

                        <div class="stat-icon">
                            <i class="fa-solid fa-reply"></i>
                        </div>

                        <div class="stat-number">
                            5
                        </div>

                        <div class="stat-label">
                            Responses
                        </div>

                    </div>


                    <div class="stat-card">

                        <div class="stat-icon">
                            <i class="fa-solid fa-circle-check"></i>
                        </div>

                        <div class="stat-number">
                            3
                        </div>

                        <div class="stat-label">
                            Completed
                        </div>

                    </div>

                </div>


                <div class="section-card">

                    <div class="section-header">
                        <h3>Recent Activity</h3>
                    </div>


                    <div class="activity">

                        <div class="activity-dot red-dot"></div>

                        <div class="activity-text">

                            <strong>Response received:</strong>
                            Ananya Patel accepted your O+ request.

                            <span class="activity-time">
                                2 hours ago
                            </span>

                        </div>

                    </div>


                    <div class="activity">

                        <div class="activity-dot"></div>

                        <div class="activity-text">

                            <strong>Viewed Donors:</strong>
                            You viewed 5 donor profiles in Ahmedabad.

                            <span class="activity-time">
                                5 hours ago
                            </span>

                        </div>

                    </div>


                    <div class="activity">

                        <div class="activity-dot"></div>

                        <div class="activity-text">

                            <strong>Request Created:</strong>
                            Emergency request for O+ created.

                            <span class="activity-time">
                                Yesterday
                            </span>

                        </div>

                    </div>


                    <div class="activity">

                        <div class="activity-dot"></div>

                        <div class="activity-text">

                            <strong>Profile Updated:</strong>
                            Contact details updated successfully.

                            <span class="activity-time">
                                3 days ago
                            </span>

                        </div>

                    </div>

                </div>


                <div class="section-card">

                    <div class="section-header">
                        <h3>Urgent Needs Nearby</h3>
                    </div>


                    <div class="urgent-item">

                        <div class="urgent-left">

                            <div class="urgent-blood">
                                O+
                            </div>

                            <div class="urgent-info">

                                <strong>
                                    2 Units
                                </strong>

                                <span>
                                    📍 3.2 km away • Needed Today
                                </span>

                            </div>

                        </div>

                        <div class="urgent-label">
                            URGENT
                        </div>

                    </div>


                    <div class="urgent-item">

                        <div class="urgent-left">

                            <div class="urgent-blood">
                                AB-
                            </div>

                            <div class="urgent-info">

                                <strong>
                                    1 Unit
                                </strong>

                                <span>
                                    📍 5.1 km away • Needed by Tmrw
                                </span>

                            </div>

                        </div>

                        <div class="urgent-label">
                            URGENT
                        </div>

                    </div>

                </div>


                <div class="disclaimer">

                    <i class="fa-solid fa-circle-info"></i>

                    Always verify donor health and medical history
                    with healthcare professionals before proceeding
                    with blood donation.

                </div>

            </div>

        </div>

    </div>

</asp:Content>
