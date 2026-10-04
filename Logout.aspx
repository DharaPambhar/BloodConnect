<%@ Page Title="Logout" Language="C#" MasterPageFile="~/Donor.Master"
    AutoEventWireup="true"
    CodeBehind="Logout.aspx.cs"
    Inherits="WebApplication1.Logout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        .logout-page {
            min-height: calc(100vh - 130px);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .logout-card {
            width: 100%;
            max-width: 500px;
            background: white;
            border: 1px solid #E5E7EB;
            border-radius: 15px;
            padding: 40px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
        }

        .logout-icon {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            background: #F8E7EC;
            color: #D80032;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px auto;
            font-size: 32px;
        }

        .logout-title {
            font-size: 24px;
            font-weight: 700;
            color: #202338;
            margin-bottom: 10px;
        }

        .logout-text {
            color: #6B7280;
            font-size: 13px;
            line-height: 1.6;
            margin: 0 auto 25px auto;
            max-width: 390px;
        }

        .logout-actions {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .cancel-btn {
            background: white;
            color: #4B5563;
            border: 1px solid #D1D5DB;
            border-radius: 7px;
            padding: 11px 20px;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
        }

        .cancel-btn:hover {
            background: #F3F4F6;
        }

        .confirm-btn {
            background: #D80032;
            color: white;
            border: 1px solid #D80032;
            border-radius: 7px;
            padding: 11px 20px;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
        }

        .confirm-btn:hover {
            background: #B8002A;
        }

        .logout-message {
            display: block;
            margin-top: 18px;
            color: #15803D;
            font-size: 12px;
        }

        @media (max-width: 550px) {

            .logout-card {
                padding: 30px 20px;
            }

            .logout-actions {
                flex-direction: column;
            }

            .cancel-btn,
            .confirm-btn {
                width: 100%;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="logout-page">

        <div class="logout-card">

            <div class="logout-icon">
                🚪
            </div>

            <div class="logout-title">
                Logout
            </div>

            <div class="logout-text">
                Are you sure you want to logout from your BloodConnect donor account?
                You can login again anytime to continue using your account.
            </div>

            <div class="logout-actions">

                <asp:Button
                    ID="btnCancel"
                    runat="server"
                    Text="Cancel"
                    CssClass="cancel-btn"
                    OnClick="btnCancel_Click" />

                <asp:Button
                    ID="btnConfirmLogout"
                    runat="server"
                    Text="Logout"
                    CssClass="confirm-btn"
                    OnClick="btnConfirmLogout_Click" />

            </div>

            <asp:Label
                ID="lblMessage"
                runat="server"
                CssClass="logout-message">
            </asp:Label>

        </div>

    </div>

</asp:Content>