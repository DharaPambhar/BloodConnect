
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
            if (Page.IsValid)
            {
                string connectionString =
                    "Data Source=(LocalDB)\\MSSQLLocalDB;" +
                    "AttachDbFilename=|DataDirectory|\\BloodConnect.mdf;" +
                    "Integrated Security=True";

                SqlConnection con = new SqlConnection(connectionString);

                string query = "SELECT Role, FirstName, LastName " +
                               "FROM Users " +
                               "WHERE Email = @Email AND Password = @Password";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@Email", EMAILTXT.Text);
                cmd.Parameters.AddWithValue("@Password", PWDTXT.Text);

                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    Session["User"] = EMAILTXT.Text;
                    Session["FirstName"] = dr["FirstName"].ToString();
                    Session["LastName"] = dr["LastName"].ToString();
                    Session["Role"] = dr["Role"].ToString();

                    string role = dr["Role"].ToString();

                    dr.Close();
                    con.Close();

                    if (role == "Donor")
                    {
                        Response.Redirect("DonorDashboard.aspx");
                    }
                    else if (role == "Blood Seeker")
                    {
                        Response.Redirect("User_Dashboard.aspx");
                    }
                    else if (role == "Admin")
                    {
                        Response.Redirect("AdminDashboard.aspx");
                    }
                }
                else
                {
                    dr.Close();
                    con.Close();

                    Response.Write("<script>alert('Invalid Email or Password');</script>");
                }
            }
        }
    }
}