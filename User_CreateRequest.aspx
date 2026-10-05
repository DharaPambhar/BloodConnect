<%@ Page Title="Create Blood Request" Language="C#" MasterPageFile="~/User.Master"
    AutoEventWireup="true" CodeBehind="User_CreateRequest.aspx.cs"
    Inherits="BloodConnect.User_CreateRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .page-container {
            padding: 30px;
            background: #f8f9fc;
            min-height: calc(100vh - 70px);
        }

        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 25px;
        }

        .page-header h1 {
            font-size: 28px;
            font-weight: 700;
            color: #252525;
            margin: 0 0 7px 0;
        }

        .page-header p {
            color: #777;
            margin: 0;
            font-size: 14px;
        }

        .cancel-btn {
            background: white;
            border: 1px solid #d8d8d8;
            color: #555;
            padding: 10px 22px;
            border-radius: 8px;
            font-size: 14px;
            text-decoration: none;
            transition: 0.2s;
        }

        .cancel-btn:hover {
            background: #f4f4f4;
            color: #333;
        }

        .content-grid {
            display: grid;
            grid-template-columns: minmax(0, 1fr) 350px;
            gap: 24px;
            align-items: start;
        }

        .form-card {
            background: white;
            border: 1px solid #e9e9ef;
            border-radius: 14px;
            padding: 25px;
            margin-bottom: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.03);
        }

        .section-title {
            font-size: 18px;
            font-weight: 700;
            color: #292929;
            margin-bottom: 18px;
        }

        .section-subtitle {
            color: #888;
            font-size: 13px;
            margin-top: -12px;
            margin-bottom: 18px;
        }

        .request-types {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }

        .request-option {
            border: 1.5px solid #dedede;
            border-radius: 10px;
            padding: 16px;
            display: flex;
            align-items: flex-start;
            gap: 12px;
            background: white;
        }

        .request-option.selected {
            border: 1.5px solid #c62828;
            background: #fffafa;
        }

        .request-option input {
            margin-top: 4px;
            accent-color: #c62828;
        }

        .option-title {
            font-weight: 600;
            color: #333;
            font-size: 14px;
            margin-bottom: 4px;
        }

        .option-desc {
            color: #888;
            font-size: 12px;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 18px;
            margin-bottom: 18px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-label {
            font-size: 13px;
            font-weight: 600;
            color: #444;
            margin-bottom: 8px;
        }

        .form-control-custom {
            width: 100%;
            height: 44px;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 0 13px;
            font-size: 14px;
            color: #444;
            background: white;
            outline: none;
            box-sizing: border-box;
        }

        .form-control-custom:focus {
            border-color: #a77df4;
        }

        .units-control {
            display: flex;
            height: 44px;
        }

        .unit-btn {
            width: 45px;
            border: 1px solid #ddd;
            background: #f8f8f8;
            font-size: 20px;
            color: #555;
        }

        .unit-number {
            flex: 1;
            border-top: 1px solid #ddd;
            border-bottom: 1px solid #ddd;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            color: #333;
        }

        .summary-card {
            background: white;
            border: 1px solid #e9e9ef;
            border-radius: 14px;
            padding: 24px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.03);
            position: sticky;
            top: 20px;
        }

        .summary-title {
            font-size: 19px;
            font-weight: 700;
            color: #292929;
            margin-bottom: 22px;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            gap: 15px;
            padding: 13px 0;
            border-bottom: 1px solid #f0f0f0;
        }

        .summary-label {
            color: #888;
            font-size: 13px;
        }

        .summary-value {
            color: #333;
            font-size: 13px;
            font-weight: 600;
            text-align: right;
        }

        .normal-badge {
            background: #eaf3ff;
            color: #3973b9;
            padding: 5px 11px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }

        .blood-badge {
            background: #fdeaea;
            color: #c62828;
            padding: 5px 11px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 700;
        }

        .submit-btn {
            width: 100%;
            background: #c62828;
            border: none;
            color: white;
            padding: 13px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            margin-top: 22px;
            cursor: pointer;
        }

        .submit-btn:hover {
            background: #a91f1f;
        }

        .summary-note {
            margin-top: 14px;
            text-align: center;
            color: #888;
            font-size: 12px;
            line-height: 1.5;
        }

        @media (max-width: 900px) {
            .content-grid {
                grid-template-columns: 1fr;
            }

            .summary-card {
                position: static;
            }
        }

        @media (max-width: 650px) {
            .page-container {
                padding: 18px;
            }

            .page-header {
                flex-direction: column;
                gap: 15px;
            }

            .request-types,
            .form-row {
                grid-template-columns: 1fr;
            }
        }
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-container">

        <!-- PAGE HEADER -->
        <div class="page-header">

            <div>
                <h1>Create Blood Request</h1>

                <p>
                    Provide the details below to help us connect your request
                    with relevant potential donors.
                </p>
            </div>

            <a href="User_Dashboard.aspx" class="cancel-btn">
                Cancel
            </a>

        </div>


        <div class="content-grid">

            <!-- LEFT FORM -->
            <div>

                <!-- REQUEST TYPE -->
                <div class="form-card">

                    <div class="section-title">
                        Request Type
                    </div>

                    <div class="request-types">

                        <div class="request-option selected">

                            <input type="radio"
                                   name="requestType"
                                   checked="checked" />

                            <div>
                                <div class="option-title">
                                    Normal Request
                                </div>

                                <div class="option-desc">
                                    Standard processing time
                                </div>
                            </div>

                        </div>


                        <div class="request-option">

                            <input type="radio"
                                   name="requestType" />

                            <div>
                                <div class="option-title">
                                    Emergency Request
                                </div>

                                <div class="option-desc">
                                    Priority donor alerts
                                </div>
                            </div>

                        </div>

                    </div>

                </div>


                <!-- BLOOD REQUIREMENT -->
                <div class="form-card">

                    <div class="section-title">
                        Blood Requirement
                    </div>

                    <div class="form-row">

                        <div class="form-group">

                            <label class="form-label">
                                Blood Group Needed
                            </label>

                            <select class="form-control-custom">
                                <option selected="selected">
                                    O Positive (O+)
                                </option>
                                <option>A Positive (A+)</option>
                                <option>A Negative (A-)</option>
                                <option>B Positive (B+)</option>
                                <option>B Negative (B-)</option>
                                <option>AB Positive (AB+)</option>
                                <option>AB Negative (AB-)</option>
                                <option>O Negative (O-)</option>
                            </select>

                        </div>


                        <div class="form-group">

                            <label class="form-label">
                                Units Required
                            </label>

                            <div class="units-control">

                                <button type="button"
                                        class="unit-btn">
                                    −
                                </button>

                                <div class="unit-number">
                                    2
                                </div>

                                <button type="button"
                                        class="unit-btn">
                                    +
                                </button>

                            </div>

                        </div>

                    </div>


                    <div class="form-row">

                        <div class="form-group">

                            <label class="form-label">
                                Required Date
                            </label>

                            <input type="text"
                                   class="form-control-custom"
                                   value="08/20/2026" />

                        </div>


                        <div class="form-group">

                            <label class="form-label">
                                Required Time
                            </label>

                            <input type="text"
                                   class="form-control-custom"
                                   value="10:00 AM" />

                        </div>

                    </div>

                </div>


                <!-- HOSPITAL DETAILS -->
                <div class="form-card">

                    <div class="section-title">
                        Hospital Details
                    </div>

                    <div class="form-row">

                        <div class="form-group">

                            <label class="form-label">
                                Hospital Name
                            </label>

                            <input type="text"
                                   class="form-control-custom"
                                   value="CityCare Hospital" />

                        </div>


                        <div class="form-group">

                            <label class="form-label">
                                Area
                            </label>

                            <input type="text"
                                   class="form-control-custom"
                                   value="Navrangpura" />

                        </div>

                    </div>


                    <div class="form-row">

                        <div class="form-group">

                            <label class="form-label">
                                City
                            </label>

                            <input type="text"
                                   class="form-control-custom"
                                   value="Ahmedabad" />

                        </div>


                        <div class="form-group">

                            <label class="form-label">
                                State
                            </label>

                            <input type="text"
                                   class="form-control-custom"
                                   value="Gujarat" />

                        </div>

                    </div>

                </div>

            </div>


            <!-- RIGHT SUMMARY -->
            <div>

                <div class="summary-card">

                    <div class="summary-title">
                        Request Summary
                    </div>


                    <div class="summary-row">

                        <div class="summary-label">
                            Type
                        </div>

                        <div class="summary-value">
                            <span class="normal-badge">
                                Normal
                            </span>
                        </div>

                    </div>


                    <div class="summary-row">

                        <div class="summary-label">
                            Blood Group
                        </div>

                        <div class="summary-value">
                            <span class="blood-badge">
                                O+
                            </span>
                        </div>

                    </div>


                    <div class="summary-row">

                        <div class="summary-label">
                            Units
                        </div>

                        <div class="summary-value">
                            2 Units
                        </div>

                    </div>


                    <div class="summary-row">

                        <div class="summary-label">
                            Date &amp; Time
                        </div>

                        <div class="summary-value">
                            20 Aug 2026, 10:00 AM
                        </div>

                    </div>


                    <div class="summary-row">

                        <div class="summary-label">
                            Hospital
                        </div>

                        <div class="summary-value">
                            CityCare Hospital<br />
                            Navrangpura, Ahmedabad
                        </div>

                    </div>


                    <asp:Button ID="btnSubmitRequest"
                        runat="server"
                        Text="Submit Blood Request"
                        CssClass="submit-btn"
                        OnClick="btnSubmitRequest_Click" />


                    <div class="summary-note">
                        Please review your information before submitting.
                    </div>

                </div>

            </div>

        </div>

    </div>

</asp:Content>