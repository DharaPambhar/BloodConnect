<%@ Page Title="Emergency Blood Request" Language="C#" MasterPageFile="~/Site1.Master"
    AutoEventWireup="true" CodeBehind="Emergency.aspx.cs"
    Inherits="WebApplication1.Emergency" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        /* HERO */

        .emergency-hero {
            background: linear-gradient(135deg, #FFF0F3, #FFFFFF);
            padding: 90px 10%;
            text-align: center;
        }

        .emergency-tag {
            color: #D80032;
            font-size: 13px;
            font-weight: bold;
            letter-spacing: 1.5px;
            margin-bottom: 15px;
        }

        .emergency-hero h1 {
            font-size: 48px;
            margin-bottom: 20px;
            line-height: 1.25;
        }

        .black-title {
            color: #1F2937;
        }

        .red-title {
            color: #D80032;
        }

        .emergency-hero p {
            max-width: 850px;
            margin: 0 auto 30px;
            color: #6B7280;
            font-size: 18px;
            line-height: 1.7;
        }

        .hero-buttons {
            display: flex;
            justify-content: center;
            gap: 15px;
            flex-wrap: wrap;
        }

        .request-now {
            background-color: #D80032;
            color: white;
            padding: 13px 25px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
        }

        .find-blood {
            background-color: white;
            color: #D80032;
            border: 1px solid #D80032;
            padding: 12px 25px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
        }

        .request-now:hover {
            background-color: #B9002B;
            color: white;
        }

        .find-blood:hover {
            background-color: #FFF0F3;
            color: #D80032;
        }


        /* FORM SECTION */

        .request-section {
            background-color: #F3F4F6;
            padding: 60px 8%;
        }

        .request-container {
            max-width: 900px;
            margin: auto;
            background-color: white;
            padding: 45px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.06);
        }

        .request-container h2 {
            text-align: center;
            color: #1F2937;
            margin-bottom: 35px;
            font-size: 30px;
        }

        .form-row {
            display: flex;
            gap: 25px;
            margin-bottom: 22px;
        }

        .form-group {
            flex: 1;
        }

        .form-group.full {
            width: 100%;
        }

        .form-group label {
            display: block;
            font-size: 13px;
            font-weight: bold;
            color: #374151;
            margin-bottom: 8px;
        }

        .required {
            color: #D80032;
        }

        .form-control {
            width: 100%;
            box-sizing: border-box;
            padding: 13px;
            border: 1px solid #D1D5DB;
            border-radius: 6px;
            font-size: 14px;
            background-color: white;
        }

        .form-control:focus {
            outline: none;
            border-color: #D80032;
        }

        textarea.form-control {
            min-height: 110px;
            resize: vertical;
        }


        /* URGENCY */

        .urgency-title {
            font-size: 13px;
            font-weight: bold;
            color: #374151;
            margin-bottom: 12px;
        }

        .urgency-options {
            display: flex;
            gap: 15px;
            margin-bottom: 25px;
        }

        .urgency-option {
            flex: 1;
            border: 1px solid #D1D5DB;
            border-radius: 7px;
            padding: 15px;
            cursor: pointer;
            text-align: center;
            background-color: #FFFFFF;
        }

        .urgency-option:hover {
            border-color: #D80032;
            background-color: #FFF0F3;
        }

        .urgency-option strong {
            display: block;
            color: #D80032;
            font-size: 14px;
            margin-bottom: 5px;
        }

        .urgency-option span {
            color: #6B7280;
            font-size: 12px;
        }

        .send-button {
            width: 100%;
            background-color: #D80032;
            color: white;
            border: none;
            padding: 15px;
            border-radius: 6px;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
        }

        .send-button:hover {
            background-color: #B9002B;
        }

        .terms {
            text-align: center;
            margin-top: 15px;
            color: #6B7280;
            font-size: 12px;
        }


        /* MOBILE */

        @media (max-width: 768px) {

            .emergency-hero {
                padding: 60px 20px;
            }

            .emergency-hero h1 {
                font-size: 34px;
            }

            .emergency-hero p {
                font-size: 16px;
            }

            .request-section {
                padding: 40px 20px;
            }

            .request-container {
                padding: 25px;
            }

            .form-row {
                flex-direction: column;
                gap: 0;
            }

            .urgency-options {
                flex-direction: column;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- HERO -->

    <section class="emergency-hero">

        <div class="emergency-tag">
            EMERGENCY BLOOD REQUEST
        </div>

        <h1>
            <span class="black-title">
                Need Blood Urgently?
            </span>
            <br />

            <span class="red-title">
                Get Help. Save Time. Save Lives.
            </span>
        </h1>

        <p>
            Connect instantly with voluntary blood donors in your area.
            Every second counts in an emergency. Fill out the request form
            below to broadcast your need to our network of registered donors.
        </p>

        <div class="hero-buttons">

            <a href="#requestForm" class="request-now">
                REQUEST BLOOD NOW
            </a>

            <a href="FindBlood.aspx" class="find-blood">
                FIND BLOOD
            </a>

        </div>

    </section>


    <!-- REQUEST FORM -->

    <section class="request-section" id="requestForm">

        <div class="request-container">

            <h2>
                Create Emergency Request
            </h2>


            <!-- Blood Group + Units -->

            <div class="form-row">

                <div class="form-group">

                    <label>
                        PATIENT BLOOD GROUP
                        <span class="required">*</span>
                    </label>

                    <asp:DropDownList ID="ddlPatientBloodGroup"
                        runat="server"
                        CssClass="form-control">

                        <asp:ListItem>
                            Select Blood Group
                        </asp:ListItem>

                        <asp:ListItem>A+</asp:ListItem>
                        <asp:ListItem>A-</asp:ListItem>
                        <asp:ListItem>B+</asp:ListItem>
                        <asp:ListItem>B-</asp:ListItem>
                        <asp:ListItem>AB+</asp:ListItem>
                        <asp:ListItem>AB-</asp:ListItem>
                        <asp:ListItem>O+</asp:ListItem>
                        <asp:ListItem>O-</asp:ListItem>

                    </asp:DropDownList>

                </div>


                <div class="form-group">

                    <label>
                        UNITS REQUIRED
                        <span class="required">*</span>
                    </label>

                    <asp:DropDownList ID="ddlUnits"
                        runat="server"
                        CssClass="form-control">

                        <asp:ListItem>1 Unit</asp:ListItem>
                        <asp:ListItem>2 Units</asp:ListItem>
                        <asp:ListItem>3 Units</asp:ListItem>
                        <asp:ListItem>4 Units</asp:ListItem>
                        <asp:ListItem>5 Units</asp:ListItem>

                    </asp:DropDownList>

                </div>

            </div>


            <!-- Hospital -->

            <div class="form-row">

                <div class="form-group full">

                    <label>
                        HOSPITAL NAME &amp; ADDRESS
                        <span class="required">*</span>
                    </label>

                    <asp:TextBox ID="txtHospital"
                        runat="server"
                        CssClass="form-control"
                        placeholder="e.g. City General Hospital, Downtown">
                    </asp:TextBox>

                </div>

            </div>


            <!-- City + Contact -->

            <div class="form-row">

                <div class="form-group">

                    <label>
                        CITY / AREA
                        <span class="required">*</span>
                    </label>

                    <asp:TextBox ID="txtCity"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Search area">
                    </asp:TextBox>

                </div>


                <div class="form-group">

                    <label>
                        CONTACT NUMBER
                        <span class="required">*</span>
                    </label>

                    <asp:TextBox ID="txtContact"
                        runat="server"
                        CssClass="form-control"
                        placeholder="+1 (555) 000-0000">
                    </asp:TextBox>

                </div>

            </div>


            <!-- Required Date -->

            <div class="form-row">

                <div class="form-group">

                    <label>
                        REQUIRED BY (DATE &amp; TIME)
                        <span class="required">*</span>
                    </label>

                    <asp:TextBox ID="txtRequiredDate"
                        runat="server"
                        CssClass="form-control"
                        TextMode="DateTimeLocal">
                    </asp:TextBox>

                </div>

            </div>


            <!-- Additional Information -->

            <div class="form-row">

                <div class="form-group full">

                    <label>
                        ADDITIONAL INFORMATION (OPTIONAL)
                    </label>

                    <asp:TextBox ID="txtAdditionalInfo"
                        runat="server"
                        CssClass="form-control"
                        TextMode="MultiLine"
                        placeholder="Patient details, specific requirements, alternate contact person, etc.">
                    </asp:TextBox>

                </div>

            </div>


            <!-- Urgency Level -->

            <div class="urgency-title">
                URGENCY LEVEL
                <span class="required">*</span>
            </div>

            <div class="urgency-options">

                <div class="urgency-option">

                    <strong>
                        URGENT
                    </strong>

                    <span>
                        1-6 HRS
                    </span>

                </div>


                <div class="urgency-option">

                    <strong>
                        HIGH
                    </strong>

                    <span>
                        12-24 HRS
                    </span>

                </div>


                <div class="urgency-option">

                    <strong>
                        NORMAL
                    </strong>

                    <span>
                        24+ HRS
                    </span>

                </div>

            </div>


            <!-- Submit Button -->

            <asp:Button ID="btnSendRequest"
                runat="server"
                Text="SEND EMERGENCY REQUEST"
                CssClass="send-button" />


            <div class="terms">

                By submitting this request, you agree to our
                Terms of Service and Privacy Policy.

            </div>

        </div>

    </section>

</asp:Content>