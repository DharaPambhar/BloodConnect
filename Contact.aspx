<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site1.Master"
    AutoEventWireup="true" CodeBehind="Contact.aspx.cs"
    Inherits="WebApplication1.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        /* =========================
           HERO SECTION
        ========================= */
        .contact-hero {
    background: linear-gradient(135deg, #FFF0F3, #FFE8EE);
    padding: 85px 10%;
    text-align: center;
}

        .contact-tag {
            color: #D80032;
            font-size: 13px;
            font-weight: bold;
            letter-spacing: 1.5px;
            margin-bottom: 15px;
        }

        .contact-hero h1 {
            font-size: 50px;
            color: #1F2937;
            margin-bottom: 20px;
        }

        .contact-hero p {
            max-width: 800px;
            margin: auto;
            color: #6B7280;
            font-size: 18px;
            line-height: 1.7;
        }


        /* =========================
           CONTACT SECTION
        ========================= */

        .contact-section {
            background-color: #F7F7F8;
            padding: 65px 8%;
        }

        .contact-container {
            max-width: 1150px;
            margin: auto;
            display: flex;
            gap: 45px;
            align-items: flex-start;
        }


        /* =========================
           CONTACT INFORMATION
        ========================= */

        .contact-info {
            flex: 1;
        }

        .contact-info h2,
        .message-box h2 {
            color: #1F2937;
            font-size: 28px;
            margin-bottom: 25px;
        }

        .info-card {
            background-color: #FFFFFF;
            padding: 22px;
            border-radius: 9px;
            margin-bottom: 15px;
            border: 1px solid #E5E7EB;
        }

        .info-card h3 {
            margin: 0 0 8px;
            color: #1F2937;
            font-size: 17px;
        }

        .info-card p {
            margin: 0;
            color: #6B7280;
            font-size: 14px;
            line-height: 1.6;
        }

        .info-card strong {
            color: #374151;
        }


        /* =========================
           EMERGENCY SUPPORT
        ========================= */

        .emergency-card {
            background-color: #FFFFFF;
            border: 2px solid #D80032;
        }

        .emergency-card h3 {
            color: #D80032;
        }

        .emergency-number {
            color: #D80032 !important;
            font-weight: bold;
            font-size: 16px !important;
            margin-top: 8px !important;
        }


        /* =========================
           MESSAGE FORM
        ========================= */

        .message-box {
            flex: 1.2;
            background-color: #FFFFFF;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
        }

        .form-row {
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
        }

        .form-group {
            flex: 1;
        }

        .form-group.full {
            width: 100%;
        }

        .form-group label {
            display: block;
            color: #374151;
            font-size: 13px;
            font-weight: bold;
            margin-bottom: 8px;
        }

        .form-control {
            width: 100%;
            box-sizing: border-box;
            padding: 12px;
            border: 1px solid #D1D5DB;
            border-radius: 6px;
            font-size: 14px;
            background-color: #FFFFFF;
        }

        .form-control:focus {
            outline: none;
            border-color: #D80032;
        }

        textarea.form-control {
            min-height: 130px;
            resize: vertical;
        }

        .send-message {
            background-color: #D80032;
            color: white;
            border: none;
            padding: 13px 28px;
            border-radius: 6px;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
        }

        .send-message:hover {
            background-color: #B9002B;
        }


        /* =========================
           LOCATION SECTION
        ========================= */

        .location-section {
    background-color: #F5F6F8;
    padding: 70px 8%;
}

        .location-container {
            max-width: 1150px;
            margin: auto;
            display: flex;
            gap: 45px;
            align-items: center;
        }

        .location-info {
            flex: 1;
        }

        .location-info h2 {
            color: #1F2937;
            font-size: 30px;
            margin-bottom: 15px;
        }

        .location-info > p {
            color: #6B7280;
            line-height: 1.7;
            font-size: 15px;
            margin-bottom: 25px;
        }

        .address-box {
            margin-bottom: 25px;
        }

        .address-box strong {
            display: block;
            color: #1F2937;
            margin-bottom: 7px;
        }

        .address-box span {
            color: #6B7280;
            line-height: 1.6;
            font-size: 14px;
        }

        .directions-btn {
            display: inline-block;
            background-color: #D80032;
            color: white;
            padding: 12px 24px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
            font-size: 14px;
        }

        .directions-btn:hover {
            background-color: #B9002B;
            color: white;
        }


        /* =========================
           MAP
        ========================= */

        .location-map {
            flex: 1;
        }

        .map-box {
            width: 100%;
            height: 330px;
            border-radius: 12px;
            overflow: hidden;
            border: 1px solid #E5E7EB;
            background-color: #F3F4F6;
        }

        .map-box iframe {
            width: 100%;
            height: 100%;
            border: 0;
            display: block;
        }


        /* =========================
           CTA SECTION
        ========================= */

    .contact-cta {
    background: linear-gradient(135deg, #FFF0F3, #FFE8EE);
    padding: 65px 20px;
    text-align: center;
    color: #1F2937;
}
        .contact-cta h2 {
            font-size: 34px;
            margin-bottom: 25px;
            color: #1F2937;
        }

        .cta-buttons {
            display: flex;
            justify-content: center;
            gap: 15px;
            flex-wrap: wrap;
        }

        .cta-find {
            background-color: #D80032;
            color: white;
            padding: 13px 27px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
        }

        .cta-donor {
            background-color: white;
            color: #D80032;
            border: 1px solid #D80032;
            padding: 12px 27px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
        }

        .cta-find:hover {
            background-color: #B9002B;
            color: white;
        }

        .cta-donor:hover {
            background-color: #FFF0F3;
            color: #D80032;
        }


        /* =========================
           MOBILE
        ========================= */

        @media (max-width: 768px) {

            .contact-hero {
                padding: 60px 20px;
            }

            .contact-hero h1 {
                font-size: 36px;
            }

            .contact-hero p {
                font-size: 16px;
            }

            .contact-section {
                padding: 45px 20px;
            }

            .contact-container {
                flex-direction: column;
            }

            .contact-info,
            .message-box {
                width: 100%;
                box-sizing: border-box;
            }

            .message-box {
                padding: 25px;
            }

            .form-row {
                flex-direction: column;
                gap: 0;
            }

            .location-section {
                padding: 50px 20px;
            }

            .location-container {
                flex-direction: column;
            }

            .location-map {
                width: 100%;
            }

            .contact-cta h2 {
                font-size: 28px;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!-- =========================
         HERO
    ========================= -->

    <section class="contact-hero">

        <div class="contact-tag">
            GET IN TOUCH
        </div>

        <h1>
            We're Here to Help.
        </h1>

        <p>
            Whether you have questions about donating, need help finding blood,
            or want to partner with us, our team is ready to assist you.
        </p>

    </section>


    <!-- =========================
         CONTACT INFORMATION + FORM
    ========================= -->

    <section class="contact-section">

        <div class="contact-container">


            <!-- LEFT SIDE -->

            <div class="contact-info">

                <h2>
                    Contact Information
                </h2>


                <div class="info-card">

                    <h3>
                        Visit Us
                    </h3>

                    <p>
                        123 Health Avenue, Medical District,
                        New York, NY 10001
                    </p>

                </div>


                <div class="info-card">

                    <h3>
                        Call Us
                    </h3>

                    <p>
                        <strong>+1 (800) 123-4567</strong>
                        <br />
                        Mon-Fri: 9 AM - 6 PM
                    </p>

                </div>


                <div class="info-card">

                    <h3>
                        Email Us
                    </h3>

                    <p>
                        support@bloodconnect.org
                    </p>

                </div>


                <div class="info-card emergency-card">

                    <h3>
                        Emergency Support
                    </h3>

                    <p>
                        Available 24/7 for urgent blood requests.
                    </p>

                    <p class="emergency-number">
                        +1 (800) 911-BLOOD
                    </p>

                </div>

            </div>


            <!-- RIGHT SIDE -->

            <div class="message-box">

                <h2>
                    Send a Message
                </h2>


                <div class="form-row">

                    <div class="form-group">

                        <label>
                            FULL NAME
                        </label>

                        <asp:TextBox ID="txtFullName"
                            runat="server"
                            CssClass="form-control"
                            placeholder="John Doe">
                        </asp:TextBox>

                    </div>


                    <div class="form-group">

                        <label>
                            EMAIL ADDRESS
                        </label>

                        <asp:TextBox ID="txtEmail"
                            runat="server"
                            CssClass="form-control"
                            placeholder="john@example.com">
                        </asp:TextBox>

                    </div>

                </div>


                <div class="form-row">

                    <div class="form-group">

                        <label>
                            PHONE NUMBER
                        </label>

                        <asp:TextBox ID="txtPhone"
                            runat="server"
                            CssClass="form-control"
                            placeholder="(123) 456-7890">
                        </asp:TextBox>

                    </div>


                    <div class="form-group">

                        <label>
                            SUBJECT
                        </label>

                        <asp:DropDownList ID="ddlSubject"
                            runat="server"
                            CssClass="form-control">

                            <asp:ListItem>
                                Select a subject
                            </asp:ListItem>

                            <asp:ListItem>
                                Blood Donation
                            </asp:ListItem>

                            <asp:ListItem>
                                Finding Blood
                            </asp:ListItem>

                            <asp:ListItem>
                                Partnership
                            </asp:ListItem>

                            <asp:ListItem>
                                General Inquiry
                            </asp:ListItem>

                        </asp:DropDownList>

                    </div>

                </div>


                <div class="form-row">

                    <div class="form-group full">

                        <label>
                            MESSAGE
                        </label>

                        <asp:TextBox ID="txtMessage"
                            runat="server"
                            CssClass="form-control"
                            TextMode="MultiLine"
                            placeholder="How can we help you today?">
                        </asp:TextBox>

                    </div>

                </div>


                <asp:Button ID="btnSendMessage"
                    runat="server"
                    Text="Send Message"
                    CssClass="send-message" />

            </div>

        </div>

    </section>


    <!-- =========================
         LOCATION
    ========================= -->

    <section class="location-section">

        <div class="location-container">


            <div class="location-info">

                <h2>
                    Find Us in the Heart of the City
                </h2>

                <p>
                    Our main headquarters and primary donation center is
                    easily accessible by public transit.
                </p>

                <div class="address-box">

                    <strong>
                        BloodConnect Headquarters
                    </strong>

                    <span>
                        123 Health Avenue, Medical District,
                        New York, NY 10001
                    </span>

                </div>

                <a href="#"
                   class="directions-btn">
                    Get Directions
                </a>

            </div>


            <div class="location-map">

                <div class="map-box">

                    <iframe
                        src="https://www.openstreetmap.org/export/embed.html?bbox=-74.015%2C40.705%2C-73.995%2C40.715&amp;layer=mapnik"
                        loading="lazy">
                    </iframe>

                </div>

            </div>

        </div>

    </section>


    <!-- =========================
         CTA
    ========================= -->

    <section class="contact-cta">

        <h2>
            Together, We Can Save More Lives.
        </h2>

        <div class="cta-buttons">

            <a href="FindBlood.aspx"
               class="cta-find">
                Find Blood
            </a>

            <a href="Registration.aspx"
               class="cta-donor">
                Become a Donor
            </a>

        </div>

    </section>


</asp:Content>