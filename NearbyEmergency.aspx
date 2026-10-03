<%@ Page Title="Nearby Emergency Requests" Language="C#" MasterPageFile="~/Donor.Master"
    AutoEventWireup="true"
    CodeBehind="NearbyEmergency.aspx.cs"
    Inherits="WebApplication1.NearbyEmergency" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>

    .nearby-page {
        width: 100%;
    }

    /* ================= PAGE HEADER ================= */

    .page-header {
        background: #FFFFFF;
        border: 1px solid #E5E7EB;
        border-radius: 15px;
        padding: 22px;
        margin-bottom: 20px;
    }

    .page-header-top {
        display: flex;
        justify-content: space-between;
        align-items: center;
        gap: 15px;
    }

    .page-title h1 {
        margin: 0 0 7px 0;
        color: #202338;
        font-size: 25px;
    }

    .page-title p {
        margin: 0;
        color: #6B7280;
        font-size: 12px;
    }

    .location-box {
        background: #EEF4FF;
        color: #3B62F6;
        padding: 9px 14px;
        border-radius: 8px;
        font-size: 11px;
        font-weight: bold;
    }


    /* ================= EMERGENCY BANNER ================= */

    .emergency-banner {
        background: #FFF1F3;
        border: 1px solid #FFD7DE;
        border-radius: 12px;
        padding: 15px 18px;
        margin-bottom: 20px;
        display: flex;
        align-items: center;
        gap: 12px;
    }

    .banner-icon {
        width: 38px;
        height: 38px;
        border-radius: 50%;
        background: #D80032;
        color: white;
        display: flex;
        align-items: center;
        justify-content: center;
        flex-shrink: 0;
    }

    .banner-text strong {
        display: block;
        color: #B00029;
        font-size: 13px;
        margin-bottom: 4px;
    }

    .banner-text span {
        color: #7F5A61;
        font-size: 11px;
    }


    /* ================= FILTER ================= */

    .filter-card {
        background: #FFFFFF;
        border: 1px solid #E5E7EB;
        border-radius: 15px;
        padding: 20px;
        margin-bottom: 20px;
    }

    .filter-title {
        color: #202338;
        font-size: 14px;
        font-weight: bold;
        margin-bottom: 15px;
    }

    .filter-grid {
        display: grid;
        grid-template-columns: 1.5fr 1fr 1fr 1fr 1fr auto auto;
        gap: 10px;
        align-items: end;
    }

    .filter-item label {
        display: block;
        color: #6B7280;
        font-size: 10px;
        font-weight: bold;
        margin-bottom: 6px;
    }

    .filter-input,
    .filter-select {
        width: 100%;
        box-sizing: border-box;
        height: 38px;
        border: 1px solid #D1D5DB;
        border-radius: 7px;
        padding: 0 10px;
        color: #374151;
        font-size: 11px;
        background: #FFFFFF;
    }

    .filter-input:focus,
    .filter-select:focus {
        outline: none;
        border-color: #D80032;
    }

    .clear-btn {
        height: 38px;
        padding: 0 14px;
        background: #FFFFFF;
        border: 1px solid #D1D5DB;
        border-radius: 7px;
        color: #6B7280;
        font-size: 11px;
        font-weight: bold;
        cursor: pointer;
    }

    .clear-btn:hover {
        border-color: #D80032;
        color: #D80032;
    }

    .apply-btn {
        height: 38px;
        padding: 0 16px;
        background: #D80032;
        border: 1px solid #D80032;
        border-radius: 7px;
        color: #FFFFFF;
        font-size: 11px;
        font-weight: bold;
        cursor: pointer;
    }

    .apply-btn:hover {
        background: #B00029;
    }


    /* ================= MAIN GRID ================= */

    .main-grid {
        display: grid;
        grid-template-columns: 1.6fr 1fr;
        gap: 20px;
        align-items: start;
    }


    /* ================= REQUEST CARDS ================= */

    .requests-card {
        background: #FFFFFF;
        border: 1px solid #E5E7EB;
        border-radius: 15px;
        padding: 20px;
    }

    .section-heading {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 15px;
    }

    .section-heading h2 {
        margin: 0;
        color: #202338;
        font-size: 15px;
    }

    .request-count {
        background: #FFF0F3;
        color: #D80032;
        padding: 5px 9px;
        border-radius: 15px;
        font-size: 9px;
        font-weight: bold;
    }


    .request-card {
        border: 1px solid #E5E7EB;
        border-radius: 12px;
        padding: 16px;
        margin-bottom: 12px;
        transition: 0.2s;
    }

    .request-card:hover {
        border-color: #F1A3B3;
        box-shadow: 0 3px 12px rgba(0,0,0,0.05);
    }

    .request-top {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
        gap: 10px;
    }

    .request-left {
        display: flex;
        gap: 11px;
        align-items: center;
    }

    .blood-group {
        width: 46px;
        height: 46px;
        border-radius: 50%;
        background: #FFF0F3;
        color: #D80032;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 14px;
        font-weight: bold;
        flex-shrink: 0;
    }

    .request-info h3 {
        margin: 0 0 4px 0;
        color: #202338;
        font-size: 13px;
    }

    .request-info span {
        display: block;
        color: #9CA3AF;
        font-size: 10px;
        margin-top: 3px;
    }

    .urgent-tag {
        background: #FFF0F3;
        color: #D80032;
        padding: 5px 8px;
        border-radius: 15px;
        font-size: 8px;
        font-weight: bold;
    }

    .request-details {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 8px;
        margin-top: 14px;
        padding-top: 12px;
        border-top: 1px solid #F0F0F0;
    }

    .request-detail {
        background: #F8F9FA;
        border-radius: 7px;
        padding: 8px;
    }

    .request-detail span {
        display: block;
        color: #9CA3AF;
        font-size: 8px;
        margin-bottom: 4px;
    }

    .request-detail strong {
        color: #374151;
        font-size: 10px;
    }

    .request-bottom {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 12px;
    }

    .distance {
        color: #3B62F6;
        font-size: 10px;
        font-weight: bold;
    }

    .view-btn {
        background: #D80032;
        color: #FFFFFF;
        text-decoration: none;
        padding: 8px 13px;
        border-radius: 6px;
        font-size: 10px;
        font-weight: bold;
    }

    .view-btn:hover {
        background: #B00029;
    }


    /* ================= RIGHT SIDE ================= */

    .side-column {
        display: flex;
        flex-direction: column;
        gap: 18px;
    }


    /* ================= MAP ================= */

    .map-card {
        background: #FFFFFF;
        border: 1px solid #E5E7EB;
        border-radius: 15px;
        padding: 18px;
    }

    .map-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 13px;
    }

    .map-header h2 {
        margin: 0;
        color: #202338;
        font-size: 14px;
    }

    .map-header span {
        color: #3B62F6;
        background: #EEF4FF;
        padding: 5px 8px;
        border-radius: 12px;
        font-size: 9px;
        font-weight: bold;
    }

    .map-box {
        width: 100%;
        height: 270px;
        background: #EEF2F7;
        border-radius: 10px;
        position: relative;
        overflow: hidden;
        border: 1px solid #E5E7EB;
    }

    .map-box iframe {
        width: 100%;
        height: 100%;
        border: 0;
        display: block;
    }

    .map-note {
        margin-top: 9px;
        color: #9CA3AF;
        font-size: 9px;
    }


    /* ================= QUICK ACTIONS ================= */

    .quick-card {
        background: #FFFFFF;
        border: 1px solid #E5E7EB;
        border-radius: 15px;
        padding: 18px;
    }

    .quick-card h2 {
        margin: 0 0 13px 0;
        color: #202338;
        font-size: 14px;
    }

    .quick-link {
        display: flex;
        align-items: center;
        gap: 10px;
        text-decoration: none;
        padding: 10px 0;
        border-bottom: 1px solid #F0F0F0;
    }

    .quick-link:last-child {
        border-bottom: none;
    }

    .quick-icon {
        width: 31px;
        height: 31px;
        background: #FFF0F3;
        color: #D80032;
        border-radius: 7px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 13px;
    }

    .quick-link span {
        color: #374151;
        font-size: 11px;
        font-weight: bold;
    }


    /* ================= RESPONSIVE ================= */

    @media (max-width: 1200px) {

        .filter-grid {
            grid-template-columns: repeat(3, 1fr);
        }

        .main-grid {
            grid-template-columns: 1fr;
        }

    }

    @media (max-width: 700px) {

        .page-header-top {
            flex-direction: column;
            align-items: flex-start;
        }

        .filter-grid {
            grid-template-columns: 1fr;
        }

        .request-details {
            grid-template-columns: 1fr;
        }

        .request-top {
            flex-direction: column;
        }

        .map-box {
            height: 230px;
        }

    }

</style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="nearby-page">


    <!-- ================= PAGE HEADER ================= -->

    <div class="page-header">

        <div class="page-header-top">

            <div class="page-title">

                <h1>
                    Nearby Emergency Requests
                </h1>

                <p>
                    Find urgent blood requests near your current location and help patients in need.
                </p>

            </div>

            <div class="location-box">
                📍 Ahmedabad, Gujarat
            </div>

        </div>

    </div>


    <!-- ================= EMERGENCY BANNER ================= -->

    <div class="emergency-banner">

        <div class="banner-icon">
            ⚠
        </div>

        <div class="banner-text">

            <strong>
                Emergency Requests Need Immediate Attention
            </strong>

            <span>
                These requests are marked urgent because patients require blood support quickly.
            </span>

        </div>

    </div>


    <!-- ================= FILTER ================= -->

    <div class="filter-card">

        <div class="filter-title">
            Find Emergency Requests
        </div>


        <div class="filter-grid">


            <div class="filter-item">

                <label>
                    Search
                </label>

                <asp:TextBox
                    ID="txtSearch"
                    runat="server"
                    CssClass="filter-input"
                    placeholder="Search hospital or location">
                </asp:TextBox>

            </div>


            <div class="filter-item">

                <label>
                    Blood Group
                </label>

                <asp:DropDownList
                    ID="ddlBloodGroup"
                    runat="server"
                    CssClass="filter-select">

                    <asp:ListItem Text="All Groups" Value=""></asp:ListItem>
                    <asp:ListItem Text="A+" Value="A+"></asp:ListItem>
                    <asp:ListItem Text="A-" Value="A-"></asp:ListItem>
                    <asp:ListItem Text="B+" Value="B+"></asp:ListItem>
                    <asp:ListItem Text="B-" Value="B-"></asp:ListItem>
                    <asp:ListItem Text="AB+" Value="AB+"></asp:ListItem>
                    <asp:ListItem Text="AB-" Value="AB-"></asp:ListItem>
                    <asp:ListItem Text="O+" Value="O+"></asp:ListItem>
                    <asp:ListItem Text="O-" Value="O-"></asp:ListItem>

                </asp:DropDownList>

            </div>


            <div class="filter-item">

                <label>
                    Distance
                </label>

                <asp:DropDownList
                    ID="ddlDistance"
                    runat="server"
                    CssClass="filter-select">

                    <asp:ListItem Text="Within 5 km" Value="5"></asp:ListItem>
                    <asp:ListItem Text="Within 10 km" Value="10"></asp:ListItem>
                    <asp:ListItem Text="Within 20 km" Value="20"></asp:ListItem>
                    <asp:ListItem Text="Any Distance" Value="0"></asp:ListItem>

                </asp:DropDownList>

            </div>


            <div class="filter-item">

                <label>
                    Urgency
                </label>

                <asp:DropDownList
                    ID="ddlUrgency"
                    runat="server"
                    CssClass="filter-select">

                    <asp:ListItem Text="All" Value=""></asp:ListItem>
                    <asp:ListItem Text="Critical" Value="Critical"></asp:ListItem>
                    <asp:ListItem Text="Urgent" Value="Urgent"></asp:ListItem>
                    <asp:ListItem Text="Normal" Value="Normal"></asp:ListItem>

                </asp:DropDownList>

            </div>


            <div class="filter-item">

                <label>
                    Request Type
                </label>

                <asp:DropDownList
                    ID="ddlRequestType"
                    runat="server"
                    CssClass="filter-select">

                    <asp:ListItem Text="All Requests" Value=""></asp:ListItem>
                    <asp:ListItem Text="Emergency" Value="Emergency"></asp:ListItem>
                    <asp:ListItem Text="Normal" Value="Normal"></asp:ListItem>

                </asp:DropDownList>

            </div>


            <asp:Button
                ID="btnClear"
                runat="server"
                Text="Clear"
                CssClass="clear-btn"
                OnClick="btnClear_Click" />


            <asp:Button
                ID="btnApply"
                runat="server"
                Text="Apply"
                CssClass="apply-btn"
                OnClick="btnApply_Click" />

        </div>

    </div>


    <!-- ================= MAIN GRID ================= -->

    <div class="main-grid">


        <!-- ================= REQUEST LIST ================= -->

        <div class="requests-card">

            <div class="section-heading">

                <h2>
                    Emergency Blood Requests
                </h2>

                <span class="request-count">
                    3 ACTIVE REQUESTS
                </span>

            </div>


            <!-- REQUEST 1 -->

            <div class="request-card">

                <div class="request-top">

                    <div class="request-left">

                        <div class="blood-group">
                            O+
                        </div>

                        <div class="request-info">

                            <h3>
                                City Care Hospital
                            </h3>

                            <span>
                                📍 120 Health Avenue, Ahmedabad
                            </span>

                            <span>
                                Requested 25 minutes ago
                            </span>

                        </div>

                    </div>

                    <span class="urgent-tag">
                        URGENT
                    </span>

                </div>


                <div class="request-details">

                    <div class="request-detail">

                        <span>
                            BLOOD GROUP
                        </span>

                        <strong>
                            O+
                        </strong>

                    </div>


                    <div class="request-detail">

                        <span>
                            UNITS
                        </span>

                        <strong>
                            2 Units
                        </strong>

                    </div>


                    <div class="request-detail">

                        <span>
                            PATIENT STATUS
                        </span>

                        <strong>
                            Critical
                        </strong>

                    </div>

                </div>


                <div class="request-bottom">

                    <span class="distance">
                        📍 3.2 km away
                    </span>

                    <a href="EmergencyDetails.aspx"
                       class="view-btn">
                        View Details
                    </a>

                </div>

            </div>


            <!-- REQUEST 2 -->

            <div class="request-card">

                <div class="request-top">

                    <div class="request-left">

                        <div class="blood-group">
                            B+
                        </div>

                        <div class="request-info">

                            <h3>
                                Sterling Hospital
                            </h3>

                            <span>
                                📍 Memnagar, Ahmedabad
                            </span>

                            <span>
                                Requested 1 hour ago
                            </span>

                        </div>

                    </div>

                    <span class="urgent-tag">
                        URGENT
                    </span>

                </div>


                <div class="request-details">

                    <div class="request-detail">

                        <span>
                            BLOOD GROUP
                        </span>

                        <strong>
                            B+
                        </strong>

                    </div>


                    <div class="request-detail">

                        <span>
                            UNITS
                        </span>

                        <strong>
                            3 Units
                        </strong>

                    </div>


                    <div class="request-detail">

                        <span>
                            PATIENT STATUS
                        </span>

                        <strong>
                            Critical
                        </strong>

                    </div>

                </div>


                <div class="request-bottom">

                    <span class="distance">
                        📍 5.7 km away
                    </span>

                    <a href="EmergencyDetails.aspx"
                       class="view-btn">
                        View Details
                    </a>

                </div>

            </div>


            <!-- REQUEST 3 -->

            <div class="request-card">

                <div class="request-top">

                    <div class="request-left">

                        <div class="blood-group">
                            A-
                        </div>

                        <div class="request-info">

                            <h3>
                                Zydus Hospital
                            </h3>

                            <span>
                                📍 S.G. Highway, Ahmedabad
                            </span>

                            <span>
                                Requested 2 hours ago
                            </span>

                        </div>

                    </div>

                    <span class="urgent-tag">
                        URGENT
                    </span>

                </div>


                <div class="request-details">

                    <div class="request-detail">

                        <span>
                            BLOOD GROUP
                        </span>

                        <strong>
                            A-
                        </strong>

                    </div>


                    <div class="request-detail">

                        <span>
                            UNITS
                        </span>

                        <strong>
                            1 Unit
                        </strong>

                    </div>


                    <div class="request-detail">

                        <span>
                            PATIENT STATUS
                        </span>

                        <strong>
                            Serious
                        </strong>

                    </div>

                </div>


                <div class="request-bottom">

                    <span class="distance">
                        📍 8.4 km away
                    </span>

                    <a href="EmergencyDetails.aspx"
                       class="view-btn">
                        View Details
                    </a>

                </div>

            </div>

        </div>


        <!-- ================= RIGHT COLUMN ================= -->

        <div class="side-column">


            <!-- ================= OPEN STREET MAP ================= -->

            <div class="map-card">

                <div class="map-header">

                    <h2>
                        📍 Nearby Requests Map
                    </h2>

                    <span>
                        LIVE AREA
                    </span>

                </div>


                <div class="map-box">

                    <iframe
                        src="https://www.openstreetmap.org/export/embed.html?bbox=72.52%2C23.00%2C72.65%2C23.10&amp;layer=mapnik&amp;marker=23.0225%2C72.5714"
                        loading="lazy">
                    </iframe>

                </div>


                <div class="map-note">
                    Map shows the Ahmedabad area and nearby emergency request location.
                </div>

            </div>


            <!-- ================= QUICK ACTIONS ================= -->

            <div class="quick-card">

                <h2>
                    Quick Actions
                </h2>


                <a href="Donation_Eligibility.aspx"
                   class="quick-link">

                    <div class="quick-icon">
                        ✓
                    </div>

                    <span>
                        Check Donation Eligibility
                    </span>

                </a>


                <a href="FindCamps.aspx"
                   class="quick-link">

                    <div class="quick-icon">
                        📍
                    </div>

                    <span>
                        Find Donation Camps
                    </span>

                </a>


                <a href="DonationHistory.aspx"
                   class="quick-link">

                    <div class="quick-icon">
                        ◷
                    </div>

                    <span>
                        Donation History
                    </span>

                </a>


                <a href="DonorNotifications.aspx"
                   class="quick-link">

                    <div class="quick-icon">
                        🔔
                    </div>

                    <span>
                        Notifications
                    </span>

                </a>

            </div>

        </div>

    </div>

</div>

</asp:Content>