
<%@ Page Title="Blood Banks - BloodConnect" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_BloodBanks.aspx.cs" Inherits="BloodConnect.Admin_BloodBanks" %>

<asp:Content ID="TitleContent1" ContentPlaceHolderID="TitleContent" runat="server">
    Blood Banks Management - BloodConnect
</asp:Content>

<asp:Content ID="HeadContent1" ContentPlaceHolderID="head" runat="server">
<style>
    .banks-page{padding:24px;background:#F8FAFC;min-height:100vh;font-family:Arial,sans-serif;color:#192033}
    .page-heading{display:flex;justify-content:space-between;align-items:center;gap:15px;flex-wrap:wrap;margin-bottom:24px}
    .breadcrumb{font-size:12px;color:#9CA3AF;margin-bottom:10px}
    .breadcrumb span{color:#B91C1C}
    .page-heading h2{font-size:27px;margin:0 0 8px;font-weight:700}
    .page-heading p{font-size:14px;color:#6B7280;margin:0}
    .btn-add{background:#B91C1C;color:white;border:0;border-radius:8px;padding:12px 17px;font-weight:600;cursor:pointer}
    .btn-add:hover{background:#991B1B}
    .stats-grid{display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:18px;margin-bottom:24px}
    .stat-card{background:white;border:1px solid #E5E7EB;border-radius:12px;padding:20px;box-shadow:0 2px 7px rgba(0,0,0,.025)}
    .stat-top{display:flex;justify-content:space-between;align-items:center;margin-bottom:15px}
    .stat-label{font-size:12px;font-weight:700;color:#6B7280}
    .stat-icon{width:42px;height:42px;display:flex;align-items:center;justify-content:center;border-radius:10px;font-size:21px}
    .blue{background:#DBEAFE;color:#2563EB}.green{background:#D1FAE5;color:#047857}
    .yellow{background:#FEF3C7;color:#B45309}.gray{background:#E5E7EB;color:#475569}
    .stat-number{font-size:30px;font-weight:700;margin-bottom:7px}
    .stat-description{font-size:12px;color:#9CA3AF}
    .content-card,.form-panel{background:white;border:1px solid #E5E7EB;border-radius:12px;padding:22px;margin-bottom:24px;box-shadow:0 2px 7px rgba(0,0,0,.025)}
    .section-heading{display:flex;justify-content:space-between;align-items:center;gap:10px;flex-wrap:wrap;margin-bottom:20px}
    .section-heading h3,.form-panel h3{font-size:18px;margin:0;color:#192033}
    .section-subtitle{font-size:12px;color:#9CA3AF;margin-top:6px}
    .filter-row{display:grid;grid-template-columns:minmax(200px,2fr) repeat(3,minmax(130px,1fr)) auto;gap:12px;align-items:center;margin-bottom:22px}
    .form-control{width:100%;box-sizing:border-box;padding:11px 12px;border:1px solid #D1D5DB;border-radius:7px;background:#fff;color:#374151;font-size:13px}
    .form-control:focus{outline:none;border-color:#B91C1C}
    .clear-link{color:#B91C1C;font-size:13px;font-weight:600;text-decoration:none;white-space:nowrap}
    .table-scroll{width:100%;overflow-x:auto}
    .banks-table{width:100%;min-width:1050px;border-collapse:collapse;font-size:13px}
    .banks-table th{background:#F9FAFB;color:#6B7280;font-size:11px;letter-spacing:.35px;text-align:left;padding:14px 12px;border-bottom:1px solid #E5E7EB;white-space:nowrap}
    .banks-table td{padding:15px 12px;border-bottom:1px solid #F1F5F9;color:#374151;vertical-align:middle}
    .banks-table tr:hover td{background:#FFFAFA}
    .bank-name{display:block;font-weight:700;color:#192033;margin-bottom:6px;white-space:nowrap}
    .bank-phone{font-size:11px;color:#9CA3AF;white-space:nowrap}
    .bank-id{font-weight:600;color:#475569;white-space:nowrap}
    .units{font-weight:700;color:#192033;white-space:nowrap}
    .stock-badge,.status-badge{display:inline-block;padding:6px 10px;border-radius:20px;font-size:11px;font-weight:600;white-space:nowrap}
    .stock-healthy{background:#D1FAE5;color:#047857}
    .stock-low{background:#FEF3C7;color:#B45309}
    .stock-critical{background:#FEE2E2;color:#B91C1C}
    .bank-active{border:1px solid #86EFAC;color:#047857;background:#F0FDF4}
    .bank-pending{border:1px solid #FCD34D;color:#92400E;background:#FFFBEB}
    .bank-inactive{border:1px solid #D1D5DB;color:#64748B;background:#F8FAFC}
    .action-link{color:#64748B;font-size:20px;text-decoration:none;padding:4px 8px}
    .action-link:hover{color:#B91C1C}
    .form-grid{display:grid;grid-template-columns:repeat(3,minmax(0,1fr));gap:16px;margin-top:20px}
    .field-label{display:block;font-size:13px;font-weight:600;color:#374151;margin-bottom:7px}
    .form-actions{display:flex;gap:10px;margin-top:18px}
    .btn-save{background:#B91C1C;color:white;border:0;border-radius:7px;padding:11px 18px;font-weight:600;cursor:pointer}
    .btn-cancel{background:white;color:#374151;border:1px solid #D1D5DB;border-radius:7px;padding:11px 18px;font-weight:600;cursor:pointer}
    .message{display:block;margin-top:12px;font-size:13px;font-weight:600}
    .empty-message{padding:25px;text-align:center;color:#6B7280}
    @media(max-width:1100px){.stats-grid{grid-template-columns:repeat(2,minmax(0,1fr))}.filter-row{grid-template-columns:repeat(2,minmax(0,1fr))}.form-grid{grid-template-columns:repeat(2,minmax(0,1fr))}}
    @media(max-width:650px){.banks-page{padding:14px}.stats-grid,.filter-row,.form-grid{grid-template-columns:1fr}.page-heading h2{font-size:23px}}
</style>
</asp:Content>

<asp:Content ID="MainContent1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="banks-page">

    <div class="page-heading">
        <div>
            <div class="breadcrumb">Home &gt; <span>Blood Banks</span></div>
            <h2>Blood Banks Management</h2>
            <p>Manage registered blood banks, stock availability, and approval status.</p>
        </div>
        <asp:Button ID="btnAddBloodBank" runat="server" Text="+ Add Blood Bank"
            CssClass="btn-add" CausesValidation="false" OnClick="btnAddBloodBank_Click" />
    </div>

    <!-- FIXED KPI CARDS -->
    <div class="stats-grid">
        <div class="stat-card">
            <div class="stat-top"><span class="stat-label">TOTAL BLOOD BANKS</span><span class="stat-icon blue">🏛️</span></div>
            <div class="stat-number">48</div>
            <div class="stat-description">Registered blood banks</div>
        </div>
        <div class="stat-card">
            <div class="stat-top"><span class="stat-label">ACTIVE BLOOD BANKS</span><span class="stat-icon green">✓</span></div>
            <div class="stat-number">42</div>
            <div class="stat-description">Currently active</div>
        </div>
        <div class="stat-card">
            <div class="stat-top"><span class="stat-label">PENDING APPROVAL</span><span class="stat-icon yellow">◷</span></div>
            <div class="stat-number">4</div>
            <div class="stat-description">Awaiting approval</div>
        </div>
        <div class="stat-card">
            <div class="stat-top"><span class="stat-label">INACTIVE</span><span class="stat-icon gray">⊘</span></div>
            <div class="stat-number">2</div>
            <div class="stat-description">Currently inactive</div>
        </div>
    </div>

    <!-- ADD BLOOD BANK FORM -->
    <asp:Panel ID="pnlAddBloodBank" runat="server" CssClass="form-panel" Visible="false">
        <h3>Add Blood Bank</h3>
        <div class="form-grid">
            <div>
                <label class="field-label">Blood Bank Name</label>
                <asp:TextBox ID="txtBankName" runat="server" CssClass="form-control" />
            </div>
            <div>
                <label class="field-label">Phone Number</label>
                <asp:TextBox ID="txtBankPhone" runat="server" CssClass="form-control" />
            </div>
            <div>
                <label class="field-label">Bank ID</label>
                <asp:TextBox ID="txtBankID" runat="server" CssClass="form-control" />
            </div>
            <div>
                <label class="field-label">Type</label>
                <asp:DropDownList ID="ddlNewType" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Government" Value="Government" />
                    <asp:ListItem Text="Private" Value="Private" />
                    <asp:ListItem Text="NGO" Value="NGO" />
                    <asp:ListItem Text="Hospital" Value="Hospital" />
                </asp:DropDownList>
            </div>
            <div>
                <label class="field-label">Location</label>
                <asp:TextBox ID="txtBankLocation" runat="server" CssClass="form-control" />
            </div>
            <div>
                <label class="field-label">Blood Units</label>
                <asp:TextBox ID="txtBankUnits" runat="server" CssClass="form-control" TextMode="Number" />
            </div>
            <div>
                <label class="field-label">Status</label>
                <asp:DropDownList ID="ddlNewStatus" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Active" Value="Active" />
                    <asp:ListItem Text="Pending" Value="Pending" />
                    <asp:ListItem Text="Inactive" Value="Inactive" />
                </asp:DropDownList>
            </div>
        </div>
        <div class="form-actions">
            <asp:Button ID="btnSaveBank" runat="server" Text="Save Blood Bank"
                CssClass="btn-save" OnClick="btnSaveBank_Click" />
            <asp:Button ID="btnCancelBank" runat="server" Text="Cancel"
                CssClass="btn-cancel" CausesValidation="false" OnClick="btnCancelBank_Click" />
        </div>
        <asp:Label ID="lblFormMessage" runat="server" CssClass="message" />
    </asp:Panel>

    <!-- BLOOD BANK TABLE -->
    <div class="content-card">
        <div class="section-heading">
            <div>
                <h3>Registered Blood Banks</h3>
                <div class="section-subtitle">Blood bank details, stock levels, and account status</div>
            </div>
            <asp:Label ID="lblBankCount" runat="server" CssClass="status-badge bank-active" />
        </div>

        <div class="filter-row">
            <asp:TextBox ID="txtBankSearch" runat="server" CssClass="form-control"
                placeholder="Search blood bank name, ID, location..."
                AutoPostBack="true" OnTextChanged="BankFilter_Changed" />

            <asp:DropDownList ID="ddlStatusFilter" runat="server" CssClass="form-control"
                AutoPostBack="true" OnSelectedIndexChanged="BankFilter_Changed">
                <asp:ListItem Text="Status: All" Value="" />
                <asp:ListItem Text="Active" Value="Active" />
                <asp:ListItem Text="Pending" Value="Pending" />
                <asp:ListItem Text="Inactive" Value="Inactive" />
            </asp:DropDownList>

            <asp:DropDownList ID="ddlTypeFilter" runat="server" CssClass="form-control"
                AutoPostBack="true" OnSelectedIndexChanged="BankFilter_Changed">
                <asp:ListItem Text="Type: All" Value="" />
                <asp:ListItem Text="Government" Value="Government" />
                <asp:ListItem Text="Private" Value="Private" />
                <asp:ListItem Text="NGO" Value="NGO" />
                <asp:ListItem Text="Hospital" Value="Hospital" />
            </asp:DropDownList>

            <asp:DropDownList ID="ddlLocationFilter" runat="server" CssClass="form-control"
                AutoPostBack="true" OnSelectedIndexChanged="BankFilter_Changed">
                <asp:ListItem Text="Location: All" Value="" />
                <asp:ListItem Text="Ahmedabad" Value="Ahmedabad" />
                <asp:ListItem Text="Surat" Value="Surat" />
                <asp:ListItem Text="Rajkot" Value="Rajkot" />
                <asp:ListItem Text="Vadodara" Value="Vadodara" />
            </asp:DropDownList>

            <asp:LinkButton ID="lnkClearFilters" runat="server" CssClass="clear-link"
                CausesValidation="false" OnClick="lnkClearFilters_Click">Clear Filters</asp:LinkButton>
        </div>

        <div class="table-scroll">
            <asp:GridView ID="gvBloodBanks" runat="server" CssClass="banks-table"
                AutoGenerateColumns="false" GridLines="None" DataKeyNames="BankID"
                OnRowDataBound="gvBloodBanks_RowDataBound"
                OnRowCommand="gvBloodBanks_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkBank" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="BLOOD BANK">
                        <ItemTemplate>
                            <asp:Label ID="lblBankName" runat="server" CssClass="bank-name"
                                Text='<%# Eval("BankName") %>' />
                            <asp:Label ID="lblPhone" runat="server" CssClass="bank-phone"
                                Text='<%# Eval("Phone") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="BankID" HeaderText="BANK ID" />
                    <asp:BoundField DataField="Type" HeaderText="TYPE" />
                    <asp:BoundField DataField="Location" HeaderText="LOCATION" />

                    <asp:TemplateField HeaderText="BLOOD UNITS">
                        <ItemTemplate>
                            <asp:Label ID="lblUnits" runat="server" CssClass="units"
                                Text='<%# String.Format("{0:N0} Units", Eval("Units")) %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="STOCK STATUS">
                        <ItemTemplate>
                            <asp:Label ID="lblStockStatus" runat="server"
                                Text='<%# Eval("StockStatus") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="STATUS">
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" runat="server"
                                Text='<%# Eval("Status") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="ACTIONS">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkBankAction" runat="server" Text="⋮"
                                CssClass="action-link" CausesValidation="false"
                                CommandName="ViewBank"
                                CommandArgument='<%# Eval("BankID") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <div class="empty-message">No blood banks match your filters.</div>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>

        <asp:Label ID="lblBankMessage" runat="server" CssClass="message" />
    </div>
</div>
</asp:Content>
