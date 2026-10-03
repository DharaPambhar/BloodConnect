<%@ Page Title="Account Created Successfully" Language="C#" MasterPageFile="~/Site1.Master"
    AutoEventWireup="true" CodeBehind="Complete.aspx.cs"
    Inherits="WebApplication1.Complete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        .complete-page {
            background-color: #F8F9FA;
            padding: 60px 7%;
            min-height: 650px;
        }

        .complete-container {
            max-width: 1150px;
            margin: auto;
            display: flex;
            gap: 45px;
            align-items: stretch;
        }

        /* SUCCESS CARD */

        .success-card {
            flex: 1.1;
            background-color: #FFFFFF;
            padding: 40px;
            border-radius: 14px;
            border-top: 4px solid #D80032;
            box-shadow: 0 6px 25px rgba(0,0,0,0.07);
        }

        /* STEP PROGRESS */

        .steps {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 35px;
        }

        .step {
            text-align: center;
            color: #D80032;
            font-size: 12px;
            font-weight: bold;
        }

        .step-circle {
            width: 32px;
            height: 32px;
            line-height: 32px;
            border-radius: 50%;
            margin: auto auto 6px;
            background-color: #D80032;
            color: white;
        }

        .step-line {
            width: 55px;
            height: 2px;
            background-color: #D80032;
            margin: 0 8px 20px;
        }

        /* SUCCESS ICON */

        .success-icon {
            width: 75px;
            height: 75px;
            background-color: #D80032;
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 42px;
            font-weight: bold;
            margin: 10px auto 22px;
        }

        /* TITLE */

        .success-title {
            text-align: center;
        }

        .success-title h1 {
            color: #1F2937;
            font-size: 30px;
            margin-bottom: 10px;
        }

        .success-title h3 {
            color: #D80032;
            font-size: 17px;
            margin-bottom: 15px;
        }

        .success-title p {
            color: #6B7280;
            font-size: 14px;
            line-height: 1.7;
            margin-bottom: 25px;
        }

        /* STATUS BOX */

        .status-box {
            background-color: #FFF0F3;
            border-radius: 9px;
            padding: 20px;
            margin-bottom: 25px;
        }

        .status-title {
            color: #1F2937;
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .status-item {
            color: #374151;
            font-size: 13px;
            margin: 10px 0;
        }

        .status-check {
            color: #15803D;
            font-weight: bold;
            margin-right: 8px;
        }

        /* LOGIN BUTTON */

        .action-buttons {
            display: flex;
            justify-content: center;
            margin-bottom: 22px;
        }

        .login-button {
            background-color: #D80032;
            color: white;
            border: 1px solid #D80032;
            padding: 12px 55px;
            border-radius: 6px;
            text-align: center;
            text-decoration: none;
            font-size: 14px;
            font-weight: bold;
        }

        .login-button:hover {
            background-color: #B9002B;
        }

        /* SECURITY */

        .security-note {
            text-align: center;
            color: #15803D;
            font-size: 12px;
            padding-top: 18px;
            border-top: 1px solid #E5E7EB;
        }

        /* BACK LOGIN */

        .back-login {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #6B7280;
            font-size: 13px;
            text-decoration: none;
        }

        .back-login:hover {
            color: #D80032;
        }

        /* RIGHT COMMUNITY */

        .community-section {
            flex: 0.9;
            background-color: #EAEFFD;
            border-radius: 14px;
            padding: 40px 35px;
        }

        /* IMAGE PLACEHOLDER */

        .community-graphic {
            height: 180px;
            background-color: #FFFFFF;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #9CA3AF;
            font-size: 14px;
            margin-bottom: 30px;
        }

        .community-section h2 {
            color: #1F2937;
            font-size: 27px;
            line-height: 1.3;
            margin-bottom: 25px;
        }

        .feature {
            margin-bottom: 22px;
        }

        .feature h3 {
            color: #D80032;
            font-size: 16px;
            margin-bottom: 5px;
        }

        .feature p {
            color: #6B7280;
            font-size: 13px;
            line-height: 1.6;
            margin: 0;
        }

        /* RESPONSIVE */

        @media (max-width: 850px) {

            .complete-container {
                flex-direction: column;
            }

            .success-card,
            .community-section {
                width: 100%;
                box-sizing: border-box;
            }

        }

        @media (max-width: 600px) {

            .step-line {
                width: 25px;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="complete-page">

        <div class="complete-container">


            <!-- LEFT SUCCESS CARD -->

            <div class="success-card">


                <!-- STEP PROGRESS -->

                <div class="steps">

                    <div class="step">

                        <div class="step-circle">
                            ✓
                        </div>

                        ACCOUNT

                    </div>


                    <div class="step-line"></div>


                    <div class="step">

                        <div class="step-circle">
                            ✓
                        </div>

                        VERIFY

                    </div>


                    <div class="step-line"></div>


                    <div class="step">

                        <div class="step-circle">
                            ✓
                        </div>

                        COMPLETE

                    </div>

                </div>


                <!-- SUCCESS ICON -->

                <div class="success-icon">
                    ✓
                </div>


                <!-- SUCCESS TITLE -->

                <div class="success-title">

                    <h1>
                        Account Created Successfully!
                    </h1>

                    <h3>
                        Welcome to BloodConnect, Jane!
                    </h3>

                    <p>
                        Your account has been created and verified successfully.
                        You can now access BloodConnect and connect with donors,
                        blood seekers, camps, and emergency blood requests.
                    </p>

                </div>


                <!-- STATUS BOX -->

                <div class="status-box">

                    <div class="status-title">
                        Your account is ready
                    </div>


                    <div class="status-item">

                        <span class="status-check">
                            ✓
                        </span>

                        Email verified

                    </div>


                    <div class="status-item">

                        <span class="status-check">
                            ✓
                        </span>

                        Phone verified

                    </div>


                    <div class="status-item">

                        <span class="status-check">
                            ✓
                        </span>

                        Profile created

                    </div>

                </div>


                <!-- LOGIN BUTTON -->

                <div class="action-buttons">

                    <a href="Login.aspx" class="login-button">
                        Login
                    </a>

                </div>


                <!-- SECURITY -->

                <div class="security-note">

                    🔒 Your information is protected with secure authentication.

                </div>


                <!-- BACK TO LOGIN -->

                <a href="Login.aspx" class="back-login">
                    ← Back to Login
                </a>

            </div>


            <!-- RIGHT COMMUNITY SECTION -->

            <div class="community-section">


                <!-- IMAGE WILL BE ADDED LATER -->

                <div class="community-graphic">

                    Together, We Save Lives.

                </div>


                <h2>
                    Welcome to the BloodConnect Community
                </h2>


                <!-- FEATURE 1 -->

                <div class="feature">

                    <h3>
                        ♥ Help Save Lives
                    </h3>

                    <p>
                        Your donations directly impact patients in critical need.
                    </p>

                </div>


                <!-- FEATURE 2 -->

                <div class="feature">

                    <h3>
                        👥 Connect With Your Community
                    </h3>

                    <p>
                        Join a network of dedicated donors and recipients.
                    </p>

                </div>


                <!-- FEATURE 3 -->

                <div class="feature">

                    <h3>
                        🛡 Safe &amp; Secure
                    </h3>

                    <p>
                        Your health and data privacy are our top priorities.
                    </p>

                </div>

            </div>

        </div>

    </section>

</asp:Content>