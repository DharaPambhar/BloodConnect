<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site1.Master"
    AutoEventWireup="true" CodeBehind="Login.aspx.cs"
    Inherits="BloodConnect.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        .login-page {
            background-color: #F8F9FA;
            min-height: 550px;
            padding: 70px 8%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-container {
            width: 1100px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 70px;
        }

        /* LEFT SECTION */

        .login-left {
            flex: 1;
            padding: 20px;
        }

        .login-left h1 {
            font-size: 48px;
            color: #1F2937;
            line-height: 1.2;
            margin-bottom: 20px;
        }

        .login-left h1 span {
            color: #D80032;
        }

        .login-left p {
            font-size: 17px;
            color: #6B7280;
            line-height: 1.7;
            max-width: 500px;
        }

        /* LOGIN CARD */

        .login-card {
            width: 400px;
            background-color: #FFFFFF;
            padding: 40px;
            border-radius: 14px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.08);
        }

        .login-card h2 {
            color: #1F2937;
            font-size: 30px;
            margin-bottom: 8px;
            text-align: center;
        }

        .login-subtitle {
            color: #6B7280;
            font-size: 14px;
            margin-bottom: 28px;
            text-align: center;
        }

        /* FORM */

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            color: #374151;
            font-size: 13px;
            font-weight: bold;
            margin-bottom: 8px;
        }

        /* INPUT WITH ICON */

        .input-icon-box {
            position: relative;
            width: 100%;
        }

        .login-input {
            width: 100%;
            box-sizing: border-box;
            padding: 13px 13px 13px 42px;
            border: 1px solid #D1D5DB;
            border-radius: 6px;
            font-size: 14px;
        }

        .login-input:focus {
            outline: none;
            border-color: #D80032;
        }

        .left-icon {
            position: absolute;
            left: 13px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 16px;
            z-index: 2;
        }

        /* VALIDATION */

        .validation {
            display: block;
            color: #D80032;
            font-size: 12px;
            margin-top: 5px;
        }

        /* REMEMBER ME + FORGOT */

        .login-options {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 5px;
            margin-bottom: 25px;
            font-size: 13px;
        }

        .remember {
            color: #6B7280;
        }

        .forgot {
            color: #D80032;
            text-decoration: none;
            font-weight: bold;
        }

        .forgot:hover {
            text-decoration: underline;
        }

        /* LOGIN BUTTON */

        .login-button {
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

        .login-button:hover {
            background-color: #B9002B;
        }

        /* REGISTER */

        .register-text {
            text-align: center;
            margin-top: 25px;
            color: #6B7280;
            font-size: 14px;
        }

        .register-text a {
            color: #D80032;
            text-decoration: none;
            font-weight: bold;
        }

        .register-text a:hover {
            text-decoration: underline;
        }

        /* RESPONSIVE */

        @media (max-width: 800px) {

            .login-container {
                flex-direction: column;
                gap: 30px;
            }

            .login-left {
                text-align: center;
            }

            .login-left p {
                margin: auto;
            }

            .login-card {
                width: 100%;
                max-width: 400px;
                box-sizing: border-box;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="login-page">

        <div class="login-container">

            <!-- LEFT SECTION -->

            <div class="login-left">

                <h1>
                    Together, We <span>Save Lives.</span>
                </h1>

                <p>
                    Connect with donors, find blood, and be part of a
                    community that makes a difference.
                </p>

            </div>


            <!-- RIGHT LOGIN CARD -->

            <div class="login-card">

                <h2>
                    Welcome Back
                </h2>

                <p class="login-subtitle">
                    Sign in to your BloodConnect account.
                </p>


                <!-- EMAIL / PHONE -->

                <div class="form-group">

                    <label class="form-label">
                        EMAIL OR PHONE NUMBER
                    </label>

                    <div class="input-icon-box">

                        <span class="left-icon">
                            👤
                        </span>

                        <asp:TextBox
                            ID="EMAILTXT"
                            runat="server"
                            CssClass="login-input"
                            placeholder="Enter your email">
                        </asp:TextBox>

                    </div>

                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator1"
                        runat="server"
                        ControlToValidate="EMAILTXT"
                        ErrorMessage="EMAIL OR PHONE NUMBER IS REQUIRED"
                        ForeColor="Red"
                        CssClass="validation">
                    </asp:RequiredFieldValidator>

                    <asp:RegularExpressionValidator
                        ID="RegularExpressionValidator1"
                        runat="server"
                        ControlToValidate="EMAILTXT"
                        ErrorMessage="EMAIL IS INVALID"
                        ForeColor="Red"
                        CssClass="validation"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                    </asp:RegularExpressionValidator>

                </div>


                <!-- PASSWORD -->

                <div class="form-group">

                    <label class="form-label">
                        PASSWORD
                    </label>

                    <div class="input-icon-box">

                        <span class="left-icon">
                            🔒
                        </span>

                        <asp:TextBox
                            ID="PWDTXT"
                            runat="server"
                            CssClass="login-input"
                            TextMode="Password"
                            placeholder="Enter your password">
                        </asp:TextBox>

                    </div>

                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator2"
                        runat="server"
                        ControlToValidate="PWDTXT"
                        ErrorMessage="PASSWORD IS REQUIRED"
                        ForeColor="Red"
                        CssClass="validation">
                    </asp:RequiredFieldValidator>

                </div>


                <!-- REMEMBER ME + FORGOT PASSWORD -->

                <div class="login-options">

                    <span class="remember">

                        <asp:CheckBox
                            ID="RememberMe"
                            runat="server"
                            Text=" Remember me" />

                    </span>

                    <a href="#" class="forgot">
                        Forgot Password?
                    </a>

                </div>


                <!-- LOGIN BUTTON -->

                <asp:Button
                    ID="LOGIN"
                    runat="server"
                    Text="Login →"
                    CssClass="login-button"
                    OnClick="LOGIN_Click" />


                <!-- REGISTER -->

                <div class="register-text">

                    Don't have an account?

                    <a href="Registration.aspx">
                        Register
                    </a>

                </div>

            </div>

        </div>

    </section>

</asp:Content>