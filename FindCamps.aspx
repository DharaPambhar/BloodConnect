<%@ Page Title="Find Donation Camps" Language="C#" MasterPageFile="~/Donor.Master"
    AutoEventWireup="true"
    CodeBehind="FindCamps.aspx.cs"
    Inherits="WebApplication1.FindCamps" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>

    .camps-page {
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
        gap: 20px;
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

    .location-area {
        text-align: right;
    }

    .location-box {
        background: #EEF4FF;
        color: #3B62F6;
        padding: 9px 13px;
        border-radius: 8px;
        font-size: 11px;
        font-weight: bold;
        display: inline-block;
        margin-bottom: 5px;
    }

    .change-location {
        display: block;
        color: #3B62F6;
        font-size: 10px;
        text-decoration: none;
    }

    .change-location:hover {
        text-decoration: underline;
    }


    /* ================= FILTER CARD ================= */

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
        margin-bottom: 14px;
    }

    .search-box {
        margin-bottom: 15px;
    }

    .search-box label {
        display: block;
        color: #6B7280;
        font-size: 10px;
        font-weight: bold;
        margin-bottom: 6px;
    }

    .search-input {
        width: 100%;
        height: 39px;
        box-sizing: border-box;
        border: 1px solid #D1D5DB;
        border-radius: 7px;
        padding: 0 12px;
        color: #374151;
        font-size: 11px;
    }

    .search-input:focus {
        outline: none;
        border-color: #D80032;
    }

    .filter-grid {
        display: grid;
        grid-template-columns: repeat(5, 1fr) auto auto;
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

    .filter-select {
        width: 100%;
        height: 38px;
        box-sizing: border-box;
        border: 1px solid #D1D5DB;
        border-radius: 7px;
        padding: 0 9px;
        background: #FFFFFF;
        color: #374151;
        font-size: 10px;
    }

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
        font-size: 10px;
        font-weight: bold;
        cursor: pointer;
    }

    .clear-btn:hover {
        color: #D80032;
        border-color: #D80032;
    }

    .apply-btn {
        height: 38px;
        padding: 0 15px;
        background: #D80032;
        border: 1px solid #D80032;
        border-radius: 7px;
        color: #FFFFFF;
        font-size: 10px;
        font-weight: bold;
        cursor: pointer;
    }

    .apply-btn:hover {
        background: #B00029;
    }


    /* ================= RESULTS HEADER ================= */

    .results-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 13px;
    }

    .results-title {
        display: flex;
        align-items: center;
        gap: 8px;
    }

    .results-title h2 {
        margin: 0;
        color: #202338;
        font-size: 16px;
    }

    .found-count {
        background: #FFF0F3;
        color: #D80032;
        padding: 5px 9px;
        border-radius: 15px;
        font-size: 9px;
        font-weight: bold;
    }

    .sort-area {
        display: flex;
        align-items: center;
        gap: 6px;
    }

    .sort-area span {
        color: #9CA3AF;
        font-size: 10px;
    }

    .sort-select {
        height: 31px;
        border: 1px solid #D1D5DB;
        border-radius: 6px;
        background: white;
        color: #374151;
        padding: 0 8px;
        font-size: 10px;
    }


    /* ================= CONTENT GRID ================= */

    .content-grid {
        display: grid;
        grid-template-columns: 0.85fr 1.4fr;
        gap: 20px;
        align-items: start;
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
        background: #EEF4FF;
        color: #3B62F6;
        padding: 5px 8px;
        border-radius: 12px;
        font-size: 9px;
        font-weight: bold;
    }

    .map-box {
        width: 100%;
        height: 475px;
        background: #EEF2F7;
        border-radius: 10px;
        overflow: hidden;
        border: 1px solid #E5E7EB;
    }

    .map-box iframe {
        width: 100%;
        height: 100%;
        border: 0;
        display: block;
    }

    .map-footer {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 10px;
    }

    .map-legend {
        color: #6B7280;
        font-size: 9px;
    }

    .expand-map {
        color: #3B62F6;
        font-size: 10px;
        font-weight: bold;
        text-decoration: none;
    }

    .expand-map:hover {
        text-decoration: underline;
    }


    /* ================= CAMP GRID ================= */

    .camp-grid {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        gap: 13px;
    }

    .camp-card {
        background: #FFFFFF;
        border: 1px solid #E5E7EB;
        border-radius: 13px;
        padding: 16px;
        transition: 0.2s;
    }

    .camp-card:hover {
        border-color: #F1A3B3;
        box-shadow: 0 3px 12px rgba(0,0,0,0.05);
    }

    .camp-top {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
        gap: 8px;
        margin-bottom: 12px;
    }

    .camp-name {
        margin: 0;
        color: #202338;
        font-size: 13px;
        line-height: 1.4;
    }

    .open-status {
        background: #E9F9F0;
        color: #15803D;
        padding: 5px 8px;
        border-radius: 12px;
        font-size: 8px;
        font-weight: bold;
        white-space: nowrap;
    }

    .few-status {
        background: #FFF6E5;
        color: #C26A00;
        padding: 5px 8px;
        border-radius: 12px;
        font-size: 8px;
        font-weight: bold;
        white-space: nowrap;
    }

    .camp-info {
        border-top: 1px solid #F0F0F0;
        padding-top: 11px;
    }

    .camp-row {
        display: flex;
        align-items: flex-start;
        gap: 7px;
        margin-bottom: 8px;
    }

    .camp-row-icon {
        width: 20px;
        color: #D80032;
        font-size: 11px;
        flex-shrink: 0;
    }

    .camp-row-text {
        color: #6B7280;
        font-size: 10px;
        line-height: 1.4;
    }

    .camp-row-text strong {
        color: #374151;
        font-weight: bold;
    }

    .slots {
        background: #F8F9FA;
        border-radius: 7px;
        padding: 8px 9px;
        margin-top: 10px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .slots span {
        color: #9CA3AF;
        font-size: 9px;
    }

    .slots strong {
        color: #15803D;
        font-size: 10px;
    }

    .few-slots strong {
        color: #C26A00;
    }

    .camp-button {
        display: block;
        width: 100%;
        box-sizing: border-box;
        text-align: center;
        margin-top: 11px;
        padding: 9px;
        border-radius: 7px;
        background: #D80032;
        color: #FFFFFF;
        text-decoration: none;
        font-size: 10px;
        font-weight: bold;
    }

    .camp-button:hover {
        background: #B00029;
    }


    /* ================= BOTTOM INFO ================= */

    .info-banner {
        background: #F8F9FA;
        border: 1px solid #E5E7EB;
        border-radius: 12px;
        padding: 14px 16px;
        margin-top: 20px;
        display: flex;
        gap: 10px;
        align-items: center;
    }

    .info-icon {
        width: 32px;
        height: 32px;
        border-radius: 50%;
        background: #EEF4FF;
        color: #3B62F6;
        display: flex;
        align-items: center;
        justify-content: center;
        flex-shrink: 0;
    }

    .info-banner strong {
        display: block;
        color: #374151;
        font-size: 11px;
        margin-bottom: 3px;
    }

    .info-banner span {
        color: #9CA3AF;
        font-size: 9px;
    }


    /* ================= RESPONSIVE ================= */

    @media (max-width: 1200px) {

        .filter-grid {
            grid-template-columns: repeat(3, 1fr);
        }

        .content-grid {
            grid-template-columns: 1fr;
        }

        .map-box {
            height: 300px;
        }

    }

    @media (max-width: 800px) {

        .page-header-top {
            flex-direction: column;
            align-items: flex-start;
        }

        .location-area {
            text-align: left;
        }

        .filter-grid {
            grid-template-columns: 1fr;
        }

        .results-header {
            flex-direction: column;
            align-items: flex-start;
            gap: 10px;
        }

        .camp-grid {
            grid-template-columns: 1fr;
        }

    }

</style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="camps-page">


    <!-- ================= PAGE HEADER ================= -->

    <div class="page-header">

        <div class="page-header-top">

            <div class="page-title">

                <h1>
                    Find Donation Camps
                </h1>

                <p>
                    Discover nearby blood donation camps and book a convenient donation slot.
                </p>

            </div>

            <div class="location-area">

                <div class="location-box">
                    📍 Ahmedabad, Gujarat
                </div>

                <a href="#" class="change-location">
                    Change Location
                </a>

            </div>

        </div>

    </div>


    <!-- ================= FILTER ================= -->

    <div class="filter-card">

        <div class="filter-title">
            Search & Filter Donation Camps
        </div>


        <div class="search-box">

            <label>
                SEARCH
            </label>

            <asp:TextBox
                ID="txtSearch"
                runat="server"
                CssClass="search-input"
                placeholder="Search donation camps by name, location, or organizer">
            </asp:TextBox>

        </div>


        <div class="filter-grid">


            <!-- DATE -->

            <div class="filter-item">

                <label>
                    DATE
                </label>

                <asp:DropDownList
                    ID="ddlDate"
                    runat="server"
                    CssClass="filter-select">

                    <asp:ListItem Text="Any Date" Value=""></asp:ListItem>
                    <asp:ListItem Text="Today" Value="Today"></asp:ListItem>
                    <asp:ListItem Text="Tomorrow" Value="Tomorrow"></asp:ListItem>
                    <asp:ListItem Text="This Week" Value="This Week"></asp:ListItem>

                </asp:DropDownList>

            </div>


            <!-- DISTANCE -->

            <div class="filter-item">

                <label>
                    DISTANCE
                </label>

                <asp:DropDownList
                    ID="ddlDistance"
                    runat="server"
                    CssClass="filter-select">

                    <asp:ListItem Text="Within 10 km" Value="10"></asp:ListItem>
                    <asp:ListItem Text="Within 5 km" Value="5"></asp:ListItem>
                    <asp:ListItem Text="Within 20 km" Value="20"></asp:ListItem>
                    <asp:ListItem Text="Any Distance" Value="0"></asp:ListItem>

                </asp:DropDownList>

            </div>


            <!-- CAMP TYPE -->

            <div class="filter-item">

                <label>
                    CAMP TYPE
                </label>

                <asp:DropDownList
                    ID="ddlCampType"
                    runat="server"
                    CssClass="filter-select">

                    <asp:ListItem Text="All Types" Value=""></asp:ListItem>
                    <asp:ListItem Text="Community" Value="Community"></asp:ListItem>
                    <asp:ListItem Text="Corporate" Value="Corporate"></asp:ListItem>
                    <asp:ListItem Text="Hospital" Value="Hospital"></asp:ListItem>
                    <asp:ListItem Text="Organization" Value="Organization"></asp:ListItem>

                </asp:DropDownList>

            </div>


            <!-- BLOOD GROUP -->

            <div class="filter-item">

                <label>
                    BLOOD GROUP NEEDED
                </label>

                <asp:DropDownList
                    ID="ddlBloodGroup"
                    runat="server"
                    CssClass="filter-select">

                    <asp:ListItem Text="Any Group" Value=""></asp:ListItem>
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


            <!-- AVAILABILITY -->

            <div class="filter-item">

                <label>
                    AVAILABILITY
                </label>

                <asp:DropDownList
                    ID="ddlAvailability"
                    runat="server"
                    CssClass="filter-select">

                    <asp:ListItem Text="Open Slots" Value="Open"></asp:ListItem>
                    <asp:ListItem Text="Few Slots Left" Value="Few"></asp:ListItem>
                    <asp:ListItem Text="All" Value="All"></asp:ListItem>

                </asp:DropDownList>

            </div>


            <!-- CLEAR -->

            <asp:Button
                ID="btnClear"
                runat="server"
                Text="Clear Filters"
                CssClass="clear-btn"
                OnClick="btnClear_Click" />


            <!-- APPLY -->

            <asp:Button
                ID="btnApply"
                runat="server"
                Text="Apply Filters"
                CssClass="apply-btn"
                OnClick="btnApply_Click" />

        </div>

    </div>


    <!-- ================= RESULTS HEADER ================= -->

    <div class="results-header">

        <div class="results-title">

            <h2>
                Donation Camps Near You
            </h2>

            <span class="found-count">
                12 FOUND
            </span>

        </div>


        <div class="sort-area">

            <span>
                Sort by:
            </span>

            <select class="sort-select">

                <option>
                    Nearest
                </option>

                <option>
                    Date
                </option>

                <option>
                    Most Slots
                </option>

            </select>

        </div>

    </div>


    <!-- ================= MAP + CAMPS ================= -->

    <div class="content-grid">


        <!-- ================= MAP ================= -->

        <div class="map-card">

            <div class="map-header">

                <h2>
                    🔴 Camp Locations
                </h2>

                <span>
                    AHMEDABAD
                </span>

            </div>


            <div class="map-box">

                <iframe
                    src="https://www.openstreetmap.org/export/embed.html?bbox=72.52%2C23.00%2C72.65%2C23.10&amp;layer=mapnik&amp;marker=23.0225%2C72.5714"
                    loading="lazy">
                </iframe>

            </div>


            <div class="map-footer">

                <span class="map-legend">
                    📍 Showing nearby donation camp area
                </span>

                <a href="https://www.openstreetmap.org/"
                   target="_blank"
                   class="expand-map">
                    Expand Map ↗
                </a>

            </div>

        </div>


        <!-- ================= CAMP CARDS ================= -->

        <div class="camp-grid">


            <!-- CAMP 1 -->

            <div class="camp-card">

                <div class="camp-top">

                    <h3 class="camp-name">
                        Save Life Blood Drive
                    </h3>

                    <span class="open-status">
                        🟢 OPEN
                    </span>

                </div>


                <div class="camp-info">

                    <div class="camp-row">

                        <div class="camp-row-icon">
                            🏢
                        </div>

                        <div class="camp-row-text">
                            Organizer:
                            <strong>
                                Rotary Club Central
                            </strong>
                        </div>

                    </div>


                    <div class="camp-row">

                        <div class="camp-row-icon">
                            📅
                        </div>

                        <div class="camp-row-text">
                            <strong>
                                Oct 24, 2024
                            </strong>
                            <br />
                            09:00 AM - 04:00 PM
                        </div>

                    </div>


                    <div class="camp-row">

                        <div class="camp-row-icon">
                            📍
                        </div>

                        <div class="camp-row-text">
                            Town Hall, Ahmedabad
                            <br />
                            <strong>
                                2.4 km away
                            </strong>
                        </div>

                    </div>


                    <div class="slots">

                        <span>
                            Available Slots
                        </span>

                        <strong>
                            18 slots left
                        </strong>

                    </div>


                    <a href="CampDetails.aspx"
                       class="camp-button">
                        Book Slot
                    </a>

                </div>

            </div>


            <!-- CAMP 2 -->

            <div class="camp-card">

                <div class="camp-top">

                    <h3 class="camp-name">
                        Ahmedabad Community Drive
                    </h3>

                    <span class="open-status">
                        🟢 OPEN
                    </span>

                </div>


                <div class="camp-info">

                    <div class="camp-row">

                        <div class="camp-row-icon">
                            🏢
                        </div>

                        <div class="camp-row-text">
                            Organizer:
                            <strong>
                                Red Cross Society
                            </strong>
                        </div>

                    </div>


                    <div class="camp-row">

                        <div class="camp-row-icon">
                            📅
                        </div>

                        <div class="camp-row-text">
                            <strong>
                                Oct 25, 2024
                            </strong>
                            <br />
                            10:00 AM - 05:00 PM
                        </div>

                    </div>


                    <div class="camp-row">

                        <div class="camp-row-icon">
                            📍
                        </div>

                        <div class="camp-row-text">
                            Gujarat University
                            <br />
                            <strong>
                                4.1 km away
                            </strong>
                        </div>

                    </div>


                    <div class="slots">

                        <span>
                            Available Slots
                        </span>

                        <strong>
                            12 slots left
                        </strong>

                    </div>


                    <a href="CampDetails.aspx"
                       class="camp-button">
                        Book Slot
                    </a>

                </div>

            </div>


            <!-- CAMP 3 -->

            <div class="camp-card">

                <div class="camp-top">

                    <h3 class="camp-name">
                        Corporate Life Saver
                    </h3>

                    <span class="open-status">
                        🟢 OPEN
                    </span>

                </div>


                <div class="camp-info">

                    <div class="camp-row">

                        <div class="camp-row-icon">
                            🏢
                        </div>

                        <div class="camp-row-text">
                            Organizer:
                            <strong>
                                TechPark IT Solutions
                            </strong>
                        </div>

                    </div>


                    <div class="camp-row">

                        <div class="camp-row-icon">
                            📅
                        </div>

                        <div class="camp-row-text">
                            <strong>
                                Oct 28, 2024
                            </strong>
                            <br />
                            08:00 AM - 02:00 PM
                        </div>

                    </div>


                    <div class="camp-row">

                        <div class="camp-row-icon">
                            📍
                        </div>

                        <div class="camp-row-text">
                            SG Highway, Ahmedabad
                            <br />
                            <strong>
                                6.8 km away
                            </strong>
                        </div>

                    </div>


                    <div class="slots">

                        <span>
                            Available Slots
                        </span>

                        <strong>
                            25 slots left
                        </strong>

                    </div>


                    <a href="CampDetails.aspx"
                       class="camp-button">
                        Book Slot
                    </a>

                </div>

            </div>


            <!-- CAMP 4 -->

            <div class="camp-card">

                <div class="camp-top">

                    <h3 class="camp-name">
                        Sunrise Donation Camp
                    </h3>

                    <span class="few-status">
                        🟡 FEW SLOTS LEFT
                    </span>

                </div>


                <div class="camp-info">

                    <div class="camp-row">

                        <div class="camp-row-icon">
                            🏢
                        </div>

                        <div class="camp-row-text">
                            Organizer:
                            <strong>
                                Lions Club
                            </strong>
                        </div>

                    </div>


                    <div class="camp-row">

                        <div class="camp-row-icon">
                            📅
                        </div>

                        <div class="camp-row-text">
                            <strong>
                                Tomorrow
                            </strong>
                            <br />
                            09:00 AM - 01:00 PM
                        </div>

                    </div>


                    <div class="camp-row">

                        <div class="camp-row-icon">
                            📍
                        </div>

                        <div class="camp-row-text">
                            Vastrapur, Ahmedabad
                            <br />
                            <strong>
                                3.2 km away
                            </strong>
                        </div>

                    </div>


                    <div class="slots few-slots">

                        <span>
                            Available Slots
                        </span>

                        <strong>
                            8 slots left
                        </strong>

                    </div>


                    <a href="CampDetails.aspx"
                       class="camp-button">
                        Book Slot
                    </a>

                </div>

            </div>

        </div>

    </div>


    <!-- ================= INFORMATION ================= -->

    <div class="info-banner">

        <div class="info-icon">
            ℹ
        </div>

        <div>

            <strong>
                Plan Your Donation
            </strong>

            <span>
                Please arrive 10–15 minutes before your selected donation slot and carry a valid ID.
            </span>

        </div>

    </div>

</div>

</asp:Content>