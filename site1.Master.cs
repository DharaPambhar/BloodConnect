using System;

namespace BloodConnect
{
    public partial class site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string pageName = System.IO.Path.GetFileName(
                Request.Url.AbsolutePath
            ).ToLower();

            // Remove active class
            lnkHome.Attributes["class"] = "";
            lnkAbout.Attributes["class"] = "";
            lnkFindBlood.Attributes["class"] = "";
            lnkCamps.Attributes["class"] = "";
            lnkBanks.Attributes["class"] = "";
            lnkEmergency.Attributes["class"] = "";
            lnkContact.Attributes["class"] = "";

            // Set active page
            if (pageName == "home.aspx")
            {
                lnkHome.Attributes["class"] = "active";
            }
            else if (pageName == "about.aspx")
            {
                lnkAbout.Attributes["class"] = "active";
            }
            else if (pageName == "findblood.aspx")
            {
                lnkFindBlood.Attributes["class"] = "active";
            }
            else if (pageName == "bloodcamps.aspx")
            {
                lnkCamps.Attributes["class"] = "active";
            }
            else if (pageName == "bloodbanks.aspx")
            {
                lnkBanks.Attributes["class"] = "active";
            }
            else if (pageName == "emergency.aspx")
            {
                lnkEmergency.Attributes["class"] = "active";
            }
            else if (pageName == "contact.aspx")
            {
                lnkContact.Attributes["class"] = "active";
            }
        }
    }
}