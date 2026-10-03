<%@ Page Title="Find Blood" Language="C#" MasterPageFile="~/Site1.Master"
    AutoEventWireup="true" CodeBehind="FindBlood.aspx.cs"
    Inherits="WebApplication1.FindBlood" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        /* =========================
           FIND BLOOD HERO
        ========================= */

        .find-hero {
            background: linear-gradient(135deg, #FFF5F7, #FFECEF);
            padding: 70px 8%;
            text-align: center;
        }

        .find-tag {
            color: #D80032;
            font-size: 14px;
            font-weight: bold;
            letter-spacing: 1px;
            margin-bottom: 12px;
        }

        .find-hero h1 {
            font-size: 46px;
            margin: 10px 0;
            color: #1F2937;
        }

        .find-hero p {
            color: #6B7280;
            font-size: 18px;
            max-width: 750px;
            margin: 0 auto 30px auto;
            line-height: 1.6;
        }


        /* =========================
           SEARCH BOX
        ========================= */

        .search-box {
            background-color: #FFFFFF;
            max-width: 1100px;
            margin: 35px auto 0 auto;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.06);
            display: flex;
            gap: 15px;
            align-items: end;
            justify-content: center;
            flex-wrap: wrap;
        }

        .search-field {
            text-align: left;
            min-width: 180px;
            flex: 1;
        }

        .search-field label {
            display: block;
            font-size: 13px;
            font-weight: bold;
            color: #374151;
            margin-bottom: 7px;
        }

        .search-field select,
        .search-field input {
            width: 100%;
            box-sizing: border-box;
            padding: 12px;
            border: 1px solid #D1D5DB;
            border-radius: 6px;
            background-color: #FFFFFF;
            font-size: 14px;
        }

        .search-button {
            background-color: #3B62F6;
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 6px;
            font-size: 14px;
            cursor: pointer;
            height: 42px;
        }

        .search-button:hover {
            background-color: #2F52D9;
        }


        /* =========================
           AVAILABLE BLOOD
        ========================= */

        .section {
            background-color: #F8F9FA;
            padding: 60px 8%;
        }

        .section-title {
            text-align: center;
            color: #1F2937;
            font-size: 32px;
            margin-bottom: 10px;
        }

        .section-subtitle {
            text-align: center;
            color: #6B7280;
            margin-bottom: 35px;
        }


        /* =========================
           STATS
        ========================= */

        .stats {
            display: flex;
            justify-content: center;
            gap: 25px;
            margin-bottom: 40px;
            flex-wrap: wrap;
        }

        .stat-box {
            background-color: #FFFFFF;
            width: 180px;
            padding: 22px;
            border-radius: 10px;
            text-align: center;
            border: 1px solid #E5E7EB;
        }

        .stat-number {
            color: #D80032;
            font-size: 30px;
            font-weight: bold;
        }

        .stat-text {
            color: #6B7280;
            font-size: 13px;
            margin-top: 5px;
        }


        /* =========================
           BLOOD CARDS
        ========================= */

        .blood-cards {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 25px;
            max-width: 1100px;
            margin: auto;
        }

        .blood-card {
            background-color: #FFFFFF;
            padding: 25px;
            border-radius: 12px;
            border: 1px solid #E5E7EB;
            box-shadow: 0 3px 10px rgba(0,0,0,0.04);
        }

        .blood-group {
            font-size: 30px;
            font-weight: bold;
            color: #D80032;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .available {
            color: #15803D;
            font-size: 12px;
            background-color: #DCFCE7;
            padding: 5px 9px;
            border-radius: 20px;
        }

        .limited {
            color: #B45309;
            font-size: 12px;
            background-color: #FEF3C7;
            padding: 5px 9px;
            border-radius: 20px;
        }

        .card-info {
            color: #6B7280;
            font-size: 14px;
            line-height: 1.7;
            margin: 18px 0;
        }

        .card-buttons {
            display: flex;
            gap: 10px;
        }

        .view-btn {
            background-color: #D80032;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 13px;
        }

        .contact-btn {
            background-color: #FFFFFF;
            color: #374151;
            border: 1px solid #D1D5DB;
            padding: 10px 15px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 13px;
        }


        /* =========================
           MAP SECTION
        ========================= */

        .map-section {
            background-color: #F3F4F6;
            padding: 60px 8%;
            text-align: center;
        }

        .map-box {
            max-width: 1100px;
            height: 350px;
            margin: 30px auto;
            background-color: #FFFFFF;
            border-radius: 12px;
            overflow: hidden;
            border: 1px solid #E5E7EB;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        }

        .map-box iframe {
            width: 100%;
            height: 100%;
            border: 0;
            display: block;
        }

        .map-buttons {
            display: flex;
            justify-content: center;
            gap: 12px;
            flex-wrap: wrap;
        }

        .location-btn {
            background-color: #3B62F6;
            color: white;
            border: none;
            padding: 12px 22px;
            border-radius: 6px;
            cursor: pointer;
        }

        .banks-btn {
            background-color: #DCEEFF;
            color: #2563EB;
            border: none;
            padding: 12px 22px;
            border-radius: 6px;
            cursor: pointer;
        }


        /* =========================
           GUIDELINES
        ========================= */

        .guidelines {
            background-color: #FFFFFF;
            padding: 60px 8%;
        }

        .guideline-cards {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 25px;
            max-width: 1100px;
            margin: auto;
        }

        .guideline-card {
            padding: 25px;
            border: 1px solid #E5E7EB;
            border-radius: 10px;
            background-color: #FFFFFF;
        }

        .step-number {
            color: #D80032;
            font-size: 24px;
            font-weight: bold;
        }

        .guideline-card h3 {
            color: #1F2937;
            margin: 12px 0;
        }

        .guideline-card p {
            color: #6B7280;
            font-size: 14px;
            line-height: 1.6;
        }


        /* =========================
           EMERGENCY
        ========================= */

        .emergency {
            background: linear-gradient(
                90deg,
                #FFE5EA,
                #FFFFFF,
                #FFE5EA
            );
            padding: 60px 8%;
            text-align: center;
        }

        .emergency-tag {
            color: #D80032;
            font-weight: bold;
            font-size: 13px;
            letter-spacing: 1px;
        }

        .emergency h2 {
            color: #1F2937;
            font-size: 34px;
            margin: 12px 0;
        }

        .emergency p {
            color: #6B7280;
            max-width: 700px;
            margin: 0 auto 25px auto;
            line-height: 1.6;
        }

        .emergency-buttons {
            display: flex;
            justify-content: center;
            gap: 12px;
            flex-wrap: wrap;
        }

        .create-btn {
            background-color: #D80032;
            color: white;
            border: none;
            padding: 12px 22px;
            border-radius: 6px;
            cursor: pointer;
        }

        .requests-btn {
            background-color: #FFFFFF;
            color: #D80032;
            border: 1px solid #D80032;
            padding: 12px 22px;
            border-radius: 6px;
            cursor: pointer;
        }


        /* =========================
           RESPONSIVE
        ========================= */

        @media (max-width: 900px) {

            .blood-cards,
            .guideline-cards {
                grid-template-columns: 1fr;
            }

            .find-hero h1 {
                font-size: 38px;
            }

        }

        @media (max-width: 600px) {

            .find-hero {
                padding: 50px 20px;
            }

            .find-hero h1 {
                font-size: 32px;
            }

            .section,
            .map-section,
            .guidelines,
            .emergency {
                padding: 45px 20px;
            }

            .search-box {
                padding: 20px;
            }

            .search-field {
                width: 100%;
                min-width: 100%;
            }

            .search-button {
                width: 100%;
            }

            .map-box {
                height: 280px;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- =========================
         FIND BLOOD HERO
    ========================= -->

    <section class="find-hero">

        <div class="find-tag">
            FIND BLOOD
        </div>

        <h1>
            Find the Blood You Need.
        </h1>

        <p>
            Search for available blood donors and blood banks near you
            using your blood group and location.
        </p>


        <!-- SEARCH -->

        <div class="search-box">

            <div class="search-field">

                <label>
                    Blood Group
                </label>

                <asp:DropDownList
                    ID="ddlBloodGroup"
                    runat="server">

                    <asp:ListItem>
                        Any
                    </asp:ListItem>

                    <asp:ListItem>
                        A+
                    </asp:ListItem>

                    <asp:ListItem>
                        A-
                    </asp:ListItem>

                    <asp:ListItem>
                        B+
                    </asp:ListItem>

                    <asp:ListItem>
                        B-
                    </asp:ListItem>

                    <asp:ListItem>
                        O+
                    </asp:ListItem>

                    <asp:ListItem>
                        O-
                    </asp:ListItem>

                    <asp:ListItem>
                        AB+
                    </asp:ListItem>

                    <asp:ListItem>
                        AB-
                    </asp:ListItem>

                </asp:DropDownList>

            </div>


            <div class="search-field">

                <label>
                    Location
                </label>

                <asp:TextBox
                    ID="txtLocation"
                    runat="server"
                    placeholder="Enter City">
                </asp:TextBox>

            </div>


            <div class="search-field">

                <label>
                    Search Radius
                </label>

                <asp:DropDownList
                    ID="ddlRadius"
                    runat="server">

                    <asp:ListItem>
                        5km
                    </asp:ListItem>

                    <asp:ListItem>
                        10km
                    </asp:ListItem>

                    <asp:ListItem>
                        25km
                    </asp:ListItem>

                    <asp:ListItem>
                        50km
                    </asp:ListItem>

                </asp:DropDownList>

            </div>


            <div class="search-field">

                <label>
                    Availability
                </label>

                <asp:DropDownList
                    ID="ddlAvailability"
                    runat="server">

                    <asp:ListItem>
                        Available Now
                    </asp:ListItem>

                    <asp:ListItem>
                        All
                    </asp:ListItem>

                </asp:DropDownList>

            </div>


            <asp:Button
                ID="btnSearch"
                runat="server"
                Text="Search Blood"
                CssClass="search-button" />

        </div>

    </section>


    <!-- =========================
         AVAILABLE BLOOD
    ========================= -->

    <section class="section">

        <h2 class="section-title">
            Available Blood Near You
        </h2>

        <p class="section-subtitle">
            Find available donors and blood banks in your area.
        </p>


        <div class="stats">

            <div class="stat-box">

                <div class="stat-number">
                    12
                </div>

                <div class="stat-text">
                    Nearby Donors
                </div>

            </div>


            <div class="stat-box">

                <div class="stat-number">
                    8
                </div>

                <div class="stat-text">
                    Blood Banks
                </div>

            </div>


            <div class="stat-box">

                <div class="stat-number">
                    24
                </div>

                <div class="stat-text">
                    Available Units
                </div>

            </div>

        </div>


        <div class="blood-cards">


            <!-- CARD 1 -->

            <div class="blood-card">

                <div class="blood-group">

                    O+

                    <span class="available">
                        Available
                    </span>

                </div>

                <div class="card-info">

                    <strong>
                        Location:
                    </strong>
                    City Care Hospital (0.8 km away)

                    <br />

                    <strong>
                        Quantity:
                    </strong>
                    4 Units

                </div>

                <div class="card-buttons">

                    <button class="view-btn">
                        View Details
                    </button>

                    <button class="contact-btn">
                        Contact
                    </button>

                </div>

            </div>


            <!-- CARD 2 -->

            <div class="blood-card">

                <div class="blood-group">

                    A+

                    <span class="available">
                        Available
                    </span>

                </div>

                <div class="card-info">

                    <strong>
                        Location:
                    </strong>
                    Sunrise Blood Bank (1.2 km away)

                    <br />

                    <strong>
                        Quantity:
                    </strong>
                    7 Units

                </div>

                <div class="card-buttons">

                    <button class="view-btn">
                        View Details
                    </button>

                    <button class="contact-btn">
                        Contact
                    </button>

                </div>

            </div>


            <!-- CARD 3 -->

            <div class="blood-card">

                <div class="blood-group">

                    B+

                    <span class="limited">
                        Limited
                    </span>

                </div>

                <div class="card-info">

                    <strong>
                        Location:
                    </strong>
                    Community Blood Center (2.5 km away)

                    <br />

                    <strong>
                        Quantity:
                    </strong>
                    2 Units

                </div>

                <div class="card-buttons">

                    <button class="view-btn">
                        View Details
                    </button>

                    <button class="contact-btn">
                        Contact
                    </button>

                </div>

            </div>

        </div>

    </section>


    <!-- =========================
         MAP
    ========================= -->

    <section class="map-section">

        <h2 class="section-title">
            Find Blood Near You
        </h2>

        <p class="section-subtitle">
            Use our interactive map to locate nearby blood banks
            and ongoing donation camps easily.
        </p>


        <div class="map-box">

            <iframe
                src="https://www.openstreetmap.org/export/embed.html?bbox=70.75%2C22.25%2C70.85%2C22.35&amp;layer=mapnik"
                width="100%"
                height="100%"
                loading="lazy">
            </iframe>

        </div>


        <div class="map-buttons">

            <button class="location-btn">
                Use My Location
            </button>

            <button class="banks-btn">
                View All Blood Banks
            </button>

        </div>

    </section>


    <!-- =========================
         BEFORE REQUEST
    ========================= -->

    <section class="guidelines">

        <h2 class="section-title">
            Before You Request Blood
        </h2>

        <p class="section-subtitle">
            Important steps to ensure a smooth process.
        </p>


        <div class="guideline-cards">


            <!-- STEP 1 -->

            <div class="guideline-card">

                <div class="step-number">
                    01
                </div>

                <h3>
                    Know Your Blood Group
                </h3>

                <p>
                    Ensure you have medical confirmation of the exact
                    blood type required before making a request.
                </p>

            </div>


            <!-- STEP 2 -->

            <div class="guideline-card">

                <div class="step-number">
                    02
                </div>

                <h3>
                    Check Nearby Availability
                </h3>

                <p>
                    Always check local blood banks first using our
                    search tool to save time during emergencies.
                </p>

            </div>


            <!-- STEP 3 -->

            <div class="guideline-card">

                <div class="step-number">
                    03
                </div>

                <h3>
                    Emergency Cases
                </h3>

                <p>
                    For critical, life-threatening situations, use the
                    emergency request feature to alert donors immediately.
                </p>

            </div>

        </div>

    </section>


    <!-- =========================
         EMERGENCY CTA
    ========================= -->

    <section class="emergency">

        <div class="emergency-tag">
            NEED BLOOD URGENTLY?
        </div>

        <h2>
            Can't Find the Blood You Need?
        </h2>

        <p>
            Broadcast an emergency request to registered donors
            in your area. Every second counts.
        </p>


        <div class="emergency-buttons">

            <button class="create-btn">
                Create Emergency Request
            </button>

            <button class="requests-btn">
                View Emergency Requests
            </button>

        </div>

    </section>

</asp:Content>