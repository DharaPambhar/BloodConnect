
<%@ Page Title="Smart Donor Search" Language="C#" MasterPageFile="~/User.Master"
    AutoEventWireup="true" CodeBehind="User_DonorSearch.aspx.cs"
    Inherits="BloodConnect.User_DonorSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .search-page {
            padding: 28px;
            background: #f8f7fb;
            min-height: calc(100vh - 70px);
        }

        .page-title {
            font-size: 28px;
            font-weight: 700;
            color: #2d2d35;
            margin-bottom: 5px;
        }

        .page-subtitle {
            color: #777783;
            font-size: 14px;
            margin-bottom: 25px;
        }

        /* Hero */
        .search-hero {
            background: linear-gradient(135deg, #eee6ff, #f7f3ff);
            border: 1px solid #e4d9fa;
            border-radius: 18px;
            padding: 25px;
            display: flex;
            align-items: center;
            gap: 20px;
            margin-bottom: 24px;
        }

        .hero-icon {
            width: 62px;
            height: 62px;
            border-radius: 16px;
            background: #ffffff;
            color: #6d4bb5;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 27px;
            box-shadow: 0 4px 12px rgba(80, 50, 130, 0.08);
        }

        .hero-content h2 {
            margin: 0 0 7px;
            color: #35264f;
            font-size: 22px;
            font-weight: 700;
        }

        .hero-content p {
            margin: 0;
            color: #71697d;
            font-size: 14px;
            line-height: 1.6;
        }

        /* Main Grid */
        .main-grid {
            display: grid;
            grid-template-columns: minmax(0, 1fr) 320px;
            gap: 24px;
        }

        .card {
            background: #ffffff;
            border: 1px solid #ece9f1;
            border-radius: 17px;
            padding: 23px;
            box-shadow: 0 3px 12px rgba(40, 30, 60, 0.04);
        }

        .card-title {
            font-size: 18px;
            font-weight: 700;
            color: #302d38;
            margin-bottom: 5px;
        }

        .card-subtitle {
            font-size: 13px;
            color: #85818d;
            margin-bottom: 22px;
        }

        /* Filter Grid */
        .filter-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 18px;
        }

        .form-group {
            margin-bottom: 5px;
        }

        .form-label {
            display: block;
            font-size: 13px;
            font-weight: 600;
            color: #47434e;
            margin-bottom: 8px;
        }

        .required {
            color: #b52d3a;
        }

        .form-control-custom,
        .form-select-custom {
            width: 100%;
            height: 44px;
            border: 1px solid #ddd9e4;
            border-radius: 9px;
            padding: 0 13px;
            color: #3f3b46;
            background: #fff;
            font-size: 13px;
            outline: none;
        }

        .form-control-custom:focus,
        .form-select-custom:focus {
            border-color: #a98ad7;
        }

        .location-box {
            position: relative;
        }

        .location-box i {
            position: absolute;
            left: 13px;
            top: 15px;
            color: #a33b47;
            font-size: 14px;
        }

        .location-box input {
            padding-left: 36px;
        }

        /* Availability */
        .section-label {
            margin-top: 24px;
            margin-bottom: 11px;
            font-size: 14px;
            font-weight: 700;
            color: #3b3742;
        }

        .availability-options {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        .availability-btn {
            border: 1px solid #ded9e4;
            background: #fff;
            padding: 9px 17px;
            border-radius: 8px;
            font-size: 13px;
            color: #5f5a66;
        }

        .availability-btn.active {
            background: #f3dce4;
            border-color: #c95b72;
            color: #9d2945;
            font-weight: 600;
        }

        /* Smart Options */
        .smart-options {
            margin-top: 23px;
            border-top: 1px solid #eeeaf1;
            padding-top: 20px;
        }

        .smart-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 13px 0;
            border-bottom: 1px solid #f0edf3;
        }

        .smart-row:last-child {
            border-bottom: none;
        }

        .smart-text h4 {
            margin: 0 0 4px;
            font-size: 14px;
            color: #39353f;
        }

        .smart-text p {
            margin: 0;
            color: #8a8690;
            font-size: 12px;
        }

        .toggle {
            width: 44px;
            height: 24px;
            border-radius: 20px;
            background: #a92f43;
            position: relative;
            flex-shrink: 0;
        }

        .toggle::after {
            content: "";
            position: absolute;
            width: 18px;
            height: 18px;
            background: #fff;
            border-radius: 50%;
            right: 3px;
            top: 3px;
            box-shadow: 0 1px 4px rgba(0,0,0,0.2);
        }

        /* Action Buttons */
        .action-row {
            margin-top: 25px;
            display: flex;
            justify-content: flex-end;
            gap: 12px;
            padding-top: 20px;
            border-top: 1px solid #eeeaf1;
        }

        .reset-btn {
            border: 1px solid #bdb8c5;
            background: #fff;
            color: #5e5965;
            padding: 11px 19px;
            border-radius: 8px;
            font-size: 13px;
            text-decoration: none;
        }

        .find-btn {
            border: none;
            background: #8f2638;
            color: white;
            padding: 11px 21px;
            border-radius: 8px;
            font-size: 13px;
            text-decoration: none;
        }

        .find-btn:hover {
            background: #751d2d;
            color: white;
        }

        /* Emergency Card */
        .emergency-card {
            background: #fff5f6;
            border: 1px solid #f1d5da;
            border-radius: 16px;
            padding: 21px;
            margin-bottom: 20px;
        }

        .emergency-title {
            display: flex;
            align-items: center;
            gap: 8px;
            color: #8f2638;
            font-weight: 700;
            font-size: 16px;
            margin-bottom: 10px;
        }

        .emergency-title i {
            color: #c62d43;
        }

        .emergency-card p {
            color: #766b70;
            font-size: 12px;
            line-height: 1.6;
            margin-bottom: 16px;
        }

        .emergency-btn {
            display: block;
            text-align: center;
            background: #8f2638;
            color: #fff;
            padding: 10px;
            border-radius: 8px;
            font-size: 12px;
            text-decoration: none;
            font-weight: 600;
        }

        .emergency-btn:hover {
            background: #751d2d;
            color: white;
        }

        /* Recent Searches */
        .recent-card {
            margin-bottom: 20px;
        }

        .recent-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }

        .recent-header h3 {
            margin: 0;
            font-size: 17px;
            color: #35313b;
        }

        .clear-link {
            color: #a02e43;
            font-size: 12px;
            text-decoration: none;
        }

        .recent-item {
            border: 1px solid #ece9f0;
            border-radius: 10px;
            padding: 12px;
            margin-bottom: 10px;
            background: #fcfbfd;
        }

        .recent-top {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .blood-badge {
            width: 35px;
            height: 35px;
            border-radius: 8px;
            background: #f6dfe4;
            color: #a12c42;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
            font-weight: 700;
        }

        .recent-location {
            font-size: 12px;
            font-weight: 600;
            color: #48434e;
        }

        .recent-time {
            font-size: 11px;
            color: #99939f;
            margin-top: 3px;
        }

        /* How Smart Matching */
        .how-card {
            margin-top: 24px;
        }

        .steps {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 15px;
            margin-top: 20px;
        }

        .step {
            background: #faf9fc;
            border: 1px solid #ece9f1;
            border-radius: 12px;
            padding: 18px 14px;
            text-align: center;
        }

        .step-icon {
            width: 43px;
            height: 43px;
            border-radius: 50%;
            background: #eee5fa;
            color: #7151ae;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 12px;
            font-size: 17px;
        }

        .step-number {
            font-size: 10px;
            color: #a12e43;
            font-weight: 700;
            margin-bottom: 5px;
        }

        .step h4 {
            margin: 0 0 5px;
            font-size: 13px;
            color: #403b47;
        }

        .step p {
            margin: 0;
            font-size: 11px;
            color: #89848f;
            line-height: 1.5;
        }

        /* Responsive */
        @media (max-width: 1050px) {
            .main-grid {
                grid-template-columns: 1fr;
            }

            .filter-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .steps {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 650px) {
            .search-page {
                padding: 18px;
            }

            .filter-grid {
                grid-template-columns: 1fr;
            }

            .steps {
                grid-template-columns: 1fr;
            }

            .action-row {
                flex-direction: column;
            }

            .reset-btn,
            .find-btn {
                text-align: center;
            }
        }
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="search-page">

        <div class="page-title">Smart Donor Search</div>

        <div class="page-subtitle">
            Find potential blood donors quickly using smart filters and intelligent matching.
        </div>

        <!-- Hero Banner -->
        <div class="search-hero">

            <div class="hero-icon">
                <i class="fa-solid fa-user-magnifying-glass"></i>
            </div>

            <div class="hero-content">
                <h2>Smart Donor Search</h2>

                <p>
                    Find potential blood donors using smart filters based on blood group,
                    location, availability, and verification. Our system actively prioritizes
                    active donors to ensure faster response times.
                </p>
            </div>

        </div>


        <div class="main-grid">

            <!-- LEFT SIDE -->
            <div>

                <div class="card">

                    <div class="card-title">Search Preferences</div>

                    <div class="card-subtitle">
                        Set your requirements to find the most suitable blood donors.
                    </div>


                    <!-- Basic Search -->
                    <div class="filter-grid">

                        <div class="form-group">

                            <label class="form-label">
                                Required Blood Group <span class="required">*</span>
                            </label>

                            <asp:DropDownList ID="ddlBloodGroup"
                                runat="server"
                                CssClass="form-select-custom">

                                <asp:ListItem Text="Select Blood Group" Value=""></asp:ListItem>
                                <asp:ListItem Text="O+" Value="O+"></asp:ListItem>
                                <asp:ListItem Text="O-" Value="O-"></asp:ListItem>
                                <asp:ListItem Text="A+" Value="A+"></asp:ListItem>
                                <asp:ListItem Text="A-" Value="A-"></asp:ListItem>
                                <asp:ListItem Text="B+" Value="B+"></asp:ListItem>
                                <asp:ListItem Text="B-" Value="B-"></asp:ListItem>
                                <asp:ListItem Text="AB+" Value="AB+"></asp:ListItem>
                                <asp:ListItem Text="AB-" Value="AB-"></asp:ListItem>

                            </asp:DropDownList>

                        </div>


                        <div class="form-group">

                            <label class="form-label">
                                Search Location
                            </label>

                            <div class="location-box">

                                <i class="fa-solid fa-location-dot"></i>

                                <asp:TextBox ID="txtLocation"
                                    runat="server"
                                    CssClass="form-control-custom"
                                    Text="Ahmedabad, Gujarat">
                                </asp:TextBox>

                            </div>

                        </div>


                        <div class="form-group">

                            <label class="form-label">
                                Search Radius
                            </label>

                            <asp:DropDownList ID="ddlRadius"
                                runat="server"
                                CssClass="form-select-custom">

                                <asp:ListItem Text="Within 5 km" Value="5"></asp:ListItem>
                                <asp:ListItem Text="Within 10 km" Value="10" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="Within 25 km" Value="25"></asp:ListItem>
                                <asp:ListItem Text="Within 50 km" Value="50"></asp:ListItem>
                                <asp:ListItem Text="Within 100 km" Value="100"></asp:ListItem>

                            </asp:DropDownList>

                        </div>

                    </div>


                    <!-- Availability -->
                    <div class="section-label">
                        Donor Availability
                    </div>

                    <div class="availability-options">

                        <asp:LinkButton ID="btnAvailable"
                            runat="server"
                            CssClass="availability-btn active"
                            OnClick="btnAvailable_Click">
                            Available Now
                        </asp:LinkButton>

                        <asp:LinkButton ID="btnSoon"
                            runat="server"
                            CssClass="availability-btn"
                            OnClick="btnSoon_Click">
                            Soon
                        </asp:LinkButton>

                        <asp:LinkButton ID="btnAny"
                            runat="server"
                            CssClass="availability-btn"
                            OnClick="btnAny_Click">
                            Any
                        </asp:LinkButton>

                    </div>


                    <!-- Smart Filters -->
                    <div class="smart-options">

                        <div class="smart-row">

                            <div class="smart-text">

                                <h4>Verified Donors Only</h4>

                                <p>
                                    Only show donors with verified identity and medical history
                                </p>

                            </div>

                            <div class="toggle"></div>

                        </div>


                        <div class="smart-row">

                            <div class="smart-text">

                                <h4>Enable Smart Matching</h4>

                                <p>
                                    Automatically rank results by highest probability of successful donation
                                </p>

                            </div>

                            <div class="toggle"></div>

                        </div>

                    </div>


                    <!-- Actions -->
                    <div class="action-row">

                        <asp:LinkButton ID="btnReset"
                            runat="server"
                            CssClass="reset-btn"
                            OnClick="btnReset_Click">
                            Reset Filters
                        </asp:LinkButton>

                        <asp:Button ID="btnFindDonors"
                            runat="server"
                            Text="🔍 Find Donors"
                            CssClass="find-btn"
                            OnClick="btnFindDonors_Click" />

                    </div>

                </div>


                <!-- How Smart Matching -->
                <div class="card how-card">

                    <div class="card-title">
                        How Smart Matching Works
                    </div>

                    <div class="card-subtitle">
                        Our matching process helps you find suitable donors faster.
                    </div>


                    <div class="steps">

                        <div class="step">

                            <div class="step-icon">
                                <i class="fa-solid fa-droplet"></i>
                            </div>

                            <div class="step-number">STEP 01</div>

                            <h4>Choose Blood Group</h4>

                            <p>
                                Select the required blood type.
                            </p>

                        </div>


                        <div class="step">

                            <div class="step-icon">
                                <i class="fa-solid fa-location-dot"></i>
                            </div>

                            <div class="step-number">STEP 02</div>

                            <h4>Set Location</h4>

                            <p>
                                Define your preferred search area.
                            </p>

                        </div>


                        <div class="step">

                            <div class="step-icon">
                                <i class="fa-solid fa-sliders"></i>
                            </div>

                            <div class="step-number">STEP 03</div>

                            <h4>Apply Preferences</h4>

                            <p>
                                Filter donors by availability.
                            </p>

                        </div>


                        <div class="step">

                            <div class="step-icon">
                                <i class="fa-solid fa-users"></i>
                            </div>

                            <div class="step-number">STEP 04</div>

                            <h4>View Matches</h4>

                            <p>
                                Contact the best matching donors.
                            </p>

                        </div>

                    </div>

                </div>

            </div>


            <!-- RIGHT SIDE -->
            <div>

                <!-- Emergency -->
                <div class="emergency-card">

                    <div class="emergency-title">

                        <i class="fa-solid fa-circle-exclamation"></i>

                        Need Blood Urgently?

                    </div>

                    <p>
                        Bypass standard search and alert all nearby eligible donors immediately.
                    </p>

                    <a href="User_NearbyEmergency.aspx"
                       class="emergency-btn">
                        Create Emergency Request
                    </a>

                </div>


                <!-- Recent Searches -->
                <div class="card recent-card">

                    <div class="recent-header">

                        <h3>Recent Searches</h3>

                        <asp:LinkButton ID="btnClearRecent"
                            runat="server"
                            CssClass="clear-link"
                            OnClick="btnClearRecent_Click">
                            Clear
                        </asp:LinkButton>

                    </div>


                    <div class="recent-item">

                        <div class="recent-top">

                            <div class="blood-badge">
                                O+
                            </div>

                            <div>
                                <div class="recent-location">
                                    Ahmedabad, 10 km
                                </div>

                                <div class="recent-time">
                                    Yesterday
                                </div>
                            </div>

                        </div>

                    </div>


                    <div class="recent-item">

                        <div class="recent-top">

                            <div class="blood-badge">
                                A+
                            </div>

                            <div>
                                <div class="recent-location">
                                    Ahmedabad, 25 km
                                </div>

                                <div class="recent-time">
                                    3 Days Ago
                                </div>
                            </div>

                        </div>

                    </div>


                    <div class="recent-item">

                        <div class="recent-top">

                            <div class="blood-badge">
                                B+
                            </div>

                            <div>
                                <div class="recent-location">
                                    Gandhinagar, 5 km
                                </div>

                                <div class="recent-time">
                                    Last Week
                                </div>
                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</asp:Content>
