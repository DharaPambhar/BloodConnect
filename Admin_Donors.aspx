
<%@ Page Title="Donor Management - BloodConnect" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_Donors.aspx.cs" Inherits="BloodConnect.Admin_Donors" %>

<asp:Content ID="TitleContent1" ContentPlaceHolderID="TitleContent" runat="server">
    Donor Management - BloodConnect
</asp:Content>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
<style>
    .donors-page { color:#252638; font-family:'Segoe UI',Arial,sans-serif; }
    .donors-page * { box-sizing:border-box; }

    .donor-breadcrumb { font-size:13px; color:#858596; margin-bottom:20px; }
    .donor-breadcrumb .current { color:#B91C1C; font-weight:600; }

    .donor-heading {
        display:flex; justify-content:space-between; align-items:center;
        gap:16px; margin-bottom:25px;
    }

    .donor-heading h2 { font-size:25px; font-weight:750; margin:0 0 7px; }
    .donor-subtitle { color:#818194; font-size:13px; margin:0; }

    .btn-maroon {
        background:#B91C1C; color:white; border:1px solid #B91C1C;
        border-radius:9px; padding:11px 17px; font-size:13px;
        font-weight:600; white-space:nowrap; cursor:pointer;
    }
    .btn-maroon:hover { background:#991B1B; color:white; }

    .donor-stats {
        display:grid; grid-template-columns:repeat(4,minmax(0,1fr));
        gap:17px; margin-bottom:24px;
    }

    .donor-stat {
        background:#fff; border:1px solid #ECECF2; border-radius:13px;
        padding:20px; min-width:0; box-shadow:0 3px 12px rgba(25,25,50,.025);
    }

    .donor-stat-top {
        display:flex; justify-content:space-between; align-items:center;
        gap:8px; margin-bottom:17px;
    }

    .donor-stat-icon {
        width:42px; height:42px; display:flex; align-items:center;
        justify-content:center; border-radius:11px; font-size:18px;
    }

    .stat-red { background:#FDECEC; color:#B91C1C; }
    .stat-blue { background:#EAF1FF; color:#3768D9; }
    .stat-green { background:#E5F8EC; color:#16834A; }
    .stat-orange { background:#FFF0DF; color:#C66B12; }

    .donor-stat-label { font-size:12px; color:#77778B; margin-bottom:6px; }
    .donor-stat-number { font-size:27px; font-weight:750; color:#252638; }
    .donor-stat-note { font-size:11px; color:#9292A2; margin-top:5px; }

    .donor-filter-card, .donor-table-card, .add-donor-card {
        background:white; border:1px solid #ECECF2; border-radius:13px;
        margin-bottom:22px; overflow:hidden;
    }

    .donor-filter-card { padding:16px; }

    .donor-filter-grid {
        display:grid;
        grid-template-columns:minmax(200px,1.5fr) repeat(4,minmax(115px,1fr)) auto;
        gap:10px; align-items:center;
    }

    .donor-search { position:relative; }
    .donor-search i {
        position:absolute; left:12px; top:14px;
        color:#9696A7; font-size:13px;
    }

    .donor-input, .donor-select {
        width:100%; height:41px; border:1px solid #E5E5ED;
        border-radius:8px; padding:0 10px; background:white;
        color:#454557; font-size:12px; outline:none;
    }

    .donor-search .donor-input { padding-left:34px; }
    .donor-input:focus, .donor-select:focus { border-color:#B91C1C; }

    .donor-count-badge {
        display:inline-block; background:#EAF1FF; color:#3265CC;
        padding:9px 11px; border-radius:8px; font-size:11px;
        font-weight:700; white-space:nowrap;
    }

    .more-filters {
        margin-top:13px; padding:11px; background:#FAFAFC;
        border-radius:8px; display:flex; gap:20px; align-items:center;
        flex-wrap:wrap; font-size:12px; color:#55556A;
    }

    .donor-table-heading {
        display:flex; justify-content:space-between; align-items:center;
        gap:12px; padding:19px 21px; border-bottom:1px solid #EEEEF3;
    }

    .donor-table-heading h3 { margin:0; font-size:16px; font-weight:750; }

    .donor-tool {
        width:35px; height:35px; border:1px solid #E8E8EF;
        background:#fff; border-radius:8px; color:#77778B;
        cursor:pointer; display:inline-flex; justify-content:center; align-items:center;
        text-decoration:none;
    }

    .donor-table-scroll { width:100%; overflow-x:auto; }

    .donor-grid {
        width:100%; min-width:850px; border-collapse:collapse; font-size:12px;
    }

    .donor-grid th {
        background:#FAFAFC; color:#818194; font-size:10px;
        font-weight:700; text-transform:uppercase; letter-spacing:.45px;
        padding:15px 13px; text-align:left; white-space:nowrap;
        border-bottom:1px solid #EEEEF3;
    }

    .donor-grid td {
        padding:15px 13px; border-bottom:1px solid #F0F0F4;
        color:#55556A; vertical-align:middle; white-space:nowrap;
    }

    .donor-grid tr:last-child td { border-bottom:none; }
    .donor-grid tr:hover td { background:#FFFCFC; }

    .donor-user { display:flex; align-items:center; gap:10px; }

    .donor-avatar {
        width:37px; height:37px; min-width:37px; border-radius:50%;
        background:#FDECEC; color:#B91C1C; display:flex;
        justify-content:center; align-items:center; font-weight:750;
        font-size:12px;
    }

    .donor-name { color:#303044; font-weight:700; font-size:12px; margin-bottom:4px; }
    .donor-email { color:#9292A2; font-size:10px; }
    .donor-id { color:#77778B; font-size:11px; }

    .blood-badge {
        display:inline-block; background:#FDECEC; color:#B91C1C;
        border-radius:7px; padding:7px 9px; font-weight:750; font-size:11px;
    }

    .donor-status {
        display:inline-block; border-radius:20px; padding:6px 9px;
        font-size:10px; font-weight:700;
    }

    .availability-yes { background:#E5F8EC; color:#16834A; }
    .availability-no { background:#F0EFF6; color:#77718B; }
    .verify-yes { background:#E5F8EC; color:#16834A; }
    .verify-pending { background:#FFF0DF; color:#C66B12; }

    .donor-action {
        width:85px; border:1px solid #E8E8EF; border-radius:6px;
        padding:6px; background:white; color:#55556A; font-size:10px;
    }

    .donor-footer {
        padding:15px 21px; border-top:1px solid #EEEEF3;
        display:flex; justify-content:space-between; gap:12px;
        color:#858596; font-size:11px;
    }

    .donor-message { display:block; margin-top:12px; font-size:12px; font-weight:600; }

    .add-donor-card { padding:20px; }
    .add-donor-grid { display:grid; grid-template-columns:repeat(3,minmax(0,1fr)); gap:13px; }
    .add-donor-grid label { display:block; font-size:12px; color:#66667A; margin-bottom:6px; }
    .add-donor-grid input, .add-donor-grid select {
        width:100%; height:40px; border:1px solid #E5E5ED;
        border-radius:8px; padding:0 10px; font-size:12px;
    }

    @media(max-width:1250px) {
        .donor-filter-grid { grid-template-columns:repeat(3,minmax(0,1fr)); }
        .donor-stats { grid-template-columns:repeat(2,minmax(0,1fr)); }
    }

    @media(max-width:650px) {
        .donor-heading { align-items:flex-start; }
        .donor-heading h2 { font-size:21px; }
        .donor-stats, .donor-filter-grid, .add-donor-grid { grid-template-columns:1fr; }
        .donor-stat { padding:16px; }
        .donor-table-heading, .donor-footer { padding:15px; }
    }
</style>
</asp:Content>

<asp:Content ID="PageHeadingContent" ContentPlaceHolderID="PageHeading" runat="server">
    Donor Management
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="donors-page">

    <div class="donor-breadcrumb">
        <i class="fa-solid fa-house"></i>
        Home &nbsp; <i class="fa-solid fa-chevron-right"></i> &nbsp;
        <span class="current">Donor Management</span>
    </div>

    <div class="donor-heading">
        <div>
            <h2>Donor Management</h2>
            <p class="donor-subtitle">
                Manage, verify, monitor, and review registered blood donors across the BloodConnect platform.
            </p>
        </div>
        <asp:Button ID="btnAddDonor" runat="server" Text="+ Add Donor"
            CssClass="btn-maroon" OnClick="btnAddDonor_Click" />
    </div>

    <asp:Panel ID="pnlAddDonor" runat="server" Visible="false" CssClass="add-donor-card">
        <h5 style="font-weight:750;margin-bottom:18px;">Add New Donor</h5>

        <div class="add-donor-grid">
            <div>
                <label>Full Name</label>
                <asp:TextBox ID="txtDonorName" runat="server" placeholder="Enter donor name" />
            </div>
            <div>
                <label>Email</label>
                <asp:TextBox ID="txtDonorEmail" runat="server" TextMode="Email" placeholder="Enter email" />
            </div>
            <div>
                <label>Blood Group</label>
                <asp:DropDownList ID="ddlNewBlood" runat="server">
                    <asp:ListItem>A+</asp:ListItem>
                    <asp:ListItem>A-</asp:ListItem>
                    <asp:ListItem>B+</asp:ListItem>
                    <asp:ListItem>B-</asp:ListItem>
                    <asp:ListItem>O+</asp:ListItem>
                    <asp:ListItem>O-</asp:ListItem>
                    <asp:ListItem>AB+</asp:ListItem>
                    <asp:ListItem>AB-</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div>
                <label>Location</label>
                <asp:TextBox ID="txtDonorLocation" runat="server" placeholder="Enter city" />
            </div>
            <div>
                <label>Availability</label>
                <asp:DropDownList ID="ddlNewAvailability" runat="server">
                    <asp:ListItem Value="Available">Available</asp:ListItem>
                    <asp:ListItem Value="Unavailable">Unavailable</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <div style="margin-top:16px;display:flex;gap:9px;">
            <asp:Button ID="btnSaveDonor" runat="server" Text="Save Donor"
                CssClass="btn-maroon" OnClick="btnSaveDonor_Click" />
            <asp:Button ID="btnCancelDonor" runat="server" Text="Cancel"
                CssClass="donor-tool" style="width:auto;padding:0 15px;"
                OnClick="btnCancelDonor_Click" CausesValidation="false" />
        </div>
        <asp:Label ID="lblAddMessage" runat="server" CssClass="donor-message" />
    </asp:Panel>

    <div class="donor-stats">
        <div class="donor-stat">
            <div class="donor-stat-top">
                <div class="donor-stat-icon stat-red"><i class="fa-solid fa-users"></i></div>
            </div>
            <div class="donor-stat-label">Total Donors</div>
            <div class="donor-stat-number">4,826</div>
            <div class="donor-stat-note">Registered donors</div>
        </div>

        <div class="donor-stat">
            <div class="donor-stat-top">
                <div class="donor-stat-icon stat-blue"><i class="fa-solid fa-shield-halved"></i></div>
            </div>
            <div class="donor-stat-label">Verified Donors</div>
            <div class="donor-stat-number">4,210</div>
            <div class="donor-stat-note">87% of total</div>
        </div>

        <div class="donor-stat">
            <div class="donor-stat-top">
                <div class="donor-stat-icon stat-green"><i class="fa-solid fa-heart-pulse"></i></div>
            </div>
            <div class="donor-stat-label">Available Donors</div>
            <div class="donor-stat-number">3,680</div>
            <div class="donor-stat-note">Ready to donate</div>
        </div>

        <div class="donor-stat">
            <div class="donor-stat-top">
                <div class="donor-stat-icon stat-orange"><i class="fa-solid fa-clipboard-check"></i></div>
            </div>
            <div class="donor-stat-label">Pending Verification</div>
            <div class="donor-stat-number">616</div>
            <div class="donor-stat-note">Requires review</div>
        </div>
    </div>

    <div class="donor-filter-card">
        <div class="donor-filter-grid">
            <div class="donor-search">
                <i class="fa-solid fa-magnifying-glass"></i>
                <asp:TextBox ID="txtDonorSearch" runat="server" CssClass="donor-input"
                    placeholder="Search name, ID or email"
                    AutoPostBack="true" OnTextChanged="FilterDonors_Changed" />
            </div>

            <asp:DropDownList ID="ddlBloodFilter" runat="server" CssClass="donor-select"
                AutoPostBack="true" OnSelectedIndexChanged="FilterDonors_Changed">
                <asp:ListItem Value="ALL">Blood Group: All</asp:ListItem>
                <asp:ListItem>A+</asp:ListItem><asp:ListItem>A-</asp:ListItem>
                <asp:ListItem>B+</asp:ListItem><asp:ListItem>B-</asp:ListItem>
                <asp:ListItem>O+</asp:ListItem><asp:ListItem>O-</asp:ListItem>
                <asp:ListItem>AB+</asp:ListItem><asp:ListItem>AB-</asp:ListItem>
            </asp:DropDownList>

            <asp:DropDownList ID="ddlAvailabilityFilter" runat="server" CssClass="donor-select"
                AutoPostBack="true" OnSelectedIndexChanged="FilterDonors_Changed">
                <asp:ListItem Value="ALL">Availability: All</asp:ListItem>
                <asp:ListItem>Available</asp:ListItem>
                <asp:ListItem>Unavailable</asp:ListItem>
            </asp:DropDownList>

            <asp:DropDownList ID="ddlLocationFilter" runat="server" CssClass="donor-select"
                AutoPostBack="true" OnSelectedIndexChanged="FilterDonors_Changed">
                <asp:ListItem Value="ALL">Location: All</asp:ListItem>
                <asp:ListItem>Mumbai, MH</asp:ListItem>
                <asp:ListItem>Delhi, DL</asp:ListItem>
                <asp:ListItem>Bangalore, KA</asp:ListItem>
                <asp:ListItem>Pune, MH</asp:ListItem>
            </asp:DropDownList>

            <asp:DropDownList ID="ddlVerificationFilter" runat="server" CssClass="donor-select"
                AutoPostBack="true" OnSelectedIndexChanged="FilterDonors_Changed">
                <asp:ListItem Value="ALL">Status: All</asp:ListItem>
                <asp:ListItem>Verified</asp:ListItem>
                <asp:ListItem>Pending</asp:ListItem>
            </asp:DropDownList>

            <asp:Label ID="lblDonorBadge" runat="server"
                CssClass="donor-count-badge" Text="4,826 donors" />
        </div>

        <asp:Panel ID="pnlMoreFilters" runat="server" Visible="false" CssClass="more-filters">
            <span><i class="fa-solid fa-filter"></i> Additional filters</span>
            <asp:Button ID="btnClearFilters" runat="server" Text="Clear all filters"
                CssClass="donor-tool" style="width:auto;padding:0 12px;"
                OnClick="btnClearFilters_Click" CausesValidation="false" />
        </asp:Panel>

        <div style="margin-top:12px;display:flex;gap:9px;flex-wrap:wrap;">
            <asp:Button ID="btnMoreFilters" runat="server" Text="⚙ More Filters"
                CssClass="donor-tool" style="width:auto;padding:0 12px;"
                OnClick="btnMoreFilters_Click" CausesValidation="false" />
            <asp:Button ID="btnRefreshDonors" runat="server" Text="Refresh"
                CssClass="donor-tool" style="width:auto;padding:0 12px;"
                OnClick="btnRefreshDonors_Click" CausesValidation="false" />
        </div>

        <asp:Label ID="lblDonorMessage" runat="server" CssClass="donor-message" />
    </div>

    <div class="donor-table-card">
        <div class="donor-table-heading">
            <h3>All Donors</h3>
            <asp:LinkButton ID="btnTableRefresh" runat="server" CssClass="donor-tool"
                ToolTip="Refresh donors" OnClick="btnRefreshDonors_Click" CausesValidation="false">
                <i class="fa-solid fa-rotate-right"></i>
            </asp:LinkButton>
        </div>

        <div class="donor-table-scroll">
            <asp:GridView ID="gvDonors" runat="server" AutoGenerateColumns="false"
                CssClass="donor-grid" GridLines="None" DataKeyNames="DonorID"
                OnRowDataBound="gvDonors_RowDataBound"
                EmptyDataText="No donors found.">

                <Columns>
                    <asp:TemplateField HeaderText="Select">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkDonor" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Donor">
                        <ItemTemplate>
                            <div class="donor-user">
                                <div class="donor-avatar"><%# Eval("Initials") %></div>
                                <div>
                                    <div class="donor-name"><%# Eval("Name") %></div>
                                    <div class="donor-email"><%# Eval("Email") %></div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="DonorID" HeaderText="Donor ID"
                        ItemStyle-CssClass="donor-id" />

                    <asp:TemplateField HeaderText="Blood Group">
                        <ItemTemplate>
                            <span class="blood-badge"><%# Eval("BloodGroup") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="Location" HeaderText="Location" />

                    <asp:TemplateField HeaderText="Availability">
                        <ItemTemplate>
                            <asp:Label ID="lblAvailability" runat="server"
                                Text='<%# Eval("Availability") %>' CssClass="donor-status" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Verification">
                        <ItemTemplate>
                            <asp:Label ID="lblVerification" runat="server"
                                Text='<%# Eval("Verification") %>' CssClass="donor-status" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlDonorAction" runat="server"
                                CssClass="donor-action" AutoPostBack="true"
                                OnSelectedIndexChanged="ddlDonorAction_SelectedIndexChanged">
                                <asp:ListItem Value="">Actions</asp:ListItem>
                                <asp:ListItem Value="Verify">Verify</asp:ListItem>
                                <asp:ListItem Value="Available">Available</asp:ListItem>
                                <asp:ListItem Value="Unavailable">Unavailable</asp:ListItem>
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

        <div class="donor-footer">
            <asp:Label ID="lblShowingDonors" runat="server" Text="Showing 4 donors" />
            <span>BloodConnect Admin Panel</span>
        </div>
    </div>

</div>
</asp:Content>
