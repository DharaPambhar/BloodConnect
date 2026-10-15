
<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site1.Master"
    AutoEventWireup="true" CodeBehind="home.aspx.cs"
    Inherits="WebApplication1.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>
    /* ================= HERO ================= */

    .hero {
        min-height: 560px;
        background: #FFF0F3;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 50px 6%;
        box-sizing: border-box;
    }

    .hero-container {
        max-width: 1200px;
        width: 100%;
        margin: auto;
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 45px;
    }

    .hero-content {
        flex: 1;
        min-width: 0;
        text-align: left;
    }

    .hero-content h1 {
        font-size: 52px;
        font-weight: 700;
        line-height: 1.2;
        margin: 0 0 20px;
        color: #000000;
    }

    .hero-content p {
        font-size: 19px;
        line-height: 1.7;
        margin-bottom: 30px;
        color: #000000;
    }

    .hero-btn {
        display: inline-block;
        padding: 13px 30px;
        background-color: #D80032;
        color: #FFFFFF;
        text-decoration: none;
        border-radius: 6px;
        font-weight: 600;
        margin: 5px 8px 5px 0;
    }

    .hero-btn:hover {
        background-color: #D00036;
        color: #FFFFFF;
    }

   .hero-image-container {
    flex: 1;
    min-width: 0;
    display: flex;
    justify-content: stretch;
    align-items: stretch;
    overflow: hidden;
    border-radius: 16px;
}

.hero-image {
    display: block;
    width: 100%;
    height: 420px;
    object-fit: cover;
    object-position: center;
    border-radius: 16px;
    box-shadow: none;
}

    /* ================= STATISTICS ================= */

    .stats {
        display: flex;
        justify-content: center;
        gap: 80px;
        padding: 45px 20px;
        background-color: #FFFFFF;
        text-align: center;
        flex-wrap: wrap;
    }

    .stat-box {
        min-width: 180px;
    }

    .stat-box h2 {
        color: #D80032;
        font-size: 38px;
        margin-bottom: 8px;
    }

    .stat-box p {
        font-size: 13px;
        font-weight: 700;
        color: #6B7280;
        letter-spacing: 1px;
    }


    /* ================= SEARCH BLOOD ================= */

    .search-section {
        padding: 60px 20px;
        background-color: #F8F9FA;
        text-align: center;
    }

    .search-section h2 {
        color: #1F2937;
        font-size: 32px;
        margin-bottom: 30px;
    }

    .search-form {
        max-width: 1000px;
        margin: auto;
        display: flex;
        justify-content: center;
        align-items: end;
        gap: 15px;
        flex-wrap: wrap;
    }

    .form-group {
        display: flex;
        flex-direction: column;
        text-align: left;
        min-width: 210px;
    }

    .form-group label {
        font-weight: 600;
        margin-bottom: 7px;
        color: #1F2937;
    }

    .form-group select,
    .form-group input {
        padding: 12px;
        border: 1px solid #D1D5DB;
        border-radius: 5px;
        font-size: 14px;
        background-color: #FFFFFF;
        color: #1F2937;
    }

    .search-btn {
        padding: 12px 25px;
        background-color: #3B62F6;
        color: #FFFFFF;
        border: none;
        border-radius: 5px;
        font-weight: 600;
        cursor: pointer;
    }

    .search-btn:hover {
        background-color: #2563EB;
    }


    /* ================= EMERGENCY ================= */

    .emergency-section {
        padding: 65px 20px;
        background-color: #FFF0F3;
    }

    .emergency-container {
        max-width: 1100px;
        margin: auto;
        display: flex;
        justify-content: space-between;
        gap: 50px;
        flex-wrap: wrap;
    }

    .emergency-info {
        flex: 1;
        min-width: 300px;
    }

    .critical {
        color: #D80032;
        font-size: 13px;
        font-weight: 700;
        letter-spacing: 2px;
    }

    .emergency-info h2 {
        font-size: 36px;
        color: #1F2937;
        margin: 12px 0 18px;
    }

    .emergency-info p {
        color: #6B7280;
        line-height: 1.7;
    }

    .emergency-link {
        display: inline-block;
        margin-top: 20px;
        color: #D80032;
        font-weight: 600;
        text-decoration: none;
    }

    .emergency-form {
        flex: 1;
        min-width: 300px;
        background-color: #FFFFFF;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        box-sizing: border-box;
    }

    .emergency-form h3 {
        margin-bottom: 20px;
        color: #1F2937;
    }

    .emergency-form .form-group {
        margin-bottom: 15px;
        width: 100%;
    }

    .emergency-form input,
    .emergency-form select {
        width: 100%;
        box-sizing: border-box;
    }

    .request-btn {
        width: 100%;
        padding: 13px;
        background-color: #D80032;
        color: #FFFFFF;
        border: none;
        border-radius: 5px;
        font-weight: 600;
        cursor: pointer;
    }

    .request-btn:hover {
        background-color: #D00036;
    }


    /* ================= HOW IT WORKS ================= */

    .works-section {
        padding: 65px 20px;
        background-color: #F1F3FB;
        text-align: center;
    }

    .works-section h2 {
        color: #1F2937;
        font-size: 32px;
        margin-bottom: 15px;
    }

    .works-intro {
        max-width: 700px;
        margin: 0 auto 40px;
        color: #6B7280;
        line-height: 1.7;
    }

    .works-container {
        max-width: 1100px;
        margin: auto;
        display: flex;
        justify-content: center;
        gap: 25px;
        flex-wrap: wrap;
    }

    .work-card {
        width: 280px;
        padding: 30px 20px;
        background-color: #FFFFFF;
        border-radius: 10px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        box-sizing: border-box;
    }

    .work-number {
        color: #D80032;
        font-size: 22px;
        font-weight: 700;
        margin-bottom: 15px;
    }

    .work-card h3 {
        color: #1F2937;
        margin-bottom: 12px;
    }

    .work-card p {
        color: #6B7280;
        line-height: 1.6;
    }


    /* ================= RESPONSIVE ================= */

    @media (max-width: 768px) {

        .hero {
            padding: 35px 20px;
        }

        .hero-container {
            flex-direction: column;
            text-align: center;
            gap: 30px;
        }

        .hero-content {
            text-align: center;
        }

        .hero-content h1 {
            font-size: 38px;
        }

        .hero-content p {
            font-size: 16px;
        }

        .hero-image-container {
            width: 100%;
        }

        .hero-image {
            height: 280px;
            max-width: 100%;
        }

        .stats {
            gap: 30px;
        }

        .emergency-container {
            flex-direction: column;
        }

        .emergency-info,
        .emergency-form {
            min-width: 0;
            width: 100%;
        }

        .footer-container {
            flex-direction: column;
        }
    }

    @media (max-width: 480px) {
        .hero-content h1 {
            font-size: 32px;
        }

        .hero-image {
            height: 230px;
        }

        .hero-btn {
            padding: 12px 20px;
        }
    }
</style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- ================= HERO SECTION ================= -->

    <section class="hero">

        <div class="hero-container">

            <!-- LEFT SIDE: TEXT AND BUTTONS -->

            <div class="hero-content">

                <h1>Every Drop Can Save a Life.</h1>

                <p>
                    Join a network of everyday heroes. Whether you need blood urgently
                    or want to donate, BloodConnect bridges the gap instantly and safely.
                </p>

                <a href="FindBlood.aspx" class="hero-btn">
                    Find Blood
                </a>

                <a href="Register.aspx" class="hero-btn">
                    Become a Donor
                </a>

            </div>

            <!-- RIGHT SIDE: YOUR EXISTING IMAGE -->

            <div class="hero-image-container">

                <asp:Image
                    ID="HomeHeroImage"
                    runat="server"
                    ImageUrl="~/Images/home_image.png"
                    AlternateText="Blood donation at a medical facility"
                    CssClass="hero-image" />

            </div>

        </div>

    </section>


    <!-- ================= STATISTICS ================= -->

    <section class="stats">

        <div class="stat-box">
            <h2>150K+</h2>
            <p>VERIFIED DONORS</p>
        </div>

        <div class="stat-box">
            <h2>850+</h2>
            <p>BLOOD BANKS</p>
        </div>

        <div class="stat-box">
            <h2>24/7</h2>
            <p>EMERGENCY SUPPORT</p>
        </div>

    </section>


    <!-- ================= SEARCH BLOOD ================= -->

    <section class="search-section">

        <h2>Find Blood</h2>

        <div class="search-form">

            <div class="form-group">

                <label>Blood Group:</label>

                <select>
                    <option>Select Group</option>
                    <option>A+</option>
                    <option>A-</option>
                    <option>B+</option>
                    <option>B-</option>
                    <option>AB+</option>
                    <option>AB-</option>
                    <option>O+</option>
                    <option>O-</option>
                </select>

            </div>

            <div class="form-group">

                <label>Location:</label>

                <input type="text" placeholder="City or Pincode" />

            </div>

            <div class="form-group">

                <label>Search Radius:</label>

                <select>
                    <option>Within 5km</option>
                    <option>Within 10km</option>
                    <option>Within 25km</option>
                    <option>Within 50km</option>
                </select>

            </div>

            <button type="button" class="search-btn">
                Search Blood
            </button>

        </div>

    </section>


    <!-- ================= EMERGENCY REQUEST ================= -->

    <section class="emergency-section">

        <div class="emergency-container">

            <div class="emergency-info">

                <span class="critical">
                    CRITICAL NEED
                </span>

                <h2>Need Blood Urgently?</h2>

                <p>
                    Broadcast your requirement instantly to our network of verified
                    donors and partner blood banks within your immediate vicinity.
                    Time is of the essence.
                </p>

                <a href="Emergency.aspx" class="emergency-link">
                    View Emergency Requests -&gt;
                </a>

            </div>

            <div class="emergency-form">

                <h3>Create Emergency Request</h3>

                <div class="form-group">

                    <label>Required Blood Group :</label>

                    <select>
                        <option>Select Group</option>
                        <option>A+</option>
                        <option>A-</option>
                        <option>B+</option>
                        <option>B-</option>
                        <option>AB+</option>
                        <option>AB-</option>
                        <option>O+</option>
                        <option>O-</option>
                    </select>

                </div>

                <div class="form-group">

                    <label>Hospital / Location :</label>

                    <input type="text"
                           placeholder="Enter hospital name and city" />

                </div>

                <div class="form-group">

                    <label>Units Required :</label>

                    <input type="number" placeholder="e.g., 2" />

                </div>

                <button type="button" class="request-btn">
                    Request Blood Now
                </button>

            </div>

        </div>

    </section>


    <!-- ================= HOW BLOODCONNECT WORKS ================= -->

    <section class="works-section">

        <h2>How BloodConnect Works</h2>

        <p class="works-intro">
            A simple, transparent process designed to connect life-saving
            resources with those who need them most.
        </p>

        <div class="works-container">

            <div class="work-card">

                <div class="work-number">
                    01. Find Blood
                </div>

                <h3>Find Blood</h3>

                <p>
                    Search our real-time database for specific blood groups
                    in your area, or broadcast an emergency request.
                </p>

            </div>

            <div class="work-card">

                <div class="work-number">
                    02. Connect
                </div>

                <h3>Connect</h3>

                <p>
                    Directly contact verified donors or partner blood banks.
                    Our system ensures privacy and security for all parties.
                </p>

            </div>

            <div class="work-card">

                <div class="work-number">
                    03. Save a Life
                </div>

                <h3>Save a Life</h3>

                <p>
                    Complete the donation at a certified medical facility.
                    Every successful connection makes a profound impact.
                </p>

            </div>

        </div>

    </section>

</asp:Content>
