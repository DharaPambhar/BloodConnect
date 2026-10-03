<%@ Page Title="Registration" Language="C#" MasterPageFile="~/Site1.Master"
    AutoEventWireup="true" CodeBehind="Registration.aspx.cs"
    Inherits="WebApplication1.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        .registration-page {
            background-color: #F8F9FA;
            padding: 60px 7%;
            min-height: 650px;
        }

        .registration-container {
            max-width: 1150px;
            margin: auto;
            display: flex;
            gap: 45px;
            align-items: flex-start;
        }

        /* REGISTRATION CARD */

        .registration-card {
            flex: 1.2;
            background-color: #FFFFFF;
            padding: 40px;
            border-radius: 14px;
            box-shadow: 0 6px 25px rgba(0,0,0,0.07);
        }

        .registration-title {
            text-align: center;
            margin-bottom: 28px;
        }

        .registration-title h1 {
            color: #1F2937;
            font-size: 32px;
            margin: 15px 0 8px;
        }

        .registration-title p {
            color: #6B7280;
            font-size: 14px;
            line-height: 1.6;
        }

        /* STEP INDICATOR */

        .steps {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 30px;
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
            background-color: #E5E7EB;
            margin: 0 8px 20px;
        }

        /* ROLE */

        .role-title {
            color: #374151;
            font-size: 13px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .role-selection {
            display: flex;
            gap: 15px;
            margin-bottom: 25px;
        }

        .role-box {
            flex: 1;
            border: 1px solid #D1D5DB;
            border-radius: 8px;
            padding: 14px;
            text-align: center;
            color: #374151;
        }

        .role-box.selected {
            border: 2px solid #D80032;
            color: #D80032;
            background-color: #FFF5F7;
        }

        .role-icon {
            font-size: 22px;
            display: block;
            margin-bottom: 5px;
        }

        /* FORM */

        .form-row {
            display: flex;
            gap: 18px;
        }

        .form-group {
            flex: 1;
            margin-bottom: 18px;
        }

        .form-label {
            display: block;
            color: #374151;
            font-size: 12px;
            font-weight: bold;
            margin-bottom: 7px;
        }

        .input-icon-box {
            position: relative;
            width: 100%;
        }

        .registration-input {
            width: 100%;
            box-sizing: border-box;
            padding: 12px 12px 12px 40px;
            border: 1px solid #D1D5DB;
            border-radius: 6px;
            font-size: 14px;
        }

        .registration-input:focus {
            outline: none;
            border-color: #D80032;
        }

        .left-icon {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 15px;
            z-index: 2;
        }

        .validation {
            display: block;
            color: #D80032;
            font-size: 11px;
            margin-top: 4px;
        }

        /* TERMS */

        .terms {
            color: #6B7280;
            font-size: 12px;
            margin: 8px 0 20px;
        }

        .terms a {
            color: #D80032;
            text-decoration: none;
            font-weight: bold;
        }

        /* BUTTON */

        .create-button {
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

        .create-button:hover {
            background-color: #B9002B;
        }

        /* LOGIN LINK */

        .login-link {
            text-align: center;
            margin-top: 20px;
            color: #6B7280;
            font-size: 13px;
        }

        .login-link a {
            color: #D80032;
            font-weight: bold;
            text-decoration: none;
        }

        /* RIGHT COMMUNITY */

        .community-section {
            flex: 0.8;
            padding: 45px 20px;
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

            .registration-container {
                flex-direction: column;
            }

            .registration-card {
                width: 100%;
                box-sizing: border-box;
            }

            .community-section {
                padding: 20px;
            }

        }

        @media (max-width: 600px) {

            .form-row {
                flex-direction: column;
                gap: 0;
            }

            .role-selection {
                flex-direction: column;
            }

            .step-line {
                width: 25px;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="registration-page">

        <div class="registration-container">


            <!-- LEFT REGISTRATION FORM -->

            <div class="registration-card">


                <!-- STEP INDICATOR -->

                <div class="steps">

                    <div class="step active">

                        <div class="step-circle">
                            1
                        </div>

                        Account

                    </div>


                    <div class="step-line"></div>


                    <div class="step">

                        <div class="step-circle">
                            2
                        </div>

                        Verification

                    </div>


                    <div class="step-line"></div>


                    <div class="step">

                        <div class="step-circle">
                            3
                        </div>

                        Complete

                    </div>

                </div>


                <!-- TITLE -->

                <div class="registration-title">

                    <h1>
                        Create Your Account
                    </h1>

                    <p>
                        Join BloodConnect and help make blood available
                        to those who need it.
                    </p>

                </div>


                <!-- ROLE -->

                <div class="role-title">
                    I WANT TO JOIN AS:
                </div>


                <div class="role-selection">

                    <div class="role-box selected">

                        <span class="role-icon">
                            ♥
                        </span>

                        Donor

                    </div>


                    <div class="role-box">

                        <span class="role-icon">
                            🔍
                        </span>

                        Blood Seeker

                    </div>

                </div>


                <!-- FIRST NAME + LAST NAME -->

                <div class="form-row">


                    <div class="form-group">

                        <label class="form-label">
                            FIRST NAME
                        </label>


                        <div class="input-icon-box">

                            <span class="left-icon">
                                👤
                            </span>


                            <asp:TextBox
                                ID="FirstNameTXT"
                                runat="server"
                                CssClass="registration-input"
                                placeholder="Jane">
                            </asp:TextBox>

                        </div>


                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1"
                            runat="server"
                            ControlToValidate="FirstNameTXT"
                            ErrorMessage="FIRST NAME IS REQUIRED"
                            ForeColor="Red"
                            CssClass="validation">
                        </asp:RequiredFieldValidator>

                    </div>


                    <div class="form-group">

                        <label class="form-label">
                            LAST NAME
                        </label>


                        <div class="input-icon-box">

                            <span class="left-icon">
                                👤
                            </span>


                            <asp:TextBox
                                ID="LastNameTXT"
                                runat="server"
                                CssClass="registration-input"
                                placeholder="Doe">
                            </asp:TextBox>

                        </div>


                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator2"
                            runat="server"
                            ControlToValidate="LastNameTXT"
                            ErrorMessage="LAST NAME IS REQUIRED"
                            ForeColor="Red"
                            CssClass="validation">
                        </asp:RequiredFieldValidator>

                    </div>

                </div>


                <!-- EMAIL -->

                <div class="form-group">

                    <label class="form-label">
                        EMAIL ADDRESS
                    </label>


                    <div class="input-icon-box">

                        <span class="left-icon">
                            ✉
                        </span>


                        <asp:TextBox
                            ID="EmailTXT"
                            runat="server"
                            CssClass="registration-input"
                            placeholder="jane@example.com">
                        </asp:TextBox>

                    </div>


                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator3"
                        runat="server"
                        ControlToValidate="EmailTXT"
                        ErrorMessage="EMAIL IS REQUIRED"
                        ForeColor="Red"
                        CssClass="validation">
                    </asp:RequiredFieldValidator>


                    <asp:RegularExpressionValidator
                        ID="RegularExpressionValidator1"
                        runat="server"
                        ControlToValidate="EmailTXT"
                        ErrorMessage="EMAIL IS INVALID"
                        ForeColor="Red"
                        CssClass="validation"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                    </asp:RegularExpressionValidator>

                </div>


                <!-- PHONE -->

                <div class="form-group">

                    <label class="form-label">
                        PHONE NUMBER
                    </label>


                    <div class="input-icon-box">

                        <span class="left-icon">
                            ☎
                        </span>


                        <asp:TextBox
                            ID="PhoneTXT"
                            runat="server"
                            CssClass="registration-input"
                            placeholder="9876543210"
                            MaxLength="10">
                        </asp:TextBox>

                    </div>


                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator4"
                        runat="server"
                        ControlToValidate="PhoneTXT"
                        ErrorMessage="PHONE NUMBER IS REQUIRED"
                        ForeColor="Red"
                        CssClass="validation">
                    </asp:RequiredFieldValidator>


                    <asp:RegularExpressionValidator
                        ID="RegularExpressionValidator2"
                        runat="server"
                        ControlToValidate="PhoneTXT"
                        ErrorMessage="INVALID NUMBER"
                        ForeColor="Red"
                        CssClass="validation"
                        ValidationExpression="\d{10}">
                    </asp:RegularExpressionValidator>

                </div>


                <!-- CITY + PINCODE -->

                <div class="form-row">


                    <div class="form-group">

                        <label class="form-label">
                            CITY
                        </label>


                        <div class="input-icon-box">

                            <span class="left-icon">
                                🏢
                            </span>


                            <asp:TextBox
                                ID="CityTXT"
                                runat="server"
                                CssClass="registration-input"
                                placeholder="Rajkot">
                            </asp:TextBox>

                        </div>


                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator5"
                            runat="server"
                            ControlToValidate="CityTXT"
                            ErrorMessage="CITY IS REQUIRED"
                            ForeColor="Red"
                            CssClass="validation">
                        </asp:RequiredFieldValidator>

                    </div>


                    <div class="form-group">

                        <label class="form-label">
                            PINCODE / ZIP
                        </label>


                        <div class="input-icon-box">

                            <span class="left-icon">
                                📍
                            </span>


                            <asp:TextBox
                                ID="PincodeTXT"
                                runat="server"
                                CssClass="registration-input"
                                placeholder="360001">
                            </asp:TextBox>

                        </div>


                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator6"
                            runat="server"
                            ControlToValidate="PincodeTXT"
                            ErrorMessage="PINCODE IS REQUIRED"
                            ForeColor="Red"
                            CssClass="validation">
                        </asp:RequiredFieldValidator>

                    </div>

                </div>


                <!-- PASSWORD + CONFIRM PASSWORD -->

                <div class="form-row">


                    <div class="form-group">

                        <label class="form-label">
                            CREATE PASSWORD
                        </label>


                        <div class="input-icon-box">

                            <span class="left-icon">
                                🔒
                            </span>


                            <asp:TextBox
                                ID="PasswordTXT"
                                runat="server"
                                CssClass="registration-input"
                                TextMode="Password"
                                placeholder="Create password">
                            </asp:TextBox>

                        </div>


                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator7"
                            runat="server"
                            ControlToValidate="PasswordTXT"
                            ErrorMessage="PASSWORD IS REQUIRED"
                            ForeColor="Red"
                            CssClass="validation">
                        </asp:RequiredFieldValidator>

                    </div>


                    <div class="form-group">

                        <label class="form-label">
                            CONFIRM PASSWORD
                        </label>


                        <div class="input-icon-box">

                            <span class="left-icon">
                                🔒
                            </span>


                            <asp:TextBox
                                ID="ConfirmPasswordTXT"
                                runat="server"
                                CssClass="registration-input"
                                TextMode="Password"
                                placeholder="Confirm password">
                            </asp:TextBox>

                        </div>


                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator8"
                            runat="server"
                            ControlToValidate="ConfirmPasswordTXT"
                            ErrorMessage="CONFIRM PASSWORD IS REQUIRED"
                            ForeColor="Red"
                            CssClass="validation">
                        </asp:RequiredFieldValidator>


                        <asp:CompareValidator
                            ID="CompareValidator1"
                            runat="server"
                            ControlToCompare="PasswordTXT"
                            ControlToValidate="ConfirmPasswordTXT"
                            ErrorMessage="PASSWORD DOES NOT MATCH"
                            ForeColor="Red"
                            CssClass="validation">
                        </asp:CompareValidator>

                    </div>

                </div>


               


                <!-- CREATE ACCOUNT -->

                <asp:Button
                    ID="CREATEACCOUNT"
                    runat="server"
                    Text="Create Account"
                    CssClass="create-button"
                    OnClick="CREATEACCOUNT_Click" />


                <!-- LOGIN -->

                <div class="login-link">

                    Already have an account?

                    <a href="Login.aspx">
                        Login
                    </a>

                </div>

            </div>


            <!-- RIGHT COMMUNITY SECTION -->

            <div class="community-section">

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

                    <p>
                        A single donation can save up to three lives.
                        Your contribution makes a direct, critical impact.
                    </p>

                </div>


                <div class="feature">

                    <h3>
                        🤝 Connect With Your Community
                    </h3>

                    <p>
                        Join local drives, meet fellow donors, and support
                        the immediate needs of hospitals in your area.
                    </p>

                </div>


                <div class="feature">

                    <h3>
                        🔒 Safe &amp; Secure
                    </h3>

                    <p>
                        Your health data and personal information are encrypted
                        and protected with industry-leading security.
                    </p>

                </div>

            </div>

        </div>

    </section>

</asp:Content>