<%@ Page Title="Book Donation Slot" Language="C#" MasterPageFile="~/Donor.Master"
    AutoEventWireup="true"
    CodeBehind="BookDonationSlot.aspx.cs"
    Inherits="WebApplication1.BookDonationSlot" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        .booking-page {
            padding-bottom: 40px;
        }

        /* PAGE HEADER */

        .page-heading {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 20px;
            gap: 20px;
        }

        .page-heading h2 {
            margin: 0;
            color: #202338;
            font-size: 28px;
        }

        .page-heading p {
            margin: 7px 0 0;
            color: #6B7280;
            font-size: 14px;
        }

        .camp-open {
            background: #ECFDF5;
            color: #15803D;
            border: 1px solid #BBF7D0;
            border-radius: 20px;
            padding: 8px 14px;
            font-size: 12px;
            font-weight: 700;
            white-space: nowrap;
        }

        /* SELECTED CAMP */

        .selected-camp {
            background: white;
            border: 1px solid #E5E7EB;
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 22px;
            box-shadow: 0 4px 15px rgba(0,0,0,.035);

            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
        }

        .selected-camp h3 {
            margin: 0 0 8px;
            color: #202338;
            font-size: 18px;
        }

        .camp-details {
            color: #6B7280;
            font-size: 13px;
            line-height: 1.9;
        }

        .change-camp {
            color: #2563EB;
            text-decoration: none;
            font-weight: 600;
            font-size: 13px;
        }

        /* MAIN THREE COLUMN ROW */

        .booking-main-row {
            display: grid;
            grid-template-columns: 1fr 1fr 0.9fr;
            gap: 20px;
            align-items: start;
        }

        /* CARD */

        .card {
            background: white;
            border: 1px solid #E5E7EB;
            border-radius: 16px;
            padding: 23px;
            box-shadow: 0 4px 15px rgba(0,0,0,.035);
            box-sizing: border-box;
            height: 100%;
        }

        .card h3 {
            margin: 0 0 17px;
            color: #202338;
            font-size: 18px;
        }

        .section-subtitle {
            color: #6B7280;
            font-size: 13px;
            margin-top: -8px;
            margin-bottom: 15px;
        }

        /* CALENDAR */

        .calendar-wrapper {
            display: flex;
            justify-content: center;
            width: 100%;
        }

        .calendar-control {
            width: 100%;
            max-width: 520px;
            border-collapse: separate;
            border-spacing: 4px;
        }

        .calendar-control td,
        .calendar-control th {
            text-align: center;
        }

        .calendar-control td {
            height: 38px;
            min-width: 35px;
            border-radius: 8px;
        }

        .calendar-control a {
            text-decoration: none;
            color: #374151;
        }

        .calendar-control td:hover {
            background: #FFF1F2;
        }

        .calendar-title {
            background: #D80032 !important;
            color: white !important;
            font-size: 16px;
            font-weight: 700;
            height: 45px !important;
        }

        .calendar-title a {
            color: white !important;
        }

        .calendar-header {
            color: #D80032;
            font-weight: 700;
            font-size: 12px;
        }

        .calendar-selected {
            background: #D80032 !important;
            color: white !important;
            border-radius: 50% !important;
            font-weight: 700;
        }

        .calendar-selected a {
            color: white !important;
        }

        .calendar-other {
            color: #D1D5DB !important;
        }

        .selected-date-label {
            display: block;
            text-align: center;
            margin-top: 12px;
            color: #D80032;
            font-size: 13px;
            font-weight: 600;
        }

        /* TIME SLOTS */

        .slot-grid {
            display: grid;
            grid-template-columns: 1fr;
            gap: 9px;
        }

        .slot-btn {
            width: 100%;
            min-height: 43px;

            background: white;
            border: 1px solid #D1D5DB;
            color: #374151;

            border-radius: 9px;
            cursor: pointer;

            font-size: 12px;
            font-weight: 600;
        }

        .slot-btn:hover {
            border-color: #D80032;
            color: #D80032;
        }

        .slot-selected {
            background: #D80032 !important;
            border-color: #D80032 !important;
            color: white !important;
        }

        .slot-booked {
            background: #F3F4F6 !important;
            border-color: #E5E7EB !important;
            color: #9CA3AF !important;
            cursor: not-allowed !important;
        }

        .selected-slot-label {
            display: block;
            margin-top: 14px;
            color: #D80032;
            font-size: 13px;
            font-weight: 600;
        }

        /* BOOKING SUMMARY */

        .summary-card {
            background: white;
            border: 1px solid #E5E7EB;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,.035);
        }

        .summary-header {
            background: #D80032;
            color: white;
            padding: 17px 20px;
            font-size: 17px;
            font-weight: 700;
        }

        .summary-body {
            padding: 20px;
        }

        .summary-row {
            display: flex;
            gap: 12px;
            margin-bottom: 18px;
        }

        .summary-icon {
            width: 34px;
            min-width: 34px;
            height: 34px;
            border-radius: 8px;

            background: #FFF1F2;

            display: flex;
            align-items: center;
            justify-content: center;
        }

        .summary-label {
            color: #9CA3AF;
            font-size: 11px;
            font-weight: 700;
            margin-bottom: 3px;
        }

        .summary-value {
            color: #202338;
            font-size: 13px;
            font-weight: 600;
            line-height: 1.5;
        }

        .summary-info {
            background: #EEF4FF;
            color: #4B5563;

            border-radius: 9px;

            padding: 13px;

            font-size: 12px;
            line-height: 1.6;

            margin-bottom: 18px;
        }

        .back-btn {
            width: 100%;
            display: block;
            box-sizing: border-box;

            text-align: center;

            background: white;
            color: #374151;

            border: 1px solid #D1D5DB;

            border-radius: 9px;

            padding: 12px;

            text-decoration: none;

            font-size: 13px;
            font-weight: 600;
        }

        .back-btn:hover {
            border-color: #D80032;
            color: #D80032;
        }

        .message {
            display: block;
            margin-top: 12px;

            color: #15803D;

            font-size: 13px;
            text-align: center;
        }

        /* DONOR + ELIGIBILITY */

        .below-section {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;

            margin-top: 20px;
        }

        .donor-profile {
            display: flex;
            align-items: center;
            gap: 14px;

            margin-bottom: 18px;
        }

        .donor-avatar {
            width: 58px;
            height: 58px;

            border-radius: 50%;

            object-fit: cover;
        }

        .donor-name {
            font-size: 17px;
            font-weight: 700;
            color: #202338;
        }

        .donor-email {
            font-size: 13px;
            color: #6B7280;

            margin-top: 3px;
        }

        .profile-detail {
            color: #6B7280;
            font-size: 13px;
            line-height: 2;
        }

        .blood-pill {
            background: #FFF1F2;
            color: #D80032;

            padding: 4px 10px;

            border-radius: 15px;

            font-weight: 700;
        }

        /* ELIGIBILITY */

        .eligible-banner {
            background: #ECFDF5;

            border: 1px solid #BBF7D0;

            color: #15803D;

            border-radius: 10px;

            padding: 13px;

            margin-bottom: 16px;
        }

        .eligible-title {
            font-weight: 700;
            font-size: 14px;
        }

        .eligible-subtitle {
            font-size: 12px;
            margin-top: 4px;
        }

        .eligibility-point {
            font-size: 13px;
            color: #4B5563;

            margin-bottom: 10px;
        }

        /* RESPONSIVE */

        @media (max-width: 1100px) {

            .booking-main-row {
                grid-template-columns: 1fr 1fr;
            }

            .summary-card {
                grid-column: 1 / -1;
            }
        }

        @media (max-width: 800px) {

            .booking-main-row {
                grid-template-columns: 1fr;
            }

            .summary-card {
                grid-column: auto;
            }

            .below-section {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 600px) {

            .selected-camp {
                flex-direction: column;
                align-items: flex-start;
            }

            .page-heading {
                flex-direction: column;
            }
        }

    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="booking-page">


        <!-- PAGE HEADER -->

        <div class="page-heading">

            <div>

                <h2>Book Donation Slot</h2>

                <p>
                    Secure your preferred time to donate blood and save lives.
                </p>

            </div>

            <div class="camp-open">
                🟢 CAMP OPEN
            </div>

        </div>


        <!-- SELECTED CAMP -->

        <div class="selected-camp">

            <div>

                <h3>Save Life Blood Drive</h3>

                <div class="camp-details">

                    📅 Aug 15 - Aug 20, 2026
                    &nbsp;&nbsp;&nbsp;
                    📍 Community Center, Ahmedabad, Gujarat

                </div>

            </div>

            <a href="FindCamps.aspx"
               class="change-camp">

                Change Camp

            </a>

        </div>


        <!-- THREE COLUMN ROW -->

        <div class="booking-main-row">


            <!-- ========================= -->
            <!-- SELECT DATE -->
            <!-- ========================= -->

            <div class="card">

                <h3>Select Date</h3>

                <p class="section-subtitle">
                    Choose an available date for your donation.
                </p>

                <div class="calendar-wrapper">

                    <asp:Calendar
                        ID="calDonation"
                        runat="server"
                        CssClass="calendar-control"
                        OnSelectionChanged="calDonation_SelectionChanged"
                        ShowGridLines="false"
                        DayNameFormat="Short"
                        FirstDayOfWeek="Sunday"
                        SelectionMode="Day"
                        SelectedDayStyle-CssClass="calendar-selected"
                        TitleStyle-CssClass="calendar-title"
                        DayHeaderStyle-CssClass="calendar-header"
                        OtherMonthDayStyle-CssClass="calendar-other">
                    </asp:Calendar>

                </div>

                <asp:Label
                    ID="lblSelectedDate"
                    runat="server"
                    CssClass="selected-date-label">
                </asp:Label>

            </div>


            <!-- ========================= -->
            <!-- SELECT TIME SLOT -->
            <!-- ========================= -->

            <div class="card">

                <h3>Select Time Slot</h3>

                <p class="section-subtitle">
                    Select an available 30-minute donation slot.
                </p>

                <div class="slot-grid">


                    <asp:Button
                        ID="btnSlot1"
                        runat="server"
                        Text="09:00 AM - 09:30 AM"
                        CssClass="slot-btn"
                        CommandArgument="09:00 AM - 09:30 AM"
                        OnClick="Slot_Click" />


                    <asp:Button
                        ID="btnSlot2"
                        runat="server"
                        Text="09:30 AM - 10:00 AM"
                        CssClass="slot-btn"
                        CommandArgument="09:30 AM - 10:00 AM"
                        OnClick="Slot_Click" />


                    <asp:Button
                        ID="btnSlot3"
                        runat="server"
                        Text="10:00 AM - 10:30 AM"
                        CssClass="slot-btn slot-selected"
                        CommandArgument="10:00 AM - 10:30 AM"
                        OnClick="Slot_Click" />


                    <asp:Button
                        ID="btnSlot4"
                        runat="server"
                        Text="10:30 AM - 11:00 AM"
                        CssClass="slot-btn"
                        CommandArgument="10:30 AM - 11:00 AM"
                        OnClick="Slot_Click" />


                    <asp:Button
                        ID="btnSlot5"
                        runat="server"
                        Text="11:00 AM - 11:30 AM"
                        CssClass="slot-btn slot-booked"
                        Enabled="false" />


                    <asp:Button
                        ID="btnSlot6"
                        runat="server"
                        Text="11:30 AM - 12:00 PM"
                        CssClass="slot-btn slot-booked"
                        Enabled="false" />


                    <asp:Button
                        ID="btnSlot7"
                        runat="server"
                        Text="12:00 PM - 12:30 PM"
                        CssClass="slot-btn"
                        CommandArgument="12:00 PM - 12:30 PM"
                        OnClick="Slot_Click" />


                    <asp:Button
                        ID="btnSlot8"
                        runat="server"
                        Text="12:30 PM - 01:00 PM"
                        CssClass="slot-btn"
                        CommandArgument="12:30 PM - 01:00 PM"
                        OnClick="Slot_Click" />


                    <asp:Button
                        ID="btnSlot9"
                        runat="server"
                        Text="01:00 PM - 01:30 PM"
                        CssClass="slot-btn"
                        CommandArgument="01:00 PM - 01:30 PM"
                        OnClick="Slot_Click" />


                    <asp:Button
                        ID="btnSlot10"
                        runat="server"
                        Text="01:30 PM - 02:00 PM"
                        CssClass="slot-btn"
                        CommandArgument="01:30 PM - 02:00 PM"
                        OnClick="Slot_Click" />

                </div>


                <asp:Label
                    ID="lblSelectedSlot"
                    runat="server"
                    CssClass="selected-slot-label">

                    Selected: 10:00 AM - 10:30 AM

                </asp:Label>

            </div>


            <!-- ========================= -->
            <!-- BOOKING SUMMARY -->
            <!-- ========================= -->

            <div class="summary-card">

                <div class="summary-header">
                    Booking Summary
                </div>


                <div class="summary-body">


                    <!-- DATE & TIME -->

                    <div class="summary-row">

                        <div class="summary-icon">
                            📅
                        </div>

                        <div>

                            <div class="summary-label">
                                DATE &amp; TIME
                            </div>

                            <div class="summary-value">

                                <asp:Label
                                    ID="lblSummaryDate"
                                    runat="server">
                                </asp:Label>

                                <br />

                                <asp:Label
                                    ID="lblSummaryTime"
                                    runat="server">

                                    10:00 AM - 10:30 AM

                                </asp:Label>

                            </div>

                        </div>

                    </div>


                    <!-- LOCATION -->

                    <div class="summary-row">

                        <div class="summary-icon">
                            📍
                        </div>

                        <div>

                            <div class="summary-label">
                                LOCATION
                            </div>

                            <div class="summary-value">

                                Save Life Blood Drive
                                <br />

                                Community Center, Ahmedabad

                            </div>

                        </div>

                    </div>


                    <!-- DONATION TYPE -->

                    <div class="summary-row">

                        <div class="summary-icon">
                            🩸
                        </div>

                        <div>

                            <div class="summary-label">
                                DONATION TYPE
                            </div>

                            <div class="summary-value">
                                Whole Blood
                            </div>

                        </div>

                    </div>


                    <!-- EST. DURATION -->

                    <div class="summary-row">

                        <div class="summary-icon">
                            ⏱️
                        </div>

                        <div>

                            <div class="summary-label">
                                EST. DURATION
                            </div>

                            <div class="summary-value">
                                45 - 60 mins
                            </div>

                        </div>

                    </div>


                    <!-- INFORMATION -->

                    <div class="summary-info">

                        ℹ️ By confirming, you agree to arrive on time
                        and confirm you meet all basic eligibility
                        requirements.

                    </div>


                    <!-- BACK BUTTON -->

                    <a href="CampDetails.aspx"
                       class="back-btn">

                        Back to Camp Details

                    </a>


                    <asp:Label
                        ID="lblMessage"
                        runat="server"
                        CssClass="message">
                    </asp:Label>

                </div>

            </div>

        </div>


        <!-- ========================= -->
        <!-- DONOR + ELIGIBILITY -->
        <!-- ========================= -->

        <div class="below-section">


            <!-- DONOR INFORMATION -->

            <div class="card">

                <h3>Donor Information</h3>

                <div class="donor-profile">

                    <img
                        class="donor-avatar"
                        src="https://i.pravatar.cc/100?img=47"
                        alt="Jane Doe" />

                    <div>

                        <div class="donor-name">
                            Jane Doe
                        </div>

                        <div class="donor-email">
                            jane.doe@example.com
                        </div>

                    </div>

                </div>


                <div class="profile-detail">

                    Blood Group:

                    <span class="blood-pill">
                        O+
                    </span>

                    <br />

                    Donor ID:

                    <strong>
                        #BC-9842A
                    </strong>

                </div>

            </div>


            <!-- ELIGIBILITY -->

            <div class="card">

                <h3>Eligibility Status</h3>

                <div class="eligible-banner">

                    <div class="eligible-title">
                        ✅ Verified Eligible
                    </div>

                    <div class="eligible-subtitle">
                        Based on your last donation
                    </div>

                </div>


                <div class="eligibility-point">
                    ✅ 56 days passed since last whole blood donation.
                </div>


                <div class="eligibility-point">
                    ✅ No recent travel warnings.
                </div>

            </div>

        </div>

    </div>

</asp:Content>