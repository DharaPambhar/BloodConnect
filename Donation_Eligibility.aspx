<%@ Page Title="Donation Eligibility" Language="C#" MasterPageFile="~/Donor.Master"
    AutoEventWireup="true"
    CodeBehind="Donation_Eligibility.aspx.cs"
    Inherits="WebApplication1.Donation_Eligibility" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        .eligibility-page {
            max-width: 1150px;
            margin: auto;
        }

        /* PAGE HEADER */

        .page-heading {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 25px;
            gap: 20px;
        }

        .page-heading h1 {
            margin: 0 0 7px 0;
            color: #202338;
            font-size: 27px;
        }

        .page-heading p {
            margin: 0;
            color: #6B7280;
            font-size: 14px;
        }

        .guideline-button {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: white;
            color: #D80032;
            border: 1px solid #D80032;
            padding: 10px 17px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
            white-space: nowrap;
        }

        .guideline-button:hover {
            background: #FFF0F3;
            color: #D80032;
        }


        /* TOP CARDS */

        .top-grid {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 20px;
            margin-bottom: 25px;
        }

        .current-card {
    background: #F8F9FA;
    border: 1px solid #E5E7EB;
    border-radius: 15px;
    padding: 25px;
}
        .current-top {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-bottom: 25px;
        }

        .eligibility-icon {
            width: 55px;
            height: 55px;
            background: #10B981;
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 26px;
            font-weight: bold;
        }

        .current-top h2 {
            margin: 0 0 7px 0;
            color: #15803D;
            font-size: 20px;
        }

        .eligible-tag {
            display: inline-block;
            background: #D1FAE5;
            color: #15803D;
            padding: 5px 10px;
            border-radius: 15px;
            font-size: 10px;
            font-weight: bold;
            letter-spacing: 0.5px;
        }

        .date-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 15px;
        }

        .date-box {
            background: rgba(255,255,255,0.75);
            border: 1px solid #D1FAE5;
            border-radius: 10px;
            padding: 15px;
        }

        .date-label {
            display: block;
            color: #6B7280;
            font-size: 10px;
            font-weight: bold;
            margin-bottom: 7px;
        }

        .date-value {
            color: #202338;
            font-size: 14px;
            font-weight: bold;
        }

        .now-value {
            color: #15803D;
        }


        /* IMPACT */

        .impact-card {
            background: white;
            border: 1px solid #E5E7EB;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.03);
        }

        .impact-card h2 {
            margin: 0 0 18px 0;
            color: #202338;
            font-size: 17px;
        }

        .impact-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 0;
            border-bottom: 1px solid #F0F0F0;
        }

        .impact-item:last-of-type {
            border-bottom: none;
        }

        .impact-label {
            color: #6B7280;
            font-size: 12px;
        }

        .impact-value {
            color: #D80032;
            font-size: 19px;
            font-weight: bold;
        }

        .history-link {
            display: block;
            margin-top: 17px;
            color: #D80032;
            font-size: 12px;
            font-weight: bold;
            text-decoration: none;
        }

        .history-link:hover {
            text-decoration: underline;
        }


        /* MIDDLE GRID */

        .middle-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 25px;
        }

        .white-card {
            background: white;
            border: 1px solid #E5E7EB;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.03);
        }

        .white-card h2 {
            margin: 0 0 22px 0;
            color: #202338;
            font-size: 17px;
        }


        /* JOURNEY */

        .journey {
            position: relative;
        }

        .journey-item {
            display: flex;
            gap: 15px;
            position: relative;
            padding-bottom: 24px;
        }

        .journey-item:last-child {
            padding-bottom: 0;
        }

        .journey-item:not(:last-child)::after {
            content: "";
            position: absolute;
            left: 15px;
            top: 32px;
            width: 2px;
            height: 42px;
            background: #10B981;
        }

        .journey-icon {
            width: 32px;
            height: 32px;
            min-width: 32px;
            border-radius: 50%;
            background: #D1FAE5;
            color: #15803D;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 13px;
            font-weight: bold;
            z-index: 1;
        }

        .journey-icon.active {
            background: #10B981;
            color: white;
        }

        .journey-text strong {
            display: block;
            color: #202338;
            font-size: 12px;
            margin: 4px 0 5px 0;
        }

        .journey-text span {
            color: #6B7280;
            font-size: 11px;
        }


        /* CHECKLIST */

        .check-item {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 9px 0;
            color: #4B5563;
            font-size: 12px;
            border-bottom: 1px solid #F5F5F5;
        }

        .check-item:last-child {
            border-bottom: none;
        }

        .check-icon {
            width: 21px;
            height: 21px;
            border-radius: 50%;
            background: #D1FAE5;
            color: #15803D;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 11px;
            font-weight: bold;
        }


        /* CTA */

        .cta-card {
            background: linear-gradient(135deg, #FFF0F3, #FFFFFF);
            border: 1px solid #F5CDD6;
            border-radius: 15px;
            padding: 28px;
            text-align: center;
            margin-bottom: 25px;
        }

        .cta-icon {
            width: 55px;
            height: 55px;
            margin: auto;
            background: #FFE1E8;
            color: #D80032;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 25px;
        }

        .cta-card h2 {
            margin: 15px 0 8px 0;
            color: #202338;
            font-size: 20px;
        }

        .cta-card p {
            max-width: 700px;
            margin: 0 auto 20px auto;
            color: #6B7280;
            font-size: 13px;
            line-height: 1.6;
        }

        .cta-buttons {
            display: flex;
            justify-content: center;
            gap: 12px;
            flex-wrap: wrap;
        }

        .red-button {
            background: #D80032;
            color: white;
            padding: 11px 18px;
            border-radius: 7px;
            text-decoration: none;
            font-size: 12px;
            font-weight: bold;
        }

        .red-button:hover {
            background: #B8002B;
            color: white;
        }

        .blue-button {
            background: #EAEFFD;
            color: #374151;
            padding: 11px 18px;
            border-radius: 7px;
            text-decoration: none;
            font-size: 12px;
            font-weight: bold;
        }

        .blue-button:hover {
            background: #DDE4FA;
            color: #202338;
        }


        /* REQUIREMENTS */

        .section-title {
            margin-bottom: 18px;
        }

        .section-title h2 {
            margin: 0;
            color: #202338;
            font-size: 19px;
        }

        .requirements-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 15px;
            margin-bottom: 25px;
        }

        .requirement-card {
            background: white;
            border: 1px solid #E5E7EB;
            border-radius: 13px;
            padding: 20px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.02);
        }

        .requirement-icon {
            width: 40px;
            height: 40px;
            background: #FFF0F3;
            color: #D80032;
            border-radius: 9px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .requirement-card h3 {
            margin: 0 0 8px 0;
            color: #202338;
            font-size: 14px;
        }

        .requirement-card p {
            margin: 0;
            color: #6B7280;
            font-size: 11px;
            line-height: 1.6;
        }


        /* FAQ + QUICK ACTIONS */

        .bottom-grid {
            display: grid;
            grid-template-columns: 1.5fr 1fr;
            gap: 20px;
            margin-bottom: 25px;
        }

        .faq-item {
            border: 1px solid #E5E7EB;
            border-radius: 9px;
            margin-bottom: 9px;
            overflow: hidden;
        }

        .faq-question {
            width: 100%;
            border: none;
            background: white;
            padding: 15px;
            text-align: left;
            color: #202338;
            font-size: 12px;
            font-weight: bold;
            cursor: pointer;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .faq-question:hover {
            background: #FFF8F9;
        }

        .faq-answer {
            display: none;
            padding: 0 15px 15px 15px;
            color: #6B7280;
            font-size: 11px;
            line-height: 1.6;
            background: white;
        }

        .faq-answer.open {
            display: block;
        }

        .faq-arrow {
            color: #D80032;
            font-size: 15px;
        }


        /* QUICK ACTIONS */

        .quick-actions {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 12px;
        }

        .quick-action {
            min-height: 100px;
            background: #FAFAFA;
            border: 1px solid #E5E7EB;
            border-radius: 10px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            text-decoration: none;
            padding: 12px;
        }

        .quick-action:hover {
            background: #FFF0F3;
            border-color: #F3B9C5;
        }

        .quick-action-icon {
            width: 34px;
            height: 34px;
            background: #FFF0F3;
            color: #D80032;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 8px;
            font-size: 15px;
        }

        .quick-action span {
            color: #202338;
            font-size: 11px;
            font-weight: bold;
        }


        /* DISCLAIMER */

        .disclaimer {
            background: #EAEFFD;
            border: 1px solid #D5DDF8;
            border-radius: 12px;
            padding: 18px 20px;
            display: flex;
            gap: 12px;
            align-items: flex-start;
            margin-bottom: 25px;
        }

        .disclaimer-icon {
            color: #4F63A6;
            font-size: 18px;
            font-weight: bold;
        }

        .disclaimer-text {
            color: #4B5563;
            font-size: 11px;
            line-height: 1.6;
        }

        .disclaimer-text strong {
            color: #202338;
        }


        /* RESPONSIVE */

        @media (max-width: 900px) {

            .top-grid,
            .bottom-grid {
                grid-template-columns: 1fr;
            }

            .requirements-grid {
                grid-template-columns: 1fr 1fr;
            }

        }

        @media (max-width: 700px) {

            .page-heading {
                flex-direction: column;
            }

            .date-grid {
                grid-template-columns: 1fr;
            }

            .middle-grid {
                grid-template-columns: 1fr;
            }

            .requirements-grid {
                grid-template-columns: 1fr;
            }

            .quick-actions {
                grid-template-columns: 1fr 1fr;
            }

        }

    </style>

    <script type="text/javascript">

function toggleFAQ(id) {

    var answer = document.getElementById(id);

    if (answer.classList.contains("open")) {
        answer.classList.remove("open");
    }
    else {
        answer.classList.add("open");
    }
}

</script>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="eligibility-page">

        <!-- PAGE HEADING -->

        <div class="page-heading">

            <div>
                <h1>Donation Eligibility</h1>

                <p>
                    Check your current eligibility status and learn when you can donate blood again.
                </p>
            </div>

            <a href="#" class="guideline-button">
                📖 View Donation Guidelines
            </a>

        </div>


        <!-- CURRENT ELIGIBILITY + IMPACT -->

        <div class="top-grid">

            <!-- CURRENT ELIGIBILITY -->

            <div class="current-card">

                <div class="current-top">

                    <div class="eligibility-icon">
                        ✓
                    </div>

                    <div>
                        <h2>Eligible to Donate</h2>

                        <span class="eligible-tag">
                            ELIGIBLE
                        </span>
                    </div>

                </div>


                <div class="date-grid">

                    <div class="date-box">

                        <span class="date-label">
                            LAST DONATION
                        </span>

                        <span class="date-value">
                            12 May 2026
                        </span>

                    </div>


                    <div class="date-box">

                        <span class="date-label">
                            NEXT ELIGIBLE DATE
                        </span>

                        <span class="date-value">
                            10 August 2026
                        </span>

                    </div>


                    <div class="date-box">

                        <span class="date-label">
                            DAYS UNTIL ELIGIBLE
                        </span>

                        <span class="date-value now-value">
                            Eligible Now
                        </span>

                    </div>

                </div>

            </div>


            <!-- IMPACT SUMMARY -->

            <div class="impact-card">

                <h2>Impact Summary</h2>

                <div class="impact-item">
                    <span class="impact-label">
                        TOTAL DONATIONS
                    </span>

                    <span class="impact-value">
                        8
                    </span>
                </div>


                <div class="impact-item">
                    <span class="impact-label">
                        LIVES IMPACTED
                    </span>

                    <span class="impact-value">
                        24
                    </span>
                </div>


                <div class="impact-item">
                    <span class="impact-label">
                        EMERGENCY RESPONSES
                    </span>

                    <span class="impact-value">
                        3
                    </span>
                </div>


                <a href="Donation_History.aspx" class="history-link">
                    View Donation History →
                </a>

            </div>

        </div>


        <!-- JOURNEY + CHECKLIST -->

        <div class="middle-grid">

            <!-- ELIGIBILITY JOURNEY -->

            <div class="white-card">

                <h2>Eligibility Journey</h2>

                <div class="journey">

                    <div class="journey-item">

                        <div class="journey-icon">
                            ✓
                        </div>

                        <div class="journey-text">

                            <strong>
                                LAST DONATION COMPLETED
                            </strong>

                            <span>
                                Your last blood donation was completed successfully.
                            </span>

                        </div>

                    </div>


                    <div class="journey-item">

                        <div class="journey-icon">
                            ✓
                        </div>

                        <div class="journey-text">

                            <strong>
                                RECOVERY COMPLETED
                            </strong>

                            <span>
                                Required recovery interval has been recorded.
                            </span>

                        </div>

                    </div>


                    <div class="journey-item">

                        <div class="journey-icon active">
                            ♥
                        </div>

                        <div class="journey-text">

                            <strong>
                                ELIGIBLE NOW
                            </strong>

                            <span>
                                You can check available donation opportunities.
                            </span>

                        </div>

                    </div>

                </div>

            </div>


            <!-- READINESS CHECKLIST -->

            <div class="white-card">

                <h2>Quick Readiness Checklist</h2>

                <div class="check-item">
                    <span class="check-icon">✓</span>
                    Feeling healthy and well today
                </div>

                <div class="check-item">
                    <span class="check-icon">✓</span>
                    At least 17 years old
                </div>

                <div class="check-item">
                    <span class="check-icon">✓</span>
                    Weigh at least 50 kg (110 lbs)
                </div>

                <div class="check-item">
                    <span class="check-icon">✓</span>
                    Slept well last night
                </div>

                <div class="check-item">
                    <span class="check-icon">✓</span>
                    Eaten a healthy meal recently
                </div>

                <div class="check-item">
                    <span class="check-icon">✓</span>
                    Drank plenty of water
                </div>

                <div class="check-item">
                    <span class="check-icon">✓</span>
                    Not taking restricted medication
                </div>

                <div class="check-item">
                    <span class="check-icon">✓</span>
                    Past required wait interval
                </div>

            </div>

        </div>


        <!-- CALL TO ACTION -->

        <div class="cta-card">

            <div class="cta-icon">
                ♥
            </div>

            <h2>
                Ready to Make a Difference?
            </h2>

            <p>
                You are currently eligible to donate. Your contribution could
                help save lives. Find a camp or respond to an emergency near you.
            </p>

            <div class="cta-buttons">

                <a href="Find_Camps.aspx" class="red-button">
                    📍 Find Donation Camps
                </a>

                <a href="Emergency_Details.aspx" class="blue-button">
                    🚨 View Emergency Requests
                </a>

            </div>

        </div>


        <!-- BASIC REQUIREMENTS -->

        <div class="section-title">

            <h2>
                Basic Donation Requirements
            </h2>

        </div>


        <div class="requirements-grid">

            <div class="requirement-card">

                <div class="requirement-icon">
                    18+
                </div>

                <h3>
                    Age
                </h3>

                <p>
                    General donor age requirements depend on local blood donation rules.
                    Check with your donation center before booking.
                </p>

            </div>


            <div class="requirement-card">

                <div class="requirement-icon">
                    KG
                </div>

                <h3>
                    Weight
                </h3>

                <p>
                    A minimum weight requirement may apply for whole blood donation.
                    Many guidelines use 50 kg (110 lbs) as a general reference.
                </p>

            </div>


            <div class="requirement-card">

                <div class="requirement-icon">
                    ♥
                </div>

                <h3>
                    Health
                </h3>

                <p>
                    Donors should generally be feeling well and able to perform
                    normal activities on the day of donation.
                </p>

            </div>


            <div class="requirement-card">

                <div class="requirement-icon">
                    56
                </div>

                <h3>
                    Interval
                </h3>

                <p>
                    Whole blood donation intervals are commonly around 56 days,
                    but exact requirements can vary by donation program.
                </p>

            </div>

        </div>


        <!-- FAQ + QUICK ACTIONS -->

        <div class="bottom-grid">

            <!-- FAQ -->

            <div class="white-card">

                <h2>
                    Frequently Asked Questions
                </h2>


                <div class="faq-item">

                    <button type="button"
                        class="faq-question"
                        onclick="toggleFAQ('faq1')">

                        <span>
                            How often can I donate blood?
                        </span>

                        <span class="faq-arrow">
                            +
                        </span>

                    </button>

                    <div id="faq1" class="faq-answer open">

                        Whole blood donation intervals are commonly at least
                        56 days. Other donation types can have different intervals.
                        Rules vary by region and donation program.

                    </div>

                </div>


                <div class="faq-item">

                    <button type="button"
                        class="faq-question"
                        onclick="toggleFAQ('faq2')">

                        <span>
                            Can I donate if I am taking medication?
                        </span>

                        <span class="faq-arrow">
                            +
                        </span>

                    </button>

                    <div id="faq2" class="faq-answer">

                        Medication does not automatically make someone ineligible.
                        Eligibility can depend on the medication and the reason
                        it was prescribed. Check with donation center staff.

                    </div>

                </div>


                <div class="faq-item">

                    <button type="button"
                        class="faq-question"
                        onclick="toggleFAQ('faq3')">

                        <span>
                            What should I eat before donating?
                        </span>

                        <span class="faq-arrow">
                            +
                        </span>

                    </button>

                    <div id="faq3" class="faq-answer">

                        Follow the preparation instructions provided by your
                        donation center and arrive well hydrated.

                    </div>

                </div>


                <div class="faq-item">

                    <button type="button"
                        class="faq-question"
                        onclick="toggleFAQ('faq4')">

                        <span>
                            Can I donate if I recently traveled?
                        </span>

                        <span class="faq-arrow">
                            +
                        </span>

                    </button>

                    <div id="faq4" class="faq-answer">

                        Recent travel can affect eligibility depending on where
                        you traveled and the rules of the donation program.
                        Tell the donation center about recent travel.

                    </div>

                </div>


                <div class="faq-item">

                    <button type="button"
                        class="faq-question"
                        onclick="toggleFAQ('faq5')">

                        <span>
                            Does getting a tattoo affect eligibility?
                        </span>

                        <span class="faq-arrow">
                            +
                        </span>

                    </button>

                    <div id="faq5" class="faq-answer">

                        Tattoo-related eligibility rules vary by location and
                        how the tattoo was performed. Tell the donation center
                        about a recent tattoo so staff can apply the correct rule.

                    </div>

                </div>

            </div>


            <!-- QUICK ACTIONS -->

            <div class="white-card">

                <h2>
                    Quick Actions
                </h2>

                <div class="quick-actions">

                    <a href="Emergency_Details.aspx" class="quick-action">

                        <div class="quick-action-icon">
                            🚨
                        </div>

                        <span>
                            Find Emergency Requests
                        </span>

                    </a>


                    <a href="Find_Camps.aspx" class="quick-action">

                        <div class="quick-action-icon">
                            📖
                        </div>

                        <span>
                            Find Donation Camps
                        </span>

                    </a>


                    <a href="Book_Donation_Slot.aspx" class="quick-action">

                        <div class="quick-action-icon">
                            📅
                        </div>

                        <span>
                            Book Donation Slot
                        </span>

                    </a>


                    <a href="Donation_History.aspx" class="quick-action">

                        <div class="quick-action-icon">
                            ↺
                        </div>

                        <span>
                            View Donation History
                        </span>

                    </a>

                </div>

            </div>

        </div>


        <!-- MEDICAL DISCLAIMER -->

        <div class="disclaimer">

            <div class="disclaimer-icon">
                ⓘ
            </div>

            <div class="disclaimer-text">

                <strong>Disclaimer:</strong>
                The eligibility status shown here is based on recorded intervals
                and standard guidelines. Final eligibility is determined by
                qualified medical staff at the time of donation through a
                mini-physical and health history review. If you have specific
                medical concerns, please consult the donation center staff
                prior to booking.

            </div>

        </div>

    </div>

</asp:Content>