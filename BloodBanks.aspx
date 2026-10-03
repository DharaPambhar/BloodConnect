<%@ Page Title="Blood Banks" Language="C#" MasterPageFile="~/Site1.Master"
    AutoEventWireup="true" CodeBehind="BloodBanks.aspx.cs"
    Inherits="WebApplication1.BloodBanks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        /* =========================
           HERO SECTION
        ========================= */

        .bank-hero {
            background: linear-gradient(135deg, #FFF5F7, #FFECEF);
            padding: 70px 8%;
            text-align: center;
        }

        .bank-tag {
            color: #D80032;
            font-size: 14px;
            font-weight: bold;
            letter-spacing: 1px;
            margin-bottom: 12px;
        }

        .bank-hero h1 {
            font-size: 46px;
            color: #1F2937;
            margin: 10px 0 15px 0;
        }

        .bank-hero p {
            color: #6B7280;
            font-size: 18px;
            line-height: 1.6;
            max-width: 780px;
            margin: 0 auto 30px auto;
        }


        /* =========================
           SEARCH BOX
        ========================= */

        .bank-search {
            max-width: 1100px;
            margin: auto;
            background-color: #FFFFFF;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.06);

            display: flex;
            gap: 15px;
            align-items: end;
            justify-content: center;
            flex-wrap: wrap;
        }

        .bank-field {
            flex: 1;
            min-width: 190px;
            text-align: left;
        }

        .bank-field label {
            display: block;
            color: #374151;
            font-size: 13px;
            font-weight: bold;
            margin-bottom: 7px;
        }

        .bank-field input,
        .bank-field select {
            width: 100%;
            box-sizing: border-box;
            padding: 12px;
            border: 1px solid #D1D5DB;
            border-radius: 6px;
            background-color: #FFFFFF;
            color: #374151;
            font-size: 14px;
        }

        .search-bank-btn {
            background-color: #C90045;
            color: #FFFFFF;
            border: none;
            padding: 12px 24px;
            height: 42px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 600;
        }

        .search-bank-btn:hover {
            background-color: #A90039;
        }


        /* =========================
           RESULTS SECTION
        ========================= */

      .banks-section {
    background-color: #F3F4F6;
    padding: 60px 8%;
}
        .results-top {
            max-width: 1100px;
            margin: 0 auto 30px auto;

            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .results-count {
            color: #1F2937;
            font-size: 25px;
            font-weight: 600;
        }

        .sort-area {
            display: flex;
            align-items: center;
            gap: 8px;
            color: #6B7280;
            font-size: 14px;
        }

        .sort-area select {
            padding: 8px 12px;
            border: 1px solid #D1D5DB;
            border-radius: 6px;
            background-color: #FFFFFF;
            color: #374151;
        }


        /* =========================
           BLOOD BANK CARDS
        ========================= */

        .bank-list {
            max-width: 1100px;
            margin: auto;
            display: grid;
            gap: 20px;
        }

        .bank-card {
            background-color: #FFFFFF;
            border: 1px solid #E5E7EB;
            border-radius: 12px;
            padding: 25px;

            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 25px;

            box-shadow: 0 3px 10px rgba(0,0,0,0.04);
        }

        .bank-info {
            flex: 1;
        }

        .bank-info h2 {
            color: #1F2937;
            font-size: 22px;
            margin: 0 0 12px 0;
        }


        /* =========================
           TAGS
        ========================= */

        .bank-tags {
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
            margin-bottom: 14px;
        }

        .verified-tag {
            background-color: #DCFCE7;
            color: #15803D;
            padding: 6px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }

        .high-tag {
            background-color: #DCFCE7;
            color: #15803D;
            padding: 6px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }

        .limited-tag {
            background-color: #FEF3C7;
            color: #B45309;
            padding: 6px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }


        /* =========================
           BANK DETAILS
        ========================= */

        .bank-details {
            color: #6B7280;
            font-size: 14px;
            line-height: 1.8;
        }

        .bank-details strong {
            color: #374151;
        }

        .groups {
            margin-top: 8px;
        }

        .group-badge {
            display: inline-block;
            background-color: #F3F4F6;
            color: #374151;
            padding: 5px 9px;
            border-radius: 5px;
            margin-right: 5px;
            font-size: 12px;
        }


        /* =========================
           CARD BUTTONS
        ========================= */

        .bank-side {
            min-width: 190px;
            text-align: right;
        }

        .bank-buttons {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }

        .bank-view-btn {
            background-color: #FFFFFF;
            color: #374151;
            border: 1px solid #D1D5DB;
            padding: 10px 16px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 13px;
        }

        .direction-btn {
            background-color: #D80032;
            color: #FFFFFF;
            border: none;
            padding: 10px 16px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 13px;
            font-weight: 600;
        }

        .bank-view-btn:hover {
            color: #D80032;
            border-color: #D80032;
        }

        .direction-btn:hover {
            background-color: #B9002B;
        }


        /* =========================
           LOAD MORE
        ========================= */

        .load-more {
            text-align: center;
            margin-top: 35px;
        }

        .load-more-btn {
            background-color: #FFFFFF;
            color: #374151;
            border: 1px solid #D1D5DB;
            padding: 12px 25px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
        }

        .load-more-btn:hover {
            color: #D80032;
            border-color: #D80032;
        }


        /* =========================
           MAP SECTION
        ========================= */

        .network-map {
            background-color: #F3F4F6;
            padding: 60px 8%;
            text-align: center;
        }

        .network-map h2 {
            color: #1F2937;
            font-size: 32px;
            margin-bottom: 12px;
        }

        .network-map p {
            color: #6B7280;
            max-width: 760px;
            margin: 0 auto 30px auto;
            line-height: 1.6;
        }

        .map-box {
            max-width: 1100px;
            height: 350px;
            margin: 0 auto 25px auto;
            background-color: #FFFFFF;
            border: 1px solid #E5E7EB;
            border-radius: 12px;
            overflow: hidden;
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
            background-color: #333333;
            color: #FFFFFF;
            border: none;
            padding: 12px 22px;
            border-radius: 6px;
            cursor: pointer;
        }

        .full-map-btn {
            background-color: #FFFFFF;
            color: #374151;
            border: 1px solid #D1D5DB;
            padding: 12px 22px;
            border-radius: 6px;
            cursor: pointer;
        }

        .full-map-btn:hover {
            border-color: #D80032;
            color: #D80032;
        }


        /* =========================
           EMERGENCY SECTION
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
            font-size: 13px;
            font-weight: bold;
            letter-spacing: 1px;
        }

        .emergency h2 {
            color: #1F2937;
            font-size: 34px;
            margin: 12px 0;
        }

        .emergency p {
            color: #6B7280;
            max-width: 760px;
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
            color: #FFFFFF;
            border: none;
            padding: 12px 22px;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 600;
        }

        .open-requests-btn {
            background-color: #FFFFFF;
            color: #D80032;
            border: 1px solid #D80032;
            padding: 12px 22px;
            border-radius: 6px;
            cursor: pointer;
        }

        .create-btn:hover {
            background-color: #B9002B;
        }


        /* =========================
           RESPONSIVE
        ========================= */

        @media (max-width: 850px) {

            .bank-card {
                flex-direction: column;
                align-items: flex-start;
            }

            .bank-side {
                width: 100%;
                text-align: left;
            }

            .bank-buttons {
                justify-content: flex-start;
            }

        }

        @media (max-width: 650px) {

            .bank-hero {
                padding: 50px 20px;
            }

            .bank-hero h1 {
                font-size: 34px;
            }

            .bank-hero p {
                font-size: 16px;
            }

            .banks-section,
            .network-map,
            .emergency {
                padding: 45px 20px;
            }

            .bank-search {
                padding: 20px;
            }

            .bank-field {
                width: 100%;
                min-width: 100%;
            }

            .search-bank-btn {
                width: 100%;
            }

            .results-top {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }

            .results-count {
                font-size: 22px;
            }

            .map-box {
                height: 280px;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!-- =========================
         HERO
    ========================= -->

    <section class="bank-hero">

        <div class="bank-tag">
            BLOOD BANK NETWORK
        </div>

        <h1>
            Find a Blood Bank Near You
        </h1>

        <p>
            Locate verified blood banks in our network to check real-time
            availability of blood components and plan your donation.
        </p>


        <!-- SEARCH -->

        <div class="bank-search">


            <!-- LOCATION -->

            <div class="bank-field">

                <label>
                    Location
                </label>

                <asp:TextBox
                    ID="txtBankLocation"
                    runat="server"
                    placeholder="City">
                </asp:TextBox>

            </div>


            <!-- BLOOD GROUP -->

            <div class="bank-field">

                <label>
                    Blood Group
                </label>

                <asp:DropDownList
                    ID="ddlBankBloodGroup"
                    runat="server">

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


            <!-- DISTANCE -->

            <div class="bank-field">

                <label>
                    Distance
                </label>

                <asp:DropDownList
                    ID="ddlBankDistance"
                    runat="server">

                    <asp:ListItem>
                        Within 5 km
                    </asp:ListItem>

                    <asp:ListItem>
                        Within 10 km
                    </asp:ListItem>

                    <asp:ListItem>
                        Within 25 km
                    </asp:ListItem>

                    <asp:ListItem>
                        Within 50 km
                    </asp:ListItem>

                </asp:DropDownList>

            </div>


            <!-- SEARCH BUTTON -->

            <asp:Button
                ID="btnSearchBanks"
                runat="server"
                Text="Search Blood Banks"
                CssClass="search-bank-btn" />

        </div>

    </section>


    <!-- =========================
         RESULTS
    ========================= -->

    <section class="banks-section">


        <div class="results-top">

            <div class="results-count">
                24 Blood Banks Found
            </div>

            <div class="sort-area">

                <span>
                    Distance:
                </span>

                <select>

                    <option>
                        Nearest First
                    </option>

                </select>

            </div>

        </div>


        <div class="bank-list">


            <!-- =========================
                 BLOOD BANK 1
            ========================= -->

            <div class="bank-card">

                <div class="bank-info">

                    <h2>
                        City Central Blood Bank
                    </h2>


                    <div class="bank-tags">

                        <span class="verified-tag">
                            Verified Center
                        </span>

                        <span class="high-tag">
                            High Availability
                        </span>

                    </div>


                    <div class="bank-details">

                        <strong>
                            Address:
                        </strong>
                        124 Healthcare Avenue, Medical District
                        (2.4 km away)

                        <br />

                        <strong>
                            Time:
                        </strong>
                        Open 24/7

                        <br />

                        <strong>
                            Contact:
                        </strong>
                        +1 (555) 123-4567

                        <div class="groups">

                            <strong>
                                Available Groups:
                            </strong>

                            <span class="group-badge">
                                A+
                            </span>

                            <span class="group-badge">
                                O+
                            </span>

                            <span class="group-badge">
                                B-
                            </span>

                            <span class="group-badge">
                                +3 more
                            </span>

                        </div>

                    </div>

                </div>


                <div class="bank-side">

                    <div class="bank-buttons">

                        <button class="bank-view-btn">
                            View Details
                        </button>

                        <button class="direction-btn">
                            Directions
                        </button>

                    </div>

                </div>

            </div>


            <!-- =========================
                 BLOOD BANK 2
            ========================= -->

            <div class="bank-card">

                <div class="bank-info">

                    <h2>
                        Metro Regional Hospital Blood Center
                    </h2>


                    <div class="bank-tags">

                        <span class="verified-tag">
                            Verified Center
                        </span>

                        <span class="limited-tag">
                            Limited Availability
                        </span>

                    </div>


                    <div class="bank-details">

                        <strong>
                            Address:
                        </strong>
                        890 Westside Blvd, North Wing
                        (5.1 km away)

                        <br />

                        <strong>
                            Time:
                        </strong>
                        8:00 AM - 8:00 PM

                        <br />

                        <strong>
                            Contact:
                        </strong>
                        +1 (555) 987-6543

                        <div class="groups">

                            <strong>
                                Available Groups:
                            </strong>

                            <span class="group-badge">
                                AB+
                            </span>

                            <span class="group-badge">
                                O-
                            </span>

                        </div>

                    </div>

                </div>


                <div class="bank-side">

                    <div class="bank-buttons">

                        <button class="bank-view-btn">
                            View Details
                        </button>

                        <button class="direction-btn">
                            Directions
                        </button>

                    </div>

                </div>

            </div>


        </div>


        <!-- LOAD MORE -->

        <div class="load-more">

            <button class="load-more-btn">
                Load More Results ▼
            </button>

        </div>

    </section>


    <!-- =========================
         INTERACTIVE NETWORK MAP
    ========================= -->

    <section class="network-map">

        <h2>
            Interactive Network Map
        </h2>

        <p>
            Explore our extensive network of partner blood banks visually.
            Quickly identify the closest centers and plan your visit efficiently.
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

            <button class="full-map-btn">
                View Full Map
            </button>

        </div>

    </section>


    <!-- =========================
         EMERGENCY
    ========================= -->

    <section class="emergency">

        <div class="emergency-tag">
            NEED BLOOD URGENTLY?
        </div>

        <h2>
            Can't Find the Blood You Need?
        </h2>

        <p>
            If local blood banks don't have your required blood group,
            broadcast an emergency request to our network of registered
            donors immediately.
        </p>


        <div class="emergency-buttons">

            <button class="create-btn">
                Create Emergency Request
            </button>

            <button class="open-requests-btn">
                View Open Requests
            </button>

        </div>

    </section>


</asp:Content>