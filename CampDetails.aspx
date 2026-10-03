<%@ Page Title="Camp Details" Language="C#" MasterPageFile="~/Donor.Master"
    AutoEventWireup="true"
    CodeBehind="CampDetails.aspx.cs"
    Inherits="WebApplication1.CampDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        .camp-page {
            padding-bottom: 40px;
        }

        .page-heading {
            margin-bottom: 22px;
        }

        .page-heading h2 {
            margin: 0;
            color: #202338;
            font-size: 28px;
        }

        .page-heading p {
            margin-top: 7px;
            color: #6B7280;
            font-size: 14px;
        }

        /* HERO */

        .camp-hero {
            background: white;
            border: 1px solid #E5E7EB;
            border-radius: 18px;
            padding: 24px;
            box-shadow: 0 5px 18px rgba(0,0,0,0.04);
            margin-bottom: 22px;
        }

        .hero-grid {
            display: grid;
            grid-template-columns: 1.5fr 1fr;
            gap: 24px;
        }

        .camp-image {
            height: 280px;
            border-radius: 15px;
            overflow: hidden;
            position: relative;
            background: #eee;
        }

        .camp-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .image-badges {
            position: absolute;
            top: 16px;
            left: 16px;
            display: flex;
            gap: 8px;
        }

        .red-badge,
        .green-badge {
            padding: 7px 13px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 700;
        }

        .red-badge {
            background: #D80032;
            color: white;
        }

        .green-badge {
            background: #10B981;
            color: white;
        }

        .hero-info {
            padding: 10px 5px;
        }

        .hero-info h1 {
            margin: 8px 0 8px;
            font-size: 30px;
            color: #202338;
        }

        .organizer {
            color: #6B7280;
            margin-bottom: 18px;
            font-size: 14px;
        }

        .verified {
            color: #10B981;
            font-weight: bold;
        }

        .hero-buttons {
            display: flex;
            gap: 10px;
            margin-top: 20px;
        }

        .book-btn {
            background: #D80032;
            color: white;
            border: none;
            border-radius: 9px;
            padding: 12px 20px;
            text-decoration: none;
            font-weight: 600;
            cursor: pointer;
        }

        .share-btn {
            background: white;
            color: #202338;
            border: 1px solid #D1D5DB;
            border-radius: 9px;
            padding: 12px 20px;
            font-weight: 600;
            cursor: pointer;
        }

        /* QUICK SUMMARY */

        .summary-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 14px;
            margin-top: 20px;
        }

        .summary-card {
            background: #F8F9FA;
            border: 1px solid #E5E7EB;
            border-radius: 12px;
            padding: 17px;
        }

        .summary-title {
            font-size: 11px;
            font-weight: 700;
            color: #9CA3AF;
            letter-spacing: .5px;
            margin-bottom: 10px;
        }

        .summary-value {
            font-size: 15px;
            color: #202338;
            font-weight: 600;
            line-height: 1.8;
        }

        /* MAIN GRID */

        .main-grid {
            display: grid;
            grid-template-columns: 1.4fr .8fr;
            gap: 20px;
            margin-bottom: 20px;
        }

        .card {
            background: white;
            border: 1px solid #E5E7EB;
            border-radius: 16px;
            padding: 23px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.035);
        }

        .card h3 {
            margin: 0 0 15px;
            color: #202338;
            font-size: 18px;
        }

        .description {
            color: #6B7280;
            font-size: 14px;
            line-height: 1.8;
        }

        .organizer-box {
            margin-top: 20px;
            background: #F8F9FA;
            border-radius: 12px;
            padding: 16px;
        }

        .organizer-box strong {
            color: #202338;
        }

        .organizer-contact {
            margin-top: 9px;
            color: #6B7280;
            font-size: 13px;
            line-height: 1.8;
        }

        /* SLOTS */

        .progress-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 9px;
            font-size: 13px;
        }

        .progress-bar {
            height: 9px;
            background: #E5E7EB;
            border-radius: 20px;
            overflow: hidden;
            margin-bottom: 20px;
        }

        .progress-fill {
            width: 40%;
            height: 100%;
            background: #D80032;
        }

        .time-slot {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 14px;
            border-radius: 10px;
            background: #F8F9FA;
            margin-bottom: 10px;
            font-size: 13px;
        }

        .time-slot:first-of-type {
            background: #FFF1F2;
        }

        .slot-left {
            font-weight: 600;
            color: #202338;
        }

        .slot-right {
            color: #D80032;
            font-weight: 700;
        }

        /* BLOOD GROUPS */

        .blood-message {
            color: #6B7280;
            font-size: 13px;
            margin-bottom: 15px;
        }

        .blood-groups {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 9px;
        }

        .blood-group {
            background: #FFF1F2;
            color: #D80032;
            border: 1px solid #FECDD3;
            border-radius: 9px;
            padding: 10px;
            text-align: center;
            font-weight: 700;
            font-size: 13px;
        }

        /* LOCATION */

        .location-grid {
            display: grid;
            grid-template-columns: 1fr 1.1fr;
            gap: 20px;
            align-items: stretch;
        }

        .location-details {
            color: #6B7280;
            font-size: 14px;
            line-height: 1.9;
        }

        .location-details strong {
            color: #202338;
        }

        .location-buttons {
            margin-top: 15px;
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
        }

        .direction-btn {
            background: #D80032;
            color: white;
            padding: 10px 14px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
        }

        .maps-btn {
            background: white;
            border: 1px solid #D1D5DB;
            color: #202338;
            padding: 10px 14px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
        }

        .map-box {
            width: 100%;
            height: 250px;
            border-radius: 12px;
            overflow: hidden;
            border: 1px solid #E5E7EB;
        }

        .map-box iframe {
            width: 100%;
            height: 100%;
            border: 0;
        }

        /* SCHEDULE */

        .timeline {
            position: relative;
            margin-top: 15px;
        }

        .timeline-item {
            display: flex;
            gap: 15px;
            margin-bottom: 18px;
            position: relative;
        }

        .timeline-dot {
            width: 12px;
            height: 12px;
            min-width: 12px;
            border-radius: 50%;
            background: #D1D5DB;
            margin-top: 4px;
        }

        .timeline-item:first-child .timeline-dot {
            background: #D80032;
        }

        .timeline-time {
            font-weight: 700;
            color: #202338;
            font-size: 13px;
        }

        .timeline-text {
            color: #6B7280;
            font-size: 13px;
            margin-top: 3px;
        }

        /* PREPARATION */

        .prep-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .prep-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .prep-list li {
            display: flex;
            gap: 10px;
            margin-bottom: 13px;
            color: #4B5563;
            font-size: 14px;
        }

        .check {
            color: #10B981;
            font-weight: bold;
        }

        .eligibility-btn {
            display: inline-block;
            margin-top: 8px;
            color: #D80032;
            font-weight: 600;
            text-decoration: none;
            font-size: 13px;
        }

        /* INFO */

        .important-info {
            margin-top: 20px;
            background: #EAEFFD;
            border: 1px solid #D9E2FF;
            border-radius: 12px;
            padding: 17px;
            color: #374151;
            font-size: 13px;
            line-height: 1.7;
        }

        .important-info strong {
            display: block;
            margin-bottom: 5px;
            color: #202338;
        }

        /* CTA */

        .cta {
            margin-top: 20px;
            background: #FFF1F2;
            border: 1px solid #FECDD3;
            border-radius: 16px;
            padding: 25px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
        }

        .cta h2 {
            margin: 0 0 7px;
            color: #202338;
            font-size: 22px;
        }

        .cta p {
            margin: 0;
            color: #6B7280;
            font-size: 13px;
        }

        .cta-btn {
            background: #D80032;
            color: white;
            padding: 13px 21px;
            border-radius: 9px;
            text-decoration: none;
            font-weight: 700;
            white-space: nowrap;
        }

        /* RESPONSIVE */

        @media (max-width: 900px) {

            .hero-grid,
            .main-grid,
            .location-grid,
            .prep-grid {
                grid-template-columns: 1fr;
            }

            .camp-image {
                height: 230px;
            }

            .cta {
                flex-direction: column;
                align-items: flex-start;
            }
        }

        @media (max-width: 550px) {

            .summary-grid {
                grid-template-columns: 1fr;
            }

            .blood-groups {
                grid-template-columns: repeat(2, 1fr);
            }

            .hero-info h1 {
                font-size: 24px;
            }
        }

    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="camp-page">

        <!-- PAGE HEADER -->

        <div class="page-heading">
            <h2>Camp Details</h2>
            <p>View complete information about this blood donation camp.</p>
        </div>


        <!-- HERO -->

        <div class="camp-hero">

            <div class="hero-grid">

                <div class="camp-image">

                    <img src="https://images.unsplash.com/photo-1615461066841-6116e61058f4?auto=format&fit=crop&w=1200&q=80"
                         alt="Blood Donation Camp" />

                    <div class="image-badges">
                        <span class="red-badge">BLOOD DONATION CAMP</span>
                        <span class="green-badge">OPEN</span>
                    </div>

                </div>


                <div class="hero-info">

                    <h1>Save Life Blood Drive</h1>

                    <div class="organizer">
                        Organized by
                        <strong>BloodConnect Foundation</strong>
                        <span class="verified">✓ Verified</span>
                    </div>

                    <div class="summary-grid">

                        <div class="summary-card">
                            <div class="summary-title">SCHEDULE</div>

                            <div class="summary-value">
                                📅 16 Aug 2026<br />
                                🕒 9:00 AM - 4:00 PM
                            </div>
                        </div>

                        <div class="summary-card">
                            <div class="summary-title">LOCATION SUMMARY</div>

                            <div class="summary-value">
                                📍 2.4 km away<br />
                                🎟️ 18 slots left
                            </div>
                        </div>

                    </div>


                    <div class="hero-buttons">

                        <asp:Button
                            ID="btnBookTop"
                            runat="server"
                            Text="Book Donation Slot"
                            CssClass="book-btn"
                            OnClick="btnBookTop_Click" />

                        <asp:Button
                            ID="btnShare"
                            runat="server"
                            Text="↗ Share"
                            CssClass="share-btn"
                            OnClick="btnShare_Click" />

                    </div>

                    <asp:Label
                        ID="lblMessage"
                        runat="server"
                        style="display:block;margin-top:12px;color:#15803D;font-size:13px;">
                    </asp:Label>

                </div>

            </div>

        </div>


        <!-- ABOUT + AVAILABLE SLOTS -->

        <div class="main-grid">

            <div class="card">

                <h3>About This Camp</h3>

                <p class="description">
                    Join us for our monthly community blood drive. Your single donation
                    can save up to three lives. We are focusing on replenishing local
                    hospital supplies ahead of the upcoming holiday season. The event
                    features comfortable resting areas, complimentary refreshments,
                    and a team of certified phlebotomists ensuring a safe and smooth experience.
                </p>


                <div class="organizer-box">

                    <strong>Organized By</strong><br />

                    <span class="verified">
                        BloodConnect Foundation ✓
                    </span>

                    <div class="organizer-contact">
                        📞 +91 98765 43210<br />
                        ✉️ contact@bloodconnect.org
                    </div>

                </div>

            </div>


            <div class="card">

                <h3>Available Slots</h3>

                <div class="progress-header">
                    <span>Slots Filled</span>
                    <strong>12 / 30</strong>
                </div>

                <div class="progress-bar">
                    <div class="progress-fill"></div>
                </div>


                <div class="time-slot">

                    <div class="slot-left">
                        ☀️ Morning<br />
                        <small>9 AM - 12 PM</small>
                    </div>

                    <div class="slot-right">
                        4 Left
                    </div>

                </div>


                <div class="time-slot">

                    <div class="slot-left">
                        🌤️ Afternoon<br />
                        <small>1 PM - 4 PM</small>
                    </div>

                    <div class="slot-right">
                        14 Left
                    </div>

                </div>

            </div>

        </div>


        <!-- ACCEPTED BLOOD GROUPS -->

        <div class="card" style="margin-bottom:20px;">

            <h3>Accepted Blood Groups</h3>

            <div class="blood-message">
                All blood types are currently needed for this drive.
            </div>

            <div class="blood-groups">

                <div class="blood-group">A+</div>
                <div class="blood-group">A-</div>
                <div class="blood-group">B+</div>
                <div class="blood-group">B-</div>
                <div class="blood-group">O+</div>
                <div class="blood-group">O-</div>
                <div class="blood-group">AB+</div>
                <div class="blood-group">AB-</div>

            </div>

        </div>


        <!-- LOCATION -->

        <div class="card" style="margin-bottom:20px;">

            <h3>Camp Location</h3>

            <div class="location-grid">

                <div class="location-details">

                    <strong>📍 Community Hall</strong><br />
                    Near Central Park,<br />
                    Ahmedabad, Gujarat 380001

                    <br /><br />

                    🚗 Approx. 8 min drive

                    <div class="location-buttons">

                        <a href="https://www.openstreetmap.org/directions?from=&to=23.0225%2C72.5714"
                           target="_blank"
                           class="direction-btn">
                            Get Directions
                        </a>

                        <a href="https://www.openstreetmap.org/?mlat=23.0225&mlon=72.5714#map=16/23.0225/72.5714"
                           target="_blank"
                           class="maps-btn">
                            Open in Maps
                        </a>

                    </div>

                </div>


                <div class="map-box">

                    <iframe
                        src="https://www.openstreetmap.org/export/embed.html?bbox=72.52%2C23.00%2C72.65%2C23.10&amp;layer=mapnik&amp;marker=23.0225%2C72.5714"
                        loading="lazy">
                    </iframe>

                </div>

            </div>

        </div>


        <!-- CAMP SCHEDULE -->

        <div class="card" style="margin-bottom:20px;">

            <h3>Camp Schedule</h3>

            <div class="timeline">

                <div class="timeline-item">
                    <div class="timeline-dot"></div>
                    <div>
                        <div class="timeline-time">9:00 AM</div>
                        <div class="timeline-text">Registration Opens</div>
                    </div>
                </div>

                <div class="timeline-item">
                    <div class="timeline-dot"></div>
                    <div>
                        <div class="timeline-time">9:30 AM</div>
                        <div class="timeline-text">First Donation Slot</div>
                    </div>
                </div>

                <div class="timeline-item">
                    <div class="timeline-dot"></div>
                    <div>
                        <div class="timeline-time">1:00 PM</div>
                        <div class="timeline-text">Staff Lunch Break (30m)</div>
                    </div>
                </div>

                <div class="timeline-item">
                    <div class="timeline-dot"></div>
                    <div>
                        <div class="timeline-time">3:30 PM</div>
                        <div class="timeline-text">Last Registration</div>
                    </div>
                </div>

                <div class="timeline-item">
                    <div class="timeline-dot"></div>
                    <div>
                        <div class="timeline-time">4:00 PM</div>
                        <div class="timeline-text">Camp Closes</div>
                    </div>
                </div>

            </div>

        </div>


        <!-- PREPARATION -->

        <div class="card">

            <h3>Donation Preparation Guidelines</h3>

            <div class="prep-grid">

                <div>

                    <h4>What to Bring</h4>

                    <ul class="prep-list">

                        <li>
                            <span>🪪</span>
                            <span>Valid Photo ID</span>
                        </li>

                        <li>
                            <span>💧</span>
                            <span>Water Bottle</span>
                        </li>

                        <li>
                            <span>🥪</span>
                            <span>Light Snack</span>
                        </li>

                        <li>
                            <span>👕</span>
                            <span>Comfortable Clothes</span>
                        </li>

                    </ul>

                </div>


                <div>

                    <h4>Before You Donate</h4>

                    <ul class="prep-list">

                        <li>
                            <span class="check">✓</span>
                            <span>Eat a healthy, iron-rich meal.</span>
                        </li>

                        <li>
                            <span class="check">✓</span>
                            <span>Drink an extra 16 oz. of water.</span>
                        </li>

                        <li>
                            <span class="check">✓</span>
                            <span>Get a good night's sleep (at least 7-8 hours).</span>
                        </li>

                        <li>
                            <span class="check">✓</span>
                            <span>Avoid alcohol 24 hours prior.</span>
                        </li>

                    </ul>

                    <a href="Donation_Eligibility.aspx"
                       class="eligibility-btn">
                        Check Full Eligibility →
                    </a>

                </div>

            </div>


            <div class="important-info">

                <strong>Important Information</strong>

                All donors will undergo a brief, confidential health screening
                by qualified medical staff prior to donation. This includes checking
                temperature, blood pressure, pulse, and hemoglobin levels to ensure
                it is safe for you to donate today.

            </div>

        </div>


        <!-- CTA -->

        <div class="cta">

            <div>

                <h2>Ready to Donate?</h2>

                <p>
                    Secure your spot now. Pre-booking helps us manage resources
                    and reduces your wait time at the camp.
                </p>

            </div>


            <asp:Button
                ID="btnBookBottom"
                runat="server"
                Text="💖 Book Donation Slot Now"
                CssClass="cta-btn"
                OnClick="btnBookBottom_Click" />

        </div>

    </div>

</asp:Content>