using System;

namespace BloodConnect
{
    public partial class User_Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check login
                if (Session["User"] == null)
                {
                    Response.Redirect("Login.aspx");
                    return;
                }

                // Get logged-in user's name
                string firstName = "";
                string lastName = "";

                if (Session["FirstName"] != null)
                {
                    firstName = Session["FirstName"].ToString();
                }

                if (Session["LastName"] != null)
                {
                    lastName = Session["LastName"].ToString();
                }

                string fullName = (firstName + " " + lastName).Trim();

                if (fullName != "")
                {
                    lblWelcomeName.Text = fullName;
                }
                else
                {
                    lblWelcomeName.Text = "User";
                }
            }
        }
    }
}