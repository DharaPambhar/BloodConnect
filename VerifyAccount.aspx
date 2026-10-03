<%@ Page Title="Verify Your Account" Language="C#" MasterPageFile="~/Site1.Master"
    AutoEventWireup="true" CodeBehind="VerifyAccount.aspx.cs"
    Inherits="WebApplication1.VerifyAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        .verification-page {
            background-color: #F8F9FA;
            padding: 60px 7%;
            min-height: 650px;
        }

        .verification-container {
            max-width: 1150px;
            margin: auto;
            display: flex;
            gap: 45px;
            align-items: stretch;
        }

        /* LEFT CARD */

        .verification-card {
            flex: 1.1;
            background-color: #FFFFFF;
            padding: 40px;
            border-radius: 14px;
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
            color: #9CA3AF;
            font-size: 12px;
            font-weight: bold;
        }

        .step-circle {
            width: 32px;
            height: 32px;
            line-height: 32px;
            border-radius: 50%;
            margin: auto auto 6px;
            background-color: #E5E7EB;
            color: #6B7280;
        }

        .step.completed {
            color: #D80032;
        }

        .step.completed .step-circle {
            background-color: #D80032;
            color: white;
        }

        .step.active {
            color: #D80032;
        }

        .step.active .step-circle {
            background-color: #D80032;
            color: white;
        }

        .step-line {
            width: 55px;
            height: 2px;
            background-color: #D80032;
            margin: 0 8px 20px;
        }

        .step-line-gray {
            width: 55px;
            height: 2px;
            background-color: #E5E7EB;
            margin: 0 8px 20px;
        }

        /* TITLE */

        .verification-title {
            text-align: center;
            margin-bottom: 25px;
        }

        .verification-title h1 {
            color: #1F2937;
            font-size: 32px;
            margin: 0 0 8px;
        }

        .verification-title p {
            color: #6B7280;
            font-size: 14px;
            line-height: 1.6;
            margin: 0;
        }

        /* NOTIFICATION */

        .notification-box {
            background-color: #EAEFFD;
            border-radius: 8px;
            padding: 15px;
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 30px;
            color: #374151;
            font-size: 13px;
        }

        .notification-icon {
            font-size: 20px;
        }

        /* OTP */

        .otp-title {
            color: #374151;
            font-size: 13px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 12px;
        }

        .otp-container {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-bottom: 25px;
        }

        .otp-box {
            width: 48px;
            height: 52px;
            border: 1px solid #D1D5DB;
            border-radius: 7px;
            text-align: center;
            font-size: 22px;
            color: #1F2937;
        }

        .otp-box:focus {
            outline: none;
            border-color: #D80032;
        }

        /* RESEND */

        .resend-section {
            text-align: center;
            margin-bottom: 25px;
            font-size: 13px;
            color: #6B7280;
            line-height: 1.8;
        }

        .resend-link {
            color: #D80032;
            text-decoration: none;
            font-weight: bold;
        }

        .resend-link:hover {
            text-decoration: underline;
        }

        /* BUTTON */

        .verify-button {
            width: 100%;
            background-color: #D80032;
            color: white;
            border: none;
            padding: 13px;
            border-radius: 6px;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
        }

        .verify-button:hover {
            background-color: #B9002B;
        }

        /* BACK */

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #6B7280;
            text-decoration: none;
            font-size: 13px;
        }

        .back-link:hover {
            color: #D80032;
        }

        /* SECURITY */

        .security-note {
            text-align: center;
            margin-top: 22px;
            padding-top: 18px;
            border-top: 1px solid #E5E7EB;
            color: #15803D;
            font-size: 12px;
        }

        /* RIGHT COMMUNITY */

        .community-section {
            flex: 0.9;
            background-color: #EAEFFD;
            border-radius: 14px;
            padding: 45px 35px;
        }

        .community-section h2 {
            color: #1F2937;
            font-size: 27px;
            line-height: 1.3;
            margin-bottom: 15px;
        }

        .community-section > p {
            color: #6B7280;
            font-size: 14px;
            line-height: 1.7;
            margin-bottom: 30px;
        }

        .feature {
            margin-bottom: 24px;
        }

        .feature h3 {
            color: #D80032;
            font-size: 16px;
            margin-bottom: 6px;
        }

        .feature p {
            color: #6B7280;
            font-size: 13px;
            line-height: 1.6;
            margin: 0;
        }

        /* IMAGE PLACEHOLDER */

        .verification-graphic {
            height: 180px;
            background-color: #FFFFFF;
            border-radius: 12px;
            margin-bottom: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #9CA3AF;
            font-size: 14px;
        }

        /* RESPONSIVE */

        @media (max-width: 850px) {

            .verification-container {
                flex-direction: column;
            }

            .verification-card,
            .community-section {
                width: 100%;
                box-sizing: border-box;
            }

        }

        @media (max-width: 600px) {

            .otp-container {
                gap: 6px;
            }

            .otp-box {
                width: 42px;
                height: 48px;
            }

            .step-line,
            .step-line-gray {
                width: 25px;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="verification-page">

        <div class="verification-container">


            <!-- LEFT VERIFICATION CARD -->

            <div class="verification-card">


                <!-- STEP PROGRESS -->

                <div class="steps">

                    <div class="step completed">

                        <div class="step-circle">
                            ✓
                        </div>

                        ACCOUNT

                    </div>


                    <div class="step-line"></div>


                    <div class="step active">

                        <div class="step-circle">
                            2
                        </div>

                        VERIFICATION

                    </div>


                    <div class="step-line-gray"></div>


                    <div class="step">

                        <div class="step-circle">
                            3
                        </div>

                        COMPLETE

                    </div>

                </div>


                <!-- TITLE -->

                <div class="verification-title">

                    <h1>
                        Verify Your Account
                    </h1>

                    <p>
                        Enter the verification code sent to your
                        email or phone number.
                    </p>

                </div>


                <!-- NOTIFICATION -->

                <div class="notification-box">

                    <span class="notification-icon">
                        ✉
                    </span>

                    <span>
                        Verification code sent to
                        <strong>jane@example.com</strong>
                    </span>

                </div>


                <!-- OTP -->

                <div class="otp-title">
                    ENTER VERIFICATION CODE
                </div>


                <div class="otp-container">

                    <asp:TextBox
                        ID="OTP1"
                        runat="server"
                        CssClass="otp-box"
                        MaxLength="1">
                    </asp:TextBox>

                    <asp:TextBox
                        ID="OTP2"
                        runat="server"
                        CssClass="otp-box"
                        MaxLength="1">
                    </asp:TextBox>

                    <asp:TextBox
                        ID="OTP3"
                        runat="server"
                        CssClass="otp-box"
                        MaxLength="1">
                    </asp:TextBox>

                    <asp:TextBox
                        ID="OTP4"
                        runat="server"
                        CssClass="otp-box"
                        MaxLength="1">
                    </asp:TextBox>

                    <asp:TextBox
                        ID="OTP5"
                        runat="server"
                        CssClass="otp-box"
                        MaxLength="1">
                    </asp:TextBox>

                    <asp:TextBox
                        ID="OTP6"
                        runat="server"
                        CssClass="otp-box"
                        MaxLength="1">
                    </asp:TextBox>

                </div>


                <!-- RESEND -->

                <div class="resend-section">

                    Didn't receive the code?

                    <a href="#" class="resend-link">
                        Resend Code
                    </a>

                    <br />

                    Resend available in <strong>00:45</strong>

                </div>


                <!-- VERIFY BUTTON -->

                <asp:Button
                    ID="VERIFYCONTINUE"
                    runat="server"
                    Text="Verify &amp; Continue →"
                    CssClass="verify-button"
                    OnClick="VERIFYCONTINUE_Click" />


                <!-- BACK -->

                <a href="Registration.aspx" class="back-link">
                    ← Back to Account
                </a>


                <!-- SECURITY -->

                <div class="security-note">

                    🛡 Your information is protected and securely verified.

                </div>

            </div>


            <!-- RIGHT COMMUNITY SECTION -->

            <div class="community-section">


                <!-- IMAGE WILL BE ADDED LATER -->

                <div class="verification-graphic">

                    BloodConnect Verification Graphic

                </div>


                <h2>
                    Be Part of the BloodConnect Community
                </h2>


                <p>
                    Whether you donate blood or need support,
                    BloodConnect helps connect people when it matters most.
                    Join a network of everyday heroes.
                </p>


                <div class="feature">

                    <h3>
                        ♥ Help Save Lives
                    </h3>

                </div>


                <div class="feature">

                    <h3>
                        👥 Connect With Your Community
                    </h3>

                </div>


                <div class="feature">

                    <h3>
                        🛡 Safe &amp; Secure
                    </h3>

                </div>

            </div>

        </div>

    </section>

</asp:Content>