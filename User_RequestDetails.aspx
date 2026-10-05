<%@ Page Title="Request Details" Language="C#" MasterPageFile="~/User.Master"
    AutoEventWireup="true" CodeBehind="User_RequestDetails.aspx.cs"
    Inherits="BloodConnect.User_RequestDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .page-container {
            padding: 30px;
            background: #f8f9fc;
            min-height: calc(100vh - 70px);
        }

        .request-header {
            background: white;
            border: 1px solid #e8e8ee;
            border-radius: 14px;
            padding: 25px;
            margin-bottom: 22px;
            box-shadow: 0 2px 8px rgba(0,0,0,.03);
        }

        .header-top {
            display: flex;
            justify-content: space-between;
            gap: 20px;
        }

        .request-tags {
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
            margin-bottom: 14px;
        }

        .tag {
            padding: 6px 11px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 600;
        }

        .id-tag {
            background: #f1f1f1;
            color: #555;
        }

        .active-tag {
            background: #e9f8ed;
            color: #218739;
        }

        .normal-tag {
            background: #eaf3ff;
            color: #3973b9;
        }

        .created-tag {
            background: #f5f5f5;
            color: #777;
        }

        .request-title {
            font-size: 27px;
            font-weight: 700;
            color: #292929;
            margin: 0 0 7px;
        }

        .request-subtitle {
            color: #777;
            font-size: 14px;
            margin: 0;
        }

        .header-actions {
            display: flex;
            gap: 9px;
            align-items: flex-start;
        }

        .track-btn {
            background: #c62828;
            color: white;
            padding: 10px 17px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
        }

        .edit-btn {
            background: white;
            color: #c62828;
            border: 1px solid #c62828;
            padding: 9px 17px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
        }

        .more-btn {
            width: 38px;
            height: 38px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background: white;
            color: #777;
            font-size: 20px;
        }

        .track-btn:hover {
            background: #a91f1f;
            color: white;
        }

        .edit-btn:hover {
            background: #fff5f5;
            color: #c62828;
        }

        .content-grid {
            display: grid;
            grid-template-columns: minmax(0, 1fr) 350px;
            gap: 22px;
        }

        .card {
            background: white;
            border: 1px solid #e8e8ee;
            border-radius: 14px;
            padding: 23px;
            margin-bottom: 22px;
            box-shadow: 0 2px 8px rgba(0,0,0,.03);
        }

        .card-title {
            font-size: 17px;
            font-weight: 700;
            color: #292929;
            margin-bottom: 20px;
        }

        /* BLOOD */

        .blood-box {
            display: flex;
            align-items: center;
            gap: 18px;
            background: #fff8f8;
            border: 1px solid #f5dddd;
            border-radius: 11px;
            padding: 18px;
        }

        .blood-icon {
            width: 48px;
            height: 48px;
            border-radius: 12px;
            background: #fde3e3;
            color: #c62828;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 22px;
        }

        .blood-label {
            color: #888;
            font-size: 11px;
            text-transform: uppercase;
            margin-bottom: 4px;
        }

        .blood-value {
            color: #c62828;
            font-size: 20px;
            font-weight: 700;
        }

        .units-text {
            color: #333;
            font-size: 14px;
            font-weight: 600;
        }

        .component {
            margin-top: 16px;
            color: #777;
            font-size: 13px;
        }

        /* PATIENT */

        .info-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 18px;
        }

        .info-label {
            color: #999;
            font-size: 10px;
            text-transform: uppercase;
            font-weight: 600;
            margin-bottom: 6px;
        }

        .info-value {
            color: #333;
            font-size: 14px;
            font-weight: 600;
        }

        .privacy-note {
            margin-top: 20px;
            padding: 12px 14px;
            background: #f7f7f9;
            border-radius: 8px;
            color: #777;
            font-size: 12px;
        }

        /* HOSPITAL */

        .hospital-grid {
            display: grid;
            grid-template-columns: 1fr 220px;
            gap: 20px;
        }

        .hospital-detail {
            margin-bottom: 16px;
        }

        .hospital-label {
            color: #999;
            font-size: 10px;
            text-transform: uppercase;
            margin-bottom: 5px;
        }

        .hospital-value {
            color: #333;
            font-size: 13px;
            line-height: 1.5;
            font-weight: 600;
        }

        .map-box {
            height: 155px;
            background: #eef2f3;
            border: 1px solid #ddd;
            border-radius: 10px;
            position: relative;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .map-box i {
            font-size: 32px;
            color: #c62828;
        }

        .map-btn {
            position: absolute;
            bottom: 10px;
            background: white;
            border: 1px solid #ddd;
            padding: 7px 13px;
            border-radius: 6px;
            font-size: 11px;
            color: #555;
        }

        /* FULFILLMENT */

        .progress-item {
            display: flex;
            gap: 13px;
            position: relative;
            padding-bottom: 22px;
        }

        .progress-item:last-child {
            padding-bottom: 0;
        }

        .progress-item:not(:last-child):after {
            content: "";
            position: absolute;
            left: 10px;
            top: 23px;
            height: 30px;
            border-left: 2px solid #ddd;
        }

        .progress-dot {
            width: 21px;
            height: 21px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 11px;
            background: #e8f5eb;
            color: #23863a;
            z-index: 1;
        }

        .progress-dot.active {
            background: #fdeaea;
            color: #c62828;
        }

        .progress-dot.pending {
            background: #f1f1f1;
            color: #999;
        }

        .progress-title {
            font-size: 13px;
            font-weight: 600;
            color: #333;
        }

        .progress-desc {
            color: #888;
            font-size: 11px;
            margin-top: 3px;
        }

        .progress-link {
            display: inline-block;
            margin-top: 18px;
            color: #c62828;
            font-size: 12px;
            font-weight: 600;
            text-decoration: none;
        }

        /* RESPONSES */

        .responses-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 17px;
        }

        .available-text {
            color: #218739;
            font-size: 11px;
            font-weight: 600;
        }

        .donor {
            padding: 14px 0;
            border-bottom: 1px solid #eee;
        }

        .donor:last-child {
            border-bottom: none;
        }

        .donor-top {
            display: flex;
            justify-content: space-between;
        }

        .donor-name {
            font-size: 13px;
            font-weight: 600;
            color: #333;
        }

        .donor-distance {
            color: #777;
            font-size: 11px;
        }

        .available {
            color: #218739;
            font-size: 11px;
            font-weight: 600;
        }

        .donor-message {
            color: #888;
            font-size: 11px;
            line-height: 1.4;
            margin-top: 5px;
        }

        .response-note {
            margin-top: 15px;
            background: #f7f9fc;
            padding: 11px;
            border-radius: 7px;
            color: #777;
            font-size: 10px;
            line-height: 1.4;
        }

        /* ACTIVITY */

        .activity {
            position: relative;
        }

        .activity-item {
            display: flex;
            gap: 13px;
            padding-bottom: 20px;
            position: relative;
        }

        .activity-item:last-child {
            padding-bottom: 0;
        }

        .activity-item:not(:last-child):after {
            content: "";
            position: absolute;
            left: 10px;
            top: 24px;
            bottom: 0;
            border-left: 1px solid #ddd;
        }

        .activity-icon {
            width: 21px;
            height: 21px;
            border-radius: 50%;
            background: #f0f0f0;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #666;
            font-size: 10px;
            z-index: 1;
        }

        .activity-title {
            font-size: 13px;
            color: #333;
            font-weight: 600;
        }

        .activity-time {
            color: #999;
            font-size: 10px;
            margin-left: 6px;
        }

        .activity-desc {
            color: #888;
            font-size: 11px;
            margin-top: 4px;
            line-height: 1.4;
        }

        .history-link {
            float: right;
            color: #c62828;
            text-decoration: none;
            font-size: 11px;
            font-weight: 600;
        }

        @media (max-width: 1000px) {
            .content-grid {
                grid-template-columns: 1fr;
            }

            .header-top {
                flex-direction: column;
            }
        }

        @media (max-width: 700px) {
            .page-container {
                padding: 18px;
            }

            .header-actions {
                width: 100%;
                flex-wrap: wrap;
            }

            .info-grid {
                grid-template-columns: 1fr;
            }

            .hospital-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-container">

        <!-- REQUEST HEADER -->

        <div class="request-header">

            <div class="header-top">

                <div>

                    <div class="request-tags">

                        <span class="tag id-tag">
                            BR-2026-001246
                        </span>

                        <span class="tag active-tag">
                            🟢 Active
                        </span>

                        <span class="tag normal-tag">
                            Normal Type
                        </span>

                        <span class="tag created-tag">
                            Created: 18 Aug 2026
                        </span>

                    </div>


                    <h1 class="request-title">
                        O+ Blood Required
                    </h1>

                    <p class="request-subtitle">
                        🏥 2 units required at CityCare Hospital, Ahmedabad
                    </p>

                </div>


                <div class="header-actions">

                    <a href="User_RequestStatus.aspx"
                       class="track-btn">
                        🎯 Track Request
                    </a>

                    <a href="User_EditProfile.aspx"
                       class="edit-btn">
                        ✏️ Edit Request
                    </a>

                    <button type="button"
                            class="more-btn">
                        ⋮
                    </button>

                </div>

            </div>

        </div>


        <div class="content-grid">

            <!-- LEFT COLUMN -->

            <div>

                <!-- BLOOD REQUIREMENT -->

                <div class="card">

                    <div class="card-title">
                        Blood Requirement Overview
                    </div>

                    <div class="blood-box">

                        <div class="blood-icon">
                            <i class="fa-solid fa-droplet"></i>
                        </div>

                        <div>

                            <div class="blood-label">
                                Blood Group
                            </div>

                            <div class="blood-value">
                                O+
                            </div>

                        </div>

                        <div style="margin-left:25px;">

                            <div class="blood-label">
                                Required Quantity
                            </div>

                            <div class="units-text">
                                2 Units Required
                            </div>

                        </div>

                    </div>


                    <div class="component">
                        Component: <strong>Whole Blood Component</strong>
                    </div>

                </div>


                <!-- PATIENT INFORMATION -->

                <div class="card">

                    <div class="card-title">
                        Patient Information
                    </div>

                    <div class="info-grid">

                        <div>

                            <div class="info-label">
                                Patient Name
                            </div>

                            <div class="info-value">
                                Rahul Shah
                            </div>

                        </div>


                        <div>

                            <div class="info-label">
                                Age
                            </div>

                            <div class="info-value">
                                26 Years
                            </div>

                        </div>


                        <div>

                            <div class="info-label">
                                Gender
                            </div>

                            <div class="info-value">
                                Male
                            </div>

                        </div>

                    </div>


                    <div class="privacy-note">
                        🔒 Patient details are visible to potential donors
                        to facilitate matching.
                    </div>

                </div>


                <!-- HOSPITAL DETAILS -->

                <div class="card">

                    <div class="card-title">
                        Hospital Details
                    </div>

                    <div class="hospital-grid">

                        <div>

                            <div class="hospital-detail">

                                <div class="hospital-label">
                                    Hospital Name
                                </div>

                                <div class="hospital-value">
                                    CityCare Multispecialty Hospital
                                </div>

                            </div>


                            <div class="hospital-detail">

                                <div class="hospital-label">
                                    Address
                                </div>

                                <div class="hospital-value">
                                    123 Health Avenue, Near University Circle,
                                    Navrangpura, Ahmedabad 380009
                                </div>

                            </div>


                            <div class="hospital-detail">

                                <div class="hospital-label">
                                    Doctor in Charge
                                </div>

                                <div class="hospital-value">
                                    Dr. Meera Desai
                                </div>

                            </div>

                        </div>


                        <div class="map-box">

                            <i class="fa-solid fa-location-dot"></i>

                            <button type="button"
                                    class="map-btn">
                                View Map
                            </button>

                        </div>

                    </div>

                </div>


                <!-- REQUEST ACTIVITY -->

                <div class="card">

                    <div class="card-title">

                        Request Activity

                        <a href="#"
                           class="history-link">
                            View Full History
                        </a>

                    </div>


                    <div class="activity">

                        <div class="activity-item">

                            <div class="activity-icon">
                                <i class="fa-solid fa-eye"></i>
                            </div>

                            <div>

                                <div class="activity-title">
                                    Arjun Mehta viewed request
                                    <span class="activity-time">
                                        1h ago
                                    </span>
                                </div>

                                <div class="activity-desc">
                                    Donor is located 3.2 km away.
                                </div>

                            </div>

                        </div>


                        <div class="activity-item">

                            <div class="activity-icon">
                                <i class="fa-solid fa-check"></i>
                            </div>

                            <div>

                                <div class="activity-title">
                                    Request Shared
                                    <span class="activity-time">
                                        Today, 09:30 AM
                                    </span>
                                </div>

                                <div class="activity-desc">
                                    System automatically matched and shared
                                    request with 45 eligible donors in the vicinity.
                                </div>

                            </div>

                        </div>


                        <div class="activity-item">

                            <div class="activity-icon">
                                <i class="fa-solid fa-plus"></i>
                            </div>

                            <div>

                                <div class="activity-title">
                                    Request Created
                                    <span class="activity-time">
                                        18 Aug, 08:15 AM
                                    </span>
                                </div>

                                <div class="activity-desc">
                                    Initial request submitted for 2 units
                                    of O+ blood.
                                </div>

                            </div>

                        </div>

                    </div>

                </div>

            </div>


            <!-- RIGHT COLUMN -->

            <div>

                <!-- FULFILLMENT STATUS -->

                <div class="card">

                    <div class="card-title">
                        Fulfillment Status
                    </div>


                    <div class="progress-item">

                        <div class="progress-dot">
                            ✓
                        </div>

                        <div>
                            <div class="progress-title">
                                Request Created
                            </div>
                        </div>

                    </div>


                    <div class="progress-item">

                        <div class="progress-dot">
                            ✓
                        </div>

                        <div>
                            <div class="progress-title">
                                Under Review
                            </div>
                        </div>

                    </div>


                    <div class="progress-item">

                        <div class="progress-dot active">
                            🎯
                        </div>

                        <div>

                            <div class="progress-title">
                                Shared (Active)
                            </div>

                            <div class="progress-desc">
                                Broadcasting to donors
                            </div>

                        </div>

                    </div>


                    <div class="progress-item">

                        <div class="progress-dot pending">
                            ○
                        </div>

                        <div>
                            <div class="progress-title">
                                Fulfilled
                            </div>
                        </div>

                    </div>


                    <a href="User_RequestStatus.aspx"
                       class="progress-link">
                        Track Full Progress →
                    </a>

                </div>


                <!-- RESPONSES -->

                <div class="card">

                    <div class="responses-header">

                        <div class="card-title" style="margin:0;">
                            Responses (3)
                        </div>

                        <div class="available-text">
                            1 Available
                        </div>

                    </div>


                    <!-- DONOR 1 -->

                    <div class="donor">

                        <div class="donor-top">

                            <div class="donor-name">
                                Ananya Patel
                            </div>

                            <div class="available">
                                Available
                            </div>

                        </div>

                        <div class="donor-distance">
                            📍 1.8 km away
                        </div>

                        <div class="donor-message">
                            "Interested in helping. Can reach in 30 mins."
                        </div>

                    </div>


                    <!-- DONOR 2 -->

                    <div class="donor">

                        <div class="donor-top">

                            <div class="donor-name">
                                Arjun Mehta
                            </div>

                            <div class="donor-distance">
                                📍 3.2 km
                            </div>

                        </div>

                        <div class="donor-message">
                            👁️ Viewed 1h ago
                        </div>

                    </div>


                    <!-- DONOR 3 -->

                    <div class="donor">

                        <div class="donor-top">

                            <div class="donor-name">
                                Priya Shah
                            </div>

                            <div class="donor-distance">
                                📍 4.7 km
                            </div>

                        </div>

                        <div class="donor-message">
                            👁️ Viewed 3h ago
                        </div>

                    </div>


                    <div class="response-note">
                        ℹ️ Potential donor responses do not guarantee donation.
                        Final confirmation happens at the blood bank.
                    </div>

                </div>

            </div>

        </div>

    </div>

</asp:Content>