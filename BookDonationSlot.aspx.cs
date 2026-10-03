using System;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class BookDonationSlot : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Show August 2026
                calDonation.VisibleDate = new DateTime(2026, 8, 1);

                // Default selected date
                DateTime selectedDate = new DateTime(2026, 8, 16);

                calDonation.SelectedDate = selectedDate;

                if (lblSelectedDate != null)
                {
                    lblSelectedDate.Text =
                        "Selected Date: " +
                        selectedDate.ToString("dddd, MMMM dd, yyyy");
                }

                if (lblSummaryDate != null)
                {
                    lblSummaryDate.Text =
                        selectedDate.ToString("dddd, MMMM dd, yyyy");
                }
            }
        }


        // Calendar date selection
        protected void calDonation_SelectionChanged(
            object sender,
            EventArgs e)
        {
            DateTime selectedDate = calDonation.SelectedDate;

            if (lblSelectedDate != null)
            {
                lblSelectedDate.Text =
                    "Selected Date: " +
                    selectedDate.ToString("dddd, MMMM dd, yyyy");
            }

            if (lblSummaryDate != null)
            {
                lblSummaryDate.Text =
                    selectedDate.ToString("dddd, MMMM dd, yyyy");
            }
        }


        // Time slot selection
        protected void Slot_Click(
            object sender,
            EventArgs e)
        {
            Button clickedButton = sender as Button;

            if (clickedButton == null)
                return;

            string selectedSlot =
                clickedButton.CommandArgument;


            // Reset available slots
            if (btnSlot1 != null)
                btnSlot1.CssClass = "slot-btn";

            if (btnSlot2 != null)
                btnSlot2.CssClass = "slot-btn";

            if (btnSlot3 != null)
                btnSlot3.CssClass = "slot-btn";

            if (btnSlot4 != null)
                btnSlot4.CssClass = "slot-btn";

            if (btnSlot7 != null)
                btnSlot7.CssClass = "slot-btn";

            if (btnSlot8 != null)
                btnSlot8.CssClass = "slot-btn";

            if (btnSlot9 != null)
                btnSlot9.CssClass = "slot-btn";

            if (btnSlot10 != null)
                btnSlot10.CssClass = "slot-btn";


            // Selected slot
            clickedButton.CssClass =
                "slot-btn slot-selected";


            if (lblSelectedSlot != null)
            {
                lblSelectedSlot.Text =
                    "Selected: " + selectedSlot;
            }


            if (lblSummaryTime != null)
            {
                lblSummaryTime.Text =
                    selectedSlot;
            }
        }


        // Continue button
        protected void btnContinue_Click(
            object sender,
            EventArgs e)
        {
            if (lblMessage != null)
            {
                lblMessage.Text =
                    "Date and time selected successfully. Continue to confirmation.";
            }
        }
    }
}