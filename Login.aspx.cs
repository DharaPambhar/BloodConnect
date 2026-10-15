
using System;
using System.Data.SqlClient;

namespace BloodConnect
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void LOGIN_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            string email = EMAILTXT.Text.Trim();
            string password = PWDTXT.Text;

            // STATIC ADMIN LOGIN
            // Admin mate database registration ni jarur nathi.

            if (email.Equals(
                    "a@gmail.com",
                    StringComparison.OrdinalIgnoreCase)
                && password == "123")
            {
                Session["User"] = "a@gmail.com";
                Session["FirstName"] = "Admin";
                Session["LastName"] = "";
                Session["Role"] = "Admin";

                Response.Redirect("Admin_Dashboard.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
                return;
            }

            // DONOR / BLOOD SEEKER DATABASE LOGIN

            string connectionString =
                "Data Source=(LocalDB)\\MSSQLLocalDB;" +
                "AttachDbFilename=|DataDirectory|\\BloodConnect.mdf;" +
                "Integrated Security=True";

            using (SqlConnection con =
                   new SqlConnection(connectionString))
            {
                string query =
                    "SELECT Role, FirstName, LastName " +
                    "FROM Users " +
                    "WHERE Email = @Email AND Password = @Password";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", password);

                    con.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            string role = dr["Role"].ToString();

                            Session["User"] = email;
                            Session["FirstName"] =
                                dr["FirstName"].ToString();
                            Session["LastName"] =
                                dr["LastName"].ToString();
                            Session["Role"] = role;

                            dr.Close();

                            if (role == "Donor")
                            {
                                Response.Redirect(
                                    "DonorDashboard.aspx", false);
                                Context.ApplicationInstance.CompleteRequest();
                                return;
                            }
                            else if (role == "Blood Seeker")
                            {
                                Response.Redirect(
                                    "User_Dashboard.aspx", false);
                                Context.ApplicationInstance.CompleteRequest();
                                return;
                            }
                        }
                    }
                }
            }

            // INVALID LOGIN
            ClientScript.RegisterStartupScript(
                this.GetType(),
                "LoginError",
                "alert('Invalid Email or Password');",
                true
            );
        }
    }
}
