
using System;

namespace BloodConnect
{
    public partial class User_Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Login vagar profile open na thay
            if (Session["User"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                // Login mathi session ma stored details
                string firstName = Convert.ToString(Session["FirstName"]);
                string lastName = Convert.ToString(Session["LastName"]);
                string email = Convert.ToString(Session["User"]);

                // Jo FirstName empty hoy
                if (string.IsNullOrWhiteSpace(firstName))
                {
                    firstName = "User";
                }

                // Full name
                string fullName = (firstName + " " + lastName).Trim();

                if (string.IsNullOrWhiteSpace(fullName))
                {
                    fullName = "User";
                }

                // Profile ma name show
                lblName.Text = fullName;

                // Personal Information ma full name
                lblFullName.Text = fullName;

                // Email show
                lblEmail.Text = email;

                // Avatar ma first name no first letter
                lblInitial.Text = firstName.Substring(0, 1).ToUpper();
            }
        }
    }
}
