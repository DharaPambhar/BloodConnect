using System;

namespace WebApplication1
{
    public partial class VerifyAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void VERIFYCONTINUE_Click(object sender, EventArgs e)
        {
            Response.Redirect("Complete.aspx");
        }
    }
}