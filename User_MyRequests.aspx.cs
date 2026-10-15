using System;

namespace BloodConnect
{
    public partial class User_MyRequests : System.Web.UI.Page
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
                LoadRequests();
            }
        }

        private void LoadRequests()
        {
            // Request data is currently displayed
            // for UI/design purposes.
            // Database functionality can be connected later.
        }
    }
}



//using System;
//using System.Collections;

//namespace BloodConnect
//{
//    public partial class User_MyRequests : System.Web.UI.Page
//    {
//        protected void Page_Load(object sender, EventArgs e)
//        {
//            if (Session["User"] == null)
//            {
//                Response.Redirect("Login.aspx");
//                return;
//            }

//            if (!IsPostBack)
//            {
//                LoadRequests();
//            }
//        }

//        private void LoadRequests()
//        {
//            // Non-Generic Collection
//            ArrayList requests = new ArrayList();

//            // Request 1
//            requests.Add(new ArrayList()
//            {
//                "BR-2026-001246",
//                "O+",
//                "2",
//                "Normal",
//                "CityCare",
//                "20 Aug 2026",
//                "Active"
//            });

//            // Request 2
//            requests.Add(new ArrayList()
//            {
//                "BR-2026-001245",
//                "A+",
//                "3",
//                "Emergency",
//                "Apollo Care",
//                "Today",
//                "Pending"
//            });

//            // Request 3
//            requests.Add(new ArrayList()
//            {
//                "BR-2026-001198",
//                "B+",
//                "1",
//                "Normal",
//                "Shree Hospital",
//                "15 Aug 2026",
//                "Fulfilled"
//            });

//            // Request 4
//            requests.Add(new ArrayList()
//            {
//                "BR-2026-001154",
//                "O-",
//                "2",
//                "Normal",
//                "CityCare",
//                "10 Aug 2026",
//                "Cancelled"
//            });

//            // Example: ArrayList data read
//            foreach (ArrayList request in requests)
//            {
//                string requestId = request[0].ToString();
//                string bloodGroup = request[1].ToString();
//                string units = request[2].ToString();
//                string type = request[3].ToString();
//                string hospital = request[4].ToString();
//                string requiredBy = request[5].ToString();
//                string status = request[6].ToString();

//                // Data can be used here
//            }
//        }
//    }
//}