
<%@ Page Title="Admin Dashboard - BloodConnect" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_Dashboard.aspx.cs" Inherits="BloodConnect.Admin_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Admin Dashboard - BloodConnect
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
<style>
.dashboard-page {
    --admin-purple: #7354AD;
    --admin-purple-light: #EEECFA;
    --admin-text: #192033;
    --admin-muted: #777E91;
    --admin-border: #E8E7F0;
    color: var(--admin-text);
    font-family: Arial, Helvetica, sans-serif;
}

.dashboard-page * { box-sizing: border-box; }

.dashboard-page .welcome-section {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 16px;
    flex-wrap: wrap;
    margin-bottom: 26px;
}

.dashboard-page .welcome-title {
    margin: 0 0 8px;
    font-size: 27px;
    font-weight: 700;
    color: #20243A;
}

.dashboard-page .welcome-description {
    margin: 0;
    color: var(--admin-muted);
    font-size: 14px;
    line-height: 1.6;
}

.dashboard-page .date-label {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    background: #FFFFFF;
    border: 1px solid var(--admin-border);
    border-radius: 10px;
    padding: 11px 14px;
    color: #555C70;
    font-size: 13px;
}

.dashboard-page .dashboard-grid {
    display: grid;
    grid-template-columns: repeat(4, minmax(0, 1fr));
    gap: 18px;
    margin-bottom: 24px;
}

.dashboard-page .stat-card {
    min-width: 0;
    background: #FFFFFF;
    border: 1px solid var(--admin-border);
    border-radius: 15px;
    padding: 20px;
    box-shadow: 0 3px 12px rgba(37,30,74,.025);
}

.dashboard-page .emergency-stat { border-color: #F0B7BC; }

.dashboard-page .stat-top {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 8px;
    margin-bottom: 18px;
}

.dashboard-page .stat-label {
    color: #737A8D;
    font-size: 11px;
    font-weight: 700;
    letter-spacing: .65px;
    line-height: 1.5;
}

.dashboard-page .stat-icon {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 41px;
    height: 41px;
    flex-shrink: 0;
    border-radius: 12px;
    background: var(--admin-purple-light);
    color: var(--admin-purple);
    font-size: 17px;
}

.dashboard-page .emergency-stat .stat-icon {
    background: #FFF0F1;
    color: #D92D3A;
}

.dashboard-page .stat-bottom {
    display: flex;
    justify-content: space-between;
    align-items: flex-end;
    gap: 8px;
    flex-wrap: wrap;
}

.dashboard-page .stat-number {
    color: #20243A;
    font-size: clamp(23px,2vw,30px);
    line-height: 1.2;
    font-weight: 700;
}

.dashboard-page .growth {
    display: inline-flex;
    align-items: center;
    gap: 4px;
    font-size: 12px;
    font-weight: 700;
    white-space: nowrap;
}

.dashboard-page .growth-positive { color: #159947; }
.dashboard-page .growth-emergency { color: #D92D3A; }

.dashboard-page .dashboard-row {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 22px;
    margin-bottom: 24px;
    align-items: stretch;
}

.dashboard-page .panel {
    min-width: 0;
    background: #FFFFFF;
    border: 1px solid var(--admin-border);
    border-radius: 15px;
    padding: 22px;
    box-shadow: 0 3px 12px rgba(37,30,74,.025);
}

.dashboard-page .panel-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 12px;
    margin-bottom: 22px;
}

.dashboard-page .panel-title {
    display: flex;
    align-items: center;
    gap: 10px;
    margin: 0;
    color: #24283D;
    font-size: 16px;
    font-weight: 700;
}

.dashboard-page .panel-title-icon {
    color: var(--admin-purple);
    font-size: 16px;
}

.dashboard-page .panel-action {
    display: inline-flex;
    align-items: center;
    gap: 7px;
    padding: 0;
    border: 0;
    background: transparent;
    color: var(--admin-purple);
    text-decoration: none;
    font-size: 12px;
    font-weight: 700;
    white-space: nowrap;
    cursor: pointer;
}

.dashboard-page .panel-action:hover {
    color: #52368A;
    text-decoration: underline;
}

.dashboard-page .inventory-list {
    display: flex;
    flex-direction: column;
    gap: 22px;
}

.dashboard-page .inventory-item { min-width: 0; }

.dashboard-page .inventory-item-top {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 10px;
    margin-bottom: 10px;
}

.dashboard-page .blood-group-info {
    display: flex;
    align-items: center;
    gap: 11px;
    min-width: 0;
}

.dashboard-page .blood-group-badge {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 40px;
    height: 40px;
    flex-shrink: 0;
    border-radius: 11px;
    background: #EEECFA;
    color: var(--admin-purple);
    font-size: 13px;
    font-weight: 700;
}

.dashboard-page .blood-group-badge.critical {
    background: #FFF0F1;
    color: #D92D3A;
}

.dashboard-page .blood-group-badge.moderate {
    background: #FFF6E8;
    color: #C47A10;
}

.dashboard-page .inventory-name {
    margin-bottom: 4px;
    color: #282C40;
    font-size: 13px;
    font-weight: 700;
}

.dashboard-page .inventory-units {
    color: var(--admin-muted);
    font-size: 11px;
}

.dashboard-page .inventory-percentage {
    color: #34384D;
    font-size: 13px;
    font-weight: 700;
    white-space: nowrap;
}

.dashboard-page .progress-track {
    height: 7px;
    width: 100%;
    overflow: hidden;
    border-radius: 20px;
    background: #F0EFF5;
}

.dashboard-page .progress-fill {
    display: block;
    height: 100%;
    border-radius: 20px;
}

.dashboard-page .progress-healthy { background: #24A568; }
.dashboard-page .progress-critical { background: #E04452; }
.dashboard-page .progress-moderate { background: #E7A23B; }

.dashboard-page .table-panel {
    padding: 0;
    overflow: hidden;
}

.dashboard-page .table-panel .panel-header {
    padding: 22px 22px 18px;
    margin: 0;
}

.dashboard-page .table-responsive {
    width: 100%;
    overflow-x: auto;
}

.dashboard-page .dashboard-table {
    width: 100%;
    min-width: 450px;
    border-collapse: collapse;
    text-align: left;
}

.dashboard-page .dashboard-table thead { background: #F8F7FC; }

.dashboard-page .dashboard-table th {
    padding: 13px 15px;
    color: #85899A;
    font-size: 10px;
    font-weight: 700;
    letter-spacing: .55px;
    text-transform: uppercase;
    white-space: nowrap;
    border-top: 1px solid #F0EFF5;
    border-bottom: 1px solid #F0EFF5;
}

.dashboard-page .dashboard-table td {
    padding: 16px 15px;
    color: #555B6E;
    font-size: 12px;
    vertical-align: middle;
    border-bottom: 1px solid #F0EFF5;
}

.dashboard-page .dashboard-table tbody tr:last-child td {
    border-bottom: 0;
}

.dashboard-page .request-id {
    display: block;
    margin-bottom: 5px;
    color: #292D42;
    font-size: 12px;
    font-weight: 700;
    white-space: nowrap;
}

.dashboard-page .request-details {
    color: #85899A;
    font-size: 11px;
    white-space: nowrap;
}

.dashboard-page .location-name {
    display: block;
    color: #383D51;
    font-weight: 600;
    white-space: nowrap;
}

.dashboard-page .location-area {
    display: block;
    margin-top: 4px;
    color: #85899A;
    font-size: 11px;
    white-space: nowrap;
}

.dashboard-page .status-badge {
    display: inline-flex;
    align-items: center;
    gap: 5px;
    padding: 6px 9px;
    border-radius: 7px;
    font-size: 10px;
    font-weight: 700;
    white-space: nowrap;
}

.dashboard-page .status-critical {
    background: #FFF0F1;
    color: #D92D3A;
}

.dashboard-page .status-high,
.dashboard-page .status-pending {
    background: #FFF4E5;
    color: #B96A0C;
}

.dashboard-page .status-verified {
    background: #E9F8EF;
    color: #168447;
}

.dashboard-page .action-link {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 30px;
    height: 30px;
    border: 1px solid #EAE8F2;
    border-radius: 8px;
    background: #FFFFFF;
    color: var(--admin-purple);
    text-decoration: none;
    cursor: pointer;
}

.dashboard-page .action-link:hover {
    background: var(--admin-purple-light);
}

.dashboard-page .user-cell {
    display: flex;
    align-items: center;
    gap: 10px;
    min-width: 150px;
}

.dashboard-page .user-avatar {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 36px;
    height: 36px;
    flex-shrink: 0;
    border-radius: 50%;
    background: #EEECFA;
    color: var(--admin-purple);
    font-size: 11px;
    font-weight: 700;
}

.dashboard-page .user-name {
    display: block;
    color: #292D42;
    font-size: 12px;
    font-weight: 700;
    white-space: nowrap;
}

.dashboard-page .user-email {
    display: block;
    margin-top: 4px;
    color: #85899A;
    font-size: 10px;
}

.dashboard-page .panel-footer {
    padding: 13px 22px;
    border-top: 1px solid #F0EFF5;
    color: #85899A;
    font-size: 11px;
}

.dashboard-page .panel-footer strong { color: #51576A; }

@media (max-width:1200px) {
    .dashboard-page .dashboard-grid {
        grid-template-columns: repeat(2, minmax(0, 1fr));
    }

    .dashboard-page .dashboard-row {
        grid-template-columns: minmax(0, 1fr);
    }
}

@media (max-width:576px) {
    .dashboard-page .welcome-title { font-size: 23px; }
    .dashboard-page .dashboard-grid { gap: 12px; }
    .dashboard-page .stat-card { padding: 14px; }

    .dashboard-page .stat-top {
        align-items: flex-start;
        flex-direction: column-reverse;
        margin-bottom: 13px;
    }

    .dashboard-page .stat-icon {
        width: 34px;
        height: 34px;
    }

    .dashboard-page .stat-number { font-size: 23px; }
    .dashboard-page .growth { font-size: 11px; }
    .dashboard-page .panel { padding: 16px; }
    .dashboard-page .table-panel { padding: 0; }

    .dashboard-page .table-panel .panel-header {
        padding: 17px 16px;
    }
}
</style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="PageHeading" runat="server">
    <span>Admin Dashboard</span>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="dashboard-page">

    <!-- WELCOME SECTION -->
    <section class="welcome-section">
        <div>
            <h1 class="welcome-title">Good morning, Admin</h1>
            <p class="welcome-description">
                Here is the overview of the BloodConnect network for August 2026.
            </p>
        </div>

        <div class="date-label">
            <i class="fa-regular fa-calendar"></i>
            <span>August 2026</span>
        </div>
    </section>

    <!-- KPI CARDS -->
    <section class="dashboard-grid">

        <div class="stat-card">
            <div class="stat-top">
                <span class="stat-label">TOTAL USERS</span>
                <span class="stat-icon"><i class="fa-solid fa-users"></i></span>
            </div>
            <div class="stat-bottom">
                <div class="stat-number">12,480</div>
                <div class="growth growth-positive">
                    <i class="fa-solid fa-arrow-trend-up"></i> +8.4%
                </div>
            </div>
        </div>

        <div class="stat-card">
            <div class="stat-top">
                <span class="stat-label">ACTIVE DONORS</span>
                <span class="stat-icon"><i class="fa-solid fa-heart-pulse"></i></span>
            </div>
            <div class="stat-bottom">
                <div class="stat-number">4,826</div>
                <div class="growth growth-positive">
                    <i class="fa-solid fa-arrow-trend-up"></i> +6.2%
                </div>
            </div>
        </div>

        <div class="stat-card">
            <div class="stat-top">
                <span class="stat-label">BLOOD REQUESTS</span>
                <span class="stat-icon"><i class="fa-solid fa-clipboard-list"></i></span>
            </div>
            <div class="stat-bottom">
                <div class="stat-number">1,248</div>
                <div class="growth growth-positive">
                    <i class="fa-solid fa-arrow-trend-up"></i> +12.5%
                </div>
            </div>
        </div>

        <div class="stat-card emergency-stat">
            <div class="stat-top">
                <span class="stat-label">EMERGENCY REQ.</span>
                <span class="stat-icon"><i class="fa-solid fa-triangle-exclamation"></i></span>
            </div>
            <div class="stat-bottom">
                <div class="stat-number">86</div>
                <div class="growth growth-emergency">
                    <i class="fa-solid fa-arrow-trend-up"></i> +4.1%
                </div>
            </div>
        </div>

    </section>

    <!-- INVENTORY STATUS AND RECENT REGISTRATIONS -->
    <section class="dashboard-row">

        <!-- INVENTORY STATUS -->
        <div class="panel">
            <div class="panel-header">
                <h2 class="panel-title">
                    <i class="fa-solid fa-boxes-stacked panel-title-icon"></i>
                    Inventory Status
                </h2>

                <a href="Admin_Inventory.aspx" class="panel-action">
                    View All <i class="fa-solid fa-arrow-right"></i>
                </a>
            </div>

            <div class="inventory-list">

                <div class="inventory-item">
                    <div class="inventory-item-top">
                        <div class="blood-group-info">
                            <div class="blood-group-badge">A+</div>
                            <div>
                                <div class="inventory-name">Healthy</div>
                                <div class="inventory-units">450 units</div>
                            </div>
                        </div>
                        <span class="inventory-percentage">85%</span>
                    </div>
                    <div class="progress-track">
                        <span class="progress-fill progress-healthy" style="width:85%;"></span>
                    </div>
                </div>

                <div class="inventory-item">
                    <div class="inventory-item-top">
                        <div class="blood-group-info">
                            <div class="blood-group-badge critical">O-</div>
                            <div>
                                <div class="inventory-name" style="color:#D92D3A;">Critical</div>
                                <div class="inventory-units">12 units</div>
                            </div>
                        </div>
                        <span class="inventory-percentage" style="color:#D92D3A;">15%</span>
                    </div>
                    <div class="progress-track">
                        <span class="progress-fill progress-critical" style="width:15%;"></span>
                    </div>
                </div>

                <div class="inventory-item">
                    <div class="inventory-item-top">
                        <div class="blood-group-info">
                            <div class="blood-group-badge moderate">B+</div>
                            <div>
                                <div class="inventory-name">Moderate</div>
                                <div class="inventory-units">180 units</div>
                            </div>
                        </div>
                        <span class="inventory-percentage">60%</span>
                    </div>
                    <div class="progress-track">
                        <span class="progress-fill progress-moderate" style="width:60%;"></span>
                    </div>
                </div>

                <div class="inventory-item">
                    <div class="inventory-item-top">
                        <div class="blood-group-info">
                            <div class="blood-group-badge">AB+</div>
                            <div>
                                <div class="inventory-name">Healthy</div>
                                <div class="inventory-units">210 units</div>
                            </div>
                        </div>
                        <span class="inventory-percentage">75%</span>
                    </div>
                    <div class="progress-track">
                        <span class="progress-fill progress-healthy" style="width:75%;"></span>
                    </div>
                </div>

            </div>
        </div>

        <!-- RECENT REGISTRATIONS -->
        <div class="panel table-panel">
            <div class="panel-header">
                <h2 class="panel-title">
                    <i class="fa-solid fa-user-plus panel-title-icon"></i>
                    Recent Registrations
                </h2>

                <a href="Admin_Users.aspx" class="panel-action">
                    View Directory <i class="fa-solid fa-arrow-right"></i>
                </a>
            </div>

            <div class="table-responsive">
                <table class="dashboard-table">
                    <thead>
                        <tr>
                            <th>USER</th>
                            <th>ROLE / GROUP</th>
                            <th>STATUS</th>
                            <th>ACTION</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td>
                                <div class="user-cell">
                                    <div class="user-avatar">JS</div>
                                    <div>
                                        <span class="user-name">John Smith</span>
                                        <span class="user-email">Recent member</span>
                                    </div>
                                </div>
                            </td>
                            <td><span class="location-name">Donor B+</span></td>
                            <td>
                                <span class="status-badge status-pending">Pending</span>
                            </td>
                            <td>
                                <a href="Admin_Users.aspx" class="action-link"
                                   title="View user" aria-label="View John Smith">
                                    <i class="fa-solid fa-ellipsis-vertical"></i>
                                </a>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <div class="user-cell">
                                    <div class="user-avatar">EL</div>
                                    <div>
                                        <span class="user-name">Emma Lawson</span>
                                        <span class="user-email">Recent member</span>
                                    </div>
                                </div>
                            </td>
                            <td><span class="location-name">Seeker N/A</span></td>
                            <td>
                                <span class="status-badge status-verified">
                                    <i class="fa-solid fa-check"></i> Verified
                                </span>
                            </td>
                            <td>
                                <a href="Admin_Users.aspx" class="action-link"
                                   title="View user" aria-label="View Emma Lawson">
                                    <i class="fa-solid fa-ellipsis-vertical"></i>
                                </a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="panel-footer">
                Showing <strong>2</strong> recent registrations
            </div>
        </div>

    </section>

    <!-- EMERGENCY REQUESTS -->
    <section class="dashboard-row">

        <div class="panel table-panel">
            <div class="panel-header">
                <h2 class="panel-title">
                    <i class="fa-solid fa-triangle-exclamation panel-title-icon"
                       style="color:#D92D3A;"></i>
                    Emergency Requests
                </h2>

                <a href="Admin_Requests.aspx" class="panel-action">
                    Manage All <i class="fa-solid fa-arrow-right"></i>
                </a>
            </div>

            <div class="table-responsive">
                <table class="dashboard-table">
                    <thead>
                        <tr>
                            <th>ID / GROUP</th>
                            <th>LOCATION</th>
                            <th>STATUS</th>
                            <th>ACTION</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td>
                                <span class="request-id">REQ-992</span>
                                <span class="request-details">O- &bull; 4 Units</span>
                            </td>
                            <td>
                                <span class="location-name">City Hospital</span>
                                <span class="location-area">Downtown</span>
                            </td>
                            <td>
                                <span class="status-badge status-critical">
                                    <i class="fa-solid fa-circle-exclamation"></i> Critical
                                </span>
                            </td>
                            <td>
                                <a href="Admin_Requests.aspx" class="action-link"
                                   title="View request" aria-label="View REQ-992">
                                    <i class="fa-solid fa-arrow-right"></i>
                                </a>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <span class="request-id">REQ-991</span>
                                <span class="request-details">A+ &bull; 2 Units</span>
                            </td>
                            <td>
                                <span class="location-name">Mercy Clinic</span>
                                <span class="location-area">Westside</span>
                            </td>
                            <td>
                                <span class="status-badge status-high">
                                    <i class="fa-solid fa-clock"></i> High
                                </span>
                            </td>
                            <td>
                                <a href="Admin_Requests.aspx" class="action-link"
                                   title="View request" aria-label="View REQ-991">
                                    <i class="fa-solid fa-arrow-right"></i>
                                </a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="panel-footer">
                Showing <strong>2</strong> emergency requests
            </div>
        </div>

    </section>

</div>

</asp:Content>
