using System;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnDonor_Click(object sender, EventArgs e)
        {
            SelectedRole.Value = "Donor";

            btnDonor.CssClass = "role-box selected";
            btnSeeker.CssClass = "role-box";
        }

        protected void btnSeeker_Click(object sender, EventArgs e)
        {
            SelectedRole.Value = "Blood Seeker";

            btnSeeker.CssClass = "role-box selected";
            btnDonor.CssClass = "role-box";
        }

        protected void CREATEACCOUNT_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string connectionString =
                    "Data Source=(LocalDB)\\MSSQLLocalDB;" +
                    "AttachDbFilename=|DataDirectory|\\BloodConnect.mdf;" +
                    "Integrated Security=True";

                SqlConnection con = new SqlConnection(connectionString);

                string query = "INSERT INTO Users " +
                    "(FirstName, LastName, Email, Phone, City, Pincode, Password, Role, CreatedAt, Status) " +
                    "VALUES " +
                    "(@FirstName, @LastName, @Email, @Phone, @City, @Pincode, @Password, @Role, @CreatedAt, @Status)";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@FirstName", FirstNameTXT.Text);
                cmd.Parameters.AddWithValue("@LastName", LastNameTXT.Text);
                cmd.Parameters.AddWithValue("@Email", EmailTXT.Text);
                cmd.Parameters.AddWithValue("@Phone", PhoneTXT.Text);
                cmd.Parameters.AddWithValue("@City", CityTXT.Text);
                cmd.Parameters.AddWithValue("@Pincode", PincodeTXT.Text);
                cmd.Parameters.AddWithValue("@Password", PasswordTXT.Text);
                cmd.Parameters.AddWithValue("@Role", SelectedRole.Value);
                cmd.Parameters.AddWithValue("@CreatedAt", DateTime.Now);
                cmd.Parameters.AddWithValue("@Status", "Active");

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                Response.Redirect("VerifyAccount.aspx");
            }
        }
    }
}