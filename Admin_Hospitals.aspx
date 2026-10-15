
<%@ Page Title="Hospitals" Language="C#" MasterPageFile="~/Admin.Master"
    AutoEventWireup="true" CodeBehind="Admin_Hospitals.aspx.cs"
    Inherits="BloodConnect.Admin_Hospitals" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Hospitals
</asp:Content>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <style>
        .hospital-page { padding: 24px; color: #192033; }
        .page-heading { display:flex; justify-content:space-between; align-items:center; gap:16px; flex-wrap:wrap; margin-bottom:24px; }
        .page-heading h2 { margin:0 0 8px; font-size:27px; font-weight:700; }
        .page-heading p { margin:0; color:#73788c; font-size:14px; line-height:1.6; }
        .btn-primary { background:#B91C1C; color:white; border:0; border-radius:8px; padding:12px 17px; font-weight:600; cursor:pointer; }
        .btn-secondary { background:white; color:#4541DD; border:1px solid #C9C9E0; border-radius:8px; padding:10px 14px; cursor:pointer; }
        .stats-grid { display:grid; grid-template-columns:repeat(4,minmax(0,1fr)); gap:16px; margin-bottom:24px; }
        .stat-card { background:#fff; border:1px solid #ececf4; border-radius:12px; padding:20px; box-shadow:0 2px 8px rgba(30,35,60,.03); }
        .stat-top { display:flex; align-items:center; justify-content:space-between; margin-bottom:16px; }
        .stat-icon { display:inline-flex; align-items:center; justify-content:center; width:42px; height:42px; border-radius:10px; background:#F1F0FF; font-size:21px; }
        .stat-label { font-size:12px; font-weight:700; color:#777b8e; letter-spacing:.5px; }
        .stat-number { font-size:29px; font-weight:750; margin-top:8px; }
        .stat-note { font-size:12px; color:#777b8e; margin-top:5px; }
        .green { color:#159447; } .orange { color:#D97706; } .red { color:#B91C1C; }
        .filters-card,.table-card,.add-panel { background:#fff; border:1px solid #ececf4; border-radius:12px; padding:18px; margin-bottom:20px; }
        .filter-row { display:flex; flex-wrap:wrap; gap:12px; align-items:center; }
        .filter-search { flex:1; min-width:220px; }
        .form-control { width:100%; box-sizing:border-box; border:1px solid #dcddea; border-radius:8px; padding:11px 12px; background:#fff; color:#25283a; font-size:13px; }
        .filter-select { width:150px; }
        .table-title { display:flex; align-items:center; justify-content:space-between; gap:12px; margin-bottom:16px; flex-wrap:wrap; }
        .table-title h3 { margin:0; font-size:18px; }
        .table-scroll { width:100%; overflow-x:auto; }
        .hospital-table { width:100%; border-collapse:collapse; min-width:1050px; font-size:13px; }
        .hospital-table th { text-align:left; padding:14px 12px; color:#777b8e; font-size:11px; letter-spacing:.4px; background:#F8F8FC; border-bottom:1px solid #ececf4; white-space:nowrap; }
        .hospital-table td { padding:15px 12px; border-bottom:1px solid #f0f0f5; vertical-align:middle; }
        .hospital-table tr:last-child td { border-bottom:0; }
        .hospital-name { font-weight:700; color:#262a3d; }
        .hospital-id { display:block; margin-top:5px; font-size:11px; color:#888ca0; }
        .sub-text { display:block; margin-top:5px; color:#777b8e; font-size:12px; }
        .status-badge { display:inline-block; padding:6px 9px; border-radius:20px; font-size:11px; font-weight:700; white-space:nowrap; }
        .status-active { background:#E7F8ED; color:#16803D; }
        .status-pending { background:#FFF4D8; color:#A16207; }
        .availability-yes { color:#16803D; white-space:nowrap; }
        .availability-no { color:#6546C7; white-space:nowrap; }
        .connection-yes { color:#16803D; }
        .connection-no { color:#A16207; }
        .action-button { border:0; background:transparent; font-size:23px; cursor:pointer; color:#62677b; }
        .message-label { display:block; margin:12px 0; font-size:13px; color:#4541DD; }
        .form-grid { display:grid; grid-template-columns:repeat(3,minmax(0,1fr)); gap:14px; }
        .field-label { display:block; font-size:12px; font-weight:600; margin-bottom:7px; color:#565b70; }
        .empty-message { padding:25px; text-align:center; color:#777b8e; }
        .more-filters { display:none; }
        .more-filters.show { display:flex; }
        @media(max-width:1000px) { .stats-grid { grid-template-columns:repeat(2,minmax(0,1fr)); } }
        @media(max-width:600px) {
            .hospital-page { padding:14px; }
            .stats-grid { grid-template-columns:1fr; }
            .form-grid { grid-template-columns:1fr; }
            .filter-select { width:100%; }
        }
    </style>
</asp:Content>

<asp:Content ID="PageHeadingContent" ContentPlaceHolderID="PageHeading" runat="server">
    Hospitals Management
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="hospital-page">

        <div class="page-heading">
            <div>
                <h2>Hospitals</h2>
                <p>Manage registered hospitals, monitor their status, contact information,<br />
                   blood requirements, and connected blood bank services.</p>
            </div>
            <asp:Button ID="btnAddHospital" runat="server" Text="+ Add Hospital"
                CssClass="btn-primary" OnClick="btnAddHospital_Click" />
        </div>

        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-top">
                    <span class="stat-icon">🏥</span>
                    <span class="green">↗ +4%</span>
                </div>
                <div class="stat-label">TOTAL HOSPITALS</div>
                <div class="stat-number">126</div>
                <div class="stat-note">Registered hospitals</div>
            </div>

            <div class="stat-card">
                <div class="stat-top">
                    <span class="stat-icon">✅</span>
                    <span class="green">● Active</span>
                </div>
                <div class="stat-label">ACTIVE</div>
                <div class="stat-number">112</div>
                <div class="stat-note">88.8% of total hospitals</div>
            </div>

            <div class="stat-card">
                <div class="stat-top">
                    <span class="stat-icon">🕒</span>
                    <span class="orange">● Review</span>
                </div>
                <div class="stat-label">PENDING APPROVAL</div>
                <div class="stat-number">9</div>
                <div class="stat-note">Awaiting approval</div>
            </div>

            <div class="stat-card">
                <div class="stat-top">
                    <span class="stat-icon">⚠️</span>
                    <span class="red">Urgent</span>
                </div>
                <div class="stat-label">EMERGENCY ALERT</div>
                <div class="stat-number red">38</div>
                <div class="stat-note">Blood units needed</div>
            </div>
        </div>

        <asp:Panel ID="pnlAddHospital" runat="server" CssClass="add-panel" Visible="false">
            <h3 style="margin-top:0;">Add New Hospital</h3>
            <div class="form-grid">
                <div>
                    <span class="field-label">Hospital Name *</span>
                    <asp:TextBox ID="txtHospitalName" runat="server" CssClass="form-control"
                        MaxLength="100" placeholder="Enter hospital name" />
                </div>
                <div>
                    <span class="field-label">Hospital Type *</span>
                    <asp:DropDownList ID="ddlNewType" runat="server" CssClass="form-control">
                        <asp:ListItem>Private</asp:ListItem>
                        <asp:ListItem>Government</asp:ListItem>
                        <asp:ListItem>Trust</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div>
                    <span class="field-label">Location *</span>
                    <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control"
                        MaxLength="100" placeholder="Enter city" />
                </div>
                <div>
                    <span class="field-label">Contact Number *</span>
                    <asp:TextBox ID="txtContact" runat="server" CssClass="form-control"
                        MaxLength="10" placeholder="10-digit mobile number" />
                </div>
                <div>
                    <span class="field-label">Availability</span>
                    <asp:DropDownList ID="ddlAvailability" runat="server" CssClass="form-control">
                        <asp:ListItem Value="Available">Available</asp:ListItem>
                        <asp:ListItem Value="Not Available">Not Available</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div>
                    <span class="field-label">Connection</span>
                    <asp:DropDownList ID="ddlConnection" runat="server" CssClass="form-control">
                        <asp:ListItem Value="Connected">Connected</asp:ListItem>
                        <asp:ListItem Value="Not Connected">Not Connected</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <asp:Label ID="lblFormMessage" runat="server" CssClass="message-label" />
            <asp:Button ID="btnSaveHospital" runat="server" Text="Save Hospital"
                CssClass="btn-primary" OnClick="btnSaveHospital_Click" />
            <asp:Button ID="btnCancelAdd" runat="server" Text="Cancel"
                CssClass="btn-secondary" OnClick="btnCancelAdd_Click" CausesValidation="false" />
        </asp:Panel>

        <div class="filters-card">
            <div class="filter-row">
                <div class="filter-search">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control"
                        placeholder="Search hospital name, ID, location, or contact..." />
                </div>
                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control filter-select">
                    <asp:ListItem Value="All">Status: All</asp:ListItem>
                    <asp:ListItem Value="Active">Active</asp:ListItem>
                    <asp:ListItem Value="Pending">Pending</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control filter-select">
                    <asp:ListItem Value="All">Type: All</asp:ListItem>
                    <asp:ListItem Value="Private">Private</asp:ListItem>
                    <asp:ListItem Value="Government">Government</asp:ListItem>
                    <asp:ListItem Value="Trust">Trust</asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="btnSearch" runat="server" Text="Search"
                    CssClass="btn-secondary" OnClick="btnSearch_Click" />
                <asp:Button ID="btnMoreFilters" runat="server" Text="⚙ More Filters"
                    CssClass="btn-secondary" OnClick="btnMoreFilters_Click" CausesValidation="false" />
                <asp:Button ID="btnClear" runat="server" Text="Clear"
                    CssClass="btn-secondary" OnClick="btnClear_Click" CausesValidation="false" />
            </div>
        </div>

        <div class="table-card">
            <div class="table-title">
                <h3>Registered Hospitals</h3>
                <asp:Label ID="lblRecordCount" runat="server" ForeColor="#777B8E" />
            </div>
            <div class="table-scroll">
                <asp:GridView ID="gvHospitals" runat="server" AutoGenerateColumns="false"
                    CssClass="hospital-table" GridLines="None"
                    DataKeyNames="HospitalID" OnRowDataBound="gvHospitals_RowDataBound"
                    EmptyDataText="No hospitals found matching your search.">
                    <Columns>
                        <asp:TemplateField HeaderText=" ">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSelect" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="HOSPITAL (NAME &amp; ID)">
                            <ItemTemplate>
                                <span class="hospital-name">🏥 <%# Eval("HospitalName") %></span>
                                <span class="hospital-id"><%# Eval("HospitalID") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="TYPE &amp; LOCATION">
                            <ItemTemplate>
                                <%# Eval("HospitalType") %>
                                <span class="sub-text">📍 <%# Eval("Location") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Contact" HeaderText="CONTACT" />
                        <asp:TemplateField HeaderText="AVAILABILITY">
                            <ItemTemplate>
                                <asp:Label ID="lblAvailability" runat="server"
                                    Text='<%# Eval("Availability") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="CONNECTION">
                            <ItemTemplate>
                                <asp:Label ID="lblConnection" runat="server"
                                    Text='<%# Eval("Connection") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="STATUS">
                            <ItemTemplate>
                                <asp:Label ID="lblStatus" runat="server"
                                    Text='<%# Eval("Status") %>' CssClass="status-badge" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ACTIONS">
                            <ItemTemplate>
                                <asp:Button ID="btnAction" runat="server" Text="⋮"
                                    CssClass="action-button" CommandArgument='<%# Eval("HospitalID") %>'
                                    OnClick="btnAction_Click" CausesValidation="false"
                                    ToolTip="View hospital details" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
