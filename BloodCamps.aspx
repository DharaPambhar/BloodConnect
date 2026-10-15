
<%@ Page Title="Blood Camps" Language="C#" MasterPageFile="~/Site1.Master"
    AutoEventWireup="true" CodeBehind="BloodCamps.aspx.cs"
    Inherits="WebApplication1.BloodCamps" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        /* HERO */

        .camp-hero {
            background: linear-gradient(135deg, #FFF5F7, #FFECEF);
            padding: 70px 8%;
            text-align: center;
        }

        .camp-tag {
            color: #D80032;
            font-size: 14px;
            font-weight: bold;
            letter-spacing: 1px;
            margin-bottom: 12px;
        }

        .camp-hero h1 {
            font-size: 46px;
            color: #1F2937;
            margin: 10px 0 15px;
        }

        .camp-hero p {
            color: #6B7280;
            font-size: 18px;
            line-height: 1.6;
            max-width: 760px;
            margin: 0 auto 30px;
        }

        /* SEARCH */

        .camp-search {
            max-width: 1100px;
            margin: auto;
            background: #FFFFFF;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.06);
            display: flex;
            gap: 15px;
            align-items: end;
            justify-content: center;
            flex-wrap: wrap;
        }

        .camp-field {
            flex: 1;
            min-width: 190px;
            text-align: left;
        }

        .camp-field label {
            display: block;
            color: #374151;
            font-size: 13px;
            font-weight: bold;
            margin-bottom: 7px;
        }

        .camp-field input,
        .camp-field select {
            width: 100%;
            box-sizing: border-box;
            padding: 12px;
            border: 1px solid #D1D5DB;
            border-radius: 6px;
            background: #FFFFFF;
            font-size: 14px;
            color: #374151;
        }

        .search-camp-btn {
            background: #D80032;
            color: #FFFFFF;
            border: none;
            padding: 12px 24px;
            height: 42px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 600;
        }

        .search-camp-btn:hover,
        .book-btn:hover {
            background: #B9002B;
        }

        /* UPCOMING CAMPS */

        .camps-section {
            background: #F8F9FA;
            padding: 60px 8%;
        }

        .camp-heading-row {
            max-width: 1100px;
            margin: 0 auto 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .camp-heading-row h2 {
            color: #1F2937;
            font-size: 32px;
            margin: 0;
        }

        .sort-box {
            display: flex;
            align-items: center;
            gap: 8px;
            color: #6B7280;
            font-size: 14px;
        }

        .sort-box select {
            padding: 8px 12px;
            border: 1px solid #D1D5DB;
            border-radius: 6px;
            background: #FFFFFF;
            color: #374151;
        }

        /* CAMP CARDS */

        .camp-list {
            max-width: 1100px;
            margin: auto;
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 22px;
            align-items: stretch;
        }

        .camp-card {
            background: #FFFFFF;
            border: 1px solid #E5E7EB;
            border-radius: 12px;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            box-shadow: 0 3px 10px rgba(0,0,0,0.04);
            min-width: 0;
        }

        /* IMAGE AT THE TOP OF EACH CARD */

        .camp-image {
            display: block;
            width: 100%;
            height: 210px;
            object-fit: cover;
            object-position: center;
        }

        .camp-info {
            padding: 22px 20px 10px;
            flex: 1;
        }

        .camp-info h3 {
            color: #1F2937;
            font-size: 20px;
            line-height: 1.4;
            margin: 0 0 12px;
        }

        .camp-date {
            color: #D80032;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 9px;
            line-height: 1.6;
        }

        .camp-address,
        .camp-org {
            color: #6B7280;
            font-size: 14px;
            line-height: 1.7;
        }

        .camp-org strong {
            color: #374151;
        }

        /* AVAILABLE SLOTS */

        .camp-side {
            padding: 5px 20px 22px;
            margin-top: auto;
        }

        .slots-green,
        .slots-yellow {
            display: inline-block;
            padding: 7px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            margin-bottom: 15px;
        }

        .slots-green {
            background: #DCFCE7;
            color: #15803D;
        }

        .slots-yellow {
            background: #FEF3C7;
            color: #B45309;
        }

        /* BUTTONS */

        .camp-buttons {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        .details-btn {
            background: #FFFFFF;
            color: #374151;
            border: 1px solid #D1D5DB;
            padding: 10px 13px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 13px;
            flex: 1;
        }

        .book-btn {
            background: #D80032;
            color: #FFFFFF;
            border: none;
            padding: 10px 13px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 13px;
            font-weight: 600;
            flex: 1;
        }

        .details-btn:hover {
            border-color: #D80032;
            color: #D80032;
        }

        /* LOAD MORE */

        .load-more-area {
            text-align: center;
            margin-top: 35px;
        }

        .load-more-btn {
            background: #FFFFFF;
            color: #374151;
            border: 1px solid #D1D5DB;
            padding: 12px 25px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
        }

        .load-more-btn:hover {
            border-color: #D80032;
            color: #D80032;
        }

        /* RESPONSIVE */

        @media (max-width: 950px) {
            .camp-list {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }
        }

        @media (max-width: 650px) {
            .camp-hero {
                padding: 50px 20px;
            }

            .camp-hero h1 {
                font-size: 34px;
            }

            .camp-hero p {
                font-size: 16px;
            }

            .camp-search {
                padding: 20px;
            }

            .camp-field {
                width: 100%;
                min-width: 100%;
            }

            .search-camp-btn {
                width: 100%;
            }

            .camps-section {
                padding: 45px 20px;
            }

            .camp-heading-row {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }

            .camp-heading-row h2 {
                font-size: 28px;
            }

            .camp-list {
                grid-template-columns: 1fr;
            }

            .camp-image {
                height: 230px;
            }
        }
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- HERO SECTION -->

    <section class="camp-hero">

        <div class="camp-tag">BLOOD DONATION CAMPS</div>

        <h1>Donate Blood. Make a Difference.</h1>

        <p>
            Discover blood donation camps near you, find upcoming events,
            and reserve your place to help save lives.
        </p>

        <!-- SEARCH BAR -->

        <div class="camp-search">

            <div class="camp-field">
                <label for="<%= txtCampLocation.ClientID %>">Location</label>
                <asp:TextBox
                    ID="txtCampLocation"
                    runat="server"
                    placeholder="City">
                </asp:TextBox>
            </div>

            <div class="camp-field">
                <label for="<%= txtCampDate.ClientID %>">Date</label>
                <asp:TextBox
                    ID="txtCampDate"
                    runat="server"
                    TextMode="Date">
                </asp:TextBox>
            </div>

            <div class="camp-field">
                <label for="<%= ddlCampType.ClientID %>">Camp Type</label>

                <asp:DropDownList ID="ddlCampType" runat="server">
                    <asp:ListItem>All Types</asp:ListItem>
                    <asp:ListItem>Blood Donation Camp</asp:ListItem>
                    <asp:ListItem>Hospital Camp</asp:ListItem>
                    <asp:ListItem>Corporate Camp</asp:ListItem>
                    <asp:ListItem>University Camp</asp:ListItem>
                </asp:DropDownList>
            </div>

            <asp:Button
                ID="btnSearchCamps"
                runat="server"
                Text="Search Camps"
                CssClass="search-camp-btn" />

        </div>

    </section>


    <!-- UPCOMING CAMPS -->

    <section class="camps-section">

        <div class="camp-heading-row">

            <h2>Upcoming Blood Camps</h2>

            <div class="sort-box">
                <span>Sort by:</span>

                <select>
                    <option>Nearest</option>
                </select>
            </div>

        </div>


        <div class="camp-list">

            <!-- CAMP 1: HOSPITAL -->

            <div class="camp-card">

                <asp:Image
                    ID="imgHospitalCamp"
                    runat="server"
                    ImageUrl="~/Images/camp1.png"
                    AlternateText="People donating blood with medical staff in a hospital blood donation room"
                    CssClass="camp-image" />

                <div class="camp-info">

                    <h3>City General Hospital Blood Drive</h3>

                    <div class="camp-date">
                        Sat, Oct 28 • 9:00 AM - 3:00 PM
                    </div>

                    <div class="camp-address">
                        123 Medical Center Blvd, Suite 200
                    </div>

                    <div class="camp-org">
                        <strong>Org:</strong>
                        Red Cross Local Chapter
                    </div>

                </div>

                <div class="camp-side">

                    <div class="slots-green">24 Slots Available</div>

                    <div class="camp-buttons">

                        <button type="button" class="details-btn">
                            View Details
                        </button>

                        <button type="button" class="book-btn">
                            Book Slot
                        </button>

                    </div>

                </div>

            </div>


            <!-- CAMP 2: CORPORATE OFFICE -->

            <div class="camp-card">

                <asp:Image
                    ID="imgCorporateCamp"
                    runat="server"
                    ImageUrl="~/Images/camp2.png"
                    AlternateText="Blood donation camp arranged in a modern corporate office lobby with large glass windows"
                    CssClass="camp-image" />

                <div class="camp-info">

                    <h3>Downtown Corporate Tech Drive</h3>

                    <div class="camp-date">
                        Mon, Nov 6 • 10:00 AM - 4:00 PM
                    </div>

                    <div class="camp-address">
                        450 Innovation Way, Main Lobby
                    </div>

                    <div class="camp-org">
                        <strong>Org:</strong>
                        City Blood Services
                    </div>

                </div>

                <div class="camp-side">

                    <div class="slots-yellow">12 Slots Available</div>

                    <div class="camp-buttons">

                        <button type="button" class="details-btn">
                            View Details
                        </button>

                        <button type="button" class="book-btn">
                            Book Slot
                        </button>

                    </div>

                </div>

            </div>


            <!-- CAMP 3: UNIVERSITY -->

            <div class="camp-card">

                <asp:Image
                    ID="imgUniversityCamp"
                    runat="server"
                    ImageUrl="~/Images/camp3.png"
                    AlternateText="University students participating in a blood donation camp in a campus hall"
                    CssClass="camp-image" />

                <div class="camp-info">

                    <h3>University Campus Annual Drive</h3>

                    <div class="camp-date">
                        Wed, Nov 8 • 8:00 AM - 5:00 PM
                    </div>

                    <div class="camp-address">
                        State University, Student Union
                    </div>

                    <div class="camp-org">
                        <strong>Org:</strong>
                        Student Health Board
                    </div>

                </div>

                <div class="camp-side">

                    <div class="slots-green">48 Slots Available</div>

                    <div class="camp-buttons">

                        <button type="button" class="details-btn">
                            View Details
                        </button>

                        <button type="button" class="book-btn">
                            Book Slot
                        </button>

                    </div>

                </div>

            </div>

        </div>


        <!-- LOAD MORE -->

        <div class="load-more-area">

            <button type="button" class="load-more-btn">
                Load More Camps ▼
            </button>

        </div>

    </section>

</asp:Content>
