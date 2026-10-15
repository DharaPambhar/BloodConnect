
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BloodConnect
{
    public partial class User_EditProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadUserData();
            }
        }

        private void LoadUserData()
        {
            string firstName = Convert.ToString(Session["FirstName"]);
            string lastName = Convert.ToString(Session["LastName"]);
            string email = Convert.ToString(Session["User"]);

            if (string.IsNullOrWhiteSpace(firstName))
            {
                firstName = "Rahul";
            }

            if (string.IsNullOrWhiteSpace(lastName))
            {
                lastName = "Shah";
            }

            if (string.IsNullOrWhiteSpace(email))
            {
                email = "rahul.shah@example.com";
            }

            string fullName = (firstName + " " + lastName).Trim();

            // Profile details
            txtFullName.Text = fullName;
            txtEmail.Text = email;
            lblProfileName.Text = fullName;

            // Personal details
            txtDOB.Text = "1992-05-14";

            SetSelectedValue(ddlGender, "Male");

            txtPhone.Text = "+91 9876543245";

            // Address details
            txtAddress1.Text = "A-402, Shyam Residency";
            txtAddress2.Text = "Near SG Highway, Bodakdev";
            txtCity.Text = "Ahmedabad";
            SetSelectedValue(ddlState, "Gujarat");
            txtPincode.Text = "380054";
            SetSelectedValue(ddlCountry, "India");

            // Blood donation preferences
            SetSelectedValue(ddlBloodGroup, "O+");
            SetSelectedValue(ddlRadius, "10");
            txtPrimaryLocation.Text = "Ahmedabad";
            SetSelectedValue(ddlUrgency, "Normal");
            SetSelectedValue(
                ddlLocationVisibility,
                "Approximate Area"
            );
        }

        private void SetSelectedValue(
            DropDownList dropdown,
            string value)
        {
            if (dropdown != null &&
                dropdown.Items.FindByValue(value) != null)
            {
                dropdown.SelectedValue = value;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtFullName.Text))
            {
                ShowMessage("Please enter your full name.", false);
                return;
            }

            if (string.IsNullOrWhiteSpace(txtPhone.Text))
            {
                ShowMessage("Please enter your phone number.", false);
                return;
            }

            if (string.IsNullOrWhiteSpace(txtAddress1.Text))
            {
                ShowMessage("Please enter Address Line 1.", false);
                return;
            }

            // Update session name
            string fullName = txtFullName.Text.Trim();

            string[] nameParts = fullName.Split(
                new char[] { ' ' },
                StringSplitOptions.RemoveEmptyEntries
            );

            if (nameParts.Length > 0)
            {
                Session["FirstName"] = nameParts[0];

                string lastName = "";

                if (nameParts.Length > 1)
                {
                    lastName = string.Join(
                        " ",
                        nameParts,
                        1,
                        nameParts.Length - 1
                    );
                }

                Session["LastName"] = lastName;
            }

            // Update profile name on page
            lblProfileName.Text = fullName;

            ShowMessage("Profile updated successfully.", true);
        }

        private void ShowMessage(string message, bool success)
        {
            lblMessage.Text = message;

            if (success)
            {
                lblMessage.CssClass = "message success";
            }
            else
            {
                lblMessage.CssClass = "message error";
            }

            lblMessage.Visible = true;
        }
    }
}
