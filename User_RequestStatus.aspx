<%@ Page Title="Request Status" Language="C#" MasterPageFile="~/User.Master"
    AutoEventWireup="true" CodeBehind="User_RequestStatus.aspx.cs"
    Inherits="BloodConnect.User_RequestStatus" %>

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

        .outline-btn {
            background: white;
            color: #c62828;
            border: 1px solid #c62828;
            padding: 10px 18px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
        }

        .outline-btn:hover {
            background: #fff5f5;
            color: #b32020;
        }

        .primary-btn {
            background: #c62828;
            color: white;
            border: 1px solid #c62828;
            padding: 10px 20px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
        }

        .primary-btn:hover {
            background: #a91f1f;
            color: white;
        }

        /* REQUEST CARD */

        .request-card {
            background: white;
            border: 1px solid #e9e9ef;
            border-radius: 14px;
            padding: 25px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.03);
            margin-bottom: 22px;
        }

        .request-card-title {
            font-size: 17px;
            font-weight: 700;
            color: #292929;
            margin-bottom: 22px;
        }

        .request-layout {
            display: grid;
            grid-template-columns: 1.4fr 1fr;
            gap: 35px;
        }

        .tag-row {
            display: flex;
            gap: 9px;
            margin-bottom: 18px;
            flex-wrap: wrap;
        }

        .blood-tag {
            background: #fdeaea;
            color: #c62828;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 700;
        }

        .units-tag {
            background: #eaf3ff;
            color: #3973b9;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }

        .request-id-label {
            color: #888;
            font-size: 12px;
            margin-bottom: 5px;
        }

        .request-id {
            font-size: 18px;
            font-weight: 700;
            color: #333;
            margin-bottom: 13px;
        }

        .request-type {
            color: #777;
            font-size: 13px;
        }

        .active-status {
            display: inline-block;
            background: #fdeaea;
            color: #c62828;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 600;
            margin-left: 5px;
        }

        .details-column {
            border-left: 1px solid #eeeeee;
            padding-left: 30px;
        }

        .detail-item {
            margin-bottom: 17px;
        }

        .detail-label {
            color: #888;
            font-size: 12px;
            margin-bottom: 5px;
        }

        .detail-value {
            color: #333;
            font-size: 14px;
            font-weight: 600;
        }

        .hospital-value {
            line-height: 1.5;
        }

        /* STATUS ALERT */

        .status-alert {
            background: #eef6ff;
            border: 1px solid #cfe4fb;
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 22px;
        }

        .status-alert-header {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 8px;
        }

        .info-icon {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            background: #dbeeff;
            color: #3973b9;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 700;
        }

        .status-alert-title {
            color: #285f95;
            font-size: 15px;
            font-weight: 700;
        }

        .status-alert-text {
            color: #55728e;
            font-size: 13px;
            margin-left: 40px;
            line-height: 1.5;
        }

        .last-updated {
            color: #71869a;
            font-size: 12px;
            margin-top: 13px;
            margin-left: 40px;
        }

        /* RESPONSIVE */

        @media (max-width: 850px) {
            .request-layout {
                grid-template-columns: 1fr;
                gap: 20px;
            }

            .details-column {
                border-left: none;
                border-top: 1px solid #eeeeee;
                padding-left: 0;
                padding-top: 20px;
            }
        }

        @media (max-width: 650px) {
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

            .status-alert-text,
            .last-updated {
                margin-left: 0;
            }
        }
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-container">

        <!-- PAGE HEADER -->

        <div class="page-header">

            <div>
                <h1>Request Status Tracking</h1>

                <p>
                    Track the progress of your blood request and see the latest activity.
                </p>
            </div>

            <div class="header-actions">

                <a href="User_RequestDetails.aspx"
                   class="outline-btn">
                    View Request Details
                </a>

                <a href="User_MyRequests.aspx"
                   class="primary-btn">
                    My Requests
                </a>

            </div>

        </div>


        <!-- REQUEST INFORMATION -->

        <div class="request-card">

            <div class="request-card-title">
                Request Information
            </div>


            <div class="request-layout">

                <!-- LEFT DETAILS -->

                <div>

                    <div class="tag-row">

                        <span class="blood-tag">
                            O+
                        </span>

                        <span class="units-tag">
                            2 Units Required
                        </span>

                    </div>


                    <div class="request-id-label">
                        Request ID
                    </div>

                    <div class="request-id">
                        BR-2026-001246
                    </div>


                    <div class="request-type">

                        Type: Normal

                        <span class="active-status">
                            🔴 Active
                        </span>

                    </div>

                </div>


                <!-- RIGHT DETAILS -->

                <div class="details-column">

                    <div class="detail-item">

                        <div class="detail-label">
                            Required Date
                        </div>

                        <div class="detail-value">
                            20 Aug 2026
                        </div>

                    </div>


                    <div class="detail-item">

                        <div class="detail-label">
                            Required Time
                        </div>

                        <div class="detail-value">
                            14:00 PM
                        </div>

                    </div>


                    <div class="detail-item">

                        <div class="detail-label">
                            Hospital
                        </div>

                        <div class="detail-value hospital-value">
                            City General Hospital<br />
                            Central Area
                        </div>

                    </div>

                </div>

            </div>

        </div>


        <!-- CURRENT STATUS -->

        <div class="status-alert">

            <div class="status-alert-header">

                <div class="info-icon">
                    i
                </div>

                <div class="status-alert-title">
                    Your request is active
                </div>

            </div>


            <div class="status-alert-text">
                Your request has been shared with relevant potential donors
                and is currently waiting for responses.
            </div>


            <div class="last-updated">
                Last Updated: 18 Aug 2026 • 11:15 AM
            </div>

        </div>

    </div>

</asp:Content>