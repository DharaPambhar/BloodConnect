<%@ Page Title="Blood Requests - BloodConnect" Language="C#"
    MasterPageFile="~/Admin.Master"
    AutoEventWireup="true"
    CodeBehind="Admin_Requests.aspx.cs"
    Inherits="BloodConnect.Admin_Requests" %>

<asp:Content ID="TitleContent1" ContentPlaceHolderID="TitleContent" runat="server">
    Blood Requests - BloodConnect
</asp:Content>

<asp:Content ID="HeadContent1" ContentPlaceHolderID="head" runat="server">
    <style>
        .requests-page {
            padding: 24px;
            background: #F8FAFC;
            min-height: 100vh;
            color: #1F2937;
            font-family: Arial, sans-serif;
        }

        .page-heading {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            flex-wrap: wrap;
            margin-bottom: 24px;
        }

        .page-heading h2 {
            margin: 0 0 8px;
            font-size: 26px;
            font-weight: 700;
            color: #1F2937;
        }

        .page-heading p {
            margin: 0;
            color: #6B7280;
            font-size: 14px;
        }

        .btn-create {
            background: #B91C1C;
            color: white;
            padding: 12px 18px;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
        }

        .btn-create:hover {
            background: #991B1B;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(4, minmax(0, 1fr));
            gap: 18px;
            margin-bottom: 24px;
        }

        .stat-card {
            background: #FFFFFF;
            border: 1px solid #E5E7EB;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 2px 7px rgba(0,0,0,0.03);
        }

        .stat-top {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 15px;
        }

        .stat-icon {
            width: 42px;
            height: 42px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 21px;
        }

        .icon-red { background: #FEE2E2; color: #B91C1C; }
        .icon-blue { background: #DBEAFE; color: #2563EB; }
        .icon-yellow { background: #FEF3C7; color: #B45309; }
        .icon-green { background: #D1FAE5; color: #047857; }

        .stat-label {
            font-size: 14px;
            color: #6B7280;
            font-weight: 500;
        }

        .stat-number {
            font-size: 29px;
            font-weight: 700;
            margin: 8px 0;
            color: #111827;
        }

        .stat-description {
            color: #9CA3AF;
            font-size: 12px;
        }

        .filter-card, .table-card, .create-card {
            background: white;
            border: 1px solid #E5E7EB;
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 22px;
            box-shadow: 0 2px 7px rgba(0,0,0,0.03);
        }

        .filter-row {
            display: grid;
            grid-template-columns: minmax(220px, 2fr) repeat(3, minmax(130px, 1fr)) auto;
            gap: 12px;
            align-items: center;
        }

        .form-control {
            width: 100%;
            box-sizing: border-box;
            padding: 11px 12px;
            border: 1px solid #D1D5DB;
            border-radius: 7px;
            background: #FFFFFF;
            color: #374151;
            font-size: 13px;
            outline: none;
        }

        .form-control:focus {
            border-color: #B91C1C;
            box-shadow: 0 0 0 2px rgba(185,28,28,0.08);
        }

        .clear-link {
            color: #B91C1C;
            font-size: 13px;
            font-weight: 600;
            text-decoration: none;
            white-space: nowrap;
        }

        .clear-link:hover { text-decoration: underline; }

        .table-heading {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 12px;
            flex-wrap: wrap;
            margin-bottom: 18px;
        }

        .table-heading h3, .create-card h3 {
            margin: 0;
            font-size: 18px;
            color: #111827;
        }

        .request-count {
            padding: 6px 10px;
            border-radius: 20px;
            background: #FEE2E2;
            color: #991B1B;
            font-size: 12px;
            font-weight: 600;
        }

        .table-scroll {
            width: 100%;
            overflow-x: auto;
        }

        .requests-table {
            width: 100%;
            border-collapse: collapse;
            min-width: 1050px;
            font-size: 13px;
        }

        .requests-table th {
            text-align: left;
            padding: 14px 12px;
            color: #6B7280;
            background: #F9FAFB;
            border-bottom: 1px solid #E5E7EB;
            font-size: 11px;
            letter-spacing: 0.4px;
            white-space: nowrap;
        }

        .requests-table td {
            padding: 15px 12px;
            border-bottom: 1px solid #F1F5F9;
            vertical-align: middle;
            color: #374151;
        }

        .requests-table tr:hover td {
            background: #FFFAFA;
        }

        .request-id {
            color: #B91C1C;
            font-weight: 700;
            white-space: nowrap;
        }

        .patient-name {
            display: block;
            color: #111827;
            font-weight: 600;
            margin-bottom: 4px;
            white-space: nowrap;
        }

        .patient-sub {
            color: #9CA3AF;
            font-size: 11px;
        }

        .blood-group {
            display: inline-block;
            padding: 5px 9px;
            background: #FEE2E2;
            color: #991B1B;
            border-radius: 6px;
            font-weight: 700;
        }

        .urgency-badge, .status-badge {
            display: inline-block;
            padding: 6px 9px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 600;
            white-space: nowrap;
        }

        .urgency-critical { background: #FEE2E2; color: #B91C1C; }
        .urgency-high { background: #FFEDD5; color: #C2410C; }
        .urgency-medium { background: #FEF3C7; color: #92400E; }

        .status-active { background: #FEE2E2; color: #B91C1C; }
        .status-pending { background: #FEF3C7; color: #92400E; }
        .status-fulfilled { background: #D1FAE5; color: #047857; }
        .status-cancelled { background: #DBEAFE; color: #1D4ED8; }

        .action-link {
            color: #B91C1C;
            font-weight: 600;
            text-decoration: none;
            white-space: nowrap;
        }

        .action-link:hover { text-decoration: underline; }

        .create-grid {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 16px;
            margin-top: 20px;
        }

        .field-label {
            display: block;
            margin-bottom: 7px;
            color: #374151;
            font-size: 13px;
            font-weight: 600;
        }

        .form-actions {
            display: flex;
            gap: 10px;
            margin-top: 18px;
        }

        .btn-save {
            padding: 11px 18px;
            border: none;
            border-radius: 7px;
            background: #B91C1C;
            color: white;
            font-weight: 600;
            cursor: pointer;
        }

        .btn-cancel {
            padding: 11px 18px;
            border: 1px solid #D1D5DB;
            border-radius: 7px;
            background: white;
            color: #374151;
            font-weight: 600;
            cursor: pointer;
        }

        .message {
            display: block;
            margin-top: 12px;
            font-size: 13px;
            font-weight: 600;
        }

        .empty-message {
            padding: 25px;
            text-align: center;
            color: #6B7280;
        }

        @media (max-width: 1100px) {
            .stats-grid { grid-template-columns: repeat(2, minmax(0, 1fr)); }
            .filter-row { grid-template-columns: repeat(2, minmax(0, 1fr)); }
            .create-grid { grid-template-columns: repeat(2, minmax(0, 1fr)); }
        }

        @media (max-width: 600px) {
            .requests-page { padding: 14px; }
            .stats-grid, .filter-row, .create-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="MainContent1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="requests-page">

        <!-- Main heading -->
        <div class="page-heading">
            <div>
                <h2>Blood Requests</h2>
                <p>Monitor, review, and manage all blood requests submitted through BloodConnect.</p>
            </div>

            <asp:Button ID="btnShowCreate" runat="server"
                Text="+ Create Request"
                CssClass="btn-create"
                OnClick="btnShowCreate_Click" />
        </div>

        <!-- KPI Cards -->
        <div class="stats-grid">

            <div class="stat-card">
                <div class="stat-top">
                    <span class="stat-label">Total Requests</span>
                    <span class="stat-icon icon-red">📄</span>
                </div>
                <div class="stat-number">1,248</div>
                <div class="stat-description">Across all locations</div>
            </div>

            <div class="stat-card">
                <div class="stat-top">
                    <span class="stat-label">Active Requests</span>
                    <span class="stat-icon icon-blue">🩺</span>
                </div>
                <div class="stat-number">428</div>
                <div class="stat-description">Currently seeking blood</div>
            </div>

            <div class="stat-card">
                <div class="stat-top">
                    <span class="stat-label">Pending Requests</span>
                    <span class="stat-icon icon-yellow">📋</span>
                </div>
                <div class="stat-number">126</div>
                <div class="stat-description">Awaiting approval</div>
            </div>

            <div class="stat-card">
                <div class="stat-top">
                    <span class="stat-label">Fulfilled Requests</span>
                    <span class="stat-icon icon-green">✅</span>
                </div>
                <div class="stat-number">694</div>
                <div class="stat-description">Successfully completed</div>
            </div>

        </div>

        <!-- Create Request Form -->
        <asp:Panel ID="pnlCreateRequest" runat="server"
            CssClass="create-card" Visible="false">

            <h3>Create New Blood Request</h3>

            <div class="create-grid">

                <div>
                    <label class="field-label">Patient / Seeker Name</label>
                    <asp:TextBox ID="txtPatient" runat="server"
                        CssClass="form-control" placeholder="Enter patient name" />
                </div>

                <div>
                    <label class="field-label">Blood Group</label>
                    <asp:DropDownList ID="ddlNewBloodGroup" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Select blood group" Value="" />
                        <asp:ListItem> A+ </asp:ListItem>
                        <asp:ListItem> A- </asp:ListItem>
                        <asp:ListItem> B+ </asp:ListItem>
                        <asp:ListItem> B- </asp:ListItem>
                        <asp:ListItem> AB+ </asp:ListItem>
                        <asp:ListItem> AB- </asp:ListItem>
                        <asp:ListItem> O+ </asp:ListItem>
                        <asp:ListItem> O- </asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div>
                    <label class="field-label">Units Required</label>
                    <asp:TextBox ID="txtUnits" runat="server"
                        CssClass="form-control" TextMode="Number" />
                </div>

                <div>
                    <label class="field-label">Hospital Name</label>
                    <asp:TextBox ID="txtHospital" runat="server"
                        CssClass="form-control" placeholder="Enter hospital name" />
                </div>

                <div>
                    <label class="field-label">Location</label>
                    <asp:TextBox ID="txtLocation" runat="server"
                        CssClass="form-control" placeholder="Enter city" />
                </div>

                <div>
                    <label class="field-label">Urgency</label>
                    <asp:DropDownList ID="ddlNewUrgency" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Select urgency" Value="" />
                        <asp:ListItem Text="Critical" Value="Critical" />
                        <asp:ListItem Text="High" Value="High" />
                        <asp:ListItem Text="Medium" Value="Medium" />
                    </asp:DropDownList>
                </div>

            </div>

            <div class="form-actions">
                <asp:Button ID="btnSaveRequest" runat="server"
                    Text="Create Request"
                    CssClass="btn-save"
                    OnClick="btnSaveRequest_Click" />

                <asp:Button ID="btnCancelCreate" runat="server"
                    Text="Cancel"
                    CssClass="btn-cancel"
                    CausesValidation="false"
                    OnClick="btnCancelCreate_Click" />
            </div>

            <asp:Label ID="lblCreateMessage" runat="server" CssClass="message" />

        </asp:Panel>

        <!-- Search and Filters -->
        <div class="filter-card">
            <div class="filter-row">

                <asp:TextBox ID="txtSearch" runat="server"
                    CssClass="form-control"
                    placeholder="Search request ID, patient, hospital, or location"
                    AutoPostBack="true"
                    OnTextChanged="Filter_Changed" />

                <asp:DropDownList ID="ddlBloodGroup" runat="server"
                    CssClass="form-control"
                    AutoPostBack="true"
                    OnSelectedIndexChanged="Filter_Changed">
                    <asp:ListItem Text="All Blood Groups" Value="" />
                    <asp:ListItem Text="A+" Value="A+" />
                    <asp:ListItem Text="A-" Value="A-" />
                    <asp:ListItem Text="B+" Value="B+" />
                    <asp:ListItem Text="B-" Value="B-" />
                    <asp:ListItem Text="AB+" Value="AB+" />
                    <asp:ListItem Text="AB-" Value="AB-" />
                    <asp:ListItem Text="O+" Value="O+" />
                    <asp:ListItem Text="O-" Value="O-" />
                </asp:DropDownList>

                <asp:DropDownList ID="ddlStatus" runat="server"
                    CssClass="form-control"
                    AutoPostBack="true"
                    OnSelectedIndexChanged="Filter_Changed">
                    <asp:ListItem Text="All Statuses" Value="" />
                    <asp:ListItem Text="Active" Value="Active" />
                    <asp:ListItem Text="Pending" Value="Pending" />
                    <asp:ListItem Text="Fulfilled" Value="Fulfilled" />
                    <asp:ListItem Text="Cancelled" Value="Cancelled" />
                </asp:DropDownList>

                <asp:DropDownList ID="ddlUrgency" runat="server"
                    CssClass="form-control"
                    AutoPostBack="true"
                    OnSelectedIndexChanged="Filter_Changed">
                    <asp:ListItem Text="All Urgencies" Value="" />
                    <asp:ListItem Text="Critical" Value="Critical" />
                    <asp:ListItem Text="High" Value="High" />
                    <asp:ListItem Text="Medium" Value="Medium" />
                </asp:DropDownList>

                <asp:LinkButton ID="lnkClearFilters" runat="server"
                    CssClass="clear-link"
                    CausesValidation="false"
                    OnClick="lnkClearFilters_Click">Clear Filters</asp:LinkButton>

            </div>
        </div>

        <!-- Requests Table -->
        <div class="table-card">

            <div class="table-heading">
                <h3>All Blood Requests</h3>
                <asp:Label ID="lblRequestCount" runat="server" CssClass="request-count" />
            </div>

            <div class="table-scroll">
                <asp:GridView ID="gvRequests" runat="server"
                    AutoGenerateColumns="False"
                    CssClass="requests-table"
                    GridLines="None"
                    DataKeyNames="RequestID"
                    OnRowDataBound="gvRequests_RowDataBound"
                    OnRowCommand="gvRequests_RowCommand"
                    EmptyDataText="No blood requests found.">

                    <Columns>

                        <asp:TemplateField HeaderText=" ">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSelect" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="REQUEST ID">
                            <ItemTemplate>
                                <asp:Label ID="lblRequestID" runat="server"
                                    CssClass="request-id"
                                    Text='<%# Eval("RequestID") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="PATIENT / SEEKER">
                            <ItemTemplate>
                                <span class="patient-name">
                                    <%# System.Web.HttpUtility.HtmlEncode(Convert.ToString(Eval("Patient"))) %>
                                </span>
                                <span class="patient-sub">Blood request</span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="BLOOD GRP">
                            <ItemTemplate>
                                <span class="blood-group">
                                    <%# System.Web.HttpUtility.HtmlEncode(Convert.ToString(Eval("BloodGroup"))) %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="Units" HeaderText="UNITS" />

                        <asp:TemplateField HeaderText="HOSPITAL &amp; LOCATION">
                            <ItemTemplate>
                                <span class="patient-name">
                                    <%# System.Web.HttpUtility.HtmlEncode(Convert.ToString(Eval("Hospital"))) %>
                                </span>
                                <span class="patient-sub">
                                    <%# System.Web.HttpUtility.HtmlEncode(Convert.ToString(Eval("Location"))) %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="URGENCY">
                            <ItemTemplate>
                                <asp:Label ID="lblUrgency" runat="server"
                                    Text='<%# Eval("Urgency") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="STATUS">
                            <ItemTemplate>
                                <asp:Label ID="lblStatus" runat="server"
                                    Text='<%# Eval("Status") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="RequestDate"
                            HeaderText="DATE"
                            DataFormatString="{0:MMM dd, yyyy}" />

                        <asp:TemplateField HeaderText="ACTION">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkFulfill" runat="server"
                                    Text="Fulfill"
                                    CssClass="action-link"
                                    CommandName="FulfillRequest"
                                    CommandArgument='<%# Eval("RequestID") %>'
                                    CausesValidation="false"
                                    Visible='<%# Convert.ToString(Eval("Status")) != "Fulfilled" && Convert.ToString(Eval("Status")) != "Cancelled" %>' />
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>

                    <EmptyDataTemplate>
                        <div class="empty-message">No blood requests match your filters.</div>
                    </EmptyDataTemplate>

                </asp:GridView>
            </div>

            <asp:Label ID="lblActionMessage" runat="server" CssClass="message" />

        </div>

    </div>

</asp:Content>