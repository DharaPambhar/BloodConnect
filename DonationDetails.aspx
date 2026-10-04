<%@ Page Title="Donation Details" Language="C#" MasterPageFile="~/Donor.Master"
    AutoEventWireup="true"
    CodeBehind="DonationDetails.aspx.cs"
    Inherits="WebApplication1.DonationDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        .details-page {
            padding: 5px 0 30px 0;
        }

        /* PAGE HEADER */

        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 20px;
            margin-bottom: 22px;
        }

        .page-title-main {
            font-size: 27px;
            font-weight: 700;
            color: #202338;
            margin: 0 0 6px 0;
        }

        .page-subtitle {
            margin: 0;
            color: #6B7280;
            font-size: 14px;
        }

        .header-actions {
            display: flex;
            gap: 9px;
            align-items: center;
        }

        .outline-btn {
            background: white;
            color: #D80032;
            border: 1px solid #D80032;
            border-radius: 7px;
            padding: 10px 15px;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
        }

        .outline-btn:hover {
            background: #FFF0F3;
        }

        .blue-btn {
            background: #2563EB;
            color: white;
            border: 1px solid #2563EB;
            border-radius: 7px;
            padding: 10px 15px;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
        }

        .blue-btn:hover {
            background: #1D4ED8;
        }

        .status-row {
            margin-top: 10px;
        }

        .completed-status {
            display: inline-block;
            background: #D1FAE5;
            color: #15803D;
            padding: 6px 11px;
            border-radius: 16px;
            font-size: 11px;
            font-weight: 700;
        }


        /* THANK YOU + IMPACT */

        .top-grid {
            display: grid;
            grid-template-columns: 1.6fr 0.8fr;
            gap: 20px;
            margin-bottom: 20px;
        }

        .thank-card {
            background: white;
            border: 1px solid #E5E7EB;
            border-radius: 12px;
            padding: 23px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.03);
        }

        .thank-content {
            display: flex;
            align-items: flex-start;
            gap: 17px;
        }

        .drop-icon {
            width: 52px;
            height: 52px;
            border-radius: 12px;
            background: #F8E7EC;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 26px;
            flex-shrink: 0;
        }

        .thank-title {
            font-size: 21px;
            font-weight: 700;
            color: #202338;
            margin-bottom: 6px;
        }

        .thank-text {
            font-size: 13px;
            color: #6B7280;
            line-height: 1.6;
            margin-bottom: 17px;
        }

        .thank-details {
            display: flex;
            flex-wrap: wrap;
            gap: 25px;
        }

        .mini-label {
            color: #9CA3AF;
            font-size: 10px;
            font-weight: 700;
            text-transform: uppercase;
            margin-bottom: 4px;
        }

        .mini-value {
            color: #202338;
            font-size: 13px;
            font-weight: 600;
        }


        /* IMPACT */

        .impact-card {
            background: white;
            border: 1px solid #E5E7EB;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0,0,0,0.03);
        }

        .impact-header {
            background: #D80032;
            color: white;
            padding: 15px 18px;
            font-size: 16px;
            font-weight: 700;
        }

        .impact-body {
            padding: 15px;
        }

        .impact-metric {
            display: flex;
            align-items: center;
            gap: 11px;
            padding: 10px 5px;
            border-bottom: 1px solid #F0F1F3;
        }

        .impact-metric:last-child {
            border-bottom: none;
        }

        .impact-icon {
            width: 35px;
            height: 35px;
            border-radius: 8px;
            background: #F8E7EC;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .impact-number {
            font-size: 14px;
            font-weight: 700;
            color: #202338;
        }

        .impact-description {
            font-size: 10px;
            color: #6B7280;
            margin-top: 2px;
        }


        /* INFORMATION GRID */

        .info-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 20px;
        }

        .card {
            background: white;
            border: 1px solid #E5E7EB;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.03);
        }

        .card-title {
            font-size: 16px;
            font-weight: 700;
            color: #202338;
            margin: 0 0 18px 0;
        }

        .detail-list {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px 20px;
        }

        .detail-item {
            border-bottom: 1px solid #F0F1F3;
            padding-bottom: 11px;
        }

        .detail-label {
            color: #9CA3AF;
            font-size: 10px;
            font-weight: 700;
            text-transform: uppercase;
            margin-bottom: 5px;
        }

        .detail-value {
            color: #374151;
            font-size: 13px;
            font-weight: 600;
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


        /* CAMP LOCATION */

        .camp-name {
            font-size: 18px;
            font-weight: 700;
            color: #202338;
            margin-bottom: 7px;
        }

        .organized {
            color: #6B7280;
            font-size: 12px;
            margin-bottom: 18px;
        }

        .address {
            background: #F9FAFB;
            border-radius: 8px;
            padding: 13px;
            color: #4B5563;
            font-size: 12px;
            line-height: 1.6;
            margin-bottom: 15px;
        }

        .camp-actions {
            display: flex;
            gap: 9px;
        }

        .direction-btn {
            background: #2563EB;
            color: white;
            border: none;
            border-radius: 7px;
            padding: 9px 14px;
            font-size: 12px;
            font-weight: 600;
            text-decoration: none;
        }

        .direction-btn:hover {
            background: #1D4ED8;
        }

        .contact-btn {
            background: white;
            color: #D80032;
            border: 1px solid #D80032;
            border-radius: 7px;
            padding: 9px 14px;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
        }

        .contact-btn:hover {
            background: #FFF0F3;
        }


        /* TIMELINE + DOCUMENTS SAME ROW */

        .timeline-document-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 20px;
            align-items: start;
        }

        .timeline-card {
            min-height: 100%;
        }

        .timeline {
            position: relative;
            margin-top: 5px;
        }

        .timeline-item {
            display: flex;
            align-items: center;
            min-height: 55px;
            position: relative;
        }

        .timeline-line {
            position: absolute;
            left: 8px;
            top: 18px;
            bottom: -18px;
            width: 2px;
            background: #D1FAE5;
        }

        .timeline-item:last-child .timeline-line {
            display: none;
        }

        .timeline-dot {
            width: 17px;
            height: 17px;
            border-radius: 50%;
            background: #10B981;
            border: 3px solid #D1FAE5;
            z-index: 2;
            flex-shrink: 0;
        }

        .timeline-dot.completed {
            background: #D80032;
            border-color: #F8E7EC;
        }

        .timeline-content {
            margin-left: 15px;
        }

        .timeline-time {
            color: #202338;
            font-size: 12px;
            font-weight: 700;
        }

        .timeline-text {
            color: #6B7280;
            font-size: 11px;
            margin-top: 2px;
        }


        /* DOCUMENTS */

        .documents-column {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .document-card {
            background: white;
            border: 1px solid #E5E7EB;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.03);
        }

        .document-icon {
            width: 46px;
            height: 46px;
            border-radius: 10px;
            background: #F8E7EC;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 22px;
            margin-bottom: 12px;
        }

        .document-title {
            font-size: 16px;
            font-weight: 700;
            color: #202338;
            margin-bottom: 7px;
        }

        .document-text {
            color: #6B7280;
            font-size: 12px;
            line-height: 1.5;
            margin-bottom: 15px;
        }

        .document-actions {
            display: flex;
            gap: 9px;
            flex-wrap: wrap;
        }

        .red-small-btn {
            background: #D80032;
            color: white;
            border: 1px solid #D80032;
            border-radius: 7px;
            padding: 9px 13px;
            font-size: 11px;
            font-weight: 600;
            cursor: pointer;
        }

        .red-small-btn:hover {
            background: #B8002A;
        }

        .receipt-info {
            margin-bottom: 15px;
        }

        .receipt-row {
            display: flex;
            justify-content: space-between;
            gap: 15px;
            padding: 9px 0;
            border-bottom: 1px solid #F0F1F3;
            font-size: 12px;
        }

        .receipt-row span:first-child {
            color: #9CA3AF;
        }

        .receipt-row span:last-child {
            color: #374151;
            font-weight: 600;
            text-align: right;
        }


        /* NEXT STEPS */

        .next-title {
            font-size: 17px;
            font-weight: 700;
            color: #202338;
            margin-bottom: 13px;
        }

        .next-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 15px;
            margin-bottom: 22px;
        }

        .next-card {
            background: white;
            border: 1px solid #E5E7EB;
            border-radius: 10px;
            padding: 17px;
            text-decoration: none;
            display: block;
            transition: .2s;
        }

        .next-card:hover {
            border-color: #D80032;
            transform: translateY(-2px);
        }

        .next-icon {
            font-size: 22px;
            margin-bottom: 10px;
        }

        .next-card-title {
            color: #202338;
            font-size: 13px;
            font-weight: 700;
            margin-bottom: 5px;
        }

        .next-card-text {
            color: #6B7280;
            font-size: 11px;
        }


        /* BACK LINK */

        .back-link {
            color: #2563EB;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
        }

        .back-link:hover {
            text-decoration: underline;
        }


        /* MESSAGE */

        .message-label {
            display: block;
            margin-top: 12px;
            margin-bottom: 12px;
            color: #15803D;
            font-size: 12px;
        }


        /* RESPONSIVE */

        @media (max-width: 1050px) {

            .top-grid {
                grid-template-columns: 1fr;
            }

            .info-grid {
                grid-template-columns: 1fr;
            }

            .timeline-document-grid {
                grid-template-columns: 1fr;
            }

        }


        @media (max-width: 750px) {

            .page-header {
                flex-direction: column;
            }

            .header-actions {
                flex-wrap: wrap;
            }

            .detail-list {
                grid-template-columns: 1fr;
            }

            .next-grid {
                grid-template-columns: 1fr;
            }

        }


        @media (max-width: 550px) {

            .thank-content {
                flex-direction: column;
            }

            .thank-details {
                flex-direction: column;
                gap: 12px;
            }

            .camp-actions,
            .document-actions {
                flex-wrap: wrap;
            }

            .receipt-row {
                flex-direction: column;
                gap: 4px;
            }

            .receipt-row span:last-child {
                text-align: left;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="details-page">


        <!-- PAGE HEADER -->

        <div class="page-header">

            <div>

                <h1 class="page-title-main">
                    Donation Details
                </h1>

                <p class="page-subtitle">
                    View complete information about your blood donation.
                </p>

                <div class="status-row">

                    <span class="completed-status">
                        🎯 COMPLETED · 12 June 2026
                    </span>

                </div>

            </div>


            <div class="header-actions">

                <asp:Button
                    ID="btnCertificateTop"
                    runat="server"
                    Text="Download Certificate"
                    CssClass="outline-btn"
                    OnClick="btnCertificateTop_Click" />

                <asp:Button
                    ID="btnReceiptTop"
                    runat="server"
                    Text="Download Receipt"
                    CssClass="blue-btn"
                    OnClick="btnReceiptTop_Click" />

            </div>

        </div>


        <!-- THANK YOU + IMPACT -->

        <div class="top-grid">


            <!-- THANK YOU -->

            <div class="thank-card">

                <div class="thank-content">

                    <div class="drop-icon">
                        🩸
                    </div>

                    <div>

                        <div class="thank-title">
                            Thank You for Donating!
                        </div>

                        <div class="thank-text">
                            Your contribution helps support patients and communities in need.
                            Every drop counts.
                        </div>

                        <div class="thank-details">

                            <div>

                                <div class="mini-label">
                                    Status
                                </div>

                                <div class="mini-value">
                                    Completed
                                </div>

                            </div>

                            <div>

                                <div class="mini-label">
                                    Date
                                </div>

                                <div class="mini-value">
                                    12 June 2026
                                </div>

                            </div>

                            <div>

                                <div class="mini-label">
                                    Donation ID
                                </div>

                                <div class="mini-value">
                                    DN-2026-00821
                                </div>

                            </div>

                        </div>

                    </div>

                </div>

            </div>


            <!-- IMPACT -->

            <div class="impact-card">

                <div class="impact-header">
                    Your Impact
                </div>

                <div class="impact-body">

                    <div class="impact-metric">

                        <div class="impact-icon">
                            🩷
                        </div>

                        <div>

                            <div class="impact-number">
                                8 Total
                            </div>

                            <div class="impact-description">
                                Lifetime Donations
                            </div>

                        </div>

                    </div>


                    <div class="impact-metric">

                        <div class="impact-icon">
                            📅
                        </div>

                        <div>

                            <div class="impact-number">
                                3 This Year
                            </div>

                            <div class="impact-description">
                                2026 Donations
                            </div>

                        </div>

                    </div>


                    <div class="impact-metric">

                        <div class="impact-icon">
                            👥
                        </div>

                        <div>

                            <div class="impact-number">
                                24+ Lives
                            </div>

                            <div class="impact-description">
                                Community Impact
                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>


        <!-- DONATION + CAMP INFORMATION -->

        <div class="info-grid">


            <!-- DONATION DETAILS -->

            <div class="card">

                <h3 class="card-title">
                    Donation Details
                </h3>

                <div class="detail-list">


                    <div class="detail-item">

                        <div class="detail-label">
                            Donation ID
                        </div>

                        <div class="detail-value">
                            DN-2026-00821
                        </div>

                    </div>


                    <div class="detail-item">

                        <div class="detail-label">
                            Date & Time
                        </div>

                        <div class="detail-value">
                            12 June 2026, 10:15 AM
                        </div>

                    </div>


                    <div class="detail-item">

                        <div class="detail-label">
                            Donation Type
                        </div>

                        <div class="detail-value">
                            Whole Blood
                        </div>

                    </div>


                    <div class="detail-item">

                        <div class="detail-label">
                            Blood Group
                        </div>

                        <div class="detail-value">

                            <span class="blood-pill">
                                O+
                            </span>

                        </div>

                    </div>


                    <div class="detail-item">

                        <div class="detail-label">
                            Donor Name
                        </div>

                        <div class="detail-value">
                            Jane Doe
                        </div>

                    </div>


                    <div class="detail-item">

                        <div class="detail-label">
                            Donor ID
                        </div>

                        <div class="detail-value">
                            BC-DNR-10248
                        </div>

                    </div>

                </div>

            </div>


            <!-- CAMP LOCATION -->

            <div class="card">

                <h3 class="card-title">
                    Camp Location
                </h3>

                <div class="camp-name">
                    City Care Blood Camp
                </div>

                <div class="organized">
                    Organized by <strong>BloodConnect Foundation</strong>
                </div>

                <div class="address">
                    📍 120 Health Avenue, Ahmedabad, Gujarat 380001
                </div>

                <div class="camp-actions">

                    <a href="https://www.google.com/maps/search/?api=1&query=120+Health+Avenue+Ahmedabad"
                       target="_blank"
                       class="direction-btn">
                        Get Directions
                    </a>

                    <asp:Button
                        ID="btnContactCamp"
                        runat="server"
                        Text="Contact Camp"
                        CssClass="contact-btn"
                        OnClick="btnContactCamp_Click" />

                </div>

                <asp:Label
                    ID="lblCampMessage"
                    runat="server"
                    CssClass="message-label">
                </asp:Label>

            </div>

        </div>


        <!-- TIMELINE + CERTIFICATE + RECEIPT -->

        <div class="timeline-document-grid">


            <!-- DONATION TIMELINE -->

            <div class="card timeline-card">

                <h3 class="card-title">
                    Donation Timeline
                </h3>

                <div class="timeline">


                    <div class="timeline-item">

                        <div class="timeline-line"></div>

                        <div class="timeline-dot"></div>

                        <div class="timeline-content">

                            <div class="timeline-time">
                                09:45 AM
                            </div>

                            <div class="timeline-text">
                                Arrived at Camp
                            </div>

                        </div>

                    </div>


                    <div class="timeline-item">

                        <div class="timeline-line"></div>

                        <div class="timeline-dot"></div>

                        <div class="timeline-content">

                            <div class="timeline-time">
                                10:00 AM
                            </div>

                            <div class="timeline-text">
                                Registration
                            </div>

                        </div>

                    </div>


                    <div class="timeline-item">

                        <div class="timeline-line"></div>

                        <div class="timeline-dot"></div>

                        <div class="timeline-content">

                            <div class="timeline-time">
                                10:05 AM
                            </div>

                            <div class="timeline-text">
                                Health Screening
                            </div>

                        </div>

                    </div>


                    <div class="timeline-item">

                        <div class="timeline-line"></div>

                        <div class="timeline-dot completed"></div>

                        <div class="timeline-content">

                            <div class="timeline-time">
                                10:15 AM
                            </div>

                            <div class="timeline-text">
                                ✓ Donation Completed
                            </div>

                        </div>

                    </div>


                    <div class="timeline-item">

                        <div class="timeline-dot"></div>

                        <div class="timeline-content">

                            <div class="timeline-time">
                                10:30 AM
                            </div>

                            <div class="timeline-text">
                                Rest & Refreshments
                            </div>

                        </div>

                    </div>

                </div>

            </div>


            <!-- RIGHT SIDE DOCUMENTS -->

            <div class="documents-column">


                <!-- CERTIFICATE -->

                <div class="document-card">

                    <div class="document-icon">
                        🏅
                    </div>

                    <div class="document-title">
                        Certificate of Appreciation
                    </div>

                    <div class="document-text">
                        Official recognition of your life-saving contribution
                        to the community.
                    </div>

                    <div class="document-actions">

                        <asp:Button
                            ID="btnViewCertificate"
                            runat="server"
                            Text="View Full"
                            CssClass="red-small-btn"
                            OnClick="btnViewCertificate_Click" />

                        <asp:Button
                            ID="btnDownloadCertificate"
                            runat="server"
                            Text="Download PDF"
                            CssClass="outline-btn"
                            OnClick="btnDownloadCertificate_Click" />

                    </div>

                </div>


                <!-- OFFICIAL RECEIPT -->

                <div class="document-card">

                    <div class="document-icon">
                        🧾
                    </div>

                    <div class="document-title">
                        Official Receipt
                    </div>

                    <div class="receipt-info">


                        <div class="receipt-row">

                            <span>
                                Receipt No
                            </span>

                            <span>
                                REC-2026-00821
                            </span>

                        </div>


                        <div class="receipt-row">

                            <span>
                                Facility
                            </span>

                            <span>
                                City Care Blood Camp
                            </span>

                        </div>


                        <div class="receipt-row">

                            <span>
                                Authorized By
                            </span>

                            <span>
                                Dr. S. Patel, CMO
                            </span>

                        </div>


                    </div>


                    <asp:Button
                        ID="btnDownloadReceipt"
                        runat="server"
                        Text="📥 Download Receipt"
                        CssClass="blue-btn"
                        OnClick="btnDownloadReceipt_Click" />

                </div>

            </div>

        </div>


        <!-- NEXT STEPS -->

        <div class="next-title">
            Next Steps
        </div>


        <div class="next-grid">


            <!-- FIND CAMPS -->

            <a href="FindCamps.aspx" class="next-card">

                <div class="next-icon">
                    🎯
                </div>

                <div class="next-card-title">
                    Find Donation Camps
                </div>

                <div class="next-card-text">
                    Plan your next visit
                </div>

            </a>


            <!-- ELIGIBILITY -->

            <a href="Donation_Eligibility.aspx" class="next-card">

                <div class="next-icon">
                    🛡️
                </div>

                <div class="next-card-title">
                    Check Eligibility
                </div>

                <div class="next-card-text">
                    See when you can donate again
                </div>

            </a>


            <!-- REPORT ISSUE -->

            <a href="#" class="next-card">

                <div class="next-icon">
                    ⚠️
                </div>

                <div class="next-card-title">
                    Report an Issue
                </div>

                <div class="next-card-text">
                    Post-donation health concerns
                </div>

            </a>

        </div>


        <!-- MESSAGE -->

        <asp:Label
            ID="lblMessage"
            runat="server"
            CssClass="message-label">
        </asp:Label>


        <!-- BACK -->

        <a href="DonationHistory.aspx" class="back-link">
            ← Back to Donation History
        </a>


    </div>

</asp:Content>