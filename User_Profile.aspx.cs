
using System;
using System.Web.UI;

namespace BloodConnect
{
    public partial class User_Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Session mathi user details melavo
                string firstName = Convert.ToString(Session["FirstName"]);
                string lastName = Convert.ToString(Session["LastName"]);
                string email = Convert.ToString(Session["User"]);

                // Full name taiyar karo
                string fullName = (firstName + " " + lastName).Trim();

                if (string.IsNullOrWhiteSpace(fullName))
                {
                    fullName = "User";
                }

                // Profile name
                lblName.Text = fullName;

                // Personal information ma full name
                lblFullName.Text = fullName;

                // Email address
                lblEmail.Text = email;
            }
        }
    }
}
