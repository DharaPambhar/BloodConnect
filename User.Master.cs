using System;

namespace BloodConnect
{
    public partial class User : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["FirstName"] != null &&
                    Session["LastName"] != null)
                {
                    lblUserName.Text =
                        Session["FirstName"].ToString() + " " +
                        Session["LastName"].ToString();
                }
                else if (Session["User"] != null)
                {
                    lblUserName.Text =
                        Session["User"].ToString();
                }
            }
        }
    }
}