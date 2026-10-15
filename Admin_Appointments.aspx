
<%@ Page Title="Appointments" Language="C#" MasterPageFile="~/Admin.Master"
    AutoEventWireup="true" CodeBehind="Admin_Appointments.aspx.cs"
    Inherits="BloodConnect.Admin_Appointments" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Appointments
</asp:Content>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <style>
        .appointments-page {
            padding: 24px;
            background: #F9FAFB;
            min-height: 100vh;
            color: #192033;
            font-family: Arial, sans-serif;
        }

        .breadcrumb {
            color: #77788B;
            font-size: 13px;
            margin-bottom: 18px;
        }

        .breadcrumb span {
            color: #B91C1C;
            font-weight: 600;
        }

        .page-heading {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            flex-wrap: wrap;
            margin-bottom: 24px;
        }

        .page-heading h1 {
            margin: 0 0 7px;
            font-size: 28px;
            color: #192033;
        }

        .page-heading p {
            margin: 0;
            color: #77788B;
            font-size: 14px;
        }

        .btn-primary {
            background: #B91C1C;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 12px 18px;
            font-weight: 600;
            cursor: pointer;
        }

        .btn-primary:hover {
            background: #991B1B;
        }

        .stats-layout {
            display: grid;
            grid-template-columns: minmax(0, 1.5fr) minmax(280px, 1fr);
            gap: 18px;
            margin-bottom: 25px;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 15px;
        }

        .stat-card {
            background: #FFFFFF;
            border: 1px solid #E7E7EF;
            border-radius: 12px;
            padding: 20px;
            min-height: 125px;
            box-sizing: border-box;
        }

        .stat-icon {
            font-size: 23px;
            margin-bottom: 12px;
        }

        .stat-label {
            color: #77788B;
            font-size: 11px;
            font-weight: 700;
            letter-spacing: .6px;
            margin-bottom: 9px;
        }

        .stat-value {
            color: #192033;
            font-size: 28px;
            font-weight: 700;
        }

        .today-card {
            background: #FFFFFF;
            border: 1px solid #E7E7EF;
            border-radius: 12px;
            padding: 20px;
        }

        .today-title {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 10px;
            border-bottom: 1px solid #EEEEF3;
            padding-bottom: 15px;
            margin-bottom: 10px;
        }

        .today-title h3 {
            margin: 0;
            font-size: 17px;
        }

        .today-date {
            color: #77788B;
            font-size: 12px;
        }

        .pulse-row {
            display: flex;
            justify-content: space-between;
            padding: 8px 0;
            font-size: 14px;
        }

        .pulse-row span {
            color: #666779;
        }

        .pulse-row strong {
            color: #192033;
        }

        .schedule-button {
            background: #FDF2F2;
            color: #B91C1C;
            border: 1px solid #FECACA;
            padding: 10px 13px;
            border-radius: 7px;
            font-weight: 600;
            cursor: pointer;
            margin-top: 12px;
        }

        .filter-card {
            background: white;
            border: 1px solid #E7E7EF;
            border-radius: 12px;
            padding: 17px;
            margin-bottom: 18px;
        }

        .filter-row {
            display: flex;
            align-items: center;
            gap: 10px;
            flex-wrap: wrap;
        }

        .search-box {
            flex: 1;
            min-width: 200px;
        }

        .control-input, .control-select {
            width: 100%;
            box-sizing: border-box;
            padding: 11px 12px;
            border: 1px solid #DCDCE7;
            border-radius: 7px;
            background: white;
            color: #343448;
            font-size: 13px;
        }

        .filter-button {
            padding: 10px 13px;
            border: 1px solid #DCDCE7;
            background: white;
            color: #55566B;
            border-radius: 7px;
            cursor: pointer;
        }

        .clear-button {
            color: #B91C1C;
            border: none;
            background: transparent;
            padding: 10px;
            cursor: pointer;
        }

        .view-button {
            width: 39px;
            height: 39px;
            border: 1px solid #DCDCE7;
            border-radius: 7px;
            background: #FFFFFF;
            cursor: pointer;
            font-size: 17px;
        }

        .section-heading {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 0 0 14px;
            gap: 10px;
        }

        .section-heading h2 {
            font-size: 18px;
            margin: 0;
        }

        .result-count {
            color: #77788B;
            font-size: 13px;
        }

        .table-card {
            background: white;
            border: 1px solid #E7E7EF;
            border-radius: 12px;
            overflow-x: auto;
        }

        .appointments-table {
            width: 100%;
            min-width: 900px;
            border-collapse: collapse;
        }

        .appointments-table th {
            background: #F9FAFC;
            color: #77788B;
            text-align: left;
            padding: 15px 13px;
            font-size: 11px;
            letter-spacing: .45px;
            border-bottom: 1px solid #E7E7EF;
            white-space: nowrap;
        }

        .appointments-table td {
            padding: 16px 13px;
            border-bottom: 1px solid #F0F0F5;
            font-size: 13px;
            vertical-align: middle;
        }

        .appointments-table tr:last-child td {
            border-bottom: none;
        }

        .appointment-id {
            color: #4F46A5;
            font-weight: 700;
            white-space: nowrap;
        }

        .donor-name {
            color: #25263A;
            font-weight: 700;
            margin-bottom: 5px;
        }

        .donor-detail {
            color: #77788B;
            font-size: 11px;
            line-height: 1.6;
        }

        .facility-name {
            font-weight: 600;
            color: #3E3F52;
        }

        .date-text {
            font-weight: 600;
            color: #343448;
            white-space: nowrap;
        }

        .time-text {
            color: #77788B;
            font-size: 12px;
            margin-top: 5px;
            white-space: nowrap;
        }

        .status-badge {
            display: inline-block;
            padding: 6px 9px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 700;
            white-space: nowrap;
        }

        .status-confirmed {
            background: #FCE7F3;
            color: #BE185D;
        }

        .status-scheduled {
            background: #DBEAFE;
            color: #1D4ED8;
        }

        .status-checked-in {
            background: #E0E7FF;
            color: #4338CA;
        }

        .status-completed {
            background: #DCFCE7;
            color: #15803D;
        }

        .status-cancelled {
            background: #F3E8FF;
            color: #7E22CE;
        }

        .status-no-show {
            background: #FEE2E2;
            color: #B91C1C;
        }

        .action-button {
            color: #B91C1C;
            background: transparent;
            border: 1px solid #FECACA;
            border-radius: 6px;
            padding: 7px 10px;
            cursor: pointer;
            white-space: nowrap;
        }

        .form-panel {
            background: white;
            border: 1px solid #E7E7EF;
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 20px;
        }

        .form-panel h3 {
            margin: 0 0 17px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 15px;
        }

        .form-field label {
            display: block;
            margin-bottom: 7px;
            font-size: 13px;
            font-weight: 600;
        }

        .form-actions {
            display: flex;
            gap: 10px;
            margin-top: 17px;
        }

        .btn-secondary {
            background: white;
            border: 1px solid #DCDCE7;
            border-radius: 8px;
            padding: 11px 17px;
            cursor: pointer;
        }

        .message-label {
            display: block;
            margin: 12px 0;
            font-size: 13px;
            color: #B91C1C;
        }

        .empty-message {
            display: block;
            padding: 24px;
            text-align: center;
            color: #77788B;
        }

        @media (max-width: 950px) {
            .stats-layout {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 600px) {
            .appointments-page {
                padding: 14px;
            }

            .stats-grid {
                grid-template-columns: 1fr 1fr;
                gap: 10px;
            }

            .stat-card {
                padding: 14px;
            }

            .stat-value {
                font-size: 23px;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="appointments-page">

        <div class="breadcrumb">
            Home &gt; <span>Appointments</span>
        </div>

        <div class="page-heading">
            <div>
                <h1>Appointments</h1>
                <p>Manage blood donation appointments across all registered facilities.</p>
            </div>

            <asp:Button ID="btnCreateAppointment" runat="server"
                Text="+ Create Appointment"
                CssClass="btn-primary"
                OnClick="btnCreateAppointment_Click" />
        </div>

        <!-- Fixed KPI cards and Today's Pulse -->
        <div class="stats-layout">
            <div class="stats-grid">
                <div class="stat-card">
                    <div class="stat-icon">📅</div>
                    <div class="stat-label">TOTAL APPOINTMENTS</div>
                    <div class="stat-value">2,486</div>
                </div>

                <div class="stat-card" style="background:#B91C1C; border-color:#B91C1C;">
                    <div class="stat-icon">📅</div>
                    <div class="stat-label" style="color:#FEE2E2;">TODAY'S APPOINTMENTS</div>
                    <div class="stat-value" style="color:white;">86</div>
                </div>

                <div class="stat-card">
                    <div class="stat-icon">✅</div>
                    <div class="stat-label">COMPLETED</div>
                    <div class="stat-value">1,842</div>
                </div>

                <div class="stat-card">
                    <div class="stat-icon">🕒</div>
                    <div class="stat-label">PENDING REVIEW</div>
                    <div class="stat-value">214</div>
                </div>
            </div>

            <div class="today-card">
                <div class="today-title">
                    <h3>🔴 Today's Pulse</h3>
                    <span class="today-date">Aug 16</span>
                </div>

                <div class="pulse-row"><span>Scheduled</span><strong>52</strong></div>
                <div class="pulse-row"><span>Checked In</span><strong>18</strong></div>
                <div class="pulse-row"><span>Completed</span><strong>12</strong></div>
                <div class="pulse-row"><span>Cancelled</span><strong>4</strong></div>

                <asp:Button ID="btnViewSchedule" runat="server"
                    Text="View Schedule ➜"
                    CssClass="schedule-button"
                    OnClick="btnViewSchedule_Click" />
            </div>
        </div>

        <!-- Create appointment form: hidden until button is clicked -->
        <asp:Panel ID="pnlCreateAppointment" runat="server"
            CssClass="form-panel" Visible="false">
            <h3>Create Appointment</h3>

            <div class="form-grid">
                <div class="form-field">
                    <label>Donor Name</label>
                    <asp:TextBox ID="txtDonorName" runat="server"
                        CssClass="control-input" placeholder="Enter donor name" />
                </div>

                <div class="form-field">
                    <label>Blood Group</label>
                    <asp:DropDownList ID="ddlBloodGroup" runat="server"
                        CssClass="control-select">
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

                <div class="form-field">
                    <label>Facility</label>
                    <asp:DropDownList ID="ddlFacility" runat="server"
                        CssClass="control-select">
                        <asp:ListItem Text="Select facility" Value="" />
                        <asp:ListItem>City Blood Bank</asp:ListItem>
                        <asp:ListItem>LifeCare Blood Bank</asp:ListItem>
                        <asp:ListItem>Red Cross Center</asp:ListItem>
                        <asp:ListItem>Hope Blood Center</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="form-field">
                    <label>Appointment Date</label>
                    <asp:TextBox ID="txtAppointmentDate" runat="server"
                        CssClass="control-input" TextMode="Date" />
                </div>

                <div class="form-field">
                    <label>Appointment Time</label>
                    <asp:TextBox ID="txtAppointmentTime" runat="server"
                        CssClass="control-input" TextMode="Time" />
                </div>

                <div class="form-field">
                    <label>Status</label>
                    <asp:DropDownList ID="ddlNewStatus" runat="server"
                        CssClass="control-select">
                        <asp:ListItem>Scheduled</asp:ListItem>
                        <asp:ListItem>Confirmed</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <asp:Label ID="lblFormMessage" runat="server" CssClass="message-label" />

            <div class="form-actions">
                <asp:Button ID="btnSaveAppointment" runat="server"
                    Text="Save Appointment" CssClass="btn-primary"
                    OnClick="btnSaveAppointment_Click" />

                <asp:Button ID="btnCancelCreate" runat="server"
                    Text="Cancel" CssClass="btn-secondary"
                    CausesValidation="false"
                    OnClick="btnCancelCreate_Click" />
            </div>
        </asp:Panel>

        <!-- Search and filters -->
        <div class="filter-card">
            <div class="filter-row">
                <div class="search-box">
                    <asp:TextBox ID="txtSearch" runat="server"
                        CssClass="control-input"
                        placeholder="Search donor, ID..."
                        AutoPostBack="true"
                        OnTextChanged="txtSearch_TextChanged" />
                </div>

                <asp:DropDownList ID="ddlStatusFilter" runat="server"
                    CssClass="control-select" style="width:145px;"
                    AutoPostBack="true"
                    OnSelectedIndexChanged="FilterChanged">
                    <asp:ListItem Text="Status: All" Value="All" />
                    <asp:ListItem>Confirmed</asp:ListItem>
                    <asp:ListItem>Scheduled</asp:ListItem>
                    <asp:ListItem>Checked In</asp:ListItem>
                    <asp:ListItem>Completed</asp:ListItem>
                    <asp:ListItem>Cancelled</asp:ListItem>
                    <asp:ListItem>No Show</asp:ListItem>
                </asp:DropDownList>

                <asp:DropDownList ID="ddlDateFilter" runat="server"
                    CssClass="control-select" style="width:135px;"
                    AutoPostBack="true"
                    OnSelectedIndexChanged="FilterChanged">
                    <asp:ListItem Text="Date: All" Value="All" />
                    <asp:ListItem Text="Today" Value="Today" />
                    <asp:ListItem Text="Yesterday" Value="Yesterday" />
                    <asp:ListItem Text="Last 7 Days" Value="Last7Days" />
                </asp:DropDownList>

                <asp:Button ID="btnMoreFilters" runat="server"
                    Text="🎛 More Filters"
                    CssClass="filter-button"
                    OnClick="btnMoreFilters_Click" />

                <asp:Button ID="btnClearFilters" runat="server"
                    Text="Clear"
                    CssClass="clear-button"
                    OnClick="btnClearFilters_Click" />

                <asp:Button ID="btnListView" runat="server"
                    Text="☰" ToolTip="List View"
                    CssClass="view-button"
                    OnClick="btnListView_Click" />

                <asp:Button ID="btnCalendarView" runat="server"
                    Text="📅" ToolTip="Calendar View"
                    CssClass="view-button"
                    OnClick="btnCalendarView_Click" />
            </div>

            <asp:Panel ID="pnlMoreFilters" runat="server" Visible="false"
                style="margin-top:14px;">
                <div class="filter-row">
                    <asp:DropDownList ID="ddlFacilityFilter" runat="server"
                        CssClass="control-select" style="max-width:260px;"
                        AutoPostBack="true"
                        OnSelectedIndexChanged="FilterChanged">
                        <asp:ListItem Text="Facility: All" Value="All" />
                        <asp:ListItem>City Blood Bank</asp:ListItem>
                        <asp:ListItem>LifeCare Blood Bank</asp:ListItem>
                        <asp:ListItem>Red Cross Center</asp:ListItem>
                        <asp:ListItem>Hope Blood Center</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </asp:Panel>

            <asp:Label ID="lblPageMessage" runat="server" CssClass="message-label" />
        </div>

        <div class="section-heading">
            <h2>Appointment List</h2>
            <asp:Label ID="lblResultCount" runat="server" CssClass="result-count" />
        </div>

        <div class="table-card">
            <asp:GridView ID="gvAppointments" runat="server"
                AutoGenerateColumns="False"
                CssClass="appointments-table"
                GridLines="None"
                DataKeyNames="AppointmentID"
                EmptyDataText="No appointments found."
                OnRowCommand="gvAppointments_RowCommand"
                OnRowDataBound="gvAppointments_RowDataBound">

                <Columns>
                    <asp:TemplateField HeaderText="SELECT">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSelect" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="APPOINTMENT ID">
                        <ItemTemplate>
                            <asp:Label ID="lblAppointmentID" runat="server"
                                CssClass="appointment-id"
                                Text='<%# Eval("AppointmentID") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="DONOR INFO">
                        <ItemTemplate>
                            <div class="donor-name"><%# Eval("DonorName") %></div>
                            <div class="donor-detail">
                                <%# Eval("BloodGroup") %> • <%# Eval("DonorDetail") %>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="Facility" HeaderText="FACILITY" />

                    <asp:TemplateField HeaderText="DATE &amp; TIME">
                        <ItemTemplate>
                            <div class="date-text"><%# Eval("AppointmentDate", "{0:dd MMM yyyy}") %></div>
                            <div class="time-text"><%# Eval("AppointmentTime") %></div>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="STATUS">
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" runat="server"
                                Text='<%# Eval("Status") %>'
                                CssClass="status-badge" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="ACTION">
                        <ItemTemplate>
                            <asp:Button ID="btnViewDetails" runat="server"
                                Text="View"
                                CssClass="action-button"
                                CommandName="ViewAppointment"
                                CommandArgument='<%# Eval("AppointmentID") %>'
                                CausesValidation="false" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

    </div>
</asp:Content>
