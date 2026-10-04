
using System;

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

            string fullName = (firstName + " " + lastName).Trim();

            if (string.IsNullOrWhiteSpace(email))
            {
                email = "rahul.shah@example.com";
            }

            txtFullName.Text = fullName;
            txtEmail.Text = email;

            lblProfileName.Text = fullName;

            lblInitial.Text =
                firstName.Substring(0, 1).ToUpper();

            txtDOB.Text = "1992-05-14";

            ddlGender.SelectedValue = "Male";

            txtPhone.Text = "+91 9876543245";

            txtAddress1.Text = "A-402, Shyam Residency";

            txtAddress2.Text = "Near SG Highway, Bodakdev";

            txtCity.Text = "Ahmedabad";

            ddlState.SelectedValue = "Gujarat";

            txtPincode.Text = "380054";

            ddlCountry.SelectedValue = "India";

            ddlBloodGroup.SelectedValue = "O+";

            ddlRadius.SelectedValue = "10";

            txtPrimaryLocation.Text = "Ahmedabad";

            ddlUrgency.SelectedValue = "Normal";

            ddlLocationVisibility.SelectedValue =
                "Approximate Area";
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtFullName.Text))
            {
                ShowMessage(
                    "Please enter your full name.",
                    false);

                return;
            }

            if (string.IsNullOrWhiteSpace(txtPhone.Text))
            {
                ShowMessage(
                    "Please enter your phone number.",
                    false);

                return;
            }

            if (string.IsNullOrWhiteSpace(txtAddress1.Text))
            {
                ShowMessage(
                    "Please enter Address Line 1.",
                    false);

                return;
            }

            // Update session name
            string fullName =
                txtFullName.Text.Trim();

            string[] nameParts =
                fullName.Split(
                    new char[] { ' ' },
                    StringSplitOptions.RemoveEmptyEntries);

            if (nameParts.Length > 0)
            {
                Session["FirstName"] = nameParts[0];
            }

            if (nameParts.Length > 1)
            {
                Session["LastName"] =
                    string.Join(
                        " ",
                        nameParts,
                        1,
                        nameParts.Length - 1);
            }

            ShowMessage(
                "Profile updated successfully.",
                true);
        }

        private void ShowMessage(
            string message,
            bool success)
        {
            lblMessage.Text = message;

            if (success)
            {
                lblMessage.CssClass =
                    "message success";
            }
            else
            {
                lblMessage.CssClass =
                    "message error";
            }

            lblMessage.Visible = true;
        }
    }
}
