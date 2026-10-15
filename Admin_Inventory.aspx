
<%@ Page Title="Blood Inventory - BloodConnect" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_Inventory.aspx.cs" Inherits="BloodConnect.Admin_Inventory" %>

<asp:Content ID="TitleContent1" ContentPlaceHolderID="TitleContent" runat="server">
    Blood Inventory - BloodConnect
</asp:Content>

<asp:Content ID="HeadContent1" ContentPlaceHolderID="head" runat="server">
    <style>
        .inventory-page {
            padding: 24px;
            background: #F8FAFC;
            min-height: 100vh;
            color: #192033;
            font-family: Arial, sans-serif;
        }

        .page-heading {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 16px;
            margin-bottom: 24px;
        }

        .page-heading h2 {
            font-size: 27px;
            margin: 0 0 8px;
            font-weight: 700;
            color: #192033;
        }

        .page-heading p {
            color: #6B7280;
            font-size: 14px;
            margin: 0;
            line-height: 1.6;
        }

        .btn-update {
            background: #B91C1C;
            color: #FFFFFF;
            border: none;
            border-radius: 8px;
            padding: 12px 18px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
        }

        .btn-update:hover {
            background: #991B1B;
        }

        .alert-banner {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 18px;
            padding: 19px 21px;
            margin-bottom: 24px;
            background: #FFF1F2;
            border: 1px solid #FECACA;
            border-left: 5px solid #DC2626;
            border-radius: 10px;
        }

        .alert-content {
            display: flex;
            align-items: flex-start;
            gap: 14px;
        }

        .alert-icon {
            font-size: 25px;
            flex-shrink: 0;
        }

        .alert-title {
            font-size: 15px;
            font-weight: 700;
            color: #991B1B;
            margin-bottom: 7px;
        }

        .alert-tag {
            font-size: 10px;
            font-weight: 700;
            letter-spacing: .5px;
            margin-left: 7px;
            background: #FEE2E2;
            color: #B91C1C;
            padding: 4px 7px;
            border-radius: 4px;
        }

        .alert-message {
            font-size: 13px;
            color: #7F1D1D;
            line-height: 1.6;
        }

        .btn-resolve {
            background: #FFFFFF;
            border: 1px solid #DC2626;
            color: #B91C1C;
            border-radius: 7px;
            padding: 10px 16px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            white-space: nowrap;
        }

        .btn-resolve:hover {
            background: #FEE2E2;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(4, minmax(0, 1fr));
            gap: 18px;
            margin-bottom: 25px;
        }

        .stat-card {
            background: #FFFFFF;
            border: 1px solid #E5E7EB;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 2px 7px rgba(0,0,0,.025);
        }

        .stat-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 8px;
            margin-bottom: 16px;
        }

        .stat-label {
            color: #6B7280;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: .35px;
        }

        .stat-icon {
            display: flex;
            width: 42px;
            height: 42px;
            align-items: center;
            justify-content: center;
            border-radius: 10px;
            font-size: 21px;
            flex-shrink: 0;
        }

        .icon-red {
            background: #FEE2E2;
            color: #B91C1C;
        }

        .icon-green {
            background: #D1FAE5;
            color: #047857;
        }

        .icon-yellow {
            background: #FEF3C7;
            color: #B45309;
        }

        .icon-orange {
            background: #FFEDD5;
            color: #C2410C;
        }

        .stat-number {
            font-size: 30px;
            font-weight: 700;
            color: #192033;
            margin-bottom: 10px;
        }

        .stat-description {
            font-size: 12px;
            color: #9CA3AF;
            line-height: 1.5;
        }

        .positive-change {
            color: #059669;
            font-weight: 700;
        }

        .content-card {
            background: #FFFFFF;
            border: 1px solid #E5E7EB;
            border-radius: 12px;
            padding: 22px;
            margin-bottom: 24px;
            box-shadow: 0 2px 7px rgba(0,0,0,.025);
        }

        .section-heading {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 22px;
        }

        .section-heading h3 {
            margin: 0;
            font-size: 18px;
            color: #192033;
        }

        .section-subtitle {
            font-size: 12px;
            color: #9CA3AF;
            margin-top: 6px;
        }

        .overview-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 22px 32px;
        }

        .blood-group-item {
            min-width: 0;
        }

        .blood-group-top {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 10px;
            margin-bottom: 10px;
        }

        .group-name {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .group-badge {
            min-width: 40px;
            padding: 7px 9px;
            box-sizing: border-box;
            border-radius: 6px;
            text-align: center;
            background: #EDE9FE;
            color: #6D28D9;
            font-size: 12px;
            font-weight: 700;
        }

        .group-units {
            color: #192033;
            font-size: 13px;
            font-weight: 700;
        }

        .stock-status {
            font-size: 11px;
            font-weight: 600;
            white-space: nowrap;
        }

        .healthy-text { color: #059669; }
        .moderate-text { color: #B45309; }
        .low-text { color: #EA580C; }
        .critical-text { color: #DC2626; }

        .progress-track {
            width: 100%;
            height: 9px;
            background: #F1F5F9;
            border-radius: 10px;
            overflow: hidden;
        }

        .progress-fill {
            display: block;
            height: 100%;
            border-radius: 10px;
        }

        .bar-green { background: #10B981; }
        .bar-yellow { background: #F59E0B; }
        .bar-orange { background: #F97316; }
        .bar-red { background: #DC2626; }

        .filter-row {
            display: grid;
            grid-template-columns: minmax(220px, 2fr) minmax(150px, 1fr) minmax(150px, 1fr) auto;
            gap: 12px;
            align-items: center;
            margin-bottom: 22px;
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
            box-shadow: 0 0 0 2px rgba(185,28,28,.08);
        }

        .clear-link {
            color: #B91C1C;
            font-size: 13px;
            font-weight: 600;
            text-decoration: none;
            white-space: nowrap;
        }

        .clear-link:hover {
            text-decoration: underline;
        }

        .table-scroll {
            width: 100%;
            overflow-x: auto;
        }

        .inventory-table {
            width: 100%;
            min-width: 850px;
            border-collapse: collapse;
            font-size: 13px;
        }

        .inventory-table th {
            background: #F9FAFB;
            color: #6B7280;
            font-size: 11px;
            letter-spacing: .4px;
            text-align: left;
            padding: 14px 12px;
            border-bottom: 1px solid #E5E7EB;
            white-space: nowrap;
        }

        .inventory-table td {
            padding: 16px 12px;
            border-bottom: 1px solid #F1F5F9;
            color: #374151;
            vertical-align: middle;
        }

        .inventory-table tr:hover td {
            background: #FFFAFA;
        }

        .table-group {
            display: inline-block;
            min-width: 38px;
            text-align: center;
            padding: 6px 8px;
            border-radius: 6px;
            background: #EDE9FE;
            color: #6D28D9;
            font-weight: 700;
        }

        .table-group-critical {
            background: #FEE2E2;
            color: #B91C1C;
        }

        .bank-name {
            display: block;
            font-weight: 600;
            color: #192033;
            margin-bottom: 6px;
            white-space: nowrap;
        }

        .bank-location {
            font-size: 11px;
            color: #9CA3AF;
            white-space: nowrap;
        }

        .available-normal {
            font-weight: 700;
            color: #192033;
        }

        .available-critical {
            font-weight: 700;
            color: #DC2626;
        }

        .available-low {
            font-weight: 700;
            color: #EA580C;
        }

        .status-badge {
            display: inline-block;
            padding: 6px 10px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 600;
            white-space: nowrap;
        }

        .status-healthy {
            background: #D1FAE5;
            color: #047857;
        }

        .status-moderate {
            background: #FEF3C7;
            color: #92400E;
        }

        .status-low {
            background: #FFEDD5;
            color: #C2410C;
        }

        .status-critical {
            background: #FEE2E2;
            color: #B91C1C;
        }

        .btn-edit-stock {
            background: #FFFFFF;
            border: 1px solid #D1D5DB;
            color: #374151;
            padding: 7px 10px;
            border-radius: 6px;
            font-size: 11px;
            cursor: pointer;
            white-space: nowrap;
        }

        .btn-edit-stock:hover {
            border-color: #B91C1C;
            color: #B91C1C;
        }

        .message {
            display: block;
            margin-top: 14px;
            font-size: 13px;
            font-weight: 600;
        }

        .empty-message {
            padding: 25px;
            text-align: center;
            color: #6B7280;
        }

        .modal-panel {
            background: #FFFFFF;
            border: 1px solid #E5E7EB;
            border-radius: 12px;
            padding: 22px;
            margin-bottom: 24px;
        }

        .modal-panel h3 {
            margin: 0 0 18px;
            font-size: 18px;
        }

        .edit-grid {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 16px;
        }

        .field-label {
            display: block;
            margin-bottom: 7px;
            font-size: 13px;
            font-weight: 600;
            color: #374151;
        }

        .form-actions {
            display: flex;
            gap: 10px;
            margin-top: 18px;
        }

        .btn-save {
            background: #B91C1C;
            color: white;
            border: none;
            border-radius: 7px;
            padding: 11px 18px;
            font-weight: 600;
            cursor: pointer;
        }

        .btn-cancel {
            background: #FFFFFF;
            color: #374151;
            border: 1px solid #D1D5DB;
            border-radius: 7px;
            padding: 11px 18px;
            font-weight: 600;
            cursor: pointer;
        }

        @media (max-width: 1100px) {
            .stats-grid {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }

            .filter-row {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }

            .edit-grid {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }
        }

        @media (max-width: 650px) {
            .inventory-page {
                padding: 14px;
            }

            .stats-grid,
            .overview-grid,
            .filter-row,
            .edit-grid {
                grid-template-columns: 1fr;
            }

            .alert-banner {
                align-items: flex-start;
                flex-direction: column;
            }

            .page-heading h2 {
                font-size: 23px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="MainContent1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="inventory-page">

        <!-- PAGE HEADER -->
        <div class="page-heading">
            <div>
                <h2>Blood Inventory</h2>
                <p>Monitor blood stock levels, availability, and critical inventory across all connected blood banks.</p>
            </div>

            <asp:Button ID="btnUpdateStock" runat="server"
                Text="↻ Update Stock"
                CssClass="btn-update"
                CausesValidation="false"
                OnClick="btnUpdateStock_Click" />
        </div>

        <!-- CRITICAL STOCK ALERT -->
        <div class="alert-banner">
            <div class="alert-content">
                <span class="alert-icon">⚠️</span>
                <div>
                    <div class="alert-title">
                        Critical Stock Alert
                        <span class="alert-tag">ACTION REQUIRED</span>
                    </div>
                    <div class="alert-message">
                        AB- blood stock is critically low at Hope Blood Center.
                        Current Stock: 18 units. Recommended Minimum: 50 units.
                    </div>
                </div>
            </div>

            <asp:Button ID="btnResolve" runat="server"
                Text="Resolve"
                CssClass="btn-resolve"
                CausesValidation="false"
                OnClick="btnResolve_Click" />
        </div>

        <!-- KPI CARDS -->
        <div class="stats-grid">

            <div class="stat-card">
                <div class="stat-top">
                    <span class="stat-label">TOTAL BLOOD UNITS</span>
                    <span class="stat-icon icon-red">🩸</span>
                </div>
                <div class="stat-number">8,642</div>
                <div class="stat-description">
                    <span class="positive-change">↑ 12%</span> vs last month
                </div>
            </div>

            <div class="stat-card">
                <div class="stat-top">
                    <span class="stat-label">AVAILABLE UNITS</span>
                    <span class="stat-icon icon-green">✅</span>
                </div>
                <div class="stat-number">7,218</div>
                <div class="stat-description">Ready for immediate dispatch</div>
            </div>

            <div class="stat-card">
                <div class="stat-top">
                    <span class="stat-label">LOW STOCK GROUPS</span>
                    <span class="stat-icon icon-yellow">⚠️</span>
                </div>
                <div class="stat-number">426</div>
                <div class="stat-description">Units across 3 blood groups</div>
            </div>

            <div class="stat-card">
                <div class="stat-top">
                    <span class="stat-label">CRITICAL STOCK</span>
                    <span class="stat-icon icon-orange">❌</span>
                </div>
                <div class="stat-number">86</div>
                <div class="stat-description">Immediate replenishment needed</div>
            </div>

        </div>

        <!-- BLOOD GROUP OVERVIEW -->
        <div class="content-card">

            <div class="section-heading">
                <div>
                    <h3>Blood Group Stock Overview</h3>
                    <div class="section-subtitle">Available units across all connected blood banks</div>
                </div>
            </div>

            <div class="overview-grid">

                <div class="blood-group-item">
                    <div class="blood-group-top">
                        <div class="group-name">
                            <span class="group-badge">A+</span>
                            <span class="group-units">1,420 units</span>
                        </div>
                        <span class="stock-status healthy-text">● Healthy</span>
                    </div>
                    <div class="progress-track">
                        <span class="progress-fill bar-green" style="width:44.4%"></span>
                    </div>
                </div>

                <div class="blood-group-item">
                    <div class="blood-group-top">
                        <div class="group-name">
                            <span class="group-badge">A-</span>
                            <span class="group-units">340 units</span>
                        </div>
                        <span class="stock-status moderate-text">● Moderate</span>
                    </div>
                    <div class="progress-track">
                        <span class="progress-fill bar-yellow" style="width:10.6%"></span>
                    </div>
                </div>

                <div class="blood-group-item">
                    <div class="blood-group-top">
                        <div class="group-name">
                            <span class="group-badge">B+</span>
                            <span class="group-units">2,100 units</span>
                        </div>
                        <span class="stock-status healthy-text">● Healthy</span>
                    </div>
                    <div class="progress-track">
                        <span class="progress-fill bar-green" style="width:65.6%"></span>
                    </div>
                </div>

                <div class="blood-group-item">
                    <div class="blood-group-top">
                        <div class="group-name">
                            <span class="group-badge">B-</span>
                            <span class="group-units">180 units</span>
                        </div>
                        <span class="stock-status low-text">● Low</span>
                    </div>
                    <div class="progress-track">
                        <span class="progress-fill bar-orange" style="width:5.6%"></span>
                    </div>
                </div>

                <div class="blood-group-item">
                    <div class="blood-group-top">
                        <div class="group-name">
                            <span class="group-badge">O+</span>
                            <span class="group-units">3,200 units</span>
                        </div>
                        <span class="stock-status healthy-text">● Healthy</span>
                    </div>
                    <div class="progress-track">
                        <span class="progress-fill bar-green" style="width:100%"></span>
                    </div>
                </div>

                <div class="blood-group-item">
                    <div class="blood-group-top">
                        <div class="group-name">
                            <span class="group-badge">O-</span>
                            <span class="group-units">110 units</span>
                        </div>
                        <span class="stock-status low-text">● Low</span>
                    </div>
                    <div class="progress-track">
                        <span class="progress-fill bar-orange" style="width:3.4%"></span>
                    </div>
                </div>

                <div class="blood-group-item">
                    <div class="blood-group-top">
                        <div class="group-name">
                            <span class="group-badge">AB+</span>
                            <span class="group-units">860 units</span>
                        </div>
                        <span class="stock-status healthy-text">● Healthy</span>
                    </div>
                    <div class="progress-track">
                        <span class="progress-fill bar-green" style="width:26.9%"></span>
                    </div>
                </div>

                <div class="blood-group-item">
                    <div class="blood-group-top">
                        <div class="group-name">
                            <span class="group-badge table-group-critical">AB-</span>
                            <span class="group-units">86 units</span>
                        </div>
                        <span class="stock-status critical-text">⚠ Critical</span>
                    </div>
                    <div class="progress-track">
                        <span class="progress-fill bar-red" style="width:2.7%"></span>
                    </div>
                </div>

            </div>
        </div>

        <!-- STOCK UPDATE PANEL -->
        <asp:Panel ID="pnlUpdateStock" runat="server"
            CssClass="modal-panel" Visible="false">

            <h3>Update Blood Stock</h3>

            <div class="edit-grid">

                <div>
                    <label class="field-label">Blood Bank</label>
                    <asp:DropDownList ID="ddlEditBank" runat="server" CssClass="form-control">
                        <asp:ListItem Text="City Blood Bank" Value="City Blood Bank" />
                        <asp:ListItem Text="Hope Blood Center" Value="Hope Blood Center" />
                        <asp:ListItem Text="Civil Hospital Blood Bank" Value="Civil Hospital Blood Bank" />
                        <asp:ListItem Text="Red Cross Society" Value="Red Cross Society" />
                    </asp:DropDownList>
                </div>

                <div>
                    <label class="field-label">Blood Group</label>
                    <asp:DropDownList ID="ddlEditGroup" runat="server" CssClass="form-control">
                        <asp:ListItem Text="A+" Value="A+" />
                        <asp:ListItem Text="A-" Value="A-" />
                        <asp:ListItem Text="B+" Value="B+" />
                        <asp:ListItem Text="B-" Value="B-" />
                        <asp:ListItem Text="O+" Value="O+" />
                        <asp:ListItem Text="O-" Value="O-" />
                        <asp:ListItem Text="AB+" Value="AB+" />
                        <asp:ListItem Text="AB-" Value="AB-" />
                    </asp:DropDownList>
                </div>

                <div>
                    <label class="field-label">Available Units</label>
                    <asp:TextBox ID="txtAvailableUnits" runat="server"
                        CssClass="form-control" TextMode="Number" />
                </div>

                <div>
                    <label class="field-label">Reserved Units</label>
                    <asp:TextBox ID="txtReservedUnits" runat="server"
                        CssClass="form-control" TextMode="Number" />
                </div>

            </div>

            <div class="form-actions">
                <asp:Button ID="btnSaveStock" runat="server"
                    Text="Save Stock"
                    CssClass="btn-save"
                    OnClick="btnSaveStock_Click" />

                <asp:Button ID="btnCancelStock" runat="server"
                    Text="Cancel"
                    CssClass="btn-cancel"
                    CausesValidation="false"
                    OnClick="btnCancelStock_Click" />
            </div>

            <asp:Label ID="lblStockMessage" runat="server" CssClass="message" />

        </asp:Panel>

        <!-- DETAILED INVENTORY -->
        <div class="content-card">

            <div class="section-heading">
                <div>
                    <h3>Detailed Blood Inventory</h3>
                    <div class="section-subtitle">Blood bank-wise stock availability and status</div>
                </div>
                <asp:Label ID="lblInventoryCount" runat="server"
                    CssClass="status-badge status-healthy" />
            </div>

            <!-- SEARCH AND FILTERS -->
            <div class="filter-row">

                <asp:TextBox ID="txtInventorySearch" runat="server"
                    CssClass="form-control"
                    placeholder="Search blood group, blood bank..."
                    AutoPostBack="true"
                    OnTextChanged="InventoryFilter_Changed" />

                <asp:DropDownList ID="ddlFilterGroup" runat="server"
                    CssClass="form-control"
                    AutoPostBack="true"
                    OnSelectedIndexChanged="InventoryFilter_Changed">
                    <asp:ListItem Text="All Blood Groups" Value="" />
                    <asp:ListItem Text="A+" Value="A+" />
                    <asp:ListItem Text="A-" Value="A-" />
                    <asp:ListItem Text="B+" Value="B+" />
                    <asp:ListItem Text="B-" Value="B-" />
                    <asp:ListItem Text="O+" Value="O+" />
                    <asp:ListItem Text="O-" Value="O-" />
                    <asp:ListItem Text="AB+" Value="AB+" />
                    <asp:ListItem Text="AB-" Value="AB-" />
                </asp:DropDownList>

                <asp:DropDownList ID="ddlFilterStatus" runat="server"
                    CssClass="form-control"
                    AutoPostBack="true"
                    OnSelectedIndexChanged="InventoryFilter_Changed">
                    <asp:ListItem Text="All Stock Statuses" Value="" />
                    <asp:ListItem Text="Healthy" Value="Healthy" />
                    <asp:ListItem Text="Moderate" Value="Moderate" />
                    <asp:ListItem Text="Low" Value="Low" />
                    <asp:ListItem Text="Critical" Value="Critical" />
                </asp:DropDownList>

                <asp:LinkButton ID="lnkClearInventoryFilters" runat="server"
                    CssClass="clear-link"
                    CausesValidation="false"
                    OnClick="lnkClearInventoryFilters_Click">Clear Filters</asp:LinkButton>

            </div>

            <div class="table-scroll">

                <asp:GridView ID="gvInventory" runat="server"
                    AutoGenerateColumns="False"
                    CssClass="inventory-table"
                    GridLines="None"
                    DataKeyNames="InventoryID"
                    OnRowDataBound="gvInventory_RowDataBound"
                    OnRowCommand="gvInventory_RowCommand">

                    <Columns>

                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkInventory" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="GROUP">
                            <ItemTemplate>
                                <asp:Label ID="lblGroup" runat="server"
                                    Text='<%# Eval("BloodGroup") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="BLOOD BANK &amp; LOCATION">
                            <ItemTemplate>
                                <span class="bank-name">
                                    <%# System.Web.HttpUtility.HtmlEncode(Convert.ToString(Eval("BloodBank"))) %>
                                </span>
                                <span class="bank-location">
                                    📍 <%# System.Web.HttpUtility.HtmlEncode(Convert.ToString(Eval("Location"))) %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="AVAILABLE">
                            <ItemTemplate>
                                <asp:Label ID="lblAvailable" runat="server"
                                    Text='<%# Eval("Available") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="Reserved" HeaderText="RESERVED" />

                        <asp:TemplateField HeaderText="STATUS">
                            <ItemTemplate>
                                <asp:Label ID="lblStockStatus" runat="server"
                                    Text='<%# Eval("Status") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="LastUpdated"
                            HeaderText="LAST UPDATED"
                            DataFormatString="{0:dd MMM yyyy}" />

                        <asp:TemplateField HeaderText="ACTION">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEditStock" runat="server"
                                    Text="Edit Stock"
                                    CssClass="action-link"
                                    CommandName="EditStock"
                                    CommandArgument='<%# Eval("InventoryID") %>'
                                    CausesValidation="false" />
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>

                    <EmptyDataTemplate>
                        <div class="empty-message">
                            No inventory records match your filters.
                        </div>
                    </EmptyDataTemplate>

                </asp:GridView>

            </div>

            <asp:Label ID="lblInventoryMessage" runat="server" CssClass="message" />

        </div>

    </div>

</asp:Content>
