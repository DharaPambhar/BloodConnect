<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site1.Master"
    AutoEventWireup="true" CodeBehind="About.aspx.cs"
    Inherits="WebApplication1.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .about-hero {
    background: #FFF0F3;
    padding: 90px 10%;
    color: #1F2937;
    text-align: center;
}
      .about-tag {
    color: #D80032;
    font-weight: bold;
    letter-spacing: 2px;
    margin-bottom: 15px;
}

       .about-hero h1 {
    color: #1F2937;
    font-size: 48px;
    margin-bottom: 20px;
}

       .about-hero p {
    color: #6B7280;
    max-width: 800px;
    margin: auto;
    font-size: 18px;
    line-height: 1.7;
}

        .about-buttons {
            margin-top: 30px;
        }

        .about-btn {
            display: inline-block;
            padding: 13px 28px;
            margin: 8px;
            background: #D80032;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
        }

        .mission-section {
            padding: 70px 10%;
            text-align: center;
            background: #FFFFFF;
        }

        .mission-section h2 {
            color: #1F2937;
            font-size: 34px;
        }

        .mission-section p {
            color: #6B7280;
            font-size: 17px;
            max-width: 800px;
            margin: 20px auto;
            line-height: 1.7;
        }

        .values-section {
            padding: 70px 10%;
            background: #F1F3FB;
            text-align: center;
        }

        .values-section h2 {
            color: #1F2937;
            font-size: 34px;
            margin-bottom: 40px;
        }

        .values-container {
            display: flex;
            justify-content: center;
            gap: 25px;
            flex-wrap: wrap;
        }

        .value-card {
            background: white;
            width: 280px;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .value-card h3 {
            color: #D80032;
            margin-bottom: 15px;
        }

        .value-card p {
            color: #6B7280;
            line-height: 1.6;
        }

        .impact-section {
            padding: 70px 10%;
            background: #FFF0F3;
            text-align: center;
        }

        .impact-section h2 {
            font-size: 34px;
            color: #1F2937;
            margin-bottom: 40px;
        }

        .impact-container {
            display: flex;
            justify-content: center;
            gap: 60px;
            flex-wrap: wrap;
        }

        .impact-box h3 {
            color: #D80032;
            font-size: 36px;
            margin: 0;
        }

        .impact-box p {
            color: #6B7280;
            font-weight: bold;
            margin-top: 8px;
        }

        .footer {
            background: #F1F3FB;
            padding: 50px 10%;
            color: #1F2937;
        }

        .footer-container {
            display: flex;
            justify-content: space-between;
            gap: 40px;
            flex-wrap: wrap;
        }

        .footer-box {
            max-width: 250px;
        }

        .footer-box h3 {
            color: #D80032;
        }

        .footer-box p,
        .footer-box a {
            color: #6B7280;
            text-decoration: none;
            line-height: 1.9;
        }

        .copyright {
            text-align: center;
            margin-top: 35px;
            padding-top: 20px;
            border-top: 1px solid #ddd;
            color: #6B7280;
        }

        @media(max-width:768px) {
            .about-hero h1 {
                font-size: 34px;
            }

            .impact-container {
                gap: 30px;
            }
        }
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- About Hero -->
    <section class="about-hero">

        <div class="about-tag">
            ABOUT BLOODCONNECT
        </div>

        <h1>Connecting People. Saving Lives.</h1>

        <p>
            We are building a reliable, human-centric community to make blood
            donation accessible, transparent, and fast. Every connection we
            make has the potential to save a life.
        </p>

        <div class="about-buttons">

            <a href="FindBlood.aspx" class="about-btn">
                Find Blood
            </a>

            <a href="Register.aspx" class="about-btn">
                Become a Donor
            </a>

        </div>

    </section>


    <!-- Mission -->
    <section class="mission-section">

        <h2>Making Blood Access Simple, Fast &amp; Human</h2>

        <p>
            Our mission is to eliminate the panic and difficulty of finding
            blood during emergencies by connecting donors directly with
            those in need.
        </p>

    </section>


    <!-- Core Values -->
    <section class="values-section">

        <h2>Our Core Values</h2>

        <div class="values-container">

            <div class="value-card">

                <h3>Connect Communities</h3>

                <p>
                    We bridge the gap between willing donors and patients,
                    fostering a strong network of care.
                </p>

            </div>


            <div class="value-card">

                <h3>Respond Quickly</h3>

                <p>
                    Time is critical. Our platform is optimized for immediate
                    alerts and rapid response during emergencies.
                </p>

            </div>


            <div class="value-card">

                <h3>Save Lives</h3>

                <p>
                    Ultimately, everything we do is focused on the single goal
                    of ensuring blood is available when lives are on the line.
                </p>

            </div>

        </div>

    </section>


    <!-- Impact -->
    <section class="impact-section">

        <h2>Our Impact</h2>

        <div class="impact-container">

            <div class="impact-box">

                <h3>150K+</h3>

                <p>VERIFIED DONORS</p>

            </div>


            <div class="impact-box">

                <h3>850+</h3>

                <p>BLOOD BANKS</p>

            </div>


            <div class="impact-box">

                <h3>24/7</h3>

                <p>EMERGENCY SUPPORT</p>

            </div>


            <div class="impact-box">

                <h3>10K+</h3>

                <p>SUCCESSFUL CONNECTIONS</p>

            </div>

        </div>

    </section>


    


            
  

</asp:Content>