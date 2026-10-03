<%@ Page Title="Emergency Request Details" Language="C#" MasterPageFile="~/Donor.Master"
    AutoEventWireup="true"
    CodeBehind="EmergencyDetails.aspx.cs"
    Inherits="WebApplication1.EmergencyDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>

    .emergency-details-page {
        width: 100%;
    }

    /* ================= HERO ================= */

    .hero-card {
        background: #FFFFFF;
        border: 1px solid #E5E7EB;
        border-radius: 16px;
        padding: 24px;
        margin-bottom: 20px;
    }

    .hero-top {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
        gap: 20px;
    }

    .hero-left {
        flex: 1;
    }

    .badge-row {
        display: flex;
        gap: 8px;
        align-items: center;
        margin-bottom: 13px;
        flex-wrap: wrap;
    }

    .urgent-badge {
        background: #D80032;
        color: #FFFFFF;
        padding: 7px 13px;
        border-radius: 20px;
        font-size: 10px;
        font-weight: bold;
    }

    .active-badge {
        background: #DCFCE7;
        color: #15803D;
        padding: 7px 13px;
        border-radius: 20px;
        font-size: 10px;
        font-weight: bold;
    }

    .requested-time {
        color: #9CA3AF;
        font-size: 11px;
    }

    .hero-left h1 {
        margin: 0 0 8px 0;
        color: #202338;
        font-size: 27px;
    }

    .hero-left p {
        margin: 0;
        color: #6B7280;
        font-size: 13px;
    }

    .back-btn {
        text-decoration: none;
        border: 1px solid #D1D5DB;
        background: #FFFFFF;
        color: #374151;
        padding: 10px 16px;
        border-radius: 8px;
        font-size: 12px;
        font-weight: bold;
    }

    .back-btn:hover {
        border-color: #D80032;
        color: #D80032;
    }


    /* ================= METRICS ================= */

    .metrics-grid {
        display: grid;
        grid-template-columns: repeat(5, 1fr);
        gap: 12px;
        margin-top: 22px;
    }

    .metric-card {
        border: 1px solid #E5E7EB;
        background: #FFFFFF;
        border-radius: 12px;
        padding: 15px;
        min-height: 100px;
    }

    .metric-title {
        color: #9CA3AF;
        font-size: 9px;
        font-weight: bold;
        margin-bottom: 10px;
        text-transform: uppercase;
    }

    .metric-content {
        display: flex;
        align-items: center;
        gap: 9px;
    }

    .blood-circle {
        width: 38px;
        height: 38px;
        border-radius: 50%;
        background: #FFF0F3;
        color: #D80032;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: bold;
        font-size: 13px;
        flex-shrink: 0;
    }

    .metric-value {
        color: #202338;
        font-size: 15px;
        font-weight: bold;
    }

    .metric-sub {
        color: #9CA3AF;
        font-size: 10px;
        margin-top: 3px;
    }

    .critical-text {
        color: #B91C1C;
    }


    /* ================= MIDDLE GRID ================= */

    .middle-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 20px;
        margin-bottom: 20px;
    }

    .info-card {
        background: #FFFFFF;
        border: 1px solid #E5E7EB;
        border-radius: 15px;
        padding: 21px;
    }

    .card-heading {
        display: flex;
        align-items: center;
        gap: 9px;
        margin-bottom: 19px;
        padding-bottom: 13px;
        border-bottom: 1px solid #EEEEEE;
    }

    .card-heading-icon {
        width: 32px;
        height: 32px;
        border-radius: 8px;
        background: #FFF0F3;
        color: #D80032;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .card-heading h2 {
        margin: 0;
        color: #202338;
        font-size: 15px;
    }

    .info-row {
        display: flex;
        justify-content: space-between;
        gap: 15px;
        padding: 9px 0;
    }

    .info-label {
        color: #9CA3AF;
        font-size: 11px;
    }

    .info-value {
        color: #374151;
        font-size: 12px;
        font-weight: bold;
        text-align: right;
    }

    .red-value {
        color: #D80032;
    }

    .priority-value {
        color: #B91C1C;
    }


    /* ================= HOSPITAL + MAP ================= */

    .location-map-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 20px;
        margin-bottom: 20px;
    }

    .hospital-name {
        display: flex;
        align-items: center;
        gap: 10px;
        margin-bottom: 16px;
    }

    .hospital-icon {
        width: 43px;
        height: 43px;
        background: #FFF0F3;
        color: #D80032;
        border-radius: 10px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 21px;
    }

    .hospital-name h3 {
        margin: 0 0 3px 0;
        color: #202338;
        font-size: 15px;
    }

    .hospital-name span {
        color: #9CA3AF;
        font-size: 10px;
    }

    .hospital-detail {
        display: flex;
        align-items: center;
        gap: 8px;
        color: #4B5563;
        font-size: 12px;
        margin: 12px 0;
    }

    .distance-box {
        background: #EEF4FF;
        border-radius: 9px;
        padding: 11px 13px;
        margin-top: 15px;
        color: #3B62F6;
        font-size: 12px;
        font-weight: bold;
    }

    .direction-btn {
        display: inline-block;
        margin-top: 15px;
        background: #3B62F6;
        color: #FFFFFF;
        text-decoration: none;
        padding: 10px 17px;
        border-radius: 7px;
        font-size: 11px;
        font-weight: bold;
    }

    .direction-btn:hover {
        background: #294DD1;
    }


    /* ================= MAP ================= */

    .map-card {
        background: #FFFFFF;
        border: 1px solid #E5E7EB;
        border-radius: 15px;
        padding: 20px;
    }

    .map-title {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 13px;
    }

    .map-title h2 {
        margin: 0;
        color: #202338;
        font-size: 15px;
    }

    .map-distance {
        background: #EEF4FF;
        color: #3B62F6;
        padding: 6px 10px;
        border-radius: 15px;
        font-size: 10px;
        font-weight: bold;
    }

    .small-map-box {
        width: 100%;
        height: 220px;
        border-radius: 11px;
        overflow: hidden;
        border: 1px solid #E5E7EB;
        background: #F3F4F6;
    }

    .small-map-box iframe {
        width: 100%;
        height: 100%;
        border: 0;
        display: block;
    }

    .maps-btn {
        display: inline-block;
        margin-top: 12px;
        background: #FFFFFF;
        color: #3B62F6;
        border: 1px solid #D1D5DB;
        padding: 9px 14px;
        border-radius: 7px;
        text-decoration: none;
        font-size: 11px;
        font-weight: bold;
    }

    .maps-btn:hover {
        border-color: #3B62F6;
    }


    /* ================= ROUTE INFO ================= */

    .route-info {
        display: flex;
        gap: 10px;
        margin-top: 13px;
        flex-wrap: wrap;
    }

    .route-box {
        background: #F8F9FA;
        border-radius: 8px;
        padding: 9px 12px;
        font-size: 10px;
        color: #6B7280;
    }

    .route-box strong {
        color: #374151;
        margin-left: 3px;
    }


    /* ================= URGENT ================= */

    .urgent-info-card {
        background: #FFF4F5;
        border: 1px solid #FFD8DE;
        border-radius: 15px;
        padding: 20px;
        margin-bottom: 20px;
    }

    .urgent-heading {
        display: flex;
        align-items: center;
        gap: 9px;
        margin-bottom: 12px;
    }

    .urgent-heading h2 {
        margin: 0;
        color: #B00029;
        font-size: 15px;
    }

    .urgent-message {
        color: #6B4B50;
        font-size: 12px;
        line-height: 1.7;
        margin: 0 0 16px 0;
    }

    .mini-summary {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 10px;
    }

    .mini-box {
        background: #FFFFFF;
        border: 1px solid #F5D9DE;
        border-radius: 9px;
        padding: 11px;
    }

    .mini-box span {
        display: block;
        color: #9CA3AF;
        font-size: 9px;
        margin-bottom: 5px;
    }

    .mini-box strong {
        color: #374151;
        font-size: 11px;
    }

    .mini-box .red {
        color: #D80032;
    }


    /* ================= BOTTOM ================= */

    .bottom-grid {
        display: grid;
        grid-template-columns: 1fr 1.1fr;
        gap: 20px;
    }

    .compatibility-card {
        background: #FFFFFF;
        border: 1px solid #E5E7EB;
        border-radius: 15px;
        padding: 21px;
    }

    .compatibility-card h2 {
        margin: 0 0 20px 0;
        color: #202338;
        font-size: 15px;
    }

    .match-row {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 15px;
        margin: 15px 0 20px 0;
    }

    .group-person {
        text-align: center;
    }

    .group-circle {
        width: 55px;
        height: 55px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: bold;
        font-size: 15px;
        margin: auto;
    }

    .your-group {
        background: #FFFFFF;
        border: 2px solid #D1D5DB;
        color: #374151;
    }

    .required-group {
        background: #FFF0F3;
        border: 2px solid #FFD1D8;
        color: #D80032;
    }

    .group-label {
        color: #9CA3AF;
        font-size: 10px;
        margin-top: 6px;
    }

    .match-pill {
        background: #DCFCE7;
        color: #15803D;
        border-radius: 20px;
        padding: 9px 15px;
        font-size: 10px;
        font-weight: bold;
    }

    .compatible-box {
        background: #F0FDF4;
        border: 1px solid #BBF7D0;
        border-radius: 9px;
        padding: 12px;
        color: #15803D;
        font-size: 11px;
        text-align: center;
        line-height: 1.5;
    }


    /* ================= CTA ================= */

    .cta-card {
        background: #FFFFFF;
        border: 1px solid #E5E7EB;
        border-radius: 15px;
        padding: 21px;
    }

    .cta-icon {
        width: 45px;
        height: 45px;
        background: #FFF0F3;
        color: #D80032;
        border-radius: 11px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 21px;
        margin-bottom: 12px;
    }

    .cta-card h2 {
        margin: 0 0 7px 0;
        color: #202338;
        font-size: 18px;
    }

    .cta-card p {
        margin: 0 0 17px 0;
        color: #6B7280;
        font-size: 12px;
        line-height: 1.6;
    }

    .cta-buttons {
        display: flex;
        gap: 10px;
        flex-wrap: wrap;
    }

    .respond-btn {
        border: none;
        background: #D80032;
        color: #FFFFFF;
        padding: 11px 20px;
        border-radius: 7px;
        font-size: 12px;
        font-weight: bold;
        cursor: pointer;
    }

    .respond-btn:hover {
        background: #B00029;
    }

    .not-available-btn {
        border: 1px solid #D1D5DB;
        background: #FFFFFF;
        color: #6B7280;
        padding: 10px 18px;
        border-radius: 7px;
        font-size: 12px;
        font-weight: bold;
        cursor: pointer;
    }

    .not-available-btn:hover {
        border-color: #9CA3AF;
    }

    .message-label {
        display: block;
        margin-top: 12px;
        color: #15803D;
        font-size: 12px;
        font-weight: bold;
    }


    /* ================= RESPONSIVE ================= */

    @media (max-width: 1100px) {

        .metrics-grid {
            grid-template-columns: repeat(3, 1fr);
        }

        .middle-grid,
        .bottom-grid,
        .location-map-grid {
            grid-template-columns: 1fr;
        }
    }

    @media (max-width: 700px) {

        .hero-top {
            flex-direction: column;
        }

        .metrics-grid {
            grid-template-columns: repeat(2, 1fr);
        }

        .mini-summary {
            grid-template-columns: 1fr;
        }

        .match-row {
            gap: 8px;
        }

        .small-map-box {
            height: 250px;
        }
    }

    @media (max-width: 500px) {

        .metrics-grid {
            grid-template-columns: 1fr;
        }

        .hero-left h1 {
            font-size: 22px;
        }

        .small-map-box {
            height: 230px;
        }
    }

</style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="emergency-details-page">


    <!-- ================= HERO ================= -->

    <div class="hero-card">

        <div class="hero-top">

            <div class="hero-left">

                <div class="badge-row">

                    <span class="urgent-badge">
                        URGENT REQUEST
                    </span>

                    <span class="active-badge">
                        ACTIVE
                    </span>

                    <span class="requested-time">
                        Requested 25 minutes ago
                    </span>

                </div>

                <h1>
                    Emergency Blood Requirement
                </h1>

                <p>
                    Immediate blood support is required for a patient at City Care Hospital.
                </p>

            </div>

            <a href="NearbyEmergency.aspx"
               class="back-btn">
                ← Back to Nearby Requests
            </a>

        </div>


        <!-- ================= METRICS ================= -->

        <div class="metrics-grid">

            <div class="metric-card">

                <div class="metric-title">
                    Blood Group Required
                </div>

                <div class="metric-content">

                    <div class="blood-circle">
                        O+
                    </div>

                    <div>

                        <div class="metric-value">
                            O+
                        </div>

                        <div class="metric-sub">
                            URGENT
                        </div>

                    </div>

                </div>

            </div>


            <div class="metric-card">

                <div class="metric-title">
                    Units Required
                </div>

                <div class="metric-value">
                    2 Units
                </div>

            </div>


            <div class="metric-card">

                <div class="metric-title">
                    Patient Status
                </div>

                <div class="metric-value critical-text">
                    Critical
                </div>

            </div>


            <div class="metric-card">

                <div class="metric-title">
                    Required By
                </div>

                <div class="metric-value">
                    Today
                </div>

                <div class="metric-sub">
                    04:00 PM
                </div>

            </div>


            <div class="metric-card">

                <div class="metric-title">
                    Distance
                </div>

                <div class="metric-value">
                    3.2 km
                </div>

                <div class="metric-sub">
                    away
                </div>

            </div>

        </div>

    </div>


    <!-- ================= REQUEST + HOSPITAL ================= -->

    <div class="middle-grid">


        <!-- REQUEST INFORMATION -->

        <div class="info-card">

            <div class="card-heading">

                <div class="card-heading-icon">
                    ℹ
                </div>

                <h2>
                    Request Information
                </h2>

            </div>


            <div class="info-row">
                <span class="info-label">Request ID</span>
                <span class="info-value">BR-2026-08421</span>
            </div>


            <div class="info-row">
                <span class="info-label">Blood Group</span>
                <span class="info-value red-value">O+</span>
            </div>


            <div class="info-row">
                <span class="info-label">Units</span>
                <span class="info-value">2</span>
            </div>


            <div class="info-row">
                <span class="info-label">Type</span>
                <span class="info-value">Emergency</span>
            </div>


            <div class="info-row">
                <span class="info-label">Priority</span>
                <span class="info-value priority-value">Critical</span>
            </div>


            <div class="info-row">
                <span class="info-label">Requested On</span>
                <span class="info-value">
                    15 Aug 2026, 10:35 AM
                </span>
            </div>


            <div class="info-row">
                <span class="info-label">Required By</span>
                <span class="info-value">
                    15 Aug 2026, 04:00 PM
                </span>
            </div>

        </div>


        <!-- HOSPITAL INFORMATION -->

        <div class="info-card">

            <div class="card-heading">

                <div class="card-heading-icon">
                    ✚
                </div>

                <h2>
                    Hospital Information
                </h2>

            </div>


            <div class="hospital-name">

                <div class="hospital-icon">
                    ✚
                </div>

                <div>

                    <h3>
                        City Care Hospital
                    </h3>

                    <span>
                        Emergency Blood Request
                    </span>

                </div>

            </div>


            <div class="hospital-detail">
                📍 120 Health Avenue, Ahmedabad
            </div>


            <div class="hospital-detail">
                📞 +91 79 4000 1234
            </div>


            <div class="distance-box">
                🚘 Distance: 3.2 km away
            </div>


            <a href="#"
               class="direction-btn">
                Get Directions
            </a>

        </div>

    </div>


    <!-- ================= HOSPITAL LOCATION + SMALL MAP ================= -->

    <div class="location-map-grid">


        <!-- LOCATION DETAILS -->

        <div class="info-card">

            <div class="card-heading">

                <div class="card-heading-icon">
                    📍
                </div>

                <h2>
                    Hospital Location
                </h2>

            </div>


            <div class="hospital-name">

                <div class="hospital-icon">
                    ✚
                </div>

                <div>

                    <h3>
                        City Care Hospital
                    </h3>

                    <span>
                        Emergency Blood Request
                    </span>

                </div>

            </div>


            <div class="hospital-detail">
                📍 120 Health Avenue, Ahmedabad
            </div>


            <div class="hospital-detail">
                📞 +91 79 4000 1234
            </div>


            <div class="distance-box">
                🚘 3.2 km away
            </div>


            <div class="route-info">

                <div class="route-box">
                    📏 <strong>3.2 km</strong>
                </div>

                <div class="route-box">
                    ⏱️ <strong>Approx. 12 min</strong>
                </div>

            </div>


            <a href="#"
               class="direction-btn">
                Get Directions
            </a>

        </div>


        <!-- SMALL MAP -->

        <div class="map-card">

            <div class="map-title">

                <h2>
                    📍 Map
                </h2>

                <span class="map-distance">
                    3.2 km
                </span>

            </div>


            <div class="small-map-box">

                <iframe
                    src="https://www.openstreetmap.org/export/embed.html?bbox=70.75%2C22.25%2C70.85%2C22.35&amp;layer=mapnik"
                    width="100%"
                    height="100%"
                    loading="lazy">
                </iframe>

            </div>


            <a href="#"
               class="maps-btn">
                🗺 Open in Maps
            </a>

        </div>

    </div>


    <!-- ================= WHY URGENT ================= -->

    <div class="urgent-info-card">

        <div class="urgent-heading">

            <span>
                ⚠️
            </span>

            <h2>
                Why This Request Is Urgent
            </h2>

        </div>


        <p class="urgent-message">

            This is a life-saving request. The patient is currently in a critical
            state and requires immediate transfusion to stabilize. Your quick
            response can make a significant difference.

        </p>


        <div class="mini-summary">


            <div class="mini-box">

                <span>
                    🩸 Blood Required
                </span>

                <strong>
                    2 Units
                </strong>

            </div>


            <div class="mini-box">

                <span>
                    ⏰ Required By
                </span>

                <strong>
                    Today, 04:00 PM
                </strong>

            </div>


            <div class="mini-box">

                <span>
                    ❗ Priority
                </span>

                <strong class="red">
                    Critical
                </strong>

            </div>

        </div>

    </div>


    <!-- ================= BOTTOM ================= -->

    <div class="bottom-grid">


        <!-- COMPATIBILITY -->

        <div class="compatibility-card">

            <h2>
                Your Compatibility
            </h2>


            <div class="match-row">


                <div class="group-person">

                    <div class="group-circle your-group">
                        O+
                    </div>

                    <div class="group-label">
                        You
                    </div>

                </div>


                <div class="match-pill">
                    ✓ MATCH
                </div>


                <div class="group-person">

                    <div class="group-circle required-group">
                        O+
                    </div>

                    <div class="group-label">
                        Required
                    </div>

                </div>

            </div>


            <div class="compatible-box">

                ✓ <strong>Compatible</strong><br />

                Subject to final confirmation by medical staff.

            </div>

        </div>


        <!-- CTA -->

        <div class="cta-card">

         


            <h2>
                🩸Can You Help?
            </h2>


            <p>
                Your blood group matches the requirement.
                Please respond quickly if you are available to donate.
            </p>


            <div class="cta-buttons">

                <asp:Button
                    ID="btnRespond"
                    runat="server"
                    Text="✓ Respond to Request"
                    CssClass="respond-btn"
                    OnClick="btnRespond_Click" />


                <asp:Button
                    ID="btnNotAvailable"
                    runat="server"
                    Text="✕ Not Available"
                    CssClass="not-available-btn"
                    OnClick="btnNotAvailable_Click" />

            </div>


            <asp:Label
                ID="lblMessage"
                runat="server"
                CssClass="message-label">
            </asp:Label>

        </div>

    </div>

</div>

</asp:Content>