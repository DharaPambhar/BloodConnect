<%@ Page Title="Edit Profile" Language="C#" MasterPageFile="~/Donor.Master"
    AutoEventWireup="true"
    CodeBehind="EditProfile.aspx.cs"
    Inherits="WebApplication1.EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        .edit-page {
            max-width: 1100px;
            margin: auto;
        }

        .page-header {
            margin-bottom: 25px;
        }

        .page-header h1 {
            margin: 0;
            color: #202338;
            font-size: 28px;
        }

        .page-header p {
            margin: 7px 0 0;
            color: #6B7280;
            font-size: 14px;
        }

        .edit-card {
            background: white;
            border: 1px solid #E5E7EB;
            border-radius: 14px;
            padding: 25px;
            margin-bottom: 20px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.03);
        }

        .edit-card h2 {
            margin: 0 0 20px;
            color: #202338;
            font-size: 18px;
        }

        .profile-photo-section {
            display: flex;
            align-items: center;
            gap: 20px;
            margin-bottom: 25px;
        }

        .profile-photo {
            width: 90px;
            height: 90px;
            border-radius: 50%;
            background-color: #FFF0F3;
            color: #D80032;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 30px;
            font-weight: bold;
        }

        .photo-text h3 {
            margin: 0 0 5px;
            color: #202338;
            font-size: 16px;
        }

        .photo-text p {
            margin: 0;
            color: #6B7280;
            font-size: 12px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group.full {
            grid-column: 1 / 3;
        }

        .form-group label {
            color: #374151;
            font-size: 13px;
            font-weight: 600;
            margin-bottom: 7px;
        }

        .form-control {
            width: 100%;
            box-sizing: border-box;
            padding: 11px 13px;
            border: 1px solid #D1D5DB;
            border-radius: 7px;
            font-size: 13px;
            color: #202338;
            outline: none;
        }

        .form-control:focus {
            border-color: #D80032;
        }

        .readonly {
            background-color: #F3F4F6;
            color: #6B7280;
        }

        .blood-options {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        .blood-option {
            padding: 9px 15px;
            border: 1px solid #D1D5DB;
            border-radius: 7px;
            font-size: 13px;
            color: #374151;
        }

        .blood-option.selected {
            background-color: #FFF0F3;
            border-color: #D80032;
            color: #D80032;
            font-weight: bold;
        }

        .form-actions {
            display: flex;
            justify-content: flex-end;
            gap: 12px;
            margin-top: 25px;
        }

        .cancel-button {
            padding: 11px 22px;
            border: 1px solid #D1D5DB;
            background-color: white;
            color: #374151;
            border-radius: 7px;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
        }

        .save-button {
            padding: 11px 22px;
            border: none;
            background-color: #D80032;
            color: white;
            border-radius: 7px;
            font-size: 13px;
            font-weight: bold;
            cursor: pointer;
        }

        .save-button:hover {
            background-color: #B8002B;
        }

        .success-message {
            display: block;
            margin-top: 15px;
            color: #15803D;
            font-size: 13px;
            font-weight: bold;
        }

        .note-box {
            background-color: #EAEFFD;
            border-radius: 10px;
            padding: 15px;
            color: #59688D;
            font-size: 12px;
        }

        @media (max-width: 700px) {

            .form-grid {
                grid-template-columns: 1fr;
            }

            .form-group.full {
                grid-column: 1;
            }

            .form-actions {
                justify-content: stretch;
            }

            .cancel-button,
            .save-button {
                flex: 1;
                text-align: center;
            }
        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="edit-page">

        <!-- PAGE HEADER -->

        <div class="page-header">

            <h1>Edit Profile</h1>

            <p>
                Update your personal information and donor details.
            </p>

        </div>


        <!-- PERSONAL INFORMATION -->

        <div class="edit-card">

            <h2>Personal Information</h2>


            <!-- PROFILE PHOTO -->

            <div class="profile-photo-section">

                <div class="profile-photo">
                    R
                </div>

                <div class="photo-text">

                    <h3>Profile Photo</h3>

                    <p>
                        Your profile photo helps other users identify you.
                    </p>

                </div>

            </div>


            <!-- FORM -->

            <div class="form-grid">


                <div class="form-group">

                    <label>Full Name</label>

                    <asp:TextBox ID="txtFullName"
                        runat="server"
                        CssClass="form-control"
                        Text="Riya Shah">
                    </asp:TextBox>

                </div>


                <div class="form-group">

                    <label>Date of Birth</label>

                    <asp:TextBox ID="txtDOB"
                        runat="server"
                        CssClass="form-control"
                        TextMode="Date"
                        Text="1995-08-15">
                    </asp:TextBox>

                </div>


                <div class="form-group">

                    <label>Gender</label>

                    <asp:DropDownList ID="ddlGender"
                        runat="server"
                        CssClass="form-control">

                        <asp:ListItem>Female</asp:ListItem>
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>

                    </asp:DropDownList>

                </div>


                <div class="form-group">

                    <label>Phone Number</label>

                    <asp:TextBox ID="txtPhone"
                        runat="server"
                        CssClass="form-control"
                        Text="9876543210">
                    </asp:TextBox>

                </div>


                <div class="form-group">

                    <label>Email Address</label>

                    <asp:TextBox ID="txtEmail"
                        runat="server"
                        CssClass="form-control"
                        Text="riya@example.com">
                    </asp:TextBox>

                </div>


                <div class="form-group">

                    <label>City</label>

                    <asp:TextBox ID="txtCity"
                        runat="server"
                        CssClass="form-control"
                        Text="Ahmedabad">
                    </asp:TextBox>

                </div>


                <div class="form-group">

                    <label>State</label>

                    <asp:TextBox ID="txtState"
                        runat="server"
                        CssClass="form-control"
                        Text="Gujarat">
                    </asp:TextBox>

                </div>


                <div class="form-group">

                    <label>Pincode</label>

                    <asp:TextBox ID="txtPincode"
                        runat="server"
                        CssClass="form-control"
                        Text="380015">
                    </asp:TextBox>

                </div>

            </div>

        </div>


        <!-- BLOOD INFORMATION -->

        <div class="edit-card">

            <h2>Donor Information</h2>


            <div class="form-grid">


                <div class="form-group">

                    <label>Blood Group</label>

                    <asp:DropDownList ID="ddlBloodGroup"
                        runat="server"
                        CssClass="form-control">

                        <asp:ListItem>O+</asp:ListItem>
                        <asp:ListItem>O-</asp:ListItem>
                        <asp:ListItem>A+</asp:ListItem>
                        <asp:ListItem>A-</asp:ListItem>
                        <asp:ListItem>B+</asp:ListItem>
                        <asp:ListItem>B-</asp:ListItem>
                        <asp:ListItem>AB+</asp:ListItem>
                        <asp:ListItem>AB-</asp:ListItem>

                    </asp:DropDownList>

                </div>


                <div class="form-group">

                    <label>Donor Type</label>

                    <asp:DropDownList ID="ddlDonorType"
                        runat="server"
                        CssClass="form-control">

                        <asp:ListItem>Regular Donor</asp:ListItem>
                        <asp:ListItem>Occasional Donor</asp:ListItem>
                        <asp:ListItem>First Time Donor</asp:ListItem>

                    </asp:DropDownList>

                </div>


                <div class="form-group full">

                    <div class="note-box">

                        Your blood group and donation information should be
                        entered carefully because it is used for blood donation
                        matching and emergency requests.

                    </div>

                </div>

            </div>

        </div>


        <!-- ACTION BUTTONS -->

        <div class="edit-card">

            <div class="form-actions">

                <a href="Donor_profile.aspx"
                   class="cancel-button">
                    Cancel
                </a>

                <asp:Button ID="btnSave"
                    runat="server"
                    Text="Save Changes"
                    CssClass="save-button"
                    OnClick="btnSave_Click" />

            </div>


            <asp:Label ID="lblMessage"
                runat="server"
                CssClass="success-message">
            </asp:Label>

        </div>

    </div>

</asp:Content>