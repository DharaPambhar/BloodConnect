
<%@ Page Title="Emergency Blood Request" Language="C#" MasterPageFile="~/User.Master"
    AutoEventWireup="true"
    CodeBehind="User_NearbyEmergency.aspx.cs"
    Inherits="BloodConnect.User_NearbyEmergency" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>

    .emergency-page {
        width: 100%;
    }

    /* ================= ALERT BANNER ================= */

    .emergency-alert {
        background: #FFF0F2;
        border: 1px solid #F1C5CC;
        border-left: 4px solid #A52D42;
        border-radius: 11px;
        padding: 14px 16px;
        display: flex;
        align-items: flex-start;
        gap: 11px;
        margin-bottom: 20px;
    }

    .alert-icon {
        width: 30px;
        height: 30px;
        border-radius: 50%;
        background: #F7DCE1;
        color: #A52D42;
        display: flex;
        align-items: center;
        justify-content: center;
        flex-shrink: 0;
    }

    .alert-title {
        color: #8D263A;
        font-size: 11px;
        font-weight: bold;
        margin-bottom: 4px;
    }

    .alert-text {
        color: #795F66;
        font-size: 9px;
        line-height: 1.6;
    }


    /* ================= PAGE HEADER ================= */

    .page-header {
        background: #FFFFFF;
        border: 1px solid #E5E7EB;
        border-radius: 15px;
        padding: 20px 22px;
        margin-bottom: 18px;
    }

    .page-header-row {
        display: flex;
        justify-content: space-between;
        align-items: center;
        gap: 15px;
    }

    .page-title h1 {
        margin: 0 0 6px 0;
        color: #302D35;
        font-size: 23px;
    }

    .page-title p {
        margin: 0;
        color: #7E7885;
        font-size: 10px;
    }

    .cancel-btn {
        background: #FFFFFF;
        border: 1px solid #C9C3CF;
        color: #5F5866;
        border-radius: 8px;
        padding: 9px 17px;
        text-decoration: none;
        font-size: 10px;
        font-weight: bold;
        white-space: nowrap;
    }

    .cancel-btn:hover {
        color: #8F2638;
        border-color: #8F2638;
    }


    /* ================= MAIN LAYOUT ================= */

    .main-layout {
        display: grid;
        grid-template-columns: minmax(0, 1fr) 285px;
        gap: 18px;
        align-items: start;
    }


    /* ================= FORM CARD ================= */

    .form-card {
        background: #FFFFFF;
        border: 1px solid #E5E7EB;
        border-radius: 15px;
        padding: 21px;
    }

    .section {
        padding-bottom: 21px;
        margin-bottom: 21px;
        border-bottom: 1px solid #EEEAF1;
    }

    .section:last-child {
        border-bottom: none;
        margin-bottom: 0;
        padding-bottom: 0;
    }

    .section-title {
        display: flex;
        align-items: center;
        gap: 9px;
        margin-bottom: 17px;
    }

    .section-number {
        width: 25px;
        height: 25px;
        border-radius: 50%;
        background: #F4E7F8;
        color: #684BA2;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 10px;
        font-weight: bold;
    }

    .section-title h2 {
        margin: 0;
        color: #302D35;
        font-size: 14px;
    }


    /* ================= FORM ================= */

    .form-grid {
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr));
        gap: 15px;
    }

    .form-group {
        margin-bottom: 2px;
    }

    .form-group.full {
        grid-column: 1 / -1;
    }

    .form-label {
        display: block;
        color: #5F5966;
        font-size: 9px;
        font-weight: bold;
        margin-bottom: 6px;
    }

    .required {
        color: #A52D42;
    }

    .form-control-custom,
    .form-select-custom {
        width: 100%;
        height: 38px;
        border: 1px solid #D8D2DD;
        border-radius: 7px;
        background: #FFFFFF;
        color: #403B45;
        padding: 0 11px;
        font-size: 10px;
        box-sizing: border-box;
        outline: none;
    }

    .form-control-custom:focus,
    .form-select-custom:focus {
        border-color: #9B6BC5;
        box-shadow: 0 0 0 2px #F2EAF8;
    }


    /* ================= UNIT COUNTER ================= */

    .unit-counter {
        display: flex;
        align-items: center;
        width: 145px;
        height: 38px;
        border: 1px solid #D8D2DD;
        border-radius: 7px;
        overflow: hidden;
    }

    .unit-btn {
        width: 38px;
        height: 100%;
        border: none;
        background: #F7F4F9;
        color: #8F2638;
        font-size: 14px;
        font-weight: bold;
        cursor: pointer;
    }

    .unit-number {
        flex: 1;
        text-align: center;
        color: #403B45;
        font-size: 12px;
        font-weight: bold;
    }


    /* ================= URGENCY ================= */

    .urgency-options {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 8px;
    }

    .urgency-option {
        border: 1px solid #D8D2DD;
        border-radius: 8px;
        padding: 10px 8px;
        text-align: center;
        color: #6B6570;
        font-size: 9px;
    }

    .urgency-option small {
        display: block;
        margin-top: 3px;
        color: #96909A;
        font-size: 7px;
    }

    .urgency-option.selected {
        background: #FFF0F2;
        border-color: #A52D42;
        color: #8F2638;
        font-weight: bold;
    }

    .urgency-option.selected small {
        color: #A52D42;
    }


    /* ================= RIGHT CARDS ================= */

    .side-card {
        background: #FFFFFF;
        border: 1px solid #E5E7EB;
        border-radius: 15px;
        padding: 18px;
        margin-bottom: 15px;
    }

    .side-card-title {
        display: flex;
        align-items: center;
        gap: 8px;
        color: #302D35;
        font-size: 13px;
        font-weight: bold;
        margin-bottom: 16px;
        padding-bottom: 12px;
        border-bottom: 1px solid #EEEAF1;
    }

    .side-card-title i {
        color: #8F2638;
    }


    /* ================= SUMMARY ================= */

    .summary-row {
        display: flex;
        justify-content: space-between;
        gap: 12px;
        padding: 9px 0;
        border-bottom: 1px solid #F0EDF2;
    }

    .summary-row:last-of-type {
        border-bottom: none;
    }

    .summary-label {
        color: #817B87;
        font-size: 9px;
    }

    .summary-value {
        color: #403B45;
        font-size: 9px;
        font-weight: 600;
        text-align: right;
    }

    .blood-pill {
        background: #F8E1E6;
        color: #922A40;
        border-radius: 14px;
        padding: 5px 9px;
        font-weight: bold;
    }

    .emergency-pill {
        background: #FFE7E9;
        color: #A52D42;
        border-radius: 14px;
        padding: 5px 9px;
        font-weight: bold;
    }


    /* ================= ESTIMATED REACH ================= */

    .reach-box {
        background: #F7F2FB;
        border: 1px solid #E6DDF0;
        border-radius: 10px;
        padding: 14px;
        margin-top: 15px;
        text-align: center;
    }

    .reach-label {
        color: #756D80;
        font-size: 8px;
        font-weight: bold;
        letter-spacing: .5px;
        margin-bottom: 5px;
    }

    .reach-number {
        color: #684BA2;
        font-size: 25px;
        font-weight: bold;
        margin-bottom: 4px;
    }

    .reach-text {
        color: #716A7A;
        font-size: 8px;
        line-height: 1.5;
    }


    /* ================= PRIVACY ================= */

    .privacy-card {
        background: #F8FAFC;
        border: 1px solid #E0E5EB;
    }

    .privacy-icon {
        width: 32px;
        height: 32px;
        border-radius: 50%;
        background: #E9EEF4;
        color: #60758B;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-bottom: 10px;
    }

    .privacy-text {
        color: #68727C;
        font-size: 9px;
        line-height: 1.7;
    }


    /* ================= SUBMIT ================= */

    .submit-area {
        margin-top: 18px;
        background: #FFFFFF;
        border: 1px solid #E5E7EB;
        border-radius: 15px;
        padding: 15px 18px;
        display: flex;
        justify-content: flex-end;
        gap: 9px;
    }

    .submit-btn {
        background: #8F2638;
        color: #FFFFFF;
        border: 1px solid #8F2638;
        border-radius: 8px;
        padding: 10px 18px;
        font-size: 10px;
        font-weight: bold;
        cursor: pointer;
    }

    .submit-btn:hover {
        background: #751D2D;
    }


    /* ================= RESPONSIVE ================= */

    @media (max-width: 950px) {

        .main-layout {
            grid-template-columns: 1fr;
        }

    }

    @media (max-width: 650px) {

        .page-header-row {
            flex-direction: column;
            align-items: flex-start;
        }

        .form-grid {
            grid-template-columns: 1fr;
        }

        .form-group.full {
            grid-column: auto;
        }

        .urgency-options {
            grid-template-columns: 1fr;
        }

        .submit-area {
            flex-direction: column;
        }

        .submit-btn,
        .cancel-btn {
            text-align: center;
            width: 100%;
            box-sizing: border-box;
        }

    }

</style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

<div class="emergency-page">


    <!-- ================= EMERGENCY ALERT ================= -->

    <div class="emergency-alert">

        <div class="alert-icon">

            <i class="fa-solid fa-triangle-exclamation"></i>

        </div>

        <div>

            <div class="alert-title">
                Emergency Blood Request
            </div>

            <div class="alert-text">
                Use this request when blood is urgently needed within the
                next 24-48 hours. This will trigger immediate notifications
                to matching verified donors in your radius.
            </div>

        </div>

    </div>


    <!-- ================= PAGE HEADER ================= -->

    <div class="page-header">

        <div class="page-header-row">

            <div class="page-title">

                <h1>
                    Create an Emergency Request
                </h1>

                <p>
                    Please provide accurate details to help us find the right donor quickly.
                </p>

            </div>


            <a href="User_Dashboard.aspx"
               class="cancel-btn">

                <i class="fa-solid fa-xmark"></i>

                Cancel

            </a>

        </div>

    </div>


    <!-- ================= MAIN CONTENT ================= -->

    <div class="main-layout">


        <!-- ================= FORM ================= -->

        <div>

            <div class="form-card">


                <!-- ================= BLOOD REQUIREMENT ================= -->

                <div class="section">

                    <div class="section-title">

                        <span class="section-number">
                            1
                        </span>

                        <h2>
                            Blood Requirement
                        </h2>

                    </div>


                    <div class="form-grid">


                        <!-- BLOOD GROUP -->

                        <div class="form-group">

                            <label class="form-label">
                                Blood Group Required
                                <span class="required">*</span>
                            </label>

                            <asp:DropDownList
                                ID="ddlBloodGroup"
                                runat="server"
                                CssClass="form-select-custom">

                                <asp:ListItem Text="O+" Value="O+" />
                                <asp:ListItem Text="O-" Value="O-" />
                                <asp:ListItem Text="A+" Value="A+" />
                                <asp:ListItem Text="A-" Value="A-" />
                                <asp:ListItem Text="B+" Value="B+" />
                                <asp:ListItem Text="B-" Value="B-" />
                                <asp:ListItem Text="AB+" Value="AB+" />
                                <asp:ListItem Text="AB-" Value="AB-" />

                            </asp:DropDownList>

                        </div>


                        <!-- UNITS -->

                        <div class="form-group">

                            <label class="form-label">
                                Required Units
                                <span class="required">*</span>
                            </label>

                            <div class="unit-counter">

                                <button type="button"
                                        class="unit-btn">
                                    −
                                </button>

                                <span class="unit-number">
                                    2
                                </span>

                                <button type="button"
                                        class="unit-btn">
                                    +
                                </button>

                            </div>

                        </div>


                        <!-- URGENCY -->

                        <div class="form-group full">

                            <label class="form-label">
                                Urgency Level
                                <span class="required">*</span>
                            </label>


                            <div class="urgency-options">


                                <div class="urgency-option">

                                    Normal

                                    <small>
                                        2-4 Days
                                    </small>

                                </div>


                                <div class="urgency-option">

                                    Urgent

                                    <small>
                                        Within 24h
                                    </small>

                                </div>


                                <div class="urgency-option selected">

                                    <i class="fa-solid fa-triangle-exclamation"></i>

                                    Emergency

                                    <small>
                                        Immediate
                                    </small>

                                </div>


                            </div>

                        </div>


                        <!-- DATE -->

                        <div class="form-group">

                            <label class="form-label">
                                Required Date
                                <span class="required">*</span>
                            </label>

                            <asp:TextBox
                                ID="txtRequiredDate"
                                runat="server"
                                CssClass="form-control-custom"
                                Text="05/15/2024">
                            </asp:TextBox>

                        </div>


                        <!-- TIME -->

                        <div class="form-group">

                            <label class="form-label">
                                Required Time
                                <span class="required">*</span>
                            </label>

                            <asp:TextBox
                                ID="txtRequiredTime"
                                runat="server"
                                CssClass="form-control-custom"
                                Text="10:00 AM">
                            </asp:TextBox>

                        </div>

                    </div>

                </div>


                <!-- ================= PATIENT INFORMATION ================= -->

                <div class="section">

                    <div class="section-title">

                        <span class="section-number">
                            2
                        </span>

                        <h2>
                            Patient Information
                        </h2>

                    </div>


                    <div class="form-grid">

                        <div class="form-group full">

                            <label class="form-label">
                                Patient Name
                                <span class="required">*</span>
                            </label>

                            <asp:TextBox
                                ID="txtPatientName"
                                runat="server"
                                CssClass="form-control-custom"
                                Text="Rahul Shah">
                            </asp:TextBox>

                        </div>

                    </div>

                </div>


                <!-- ================= HOSPITAL ================= -->

                <div class="section">

                    <div class="section-title">

                        <span class="section-number">
                            3
                        </span>

                        <h2>
                            Hospital / Medical Facility
                        </h2>

                    </div>


                    <div class="form-grid">


                        <!-- HOSPITAL -->

                        <div class="form-group full">

                            <label class="form-label">
                                Hospital Name
                                <span class="required">*</span>
                            </label>

                            <asp:TextBox
                                ID="txtHospitalName"
                                runat="server"
                                CssClass="form-control-custom"
                                Text="CityCare Hospital">
                            </asp:TextBox>

                        </div>


                        <!-- AREA -->

                        <div class="form-group">

                            <label class="form-label">
                                Area / Locality
                                <span class="required">*</span>
                            </label>

                            <asp:TextBox
                                ID="txtArea"
                                runat="server"
                                CssClass="form-control-custom"
                                Text="Navrangpura">
                            </asp:TextBox>

                        </div>


                        <!-- CITY -->

                        <div class="form-group">

                            <label class="form-label">
                                City
                                <span class="required">*</span>
                            </label>

                            <asp:TextBox
                                ID="txtCity"
                                runat="server"
                                CssClass="form-control-custom"
                                Text="Ahmedabad">
                            </asp:TextBox>

                        </div>


                        <!-- STATE -->

                        <div class="form-group">

                            <label class="form-label">
                                State
                                <span class="required">*</span>
                            </label>

                            <asp:TextBox
                                ID="txtState"
                                runat="server"
                                CssClass="form-control-custom"
                                Text="Gujarat">
                            </asp:TextBox>

                        </div>

                    </div>

                </div>

            </div>


            <!-- ================= SUBMIT ================= -->

            <div class="submit-area">

                <a href="User_Dashboard.aspx"
                   class="cancel-btn">

                    Cancel

                </a>


                <asp:Button
                    ID="btnCreateEmergency"
                    runat="server"
                    Text="Create Emergency Request"
                    CssClass="submit-btn"
                    OnClick="btnCreateEmergency_Click" />

            </div>

        </div>


        <!-- ================= RIGHT SIDEBAR ================= -->

        <div>


            <!-- ================= REQUEST SUMMARY ================= -->

            <div class="side-card">

                <div class="side-card-title">

                    <i class="fa-solid fa-clipboard-list"></i>

                    Request Summary

                </div>


                <div class="summary-row">

                    <span class="summary-label">
                        Blood Group
                    </span>

                    <span class="summary-value">

                        <span class="blood-pill">
                            O+
                        </span>

                    </span>

                </div>


                <div class="summary-row">

                    <span class="summary-label">
                        Units Needed
                    </span>

                    <span class="summary-value">
                        2 Units
                    </span>

                </div>


                <div class="summary-row">

                    <span class="summary-label">
                        Urgency
                    </span>

                    <span class="summary-value">

                        <span class="emergency-pill">

                            ! Emergency

                        </span>

                    </span>

                </div>


                <div class="summary-row">

                    <span class="summary-label">
                        Required By
                    </span>

                    <span class="summary-value">
                        Today, 10:00 AM
                    </span>

                </div>


                <div class="summary-row">

                    <span class="summary-label">
                        Location
                    </span>

                    <span class="summary-value">
                        CityCare Hospital,<br />
                        Navrangpura,<br />
                        Ahmedabad
                    </span>

                </div>


                <!-- ESTIMATED REACH -->

                <div class="reach-box">

                    <div class="reach-label">
                        ESTIMATED REACH
                    </div>

                    <div class="reach-number">
                        ~45
                    </div>

                    <div class="reach-text">
                        potential verified O+ donors in a
                        10km radius will be notified instantly.
                    </div>

                </div>

            </div>


            <!-- ================= PRIVACY ================= -->

            <div class="side-card privacy-card">

                <div class="privacy-icon">

                    <i class="fa-solid fa-lock"></i>

                </div>


                <div class="side-card-title"
                     style="border-bottom:none;
                            padding-bottom:0;
                            margin-bottom:9px;">

                    Privacy & Security

                </div>


                <div class="privacy-text">

                    Your exact contact details are kept private
                    until a donor accepts your request. Only your
                    first name and required hospital area are
                    visible initially.

                </div>

            </div>

        </div>

    </div>

</div>

</asp:Content>
