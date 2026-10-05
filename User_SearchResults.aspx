
<%@ Page Title="Search Results" Language="C#" MasterPageFile="~/User.Master"
    AutoEventWireup="true"
    CodeBehind="User_SearchResults.aspx.cs"
    Inherits="BloodConnect.User_SearchResults" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>

    .results-page {
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
        color: #302d35;
        font-size: 25px;
    }

    .page-title p {
        margin: 0;
        color: #7e7885;
        font-size: 12px;
    }

    .header-actions {
        display: flex;
        gap: 9px;
    }

    .modify-btn {
        background: #FFFFFF;
        border: 1px solid #8F2638;
        color: #8F2638;
        padding: 10px 14px;
        border-radius: 8px;
        text-decoration: none;
        font-size: 10px;
        font-weight: bold;
    }

    .modify-btn:hover {
        background: #FFF5F6;
        color: #8F2638;
    }

    .create-btn {
        background: #8F2638;
        border: 1px solid #8F2638;
        color: #FFFFFF;
        padding: 10px 14px;
        border-radius: 8px;
        text-decoration: none;
        font-size: 10px;
        font-weight: bold;
    }

    .create-btn:hover {
        background: #751D2D;
        color: #FFFFFF;
    }


    /* ================= SEARCH TAGS ================= */

    .searching-box {
        background: #FFFFFF;
        border: 1px solid #E5E7EB;
        border-radius: 15px;
        padding: 17px 20px;
        margin-bottom: 20px;
    }

    .searching-title {
        color: #6B7280;
        font-size: 10px;
        font-weight: bold;
        margin-bottom: 10px;
    }

    .search-tags {
        display: flex;
        gap: 8px;
        flex-wrap: wrap;
    }

    .search-tag {
        background: #F3EEFB;
        border: 1px solid #E3D8F2;
        color: #654B91;
        padding: 7px 11px;
        border-radius: 18px;
        font-size: 10px;
        font-weight: bold;
    }


    /* ================= MAIN GRID ================= */

    .main-layout {
        display: grid;
        grid-template-columns: 235px minmax(0, 1fr);
        gap: 20px;
        align-items: start;
    }


    /* ================= FILTER ================= */

    .filter-card {
        background: #FFFFFF;
        border: 1px solid #E5E7EB;
        border-radius: 15px;
        padding: 19px;
    }

    .filter-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 18px;
    }

    .filter-header h3 {
        margin: 0;
        color: #302d35;
        font-size: 16px;
    }

    .reset-link {
        color: #8F2638;
        text-decoration: none;
        font-size: 10px;
    }

    .reset-link:hover {
        text-decoration: underline;
    }

    .found-count {
        background: #F7F1FA;
        color: #654B91;
        border-radius: 8px;
        padding: 10px;
        font-size: 10px;
        font-weight: bold;
        text-align: center;
        margin-bottom: 18px;
    }

    .filter-section {
        border-bottom: 1px solid #EEEAF1;
        padding-bottom: 16px;
        margin-bottom: 16px;
    }

    .filter-label {
        display: block;
        color: #817B87;
        font-size: 9px;
        font-weight: bold;
        margin-bottom: 9px;
        letter-spacing: .3px;
    }

    .blood-options {
        display: flex;
        gap: 5px;
        flex-wrap: wrap;
    }

    .blood-option {
        border: 1px solid #DDD7E3;
        background: #FFFFFF;
        color: #67616D;
        padding: 6px 8px;
        border-radius: 6px;
        font-size: 9px;
    }

    .blood-option.selected {
        background: #F4DCE2;
        border-color: #B83A50;
        color: #8E253A;
        font-weight: bold;
    }

    .check-row {
        display: flex;
        align-items: center;
        gap: 8px;
        margin-bottom: 9px;
        color: #59535F;
        font-size: 10px;
    }

    .check-box {
        width: 15px;
        height: 15px;
        border: 1px solid #C9C3CF;
        border-radius: 4px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 8px;
    }

    .check-box.selected {
        background: #8F2638;
        border-color: #8F2638;
        color: #FFFFFF;
    }

    .toggle-row {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .toggle-text {
        color: #59535F;
        font-size: 10px;
    }

    .toggle {
        width: 39px;
        height: 21px;
        border-radius: 20px;
        background: #A42D43;
        position: relative;
    }

    .toggle:after {
        content: "";
        position: absolute;
        width: 15px;
        height: 15px;
        border-radius: 50%;
        background: #FFFFFF;
        right: 3px;
        top: 3px;
    }

    .apply-btn {
        width: 100%;
        height: 37px;
        background: #8F2638;
        border: 1px solid #8F2638;
        border-radius: 7px;
        color: #FFFFFF;
        font-size: 10px;
        font-weight: bold;
        cursor: pointer;
    }

    .apply-btn:hover {
        background: #751D2D;
    }


    /* ================= RIGHT CONTENT ================= */

    .content-area {
        min-width: 0;
    }

    .top-tools {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 13px;
    }

    .result-count {
        color: #716B77;
        font-size: 11px;
    }

    .sort-box {
        height: 32px;
        border: 1px solid #D1D5DB;
        background: #FFFFFF;
        border-radius: 7px;
        color: #514B57;
        padding: 0 9px;
        font-size: 10px;
    }


    /* ================= OPEN STREET MAP ================= */

    .map-card {
        background: #FFFFFF;
        border: 1px solid #E5E7EB;
        border-radius: 15px;
        padding: 17px;
        margin-bottom: 17px;
    }

    .map-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 12px;
    }

    .map-header h2 {
        margin: 0;
        color: #302d35;
        font-size: 14px;
    }

    .map-header span {
        background: #F3EEFB;
        color: #654B91;
        padding: 5px 9px;
        border-radius: 12px;
        font-size: 9px;
        font-weight: bold;
    }

    .map-box {
        width: 100%;
        height: 330px;
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
        margin-top: 9px;
    }

    .map-legend {
        color: #6B7280;
        font-size: 9px;
    }

    .expand-map {
        color: #8F2638;
        font-size: 9px;
        font-weight: bold;
        text-decoration: none;
    }

    .expand-map:hover {
        text-decoration: underline;
    }


    /* ================= DONOR CARDS ================= */

    .donor-grid {
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr));
        gap: 14px;
    }

    .donor-card {
        background: #FFFFFF;
        border: 1px solid #E5E7EB;
        border-radius: 14px;
        padding: 16px;
        position: relative;
    }

    .donor-card:hover {
        border-color: #E7A9B5;
        box-shadow: 0 3px 12px rgba(0,0,0,.05);
    }

    .match-badge {
        position: absolute;
        top: 13px;
        right: 13px;
        background: #F8E4E8;
        color: #982D42;
        border-radius: 13px;
        padding: 5px 8px;
        font-size: 8px;
        font-weight: bold;
    }

    .donor-top {
        display: flex;
        align-items: center;
        gap: 10px;
        padding-right: 70px;
    }

    .avatar {
        width: 46px;
        height: 46px;
        border-radius: 50%;
        background: #E8DEF7;
        color: #684BA2;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: bold;
        font-size: 13px;
        flex-shrink: 0;
    }

    .donor-name {
        color: #37333C;
        font-size: 13px;
        font-weight: bold;
        margin-bottom: 3px;
    }

    .verified {
        color: #25814A;
        font-size: 8px;
        font-weight: bold;
    }

    .donor-details {
        margin-top: 13px;
        color: #77717E;
        font-size: 10px;
        line-height: 1.9;
    }

    .donor-details i {
        width: 17px;
        color: #9E3347;
    }

    .availability-now {
        color: #26814A;
        font-weight: bold;
    }

    .availability-soon {
        color: #AA7B18;
        font-weight: bold;
    }

    .card-actions {
        display: flex;
        gap: 7px;
        margin-top: 13px;
    }

    .details-btn,
    .profile-btn {
        flex: 1;
        text-align: center;
        padding: 8px 5px;
        border-radius: 7px;
        font-size: 9px;
        text-decoration: none;
    }

    .details-btn {
        background: #8F2638;
        color: #FFFFFF;
    }

    .details-btn:hover {
        background: #751D2D;
        color: #FFFFFF;
    }

    .profile-btn {
        background: #FFFFFF;
        border: 1px solid #C8C1CE;
        color: #5F5866;
    }

    .profile-btn:hover {
        border-color: #8F2638;
        color: #8F2638;
    }


    /* ================= SAFETY NOTE ================= */

    .safety-note {
        margin-top: 17px;
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

    @media (max-width: 1050px) {

        .donor-grid {
            grid-template-columns: 1fr;
        }

    }

    @media (max-width: 800px) {

        .page-header-top {
            flex-direction: column;
            align-items: flex-start;
        }

        .header-actions {
            width: 100%;
        }

        .main-layout {
            grid-template-columns: 1fr;
        }

    }

    @media (max-width: 600px) {

        .results-page {
            padding: 15px;
        }

        .header-actions {
            flex-direction: column;
        }

        .header-actions a {
            text-align: center;
        }

        .top-tools {
            flex-direction: column;
            align-items: flex-start;
            gap: 10px;
        }

        .map-footer {
            flex-direction: column;
            align-items: flex-start;
            gap: 7px;
        }

    }

</style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

<div class="results-page">


    <!-- ================= PAGE HEADER ================= -->

    <div class="page-header">

        <div class="page-header-top">

            <div class="page-title">

                <h1>
                    Search Results
                </h1>

                <p>
                    Review your smart match results and connect with potential donors.
                </p>

            </div>


            <div class="header-actions">

                <a href="User_DonorSearch.aspx"
                   class="modify-btn">

                    <i class="fa-solid fa-gear"></i>
                    Modify Search

                </a>


                <a href="User_CreateRequest.aspx"
                   class="create-btn">

                    <i class="fa-solid fa-plus"></i>
                    Create Blood Request

                </a>

            </div>

        </div>

    </div>


    <!-- ================= SEARCH TAGS ================= -->

    <div class="searching-box">

        <div class="searching-title">
            ACTIVE SEARCH
        </div>


        <div class="search-tags">

            <span class="search-tag">
                <i class="fa-solid fa-droplet"></i>
                O+
            </span>

            <span class="search-tag">
                <i class="fa-solid fa-location-dot"></i>
                Ahmedabad
            </span>

            <span class="search-tag">
                <i class="fa-solid fa-ruler"></i>
                10 km
            </span>

            <span class="search-tag">
                <i class="fa-solid fa-clock"></i>
                Available Now
            </span>

            <span class="search-tag">
                <i class="fa-solid fa-circle-check"></i>
                Verified
            </span>

            <span class="search-tag">
                <i class="fa-solid fa-bolt"></i>
                Smart Matching ON
            </span>

        </div>

    </div>


    <div class="main-layout">


        <!-- ================= LEFT FILTER ================= -->

        <div class="filter-card">

            <div class="filter-header">

                <h3>
                    Filters
                </h3>

                <asp:LinkButton
                    ID="btnReset"
                    runat="server"
                    CssClass="reset-link"
                    OnClick="btnReset_Click">

                    Reset

                </asp:LinkButton>

            </div>


            <div class="found-count">
                24 Potential Donors Found
            </div>


            <!-- BLOOD GROUP -->

            <div class="filter-section">

                <span class="filter-label">
                    BLOOD GROUP
                </span>

                <div class="blood-options">

                    <span class="blood-option selected">
                        O+
                    </span>

                    <span class="blood-option">
                        O-
                    </span>

                    <span class="blood-option">
                        A+
                    </span>

                    <span class="blood-option">
                        A-
                    </span>

                </div>

            </div>


            <!-- DISTANCE -->

            <div class="filter-section">

                <span class="filter-label">
                    DISTANCE
                </span>


                <div class="check-row">

                    <span class="check-box"></span>

                    Within 5 km

                </div>


                <div class="check-row">

                    <span class="check-box selected">

                        <i class="fa-solid fa-check"></i>

                    </span>

                    Within 10 km

                </div>


                <div class="check-row">

                    <span class="check-box"></span>

                    Within 25 km

                </div>

            </div>


            <!-- AVAILABILITY -->

            <div class="filter-section">

                <span class="filter-label">
                    AVAILABILITY
                </span>


                <div class="check-row">

                    <span class="check-box selected">

                        <i class="fa-solid fa-check"></i>

                    </span>

                    Available Now

                </div>


                <div class="check-row">

                    <span class="check-box"></span>

                    Available Next 24h

                </div>

            </div>


            <!-- VERIFICATION -->

            <div class="filter-section">

                <span class="filter-label">
                    VERIFICATION STATUS
                </span>


                <div class="toggle-row">

                    <span class="toggle-text">
                        Verified Donors Only
                    </span>

                    <div class="toggle"></div>

                </div>

            </div>


            <asp:Button
                ID="btnApplyFilters"
                runat="server"
                Text="Apply Filters"
                CssClass="apply-btn"
                OnClick="btnApplyFilters_Click" />

        </div>


        <!-- ================= RIGHT CONTENT ================= -->

        <div class="content-area">


            <!-- SORT -->

            <div class="top-tools">

                <div class="result-count">

                    <strong>
                        24
                    </strong>

                    Potential Donors Found

                </div>


                <asp:DropDownList
                    ID="ddlSort"
                    runat="server"
                    CssClass="sort-box"
                    AutoPostBack="true"
                    OnSelectedIndexChanged="ddlSort_SelectedIndexChanged">

                    <asp:ListItem
                        Text="Sort By: Best Match"
                        Value="Best">
                    </asp:ListItem>

                    <asp:ListItem
                        Text="Nearest First"
                        Value="Nearest">
                    </asp:ListItem>

                    <asp:ListItem
                        Text="Availability"
                        Value="Availability">
                    </asp:ListItem>

                </asp:DropDownList>

            </div>


            <!-- ================= OPENSTREETMAP ================= -->

            <div class="map-card">

                <div class="map-header">

                    <h2>
                        📍 Donor Locations
                    </h2>

                    <span>
                        AHMEDABAD · 10 KM
                    </span>

                </div>


                <div class="map-box">

                    <iframe
                        src="https://www.openstreetmap.org/export/embed.html?bbox=72.52%2C22.97%2C72.64%2C23.08&amp;layer=mapnik&amp;marker=23.0225%2C72.5714"
                        loading="lazy">
                    </iframe>

                </div>


                <div class="map-footer">

                    <span class="map-legend">
                        📍 Showing donor search area around Ahmedabad
                    </span>


                    <a href="https://www.openstreetmap.org/"
                       target="_blank"
                       class="expand-map">

                        Expand Map ↗

                    </a>

                </div>

            </div>


            <!-- ================= DONOR GRID ================= -->

            <div class="donor-grid">


                <!-- ANANYA PATEL -->

                <div class="donor-card">

                    <span class="match-badge">
                        98% MATCH
                    </span>


                    <div class="donor-top">

                        <div class="avatar">
                            AP
                        </div>


                        <div>

                            <div class="donor-name">
                                Ananya Patel
                            </div>

                            <div class="verified">

                                <i class="fa-solid fa-circle-check"></i>

                                Verified Donor

                            </div>

                        </div>

                    </div>


                    <div class="donor-details">

                        <div>

                            <i class="fa-solid fa-droplet"></i>

                            O+

                        </div>


                        <div class="availability-now">

                            <i class="fa-solid fa-circle"></i>

                            Available Now

                        </div>


                        <div>

                            <i class="fa-solid fa-location-dot"></i>

                            Navrangpura, Ahmedabad

                        </div>


                        <div>

                            <i class="fa-solid fa-ruler-horizontal"></i>

                            2.4 km away

                        </div>

                    </div>


                    <div class="card-actions">

                        <a href="User_DonorProfile.aspx"
                           class="details-btn">

                            View Details

                        </a>


                        <a href="User_DonorProfile.aspx"
                           class="profile-btn">

                            View Profile

                        </a>

                    </div>

                </div>


                <!-- ARJUN MEHTA -->

                <div class="donor-card">

                    <span class="match-badge">
                        94% MATCH
                    </span>


                    <div class="donor-top">

                        <div class="avatar">
                            AM
                        </div>


                        <div>

                            <div class="donor-name">
                                Arjun Mehta
                            </div>

                            <div class="verified">

                                <i class="fa-solid fa-circle-check"></i>

                                Verified Donor

                            </div>

                        </div>

                    </div>


                    <div class="donor-details">

                        <div>

                            <i class="fa-solid fa-droplet"></i>

                            O+

                        </div>


                        <div class="availability-soon">

                            <i class="fa-solid fa-circle"></i>

                            Available Soon

                        </div>


                        <div>

                            <i class="fa-solid fa-location-dot"></i>

                            Satellite, Ahmedabad

                        </div>


                        <div>

                            <i class="fa-solid fa-ruler-horizontal"></i>

                            4.1 km away

                        </div>

                    </div>


                    <div class="card-actions">

                        <a href="User_DonorProfile.aspx"
                           class="details-btn">

                            View Details

                        </a>


                        <a href="User_DonorProfile.aspx"
                           class="profile-btn">

                            View Profile

                        </a>

                    </div>

                </div>


                <!-- KAVYA VERMA -->

                <div class="donor-card">

                    <span class="match-badge">
                        88% MATCH
                    </span>


                    <div class="donor-top">

                        <div class="avatar">
                            KV
                        </div>


                        <div>

                            <div class="donor-name">
                                Kavya Verma
                            </div>

                            <div class="verified">

                                <i class="fa-solid fa-circle-check"></i>

                                Verified Donor

                            </div>

                        </div>

                    </div>


                    <div class="donor-details">

                        <div>

                            <i class="fa-solid fa-droplet"></i>

                            O+

                        </div>


                        <div class="availability-now">

                            <i class="fa-solid fa-circle"></i>

                            Available Now

                        </div>


                        <div>

                            <i class="fa-solid fa-location-dot"></i>

                            Bopal, Ahmedabad

                        </div>


                        <div>

                            <i class="fa-solid fa-ruler-horizontal"></i>

                            7.8 km away

                        </div>

                    </div>


                    <div class="card-actions">

                        <a href="User_DonorProfile.aspx"
                           class="details-btn">

                            View Details

                        </a>


                        <a href="User_DonorProfile.aspx"
                           class="profile-btn">

                            View Profile

                        </a>

                    </div>

                </div>


                <!-- VIKRAM SINGH -->

                <div class="donor-card">

                    <span class="match-badge">
                        85% MATCH
                    </span>


                    <div class="donor-top">

                        <div class="avatar">
                            VS
                        </div>


                        <div>

                            <div class="donor-name">
                                Vikram Singh
                            </div>

                            <div class="verified">

                                <i class="fa-solid fa-circle-check"></i>

                                Verified Donor

                            </div>

                        </div>

                    </div>


                    <div class="donor-details">

                        <div>

                            <i class="fa-solid fa-droplet"></i>

                            O+

                        </div>


                        <div class="availability-now">

                            <i class="fa-solid fa-circle"></i>

                            Available Now

                        </div>


                        <div>

                            <i class="fa-solid fa-location-dot"></i>

                            SG Highway, Ahmedabad

                        </div>


                        <div>

                            <i class="fa-solid fa-ruler-horizontal"></i>

                            8.2 km away

                        </div>

                    </div>


                    <div class="card-actions">

                        <a href="User_DonorProfile.aspx"
                           class="details-btn">

                            View Details

                        </a>


                        <a href="User_DonorProfile.aspx"
                           class="profile-btn">

                            View Profile

                        </a>

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

                    Potential Donors listed are based on your search criteria.
                    Donor availability may change in real-time, and a match does
                    not guarantee an immediate response or successful donation.
                    Always coordinate securely through the platform.

                </div>

            </div>

        </div>

    </div>

</div>

</asp:Content>
