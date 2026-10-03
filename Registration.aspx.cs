using System;

namespace WebApplication1
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void CREATEACCOUNT_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Response.Redirect("VerifyAccount.aspx");
            }
        }
    }
}