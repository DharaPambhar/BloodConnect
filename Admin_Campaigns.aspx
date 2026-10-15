
<%@ Page Title="Campaigns" Language="C#" MasterPageFile="~/Admin.Master"
    AutoEventWireup="true" CodeBehind="Admin_Campaigns.aspx.cs"
    Inherits="BloodConnect.Admin_Campaigns" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Campaigns
</asp:Content>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <style>
        .campaign-page { padding:24px; color:#192033; }
        .campaign-heading { display:flex; justify-content:space-between; align-items:center; gap:16px; flex-wrap:wrap; margin-bottom:24px; }
        .campaign-heading h2 { margin:0 0 8px; font-size:27px; font-weight:700; }
        .campaign-heading p { margin:0; color:#73788c; font-size:14px; line-height:1.6; }
        .btn-primary { background:#B91C1C; color:white; border:0; border-radius:8px; padding:12px 17px; font-weight:600; cursor:pointer; }
        .btn-secondary { background:white; color:#4541DD; border:1px solid #C9C9E0; border-radius:8px; padding:10px 14px; cursor:pointer; }
        .stats-grid { display:grid; grid-template-columns:repeat(4,minmax(0,1fr)); gap:16px; margin-bottom:24px; }
        .stat-card { background:white; border:1px solid #ececf4; border-radius:12px; padding:20px; box-shadow:0 2px 8px rgba(30,35,60,.03); }
        .stat-icon { display:inline-flex; width:42px; height:42px; align-items:center; justify-content:center; border-radius:10px; background:#F1F0FF; font-size:21px; margin-bottom:15px; }
        .stat-number { font-size:29px; font-weight:750; margin-bottom:7px; }
        .stat-label { font-size:13px; font-weight:700; color:#45495c; }
        .stat-note { margin-top:6px; color:#85899b; font-size:12px; }
        .filters-card,.table-card,.form-card { background:white; border:1px solid #ececf4; border-radius:12px; padding:18px; margin-bottom:20px; }
        .filter-row { display:flex; flex-wrap:wrap; gap:12px; align-items:center; }
        .filter-search { flex:1; min-width:220px; }
        .form-control { width:100%; box-sizing:border-box; border:1px solid #dcddea; border-radius:8px; padding:11px 12px; background:white; color:#25283a; font-size:13px; }
        .filter-select { width:160px; }
        .table-heading { display:flex; align-items:center; justify-content:space-between; flex-wrap:wrap; gap:12px; margin-bottom:16px; }
        .table-heading h3 { margin:0; font-size:18px; }
        .table-scroll { width:100%; overflow-x:auto; }
        .campaign-table { width:100%; min-width:1050px; border-collapse:collapse; font-size:13px; }
        .campaign-table th { text-align:left; padding:14px 12px; color:#777b8e; font-size:11px; letter-spacing:.4px; background:#F8F8FC; border-bottom:1px solid #ececf4; white-space:nowrap; }
        .campaign-table td { padding:15px 12px; border-bottom:1px solid #f0f0f5; vertical-align:middle; }
        .campaign-table tr:last-child td { border-bottom:0; }
        .campaign-name { display:block; font-weight:700; color:#262a3d; min-width:180px; }
        .campaign-id { display:block; margin-top:5px; font-size:11px; color:#888ca0; }
        .sub-text { display:block; margin-top:5px; color:#777b8e; font-size:12px; }
        .status-badge { display:inline-block; padding:6px 10px; border-radius:20px; font-size:11px; font-weight:700; white-space:nowrap; }
        .status-active { color:#16803D; background:#E7F8ED; }
        .status-upcoming { color:#315ACB; background:#EAF0FF; }
        .status-completed { color:#656A7B; background:#F0F1F5; }
        .action-button { border:0; background:transparent; font-size:23px; cursor:pointer; color:#62677b; }
        .form-grid { display:grid; grid-template-columns:repeat(3,minmax(0,1fr)); gap:14px; }
        .field-label { display:block; font-size:12px; font-weight:600; margin-bottom:7px; color:#565b70; }
        .message-label { display:block; margin:12px 0; font-size:13px; color:#4541DD; }
        @media(max-width:1000px) { .stats-grid { grid-template-columns:repeat(2,minmax(0,1fr)); } }
        @media(max-width:600px) { .campaign-page { padding:14px; } .stats-grid { grid-template-columns:1fr; } .form-grid { grid-template-columns:1fr; } .filter-select { width:100%; } }
    </style>
</asp:Content>

<asp:Content ID="PageHeadingContent" ContentPlaceHolderID="PageHeading" runat="server">
    Blood Donation Campaigns
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="campaign-page">

        <div class="campaign-heading">
            <div>
                <h2>Blood Donation Campaigns</h2>
                <p>Create, manage, and monitor blood donation campaigns across BloodConnect.</p>
            </div>
            <asp:Button ID="btnCreateCampaign" runat="server" Text="+ Create Campaign"
                CssClass="btn-primary" OnClick="btnCreateCampaign_Click" />
        </div>

        <div class="stats-grid">
            <div class="stat-card">
                <span class="stat-icon">📢</span>
                <div class="stat-number">84</div>
                <div class="stat-label">Total Campaigns</div>
                <div class="stat-note">All campaigns</div>
            </div>
            <div class="stat-card">
                <span class="stat-icon">✏️</span>
                <div class="stat-number">18</div>
                <div class="stat-label">Active Campaigns</div>
                <div class="stat-note">Currently running</div>
            </div>
            <div class="stat-card">
                <span class="stat-icon">📅</span>
                <div class="stat-number">12</div>
                <div class="stat-label">Upcoming Campaigns</div>
                <div class="stat-note">Scheduled campaigns</div>
            </div>
            <div class="stat-card">
                <span class="stat-icon">✅</span>
                <div class="stat-number">54</div>
                <div class="stat-label">Completed Campaigns</div>
                <div class="stat-note">Successfully completed</div>
            </div>
        </div>

        <asp:Panel ID="pnlCreateCampaign" runat="server" CssClass="form-card" Visible="false">
            <h3 style="margin-top:0;">Create New Campaign</h3>
            <div class="form-grid">
                <div>
                    <span class="field-label">Campaign Name *</span>
                    <asp:TextBox ID="txtCampaignName" runat="server" CssClass="form-control"
                        MaxLength="120" placeholder="Enter campaign name" />
                </div>
                <div>
                    <span class="field-label">Campaign Type *</span>
                    <asp:DropDownList ID="ddlNewType" runat="server" CssClass="form-control">
                        <asp:ListItem>Blood Donation Camp</asp:ListItem>
                        <asp:ListItem>Community Drive</asp:ListItem>
                        <asp:ListItem>Emergency Blood Drive</asp:ListItem>
                        <asp:ListItem>Corporate Drive</asp:ListItem>
                        <asp:ListItem>Awareness Campaign</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div>
                    <span class="field-label">Location *</span>
                    <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control"
                        MaxLength="100" placeholder="Enter city or venue" />
                </div>
                <div>
                    <span class="field-label">Campaign Date *</span>
                    <asp:TextBox ID="txtCampaignDate" runat="server" CssClass="form-control"
                        TextMode="Date" />
                </div>
                <div>
                    <span class="field-label">Donors Registered</span>
                    <asp:TextBox ID="txtDonors" runat="server" CssClass="form-control"
                        Text="0" MaxLength="6" />
                </div>
                <div>
                    <span class="field-label">Units Collected</span>
                    <asp:TextBox ID="txtUnits" runat="server" CssClass="form-control"
                        Text="0" MaxLength="6" />
                </div>
            </div>
            <asp:Label ID="lblFormMessage" runat="server" CssClass="message-label" />
            <asp:Button ID="btnSaveCampaign" runat="server" Text="Save Campaign"
                CssClass="btn-primary" OnClick="btnSaveCampaign_Click" />
            <asp:Button ID="btnCancelCampaign" runat="server" Text="Cancel"
                CssClass="btn-secondary" OnClick="btnCancelCampaign_Click" CausesValidation="false" />
        </asp:Panel>

        <div class="filters-card">
            <div class="filter-row">
                <div class="filter-search">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control"
                        placeholder="Search campaign name, ID..." />
                </div>
                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control filter-select">
                    <asp:ListItem Value="All">Status: All</asp:ListItem>
                    <asp:ListItem Value="Active">Active</asp:ListItem>
                    <asp:ListItem Value="Upcoming">Upcoming</asp:ListItem>
                    <asp:ListItem Value="Completed">Completed</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control filter-select">
                    <asp:ListItem Value="All">Type: All Types</asp:ListItem>
                    <asp:ListItem>Blood Donation Camp</asp:ListItem>
                    <asp:ListItem>Community Drive</asp:ListItem>
                    <asp:ListItem>Emergency Blood Drive</asp:ListItem>
                    <asp:ListItem>Corporate Drive</asp:ListItem>
                    <asp:ListItem>Corporate Drive</asp:ListItem>
                    <asp:ListItem>Awareness Campaign</asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="btnSearch" runat="server" Text="Search"
                    CssClass="btn-secondary" OnClick="btnSearch_Click" />
                <asp:Button ID="btnClear" runat="server" Text="Clear Filters"
                    CssClass="btn-secondary" OnClick="btnClear_Click" CausesValidation="false" />
            </div>
        </div>

        <div class="table-card">
            <div class="table-heading">
                <h3>All Campaigns</h3>
                <asp:Label ID="lblRecordCount" runat="server" ForeColor="#777B8E" />
            </div>
            <div class="table-scroll">
                <asp:GridView ID="gvCampaigns" runat="server" AutoGenerateColumns="false"
                    CssClass="campaign-table" GridLines="None"
                    DataKeyNames="CampaignID" OnRowDataBound="gvCampaigns_RowDataBound"
                    EmptyDataText="No campaigns found.">
                    <Columns>
                        <asp:TemplateField HeaderText=" ">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSelect" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="CAMPAIGN">
                            <ItemTemplate>
                                <span class="campaign-name"><%# Eval("CampaignName") %></span>
                                <span class="campaign-id"><%# Eval("CampaignID") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="CampaignType" HeaderText="TYPE" />
                        <asp:BoundField DataField="Location" HeaderText="LOCATION" />
                        <asp:BoundField DataField="CampaignDate" HeaderText="DATE" />
                        <asp:TemplateField HeaderText="DONORS / UNITS">
                            <ItemTemplate>
                                <strong><%# Eval("Donors") %> / <%# (Convert.ToString(Eval("Units")) == "—" ? "—" : Eval("Units")) %></strong>
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
                                    CssClass="action-button"
                                    CommandArgument='<%# Eval("CampaignID") %>'
                                    OnClick="btnAction_Click" CausesValidation="false"
                                    ToolTip="View campaign details" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>

    </div>
</asp:Content>
