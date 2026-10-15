
<%@ Page Title="User Management - BloodConnect" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_Users.aspx.cs" Inherits="BloodConnect.Admin_Users" %>

<asp:Content ID="TitleContent1" ContentPlaceHolderID="TitleContent" runat="server">
    User Management - BloodConnect
</asp:Content>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
<style>
    .users-page {
        color: #252638;
        font-family: 'Segoe UI', Arial, sans-serif;
    }

    .users-page * { box-sizing: border-box; }

    .breadcrumb {
        color: #858596;
        font-size: 13px;
        margin-bottom: 20px;
    }

    .breadcrumb span { color: #B91C1C; font-weight: 600; }

    .page-heading-row {
        display: flex;
        justify-content: space-between;
        align-items: center;
        gap: 16px;
        margin-bottom: 25px;
    }

    .page-heading-row h2 {
        font-size: 25px;
        font-weight: 750;
        margin: 0 0 7px;
        color: #252638;
    }

    .page-subtitle {
        color: #818194;
        font-size: 13px;
        margin: 0;
    }

    .btn-maroon {
        background: #B91C1C;
        color: white;
        border: 1px solid #B91C1C;
        border-radius: 9px;
        padding: 11px 17px;
        font-size: 13px;
        font-weight: 600;
        white-space: nowrap;
    }

    .btn-maroon:hover { background: #991B1B; color: white; }

    .stats-grid {
        display: grid;
        grid-template-columns: repeat(4, minmax(0, 1fr));
        gap: 17px;
        margin-bottom: 25px;
    }

    .stat-card {
        background: white;
        border: 1px solid #ECECF2;
        border-radius: 13px;
        padding: 20px;
        min-width: 0;
        box-shadow: 0 3px 12px rgba(25,25,50,.025);
    }

    .stat-top {
        display: flex;
        justify-content: space-between;
        align-items: center;
        gap: 8px;
        margin-bottom: 18px;
    }

    .stat-icon {
        width: 42px;
        height: 42px;
        display: flex;
        justify-content: center;
        align-items: center;
        border-radius: 11px;
        font-size: 18px;
    }

    .icon-red { background: #FDECEC; color: #B91C1C; }
    .icon-blue { background: #EAF1FF; color: #3768D9; }
    .icon-yellow { background: #FFF5D9; color: #B77908; }
    .icon-green { background: #E5F8EC; color: #18834A; }

    .trend {
        font-size: 11px;
        font-weight: 700;
        white-space: nowrap;
    }

    .trend-green { color: #159653; }
    .trend-yellow { color: #B77908; }

    .stat-label {
        color: #77778B;
        font-size: 12px;
        margin-bottom: 6px;
    }

    .stat-number {
        color: #252638;
        font-size: 27px;
        font-weight: 750;
        letter-spacing: -.5px;
    }

    .filter-card, .table-card {
        background: white;
        border: 1px solid #ECECF2;
        border-radius: 13px;
        margin-bottom: 22px;
        overflow: hidden;
    }

    .filter-card { padding: 17px; }

    .filter-grid {
        display: grid;
        grid-template-columns: minmax(220px, 1fr) 160px 160px auto;
        gap: 12px;
        align-items: center;
    }

    .filter-input, .filter-select {
        width: 100%;
        height: 42px;
        border: 1px solid #E5E5ED;
        border-radius: 8px;
        padding: 0 12px;
        background: #fff;
        color: #454557;
        font-size: 12px;
        outline: none;
    }

    .filter-input:focus, .filter-select:focus {
        border-color: #B91C1C;
    }

    .search-wrap { position: relative; }
    .search-wrap i {
        position: absolute;
        left: 13px;
        top: 14px;
        color: #9696A7;
        font-size: 13px;
    }
    .search-wrap .filter-input { padding-left: 36px; }

    .bulk-actions {
        display: flex;
        align-items: center;
        gap: 8px;
        flex-wrap: wrap;
    }

    .selected-count {
        color: #77778B;
        font-size: 11px;
        white-space: nowrap;
        margin-right: 3px;
    }

    .btn-small {
        border: 1px solid #E5E5ED;
        background: #fff;
        border-radius: 7px;
        padding: 9px 11px;
        color: #525268;
        font-size: 11px;
        font-weight: 600;
    }

    .btn-verify {
        background: #E8F8EE;
        color: #16834A;
        border-color: #D2F0DE;
    }

    .btn-suspend {
        background: #FFF0F0;
        color: #B91C1C;
        border-color: #F9DADA;
    }

    .table-heading {
        display: flex;
        justify-content: space-between;
        align-items: center;
        gap: 12px;
        padding: 19px 21px;
        border-bottom: 1px solid #EEEEF3;
    }

    .table-heading h3 {
        margin: 0;
        font-size: 16px;
        font-weight: 750;
    }

    .table-tools { display: flex; gap: 8px; }

    .tool-button {
        width: 34px;
        height: 34px;
        display: flex;
        align-items: center;
        justify-content: center;
        border: 1px solid #E8E8EF;
        background: white;
        color: #77778B;
        border-radius: 8px;
        cursor: pointer;
    }

    .table-responsive { width: 100%; overflow-x: auto; }

    .users-table {
        width: 100%;
        min-width: 850px;
        border-collapse: collapse;
        font-size: 12px;
    }

    .users-table th {
        background: #FAFAFC;
        color: #818194;
        font-size: 10px;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: .45px;
        padding: 15px 13px;
        text-align: left;
        white-space: nowrap;
        border-bottom: 1px solid #EEEEF3;
    }

    .users-table td {
        padding: 15px 13px;
        border-bottom: 1px solid #F0F0F4;
        color: #55556A;
        vertical-align: middle;
        white-space: nowrap;
    }

    .users-table tr:last-child td { border-bottom: none; }
    .users-table tr:hover td { background: #FFFCFC; }

    .user-cell {
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .user-avatar {
        width: 36px;
        height: 36px;
        min-width: 36px;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 50%;
        background: #FDECEC;
        color: #B91C1C;
        font-size: 12px;
        font-weight: 750;
    }

    .user-name {
        font-size: 12px;
        color: #303044;
        font-weight: 700;
        margin-bottom: 4px;
    }

    .user-email { font-size: 10px; color: #9292A2; }

    .user-id { color: #77778B; font-size: 11px; }

    .role-badge, .status-badge {
        display: inline-block;
        border-radius: 20px;
        padding: 6px 9px;
        font-size: 9px;
        font-weight: 750;
    }

    .role-donor { background: #FDECEC; color: #B91C1C; }
    .role-seeker { background: #EAF1FF; color: #3265CC; }

    .status-active { background: #E5F8EC; color: #16834A; }
    .status-pending { background: #FFF4D6; color: #A56C00; }
    .status-suspended { background: #FDECEC; color: #B91C1C; }

    .status-dot {
        display: inline-block;
        width: 6px;
        height: 6px;
        border-radius: 50%;
        margin-right: 5px;
        background: currentColor;
        vertical-align: middle;
    }

    .action-select {
        width: 75px;
        border: 1px solid #E8E8EF;
        border-radius: 6px;
        padding: 6px;
        background: white;
        font-size: 10px;
        color: #55556A;
    }

    .table-footer {
        display: flex;
        justify-content: space-between;
        align-items: center;
        gap: 12px;
        padding: 16px 21px;
        border-top: 1px solid #EEEEF3;
        color: #858596;
        font-size: 11px;
    }

    .message-label {
        display: block;
        margin-top: 12px;
        font-size: 12px;
        font-weight: 600;
    }

    .add-user-panel {
        background: white;
        border: 1px solid #ECECF2;
        border-radius: 13px;
        padding: 20px;
        margin-bottom: 22px;
    }

    .add-user-grid {
        display: grid;
        grid-template-columns: repeat(3, minmax(0, 1fr));
        gap: 12px;
    }

    .add-user-grid label {
        display: block;
        font-size: 12px;
        color: #66667A;
        margin-bottom: 6px;
    }

    .add-user-grid input, .add-user-grid select {
        width: 100%;
        height: 40px;
        border: 1px solid #E5E5ED;
        border-radius: 8px;
        padding: 0 10px;
        font-size: 12px;
    }

    @media(max-width: 1200px) {
        .stats-grid { grid-template-columns: repeat(2, minmax(0, 1fr)); }
        .filter-grid { grid-template-columns: repeat(2, minmax(0, 1fr)); }
    }

    @media(max-width: 650px) {
        .page-heading-row { align-items: flex-start; }
        .page-heading-row h2 { font-size: 21px; }
        .stats-grid, .filter-grid, .add-user-grid { grid-template-columns: 1fr; }
        .stat-card { padding: 16px; }
        .table-heading, .table-footer { padding: 15px; }
    }
</style>
</asp:Content>

<asp:Content ID="PageHeadingContent" ContentPlaceHolderID="PageHeading" runat="server">
    User Management
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="users-page">

    <div class="breadcrumb">
        <i class="fa-solid fa-house"></i>
        Home &nbsp; <i class="fa-solid fa-chevron-right"></i> &nbsp;
        <span>User Management</span>
    </div>

    <div class="page-heading-row">
        <div>
            <h2>User Management</h2>
            <p class="page-subtitle">
                Manage, verify, monitor, and control all BloodConnect platform users.
            </p>
        </div>

        <asp:Button ID="btnAddUser" runat="server" Text="+ Add User"
            CssClass="btn-maroon" OnClick="btnAddUser_Click" />
    </div>

    <asp:Panel ID="pnlAddUser" runat="server" Visible="false" CssClass="add-user-panel">
        <h5 style="font-weight:750; margin-bottom:18px;">Add New User</h5>

        <div class="add-user-grid">
            <div>
                <label>Full Name</label>
                <asp:TextBox ID="txtName" runat="server" placeholder="Enter full name" />
            </div>
            <div>
                <label>Email Address</label>
                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" placeholder="Enter email" />
            </div>
            <div>
                <label>Phone</label>
                <asp:TextBox ID="txtPhone" runat="server" placeholder="Enter phone number" />
            </div>
            <div>
                <label>Role</label>
                <asp:DropDownList ID="ddlNewRole" runat="server">
                    <asp:ListItem Value="DONOR">Donor</asp:ListItem>
                    <asp:ListItem Value="SEEKER">Seeker</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div>
                <label>Blood Group</label>
                <asp:DropDownList ID="ddlNewBloodGroup" runat="server">
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
                <asp:TextBox ID="txtLocation" runat="server" placeholder="Enter city" />
            </div>
        </div>

        <div style="margin-top:16px; display:flex; gap:9px;">
            <asp:Button ID="btnSaveUser" runat="server" Text="Save User"
                CssClass="btn-maroon" OnClick="btnSaveUser_Click" />
            <asp:Button ID="btnCancelAdd" runat="server" Text="Cancel"
                CssClass="btn-small" OnClick="btnCancelAdd_Click" CausesValidation="false" />
        </div>

        <asp:Label ID="lblFormMessage" runat="server" CssClass="message-label" />
    </asp:Panel>

    <div class="stats-grid">
        <div class="stat-card">
            <div class="stat-top">
                <div class="stat-icon icon-red"><i class="fa-solid fa-users"></i></div>
                <span class="trend trend-green"><i class="fa-solid fa-arrow-trend-up"></i> +8.4%</span>
            </div>
            <div class="stat-label">Total Users</div>
            <div class="stat-number">12,480</div>
        </div>

        <div class="stat-card">
            <div class="stat-top">
                <div class="stat-icon icon-blue"><i class="fa-solid fa-user-check"></i></div>
                <span class="trend trend-green"><i class="fa-solid fa-arrow-trend-up"></i> +6.8%</span>
            </div>
            <div class="stat-label">Active Users</div>
            <div class="stat-number">10,926</div>
        </div>

        <div class="stat-card">
            <div class="stat-top">
                <div class="stat-icon icon-yellow"><i class="fa-solid fa-shield-halved"></i></div>
                <span class="trend trend-yellow"><i class="fa-solid fa-arrow-trend-up"></i> +3.2%</span>
            </div>
            <div class="stat-label">Pending Verification</div>
            <div class="stat-number">326</div>
        </div>

        <div class="stat-card">
            <div class="stat-top">
                <div class="stat-icon icon-green"><i class="fa-solid fa-user-slash"></i></div>
                <span class="trend trend-green"><i class="fa-solid fa-arrow-trend-down"></i> -2.1%</span>
            </div>
            <div class="stat-label">Suspended Users</div>
            <div class="stat-number">84</div>
        </div>
    </div>

    <div class="filter-card">
        <div class="filter-grid">

            <div class="search-wrap">
                <i class="fa-solid fa-magnifying-glass"></i>
                <asp:TextBox ID="txtSearch" runat="server" CssClass="filter-input"
                    placeholder="Search name, email, phone, or user ID"
                    AutoPostBack="true" OnTextChanged="Filter_Changed" />
            </div>

            <asp:DropDownList ID="ddlRole" runat="server" CssClass="filter-select"
                AutoPostBack="true" OnSelectedIndexChanged="Filter_Changed">
                <asp:ListItem Value="ALL">Role: All</asp:ListItem>
                <asp:ListItem Value="DONOR">Donor</asp:ListItem>
                <asp:ListItem Value="SEEKER">Seeker</asp:ListItem>
            </asp:DropDownList>

            <asp:DropDownList ID="ddlStatus" runat="server" CssClass="filter-select"
                AutoPostBack="true" OnSelectedIndexChanged="Filter_Changed">
                <asp:ListItem Value="ALL">Status: All</asp:ListItem>
                <asp:ListItem Value="Active">Active</asp:ListItem>
                <asp:ListItem Value="Pending">Pending</asp:ListItem>
                <asp:ListItem Value="Suspended">Suspended</asp:ListItem>
            </asp:DropDownList>

            <div class="bulk-actions">
                <asp:Label ID="lblSelected" runat="server" CssClass="selected-count"
                    Text="0 selected" />
                <asp:Button ID="btnVerify" runat="server" Text="Verify"
                    CssClass="btn-small btn-verify" OnClick="btnVerify_Click" />
                <asp:Button ID="btnSuspend" runat="server" Text="Suspend"
                    CssClass="btn-small btn-suspend" OnClick="btnSuspend_Click" />
            </div>

        </div>

        <asp:Label ID="lblMessage" runat="server" CssClass="message-label" />
    </div>

    <div class="table-card">
        <div class="table-heading">
            <h3>All Users <span style="color:#9696A7; font-weight:500;">(<asp:Label ID="lblUserCount" runat="server" Text="4" />)</span></h3>

            <div class="table-tools">
                <asp:LinkButton ID="btnRefresh" runat="server" CssClass="tool-button"
                    OnClick="btnRefresh_Click" CausesValidation="false"
                    ToolTip="Refresh users">
                    <i class="fa-solid fa-rotate-right"></i>
                </asp:LinkButton>
            </div>
        </div>

        <div class="table-responsive">
            <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="false"
                CssClass="users-table" GridLines="None"
                DataKeyNames="UserID" OnRowDataBound="gvUsers_RowDataBound"
                EmptyDataText="No users found.">

                <Columns>
                    <asp:TemplateField HeaderText="Select">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSelect" runat="server"
                                AutoPostBack="true" OnCheckedChanged="chkSelect_CheckedChanged" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="User">
                        <ItemTemplate>
                            <div class="user-cell">
                                <div class="user-avatar">
                                    <%# Eval("Initials") %>
                                </div>
                                <div>
                                    <div class="user-name"><%# Eval("Name") %></div>
                                    <div class="user-email"><%# Eval("Email") %></div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="UserID" HeaderText="User ID"
                        ItemStyle-CssClass="user-id" />

                    <asp:TemplateField HeaderText="Role">
                        <ItemTemplate>
                            <asp:Label ID="lblRoleBadge" runat="server"
                                Text='<%# Eval("Role") %>' CssClass="role-badge" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="BloodGroup" HeaderText="Blood Group" />
                    <asp:BoundField DataField="Location" HeaderText="Location" />

                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" runat="server"
                                Text='<%# Eval("Status") %>' CssClass="status-badge" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlAction" runat="server"
                                CssClass="action-select" AutoPostBack="true"
                                OnSelectedIndexChanged="ddlAction_SelectedIndexChanged">
                                <asp:ListItem Value="">Actions</asp:ListItem>
                                <asp:ListItem Value="Verify">Verify</asp:ListItem>
                                <asp:ListItem Value="Suspend">Suspend</asp:ListItem>
                                <asp:ListItem Value="Activate">Activate</asp:ListItem>
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

        <div class="table-footer">
            <span>Showing sample user records</span>
            <span>BloodConnect Admin Terminal</span>
        </div>
    </div>

</div>
</asp:Content>
